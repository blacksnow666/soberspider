package com.twistlet.soberspider.model.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.twistlet.soberspider.model.type.ColumnType;
import com.twistlet.soberspider.model.type.DatabaseColumn;

@ContextConfiguration("classpath:application-context-service.xml")
public class ColumnListServiceTest extends AbstractJUnit4SpringContextTests {

	@Autowired
	ColumnListService columnListService;

	@Autowired
	DataSource dataSource;

	@Test
	public void testColumnCount1() {
		final List<DatabaseColumn> list = columnListService.listColumns(dataSource, "calendar_event");
		assertEquals(6, list.size());
	}

	@Test
	public void testColumnCount2() {
		final List<DatabaseColumn> list = columnListService.listColumns(dataSource, "user_role");
		assertEquals(3, list.size());
	}

	@Test
	public void testColumnName() {
		final List<DatabaseColumn> list = columnListService.listColumns(dataSource, "calendar_event");
		final List<String> names = new ArrayList<>();
		for (final DatabaseColumn databaseColumn : list) {
			names.add(databaseColumn.getColumnName());
		}
		final String actual = StringUtils.join(names, ", ");
		final String expected = "id, title, content, start_date, end_date, jenis";
		assertEquals(expected, actual);
	}

	@Test
	public void testColumnDataType() {
		final List<DatabaseColumn> list = columnListService.listColumns(dataSource, "calendar_event");
		final List<ColumnType> types = new ArrayList<>();
		for (final DatabaseColumn databaseColumn : list) {
			types.add(databaseColumn.getColumnType());
		}
		final String actual = StringUtils.join(types, ", ");
		final String expected = "COLUMN_TYPE_INTEGER, COLUMN_TYPE_VARCHAR, COLUMN_TYPE_VARCHAR, COLUMN_TYPE_TIMESTAMP, COLUMN_TYPE_TIMESTAMP, COLUMN_TYPE_VARCHAR";
		assertEquals(expected, actual);
	}

	@Test
	public void testColumnSize() {
		final List<DatabaseColumn> list = columnListService.listColumns(dataSource, "calendar_event");
		final List<Integer> values = new ArrayList<>();
		for (final DatabaseColumn databaseColumn : list) {
			values.add(databaseColumn.getColumnSize());
		}
		final String actual = StringUtils.join(values, "/");
		final String expected = "[0-9]*/50/1000/[0-9]*/[0-9]*/2";
		assertTrue(actual.matches(expected));
	}
}
