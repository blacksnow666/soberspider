package com.twistlet.soberspider.model.exporter;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.twistlet.soberspider.model.service.old.DatabaseService;
import com.twistlet.soberspider.model.type.DatabaseTable;

@ContextConfiguration("classpath:application-context.xml")
public class InformixSchemaExporterIT extends AbstractJUnit4SpringContextTests {

	@Autowired
	@Qualifier("informixSchemaExporter")
	SchemaExporter schemaExporter;

	@Autowired
	DatabaseService databaseService;

	@Test
	public void testExportTableSimple1() {
		final DatabaseTable databaseTable = databaseService.createDatabaseTable("calendar_event");
		final String actual = schemaExporter.exportTable(databaseTable);
		final String expected = createEventCalendarStructure();
		assertEquals(expected, actual);
	}

	private String createEventCalendarStructure() {
		final List<String> lines = new ArrayList<>();
		lines.add("CREATE TABLE calendar_event");
		lines.add("(");
		lines.add("\tid SERIAL NOT NULL,");
		lines.add("\ttitle VARCHAR(50),");
		lines.add("\tcontent LVARCHAR(1000),");
		lines.add("\tstart_date DATETIME YEAR to FRACTION,");
		lines.add("\tend_date DATETIME YEAR to FRACTION,");
		lines.add("\tjenis VARCHAR(2),");
		lines.add("\tPRIMARY KEY (id)");
		lines.add(");");
		return StringUtils.join(lines.toArray(new String[] {}), "\n");
	}

	@Test
	public void testExportTableUsesBit() {
		final DatabaseTable databaseTable = databaseService.createDatabaseTable("user");
		final String actual = schemaExporter.exportTable(databaseTable);
		final String expected = createUserStructure();
		assertEquals(expected, actual);
	}

	private String createUserStructure() {
		final List<String> lines = new ArrayList<>();
		lines.add("CREATE TABLE user");
		lines.add("(");
		lines.add("\tusername VARCHAR(12) NOT NULL,");
		lines.add("\tenabled BOOLEAN NOT NULL,");
		lines.add("\tname VARCHAR(200) NOT NULL,");
		lines.add("\tpassword VARCHAR(100) NOT NULL,");
		lines.add("\tvendor CHAR(1),");
		lines.add("\tPRIMARY KEY (username)");
		lines.add(");");
		return StringUtils.join(lines.toArray(new String[] {}), "\n");
	}

	@Test
	public void testExportTableUsesByte() {
		final DatabaseTable databaseTable = databaseService.createDatabaseTable("ref_file");
		final String actual = schemaExporter.exportTable(databaseTable);
		final String expected = createRefFileStructure();
		assertEquals(expected, actual);
	}

	private String createRefFileStructure() {
		final List<String> lines = new ArrayList<>();
		lines.add("CREATE TABLE ref_file");
		lines.add("(");
		lines.add("\tid SERIAL NOT NULL,");
		lines.add("\tfile_name VARCHAR(100),");
		lines.add("\tfile_type VARCHAR(25),");
		lines.add("\tfile_size INT,");
		lines.add("\tcontent BYTE,");
		lines.add("\tcreated_by VARCHAR(25),");
		lines.add("\tcreated_date DATETIME YEAR to FRACTION NOT NULL,");
		lines.add("\tPRIMARY KEY (id)");
		lines.add(");");
		return StringUtils.join(lines.toArray(new String[] {}), "\n");
	}

	@Test
	public void testExportTableUsesDecimal() {
		final DatabaseTable databaseTable = databaseService.createDatabaseTable("ref_pkk_limit");
		final String actual = schemaExporter.exportTable(databaseTable);
		final String expected = createRefPkkLimitStructure();
		assertEquals(expected, actual);
	}

	private String createRefPkkLimitStructure() {
		final List<String> lines = new ArrayList<>();
		lines.add("CREATE TABLE ref_pkk_limit");
		lines.add("(");
		lines.add("\tid SERIAL NOT NULL,");
		lines.add("\tcategory_id INT NOT NULL,");
		lines.add("\tlabel VARCHAR(45) NOT NULL,");
		lines.add("\tmin DECIMAL(12,0),");
		lines.add("\tmax DECIMAL(12,0),");
		lines.add("\tPRIMARY KEY (id)");
		lines.add(");");
		return StringUtils.join(lines.toArray(new String[] {}), "\n");
	}

	@Test
	public void testExportTableUsesDate() {
		final DatabaseTable databaseTable = databaseService.createDatabaseTable("contract");
		final String actual = schemaExporter.exportTable(databaseTable);
		final String expected = createContractStructure();
		assertEquals(expected, actual);
	}

	private String createContractStructure() {
		final List<String> lines = new ArrayList<>();
		lines.add("CREATE TABLE contract");
		lines.add("(");
		lines.add("\tid SERIAL NOT NULL,");
		lines.add("\treference_number VARCHAR(100),");
		lines.add("\tcontract_type INT,");
		lines.add("\tcontract_amount DECIMAL(14,2),");
		lines.add("\tbon_type INT,");
		lines.add("\tbon_amount DECIMAL(14,2),");
		lines.add("\tbank VARCHAR(11),");
		lines.add("\tstart_date DATE,");
		lines.add("\tend_date DATE,");
		lines.add("\tcontract_date DATE,");
		lines.add("\tdescription VARCHAR(250),");
		lines.add("\tstatus VARCHAR(1),");
		lines.add("\ttermination_date DATE,");
		lines.add("\ttermination_reason INT,");
		lines.add("\tPRIMARY KEY (id)");
		lines.add(");");
		return StringUtils.join(lines.toArray(new String[] {}), "\n");
	}
}
