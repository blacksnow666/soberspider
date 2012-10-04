package com.twistlet.soberspider.model.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;

public class DatabaseServiceImpl implements DatabaseService {

	private final DataSource dataSource;

	public DatabaseServiceImpl(final DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	@Override
	public List<String> listTables() {
		final ListTablesConnectionCallback callback = new ListTablesConnectionCallback();
		final List<String> result = new JdbcTemplate(dataSource).execute(callback);
		return result;
	}

	class ListTablesConnectionCallback implements ConnectionCallback<List<String>> {

		@Override
		public List<String> doInConnection(final Connection connection) throws SQLException, DataAccessException {
			final List<String> list = new ArrayList<>();
			final DatabaseMetaData databaseMetaData = connection.getMetaData();
			final String[] tableTypes = new String[] { "TABLE" };
			final ResultSet rs = databaseMetaData.getTables(null, null, null, tableTypes);
			while (rs.next()) {
				final String table = rs.getString("TABLE_NAME");
				list.add(table);
			}
			return list;
		}
	}

	@Override
	public List<String> sortByCreationOrder(final List<String> list) {
		// TODO Auto-generated method stub
		return null;
	}

}
