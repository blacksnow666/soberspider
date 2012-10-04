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

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;

public class TableServiceImpl implements TableService {

	private final DataSource dataSource;

	public TableServiceImpl(final DataSource dataSource) {
		this.dataSource = dataSource;
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
			int count = 0;
			while (resultSet.next()) {
				final String column = resultSet.getString("COLUMN_NAME");
				final Short index = resultSet.getShort("KEY_SEQ");
				map.put(index.toString(), column);
				count++;
			}
			resultSet.close();
			final Set<String> set = map.keySet();
			if (count != set.size()) {
				throw new RuntimeException("PK size inconsistency in table " + tablename);
			}
			short index = 0;
			for (final String key : set) {
				index++;
				if (!(new Short(index).toString().equals(key))) {
					throw new RuntimeException("PK ordering inconsistency in table " + tablename);
				}
				columns.add(map.get(key));
			}
			return columns;
		}
	}

}
