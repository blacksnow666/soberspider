package com.twistlet.soberspider.model.service;

import static org.junit.Assert.assertEquals;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.easymock.EasyMock;
import org.junit.Test;

import com.twistlet.soberspider.model.type.ColumnType;
import com.twistlet.soberspider.model.type.DatabaseColumn;

public class ColumnListServiceImplTest {

	@Test
	public void testColumnCountOne() throws SQLException {
		final ColumnTypeMapService columnTypeMapService = EasyMock.createStrictMock(ColumnTypeMapService.class);
		final DataSource dataSource = EasyMock.createStrictMock(DataSource.class);
		final Connection connection = EasyMock.createStrictMock(Connection.class);
		final DatabaseMetaData databaseMetaData = EasyMock.createStrictMock(DatabaseMetaData.class);
		final ResultSet resultSet = EasyMock.createStrictMock(ResultSet.class);
		EasyMock.expect(dataSource.getConnection()).andReturn(connection);
		EasyMock.expect(connection.getMetaData()).andReturn(databaseMetaData);
		EasyMock.expect(databaseMetaData.getColumns(null, null, "table1", null)).andReturn(resultSet);
		EasyMock.expect(resultSet.next()).andReturn(true);
		EasyMock.expect(resultSet.getString("COLUMN_NAME")).andReturn("column1");
		EasyMock.expect(resultSet.getInt("DATA_TYPE")).andReturn(1);
		EasyMock.expect(columnTypeMapService.resolveColumnType(1)).andReturn(ColumnType.COLUMN_TYPE_CHAR);
		EasyMock.expect(resultSet.getInt("COLUMN_SIZE")).andReturn(8);
		EasyMock.expect(resultSet.getInt("DECIMAL_DIGITS")).andReturn(0);
		EasyMock.expect(resultSet.getInt("NULLABLE")).andReturn(0);
		EasyMock.expect(resultSet.getString("IS_AUTOINCREMENT")).andReturn("NO");
		EasyMock.expect(resultSet.getInt("ORDINAL_POSITION")).andReturn(1);
		EasyMock.expect(resultSet.next()).andReturn(Boolean.FALSE);
		resultSet.close();
		connection.close();
		final ColumnListServiceImpl unit = new ColumnListServiceImpl(columnTypeMapService);
		EasyMock.replay(dataSource, columnTypeMapService, connection, databaseMetaData, resultSet);
		final List<DatabaseColumn> list = unit.listColumns(dataSource, "table1");
		assertEquals(1, list.size());
		EasyMock.verify(dataSource, columnTypeMapService, connection, databaseMetaData, resultSet);
	}

	@Test
	public void testColumnCountTwo() throws SQLException {
		final ColumnTypeMapService columnTypeMapService = EasyMock.createStrictMock(ColumnTypeMapService.class);
		final DataSource dataSource = EasyMock.createStrictMock(DataSource.class);
		final Connection connection = EasyMock.createStrictMock(Connection.class);
		final DatabaseMetaData databaseMetaData = EasyMock.createStrictMock(DatabaseMetaData.class);
		final ResultSet resultSet = EasyMock.createStrictMock(ResultSet.class);
		EasyMock.expect(dataSource.getConnection()).andReturn(connection);
		EasyMock.expect(connection.getMetaData()).andReturn(databaseMetaData);
		EasyMock.expect(databaseMetaData.getColumns(null, null, "table1", null)).andReturn(resultSet);
		EasyMock.expect(resultSet.next()).andReturn(true);
		EasyMock.expect(resultSet.getString("COLUMN_NAME")).andReturn("column1");
		EasyMock.expect(resultSet.getInt("DATA_TYPE")).andReturn(1);
		EasyMock.expect(columnTypeMapService.resolveColumnType(1)).andReturn(ColumnType.COLUMN_TYPE_CHAR);
		EasyMock.expect(resultSet.getInt("COLUMN_SIZE")).andReturn(8);
		EasyMock.expect(resultSet.getInt("DECIMAL_DIGITS")).andReturn(0);
		EasyMock.expect(resultSet.getInt("NULLABLE")).andReturn(0);
		EasyMock.expect(resultSet.getString("IS_AUTOINCREMENT")).andReturn("NO");
		EasyMock.expect(resultSet.getInt("ORDINAL_POSITION")).andReturn(1);
		EasyMock.expect(resultSet.next()).andReturn(true);
		EasyMock.expect(resultSet.getString("COLUMN_NAME")).andReturn("column2");
		EasyMock.expect(resultSet.getInt("DATA_TYPE")).andReturn(2);
		EasyMock.expect(columnTypeMapService.resolveColumnType(2)).andReturn(ColumnType.COLUMN_TYPE_VARCHAR);
		EasyMock.expect(resultSet.getInt("COLUMN_SIZE")).andReturn(8);
		EasyMock.expect(resultSet.getInt("DECIMAL_DIGITS")).andReturn(0);
		EasyMock.expect(resultSet.getInt("NULLABLE")).andReturn(1);
		EasyMock.expect(resultSet.getString("IS_AUTOINCREMENT")).andReturn("NO");
		EasyMock.expect(resultSet.getInt("ORDINAL_POSITION")).andReturn(2);
		EasyMock.expect(resultSet.next()).andReturn(Boolean.FALSE);
		resultSet.close();
		connection.close();
		final ColumnListServiceImpl unit = new ColumnListServiceImpl(columnTypeMapService);
		EasyMock.replay(dataSource, columnTypeMapService, connection, databaseMetaData, resultSet);
		final List<DatabaseColumn> list = unit.listColumns(dataSource, "table1");
		assertEquals(2, list.size());
		EasyMock.verify(dataSource, columnTypeMapService, connection, databaseMetaData, resultSet);
	}

	@Test
	public void testColumnAutoIncrement() throws SQLException {
		final ColumnTypeMapService columnTypeMapService = EasyMock.createStrictMock(ColumnTypeMapService.class);
		final DataSource dataSource = EasyMock.createStrictMock(DataSource.class);
		final Connection connection = EasyMock.createStrictMock(Connection.class);
		final DatabaseMetaData databaseMetaData = EasyMock.createStrictMock(DatabaseMetaData.class);
		final ResultSet resultSet = EasyMock.createStrictMock(ResultSet.class);
		EasyMock.expect(dataSource.getConnection()).andReturn(connection);
		EasyMock.expect(connection.getMetaData()).andReturn(databaseMetaData);
		EasyMock.expect(databaseMetaData.getColumns(null, null, "table1", null)).andReturn(resultSet);
		EasyMock.expect(resultSet.next()).andReturn(true);
		EasyMock.expect(resultSet.getString("COLUMN_NAME")).andReturn("column1");
		EasyMock.expect(resultSet.getInt("DATA_TYPE")).andReturn(1);
		EasyMock.expect(columnTypeMapService.resolveColumnType(1)).andReturn(ColumnType.COLUMN_TYPE_INTEGER);
		EasyMock.expect(resultSet.getInt("COLUMN_SIZE")).andReturn(10);
		EasyMock.expect(resultSet.getInt("DECIMAL_DIGITS")).andReturn(0);
		EasyMock.expect(resultSet.getInt("NULLABLE")).andReturn(0);
		EasyMock.expect(resultSet.getString("IS_AUTOINCREMENT")).andReturn("YES");
		EasyMock.expect(resultSet.getInt("ORDINAL_POSITION")).andReturn(1);
		EasyMock.expect(resultSet.next()).andReturn(true);
		EasyMock.expect(resultSet.getString("COLUMN_NAME")).andReturn("column2");
		EasyMock.expect(resultSet.getInt("DATA_TYPE")).andReturn(2);
		EasyMock.expect(columnTypeMapService.resolveColumnType(2)).andReturn(ColumnType.COLUMN_TYPE_VARCHAR);
		EasyMock.expect(resultSet.getInt("COLUMN_SIZE")).andReturn(8);
		EasyMock.expect(resultSet.getInt("DECIMAL_DIGITS")).andReturn(0);
		EasyMock.expect(resultSet.getInt("NULLABLE")).andReturn(1);
		EasyMock.expect(resultSet.getString("IS_AUTOINCREMENT")).andReturn("NO");
		EasyMock.expect(resultSet.getInt("ORDINAL_POSITION")).andReturn(2);
		EasyMock.expect(resultSet.next()).andReturn(Boolean.FALSE);
		resultSet.close();
		connection.close();
		final ColumnListServiceImpl unit = new ColumnListServiceImpl(columnTypeMapService);
		EasyMock.replay(dataSource, columnTypeMapService, connection, databaseMetaData, resultSet);
		final List<DatabaseColumn> list = unit.listColumns(dataSource, "table1");
		assertEquals(true, list.get(0).isAutoIncrement());
		EasyMock.verify(dataSource, columnTypeMapService, connection, databaseMetaData, resultSet);
	}

	@Test
	public void testColumnAutoIncrementFalse() throws SQLException {
		final ColumnTypeMapService columnTypeMapService = EasyMock.createStrictMock(ColumnTypeMapService.class);
		final DataSource dataSource = EasyMock.createStrictMock(DataSource.class);
		final Connection connection = EasyMock.createStrictMock(Connection.class);
		final DatabaseMetaData databaseMetaData = EasyMock.createStrictMock(DatabaseMetaData.class);
		final ResultSet resultSet = EasyMock.createStrictMock(ResultSet.class);
		EasyMock.expect(dataSource.getConnection()).andReturn(connection);
		EasyMock.expect(connection.getMetaData()).andReturn(databaseMetaData);
		EasyMock.expect(databaseMetaData.getColumns(null, null, "table1", null)).andReturn(resultSet);
		EasyMock.expect(resultSet.next()).andReturn(true);
		EasyMock.expect(resultSet.getString("COLUMN_NAME")).andReturn("column1");
		EasyMock.expect(resultSet.getInt("DATA_TYPE")).andReturn(1);
		EasyMock.expect(columnTypeMapService.resolveColumnType(1)).andReturn(ColumnType.COLUMN_TYPE_INTEGER);
		EasyMock.expect(resultSet.getInt("COLUMN_SIZE")).andReturn(10);
		EasyMock.expect(resultSet.getInt("DECIMAL_DIGITS")).andReturn(0);
		EasyMock.expect(resultSet.getInt("NULLABLE")).andReturn(0);
		EasyMock.expect(resultSet.getString("IS_AUTOINCREMENT")).andReturn("NO");
		EasyMock.expect(resultSet.getInt("ORDINAL_POSITION")).andReturn(1);
		EasyMock.expect(resultSet.next()).andReturn(true);
		EasyMock.expect(resultSet.getString("COLUMN_NAME")).andReturn("column2");
		EasyMock.expect(resultSet.getInt("DATA_TYPE")).andReturn(2);
		EasyMock.expect(columnTypeMapService.resolveColumnType(2)).andReturn(ColumnType.COLUMN_TYPE_VARCHAR);
		EasyMock.expect(resultSet.getInt("COLUMN_SIZE")).andReturn(8);
		EasyMock.expect(resultSet.getInt("DECIMAL_DIGITS")).andReturn(0);
		EasyMock.expect(resultSet.getInt("NULLABLE")).andReturn(1);
		EasyMock.expect(resultSet.getString("IS_AUTOINCREMENT")).andReturn("NO");
		EasyMock.expect(resultSet.getInt("ORDINAL_POSITION")).andReturn(2);
		EasyMock.expect(resultSet.next()).andReturn(Boolean.FALSE);
		resultSet.close();
		connection.close();
		final ColumnListServiceImpl unit = new ColumnListServiceImpl(columnTypeMapService);
		EasyMock.replay(dataSource, columnTypeMapService, connection, databaseMetaData, resultSet);
		final List<DatabaseColumn> list = unit.listColumns(dataSource, "table1");
		assertEquals(false, list.get(0).isAutoIncrement());
		EasyMock.verify(dataSource, columnTypeMapService, connection, databaseMetaData, resultSet);
	}

	@Test(expected = RuntimeException.class)
	public void testColumnTypeNull() throws SQLException {
		final ColumnTypeMapService columnTypeMapService = EasyMock.createStrictMock(ColumnTypeMapService.class);
		final DataSource dataSource = EasyMock.createStrictMock(DataSource.class);
		final Connection connection = EasyMock.createStrictMock(Connection.class);
		final DatabaseMetaData databaseMetaData = EasyMock.createStrictMock(DatabaseMetaData.class);
		final ResultSet resultSet = EasyMock.createStrictMock(ResultSet.class);
		EasyMock.expect(dataSource.getConnection()).andReturn(connection);
		EasyMock.expect(connection.getMetaData()).andReturn(databaseMetaData);
		EasyMock.expect(databaseMetaData.getColumns(null, null, "table1", null)).andReturn(resultSet);
		EasyMock.expect(resultSet.next()).andReturn(true);
		EasyMock.expect(resultSet.getString("COLUMN_NAME")).andReturn("column1");
		EasyMock.expect(resultSet.getInt("DATA_TYPE")).andReturn(1);
		EasyMock.expect(columnTypeMapService.resolveColumnType(1)).andReturn(null);
		connection.close();
		final ColumnListServiceImpl unit = new ColumnListServiceImpl(columnTypeMapService);
		EasyMock.replay(dataSource, columnTypeMapService, connection, databaseMetaData, resultSet);
		unit.listColumns(dataSource, "table1");
	}
}
