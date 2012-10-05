package com.twistlet.soberspider.model.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.twistlet.soberspider.model.type.ColumnType;
import com.twistlet.soberspider.model.type.DatabaseColumn;

public class TableServiceImpl implements TableService {

	private final DataSource dataSource;
	private final Map<Integer, ColumnType> columnTypeMap;

	@Autowired
	public TableServiceImpl(final DataSource dataSource, final Map<Integer, ColumnType> columnTypeMap) {
		this.dataSource = dataSource;
		this.columnTypeMap = columnTypeMap;
	}

	@Override
	public List<String> listTableDependenciesForTable(final String tablename) {
		final ListTableDependenciesConnectionCallback callback = new ListTableDependenciesConnectionCallback(tablename);
		final List<String> result = new JdbcTemplate(dataSource).execute(callback);
		return result;
	}

	class ListTableDependenciesConnectionCallback implements ConnectionCallback<List<String>> {

		private final String tablename;

		public ListTableDependenciesConnectionCallback(final String tablename) {
			this.tablename = tablename;
			// TODO Auto-generated constructor stub
		}

		@Override
		public List<String> doInConnection(final Connection connection) throws SQLException, DataAccessException {
			final Set<String> tables = new LinkedHashSet<>();
			final DatabaseMetaData databaseMetaData = connection.getMetaData();
			final ResultSet resultSet = databaseMetaData.getImportedKeys(null, null, tablename);
			while (resultSet.next()) {
				final String table = resultSet.getString("PKTABLE_NAME");
				tables.add(table);
			}
			resultSet.close();
			return new ArrayList<>(tables);
		}
	}

	@Override
	public List<String> listPrimaryKeyColumnsForTable(final String tablename) {
		final ListPrimaryKeyColumnsConnectionCallback callback = new ListPrimaryKeyColumnsConnectionCallback(tablename);
		final List<String> result = new JdbcTemplate(dataSource).execute(callback);
		return result;
	}

	class ListPrimaryKeyColumnsConnectionCallback implements ConnectionCallback<List<String>> {

		private final String tablename;

		public ListPrimaryKeyColumnsConnectionCallback(final String tablename) {
			this.tablename = tablename;
		}

		@Override
		public List<String> doInConnection(final Connection connection) throws SQLException, DataAccessException {
			final List<String> columns = new ArrayList<>();
			final Map<String, String> map = new LinkedHashMap<>();
			final DatabaseMetaData databaseMetaData = connection.getMetaData();
			final ResultSet resultSet = databaseMetaData.getPrimaryKeys(null, null, tablename);
			final TableServiceRowMapperProcessor<String> rmp = new TableServiceRowMapperProcessor<>();
			final RowMapper<String> mapper = new RowMapper<String>() {

				@Override
				public String mapRow(final ResultSet rs, final int rowNum) throws SQLException {
					final String column = resultSet.getString("COLUMN_NAME");
					final Short index = resultSet.getShort("KEY_SEQ");
					map.put(index.toString(), column);
					return column;
				}
			};
			final int count = rmp.processRowMapper(resultSet, mapper).size();
			resultSet.close();
			final Set<String> set = map.keySet();
			if (count != set.size()) {
				throw new RuntimeException("PK size inconsistency in table " + tablename);
			}
			populateAndCheckColumns(columns, map, set);
			return columns;
		}

		private void populateAndCheckColumns(final List<String> columns, final Map<String, String> map, final Set<String> set) {
			short index = 0;
			for (final String key : set) {
				index++;
				if (!(new Short(index).toString().equals(key))) {
					throw new RuntimeException("PK ordering inconsistency in table " + tablename);
				}
				columns.add(map.get(key));
			}
		}
	}

	class TableServiceRowMapperProcessor<T> {
		public List<T> processRowMapper(final ResultSet rs, final RowMapper<T> rm) throws SQLException {
			int count = 0;
			final List<T> list = new ArrayList<>();
			while (rs.next()) {
				list.add(rm.mapRow(rs, count++));
			}
			return list;
		}
	}

	class ListPrimaryKeyColumnsRowMapper implements RowMapper<DatabaseColumn> {

		@Override
		public DatabaseColumn mapRow(final ResultSet rs, final int rowNum) throws SQLException {
			final String columnName = rs.getString("COLUMN_NAME");
			final int dataType = rs.getInt("DATA_TYPE");
			final ColumnType columnType = columnTypeMap.get(dataType);
			if (columnType == null) {
				throw new RuntimeException(columnName + ": column type not mapped: " + dataType);
			}
			final int columnSize = rs.getInt("COLUMN_SIZE");
			final int decimalDigits = rs.getInt("DECIMAL_DIGITS");
			final boolean nullable = rs.getInt("NULLABLE") == 1 ? true : false;
			final String autoIncrementStatus = rs.getString("IS_AUTOINCREMENT");
			final boolean autoIncrement = "YES".equals(autoIncrementStatus) ? true : false;
			final int ordinalPosition = rs.getInt("ORDINAL_POSITION");
			return new DatabaseColumn(columnName, columnType, columnSize, decimalDigits, nullable, autoIncrement, ordinalPosition);
		}
	}

	@Override
	public List<DatabaseColumn> listColumnsForTable(final String tablename) {
		final ListColumnsConnectionCallback callback = new ListColumnsConnectionCallback(tablename);
		final List<DatabaseColumn> result = new JdbcTemplate(dataSource).execute(callback);
		return result;
	}

	class ListColumnsConnectionCallback implements ConnectionCallback<List<DatabaseColumn>> {

		private final String tablename;

		public ListColumnsConnectionCallback(final String tablename) {
			this.tablename = tablename;
		}

		@Override
		public List<DatabaseColumn> doInConnection(final Connection connection) throws SQLException, DataAccessException {
			final DatabaseMetaData databaseMetaData = connection.getMetaData();
			final ResultSet resultSet = databaseMetaData.getColumns(null, null, tablename, null);
			final TableServiceRowMapperProcessor<DatabaseColumn> rmp = new TableServiceRowMapperProcessor<>();
			final List<DatabaseColumn> columns = rmp.processRowMapper(resultSet, new ListPrimaryKeyColumnsRowMapper());
			resultSet.close();
			return columns;
		}
	}
}
