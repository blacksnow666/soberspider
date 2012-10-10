package com.twistlet.soberspider.model.service;

import static org.easymock.EasyMock.*;
import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;

public class DatabaseServiceImplTest {

	@Test
	public void testListTables() {
		final List<String> tables = Arrays.asList("table1", "table200", "table304");
		final DataSource dataSource = createStrictMock(DataSource.class);
		final ListTableService listTableService = createStrictMock(ListTableService.class);
		expect(listTableService.list(dataSource)).andReturn(tables);
		final DatabaseServiceImpl unit = new DatabaseServiceImpl(listTableService, null);
		replay(dataSource, listTableService);
		final List<String> result = unit.listTables(dataSource);
		final String actual = StringUtils.join(result, "/");
		final String expected = "table1/table200/table304";
		assertEquals(expected, actual);
		verify(dataSource, listTableService);
	}

	@Test
	public void testSortTables() {
		final List<String> tables = Arrays.asList("table1", "table200", "table304");
		final DataSource dataSource = createStrictMock(DataSource.class);
		final TableDependencyService tableDependencyService = createStrictMock(TableDependencyService.class);
		expect(tableDependencyService.listTableDependencies(dataSource, "table1")).andReturn(new ArrayList<String>());
		expect(tableDependencyService.listTableDependencies(dataSource, "table200")).andReturn(Arrays.asList("table304"));
		expect(tableDependencyService.listTableDependencies(dataSource, "table304")).andReturn(new ArrayList<String>());
		final DatabaseServiceImpl unit = new DatabaseServiceImpl(null, tableDependencyService);
		replay(dataSource, tableDependencyService);
		final List<String> result = unit.sortTables(dataSource, tables);
		final String actual = StringUtils.join(result, "/");
		final String expected = "table1/table304/table200";
		assertEquals(expected, actual);
		verify(dataSource, tableDependencyService);
	}
}
