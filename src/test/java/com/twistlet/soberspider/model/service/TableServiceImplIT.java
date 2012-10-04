package com.twistlet.soberspider.model.service;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration("classpath:application-context.xml")
public class TableServiceImplIT extends AbstractJUnit4SpringContextTests {

	@Autowired
	DataSource dataSource;

	TableService tableService;

	@Before
	public void init() {
		tableService = new TableServiceImpl(dataSource);
	}

	@Test
	public void testListTableDependenciesForTableNone1() {
		final List<String> list = tableService.listTableDependenciesForTable("calendar_event");
		assertEquals(0, list.size());
	}

	@Test
	public void testListTableDependenciesForTableNone2() {
		final List<String> list = tableService.listTableDependenciesForTable("fais_account_code");
		assertEquals(0, list.size());
	}

	@Test
	public void testListTableDependenciesForTableSingle1() {
		final List<String> actual = tableService.listTableDependenciesForTable("contract");
		final List<String> expected = Arrays.asList(new String[] { "ref_bank" });
		assertEquals(expected, actual);
	}

	@Test
	public void testListTableDependenciesForTableSingle2() {
		final List<String> actual = tableService.listTableDependenciesForTable("inbox");
		final List<String> expected = Arrays.asList(new String[] { "user" });
		assertEquals(expected, actual);
	}

	@Test
	public void testListTableDependenciesForTableMultiple1() {
		final List<String> actual = tableService.listTableDependenciesForTable("committee_detail");
		final List<String> expected = Arrays.asList(new String[] { "committee_master", "ref_position", "user" });
		assertEquals(expected, actual);
	}

	@Test
	public void testListTableDependenciesForTableMultiple2() {
		final List<String> actual = tableService.listTableDependenciesForTable("contract_item");
		final List<String> expected = Arrays.asList(new String[] { "contract", "item" });
		assertEquals(expected, actual);
	}

	@Test
	public void testListPKForTable1() {
		final List<String> actual = tableService.listPrimaryKeyColumnsForTable("item");
		final List<String> expected = Arrays.asList(new String[] { "id" });
		assertEquals(expected, actual);
	}

	@Test
	public void testListPKForTable2() {
		final List<String> actual = tableService.listPrimaryKeyColumnsForTable("vendor_equity");
		final List<String> expected = Arrays.asList(new String[] { "vendor_code" });
		assertEquals(expected, actual);
	}
}
