package com.twistlet.soberspider.model.run;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

import com.twistlet.soberspider.model.exporter.InformixSchemaExporter;
import com.twistlet.soberspider.model.service.SoberSpiderService;
import com.twistlet.soberspider.model.type.DatabaseTable;

public class RunDropCreateExport {

	public static void main(final String[] args) throws IOException {
		final String contextFile = "src/main/resources/application-context-sober-spider-service.xml";
		new RunDropCreateExport().execute(contextFile);
	}

	private void execute(final String contextFile) throws IOException {
		final ConfigurableApplicationContext applicationContext = new FileSystemXmlApplicationContext(contextFile);
		final SoberSpiderService soberSpiderService = applicationContext.getBean(SoberSpiderService.class);
		final DataSource dataSource = applicationContext.getBean(DataSource.class);
		soberSpiderService.dropAllTables(dataSource);

		createStructureOnly(dataSource);

		final List<DatabaseTable> list = soberSpiderService.listDatabaseTables(dataSource);
		final InformixSchemaExporter exporter = new InformixSchemaExporter();
		final List<String> lines = new ArrayList<>();
		for (final DatabaseTable databaseTable : list) {
			final String content = exporter.exportTable(databaseTable);
			lines.add(content);
		}
		final String exportContent = StringUtils.join(lines, "\n");
		FileUtils.write(new File("informix-schema.sql"), exportContent);
		applicationContext.close();
	}

	private void createStructureOnly(final DataSource dataSource) {
		final ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
		populator.addScript(new FileSystemResource("eperolehan-mysql-structure.sql"));
		DatabasePopulatorUtils.execute(populator, dataSource);
	}

}
