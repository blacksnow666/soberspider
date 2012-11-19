package com.twistlet.soberspider.model.run;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.sql.DataSource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

import com.twistlet.soberspider.model.exporter.InformixSchemaExporter;
import com.twistlet.soberspider.model.service.SoberSpiderService;
import com.twistlet.soberspider.model.type.DatabaseTable;

public class RunDropCreateExportWithData {

	public static void main(final String[] args) throws IOException {
		final String contextFile = "src/main/resources/application-context-sober-spider-service.xml";
		new RunDropCreateExportWithData().execute(contextFile);
	}

	private void execute(final String contextFile) throws IOException {
		final ConfigurableApplicationContext applicationContext = new FileSystemXmlApplicationContext(contextFile);
		final SoberSpiderService soberSpiderService = applicationContext.getBean(SoberSpiderService.class);
		final DataSource dataSource = applicationContext.getBean(DataSource.class);
		soberSpiderService.dropAllTables(dataSource);

		createStructureOnly(dataSource);

		final List<DatabaseTable> list = soberSpiderService.listDatabaseTables(dataSource);
		{
			final InformixSchemaExporter exporter = new InformixSchemaExporter();
			final List<String> lines = new ArrayList<>();
			for (final DatabaseTable databaseTable : list) {
				final String content = exporter.exportTable(databaseTable);
				lines.add(content);
			}
			final String exportContent = StringUtils.join(lines, "\n");
			FileUtils.write(new File("../ep/src/main/resources/eperolehan-informix-structure.sql"), exportContent);
		}
		{
			final int count = list.size();
			int index = 0;
			final List<String> lines = FileUtils.readLines(new File("../ep/src/main/resources/eperolehan-mysql-data.sql"));
			System.out.println("initial lines: " + lines.size());
			filterInsertOnly(lines);
			System.out.println("insert-only lines: " + lines.size());
			for (final DatabaseTable databaseTable : list) {
				final String tablename = databaseTable.getName();
				final List<String> insertForTable = filterInsertForTable(lines, tablename);
				filterInformixInsert(insertForTable, databaseTable);
				index++;
				lines.addAll(insertForTable);
				System.out.println(index + "/" + count + ": " + tablename + "(" + insertForTable.size() + ")");

			}
			final String exportContent = StringUtils.join(lines, "\n");
			FileUtils.write(new File("../ep/src/main/resources/eperolehan-informix-data.sql"), exportContent);
		}

		applicationContext.close();
	}

	private void filterInformixInsert(final List<String> insertForTable, final DatabaseTable databaseTable) {
		final String tablename = databaseTable.getName();

		final String oldInsertInto = "INSERT INTO `" + tablename + "`";
		final String newInsertInto = "INSERT INTO " + tablename;

		final String oldInsertIntoTableFront = "INSERT INTO " + tablename + " (`";
		final String newInsertIntoTableFront = "INSERT INTO " + tablename + " (";

		final String oldInsertIntoTableBack = "`)";
		final String newInsertIntoTableBack = ")";

		final String oldColumnDelimiter = "`, `";
		final String newColumnDelimiter = ", ";

		final String oldDato = "DATO\\\'";
		final String newDato = "DATO\'\'";

		final String oldName1 = "\'NOR \\\'AZIAH BT ABDUL MALIK\'";
		final String newName1 = "\'NOR \'\'AZIAH BT ABDUL MALIK\'";

		final String oldName2 = "\'JARA\\\'IN BT ABU SEMAN\'";
		final String newName2 = "\'JARA\'\'IN BT ABU SEMAN\'";

		final String oldName3 = "\'YA\\\'KUB B MD TAIB\'";
		final String newName3 = "\'YA\'\'KUB B MD TAIB\'";

		final String oldName4 = "\'ZAITON BT MA\\\'IN (HAJAH)\'";
		final String newName4 = "\'ZAITON BT MA\'\'IN (HAJAH)\'";

		final String oldName5 = "\\\'";
		final String newName5 = "\'\'";

		final List<String> lines = new ArrayList<>();
		for (String line : insertForTable) {
			line = line.replace(oldInsertInto, newInsertInto);
			line = line.replace(oldInsertIntoTableFront, newInsertIntoTableFront);
			line = line.replace(oldInsertIntoTableBack, newInsertIntoTableBack);
			line = line.replace(oldColumnDelimiter, newColumnDelimiter);
			line = line.replace(oldDato, newDato);
			line = line.replace(oldName1, newName1);
			line = line.replace(oldName2, newName2);
			line = line.replace(oldName3, newName3);
			line = line.replace(oldName4, newName4);
			line = line.replace(oldName5, newName5);
			lines.add(line);
		}
		if ("ref_field".equals(tablename)) {
			sortLinesParentItemsFirst(lines);
		}
		if ("user".equals(tablename)) {
			replaceShortWithBooleanUser(lines);
		}
		insertForTable.clear();
		insertForTable.addAll(lines);
	}

	private void replaceShortWithBooleanUser(final List<String> lines) {
		final List<String> result = new ArrayList<>();
		final Pattern pattern = Pattern
				.compile("^(INSERT INTO user \\(username, enabled, name, password, vendor\\) VALUES \\('[A-Za-z0-9]*',)([01])(.*)");
		for (final String line : lines) {
			final Matcher matcher = pattern.matcher(line);
			if (matcher.matches()) {
				final String tf = matcher.group(2);
				final String tfValue = BooleanUtils.toString("1".equals(tf), "'T'", "'F'");
				String sql = matcher.group(1);
				sql = sql + tfValue;
				sql = sql + matcher.group(3);
				result.add(sql);
			}
		}
		lines.clear();
		lines.addAll(result);
	}

	private void sortLinesParentItemsFirst(final List<String> lines) {
		final String regex = (".*\\) VALUES \\(.[A-Za-z]*.,NULL,.*");
		final List<String> sorted = new ArrayList<>();
		for (final String line : lines) {
			if (line.matches(regex)) {
				sorted.add(line);
			}
		}
		lines.removeAll(sorted);
		sorted.addAll(lines);
		lines.clear();
		lines.addAll(sorted);
	}

	private List<String> filterInsertForTable(final List<String> lines, final String tablename) {
		final List<String> linesToBeRemoved = new ArrayList<>();
		for (final String line : lines) {
			if (line.startsWith("INSERT INTO `" + tablename + "`")) {
				linesToBeRemoved.add(line);
			}
		}
		lines.removeAll(linesToBeRemoved);
		return linesToBeRemoved;
	}

	private void filterInsertOnly(final List<String> lines) {
		final List<String> linesToBeRemoved = new ArrayList<>();
		for (final String line : lines) {
			if (!line.toUpperCase().startsWith("INSERT INTO")) {
				linesToBeRemoved.add(line);
			}
		}
		lines.removeAll(linesToBeRemoved);
	}

	private void createStructureOnly(final DataSource dataSource) {
		final ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
		populator.addScript(new FileSystemResource("../ep/src/main/resources/eperolehan-mysql-structure.sql"));
		DatabasePopulatorUtils.execute(populator, dataSource);
	}

}
