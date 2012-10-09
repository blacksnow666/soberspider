package com.twistlet.soberspider.model.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class TableDependencyServiceImpl implements TableDependencyService {

	@Override
	public List<String> listTableDependencies(final DataSource dataSource, final String tablename) {
		final JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		final ListTableDependenciesConnectionCallback callback = new ListTableDependenciesConnectionCallback(tablename);
		final List<String> result = jdbcTemplate.execute(callback);
		return result;
	}

	class ListTableDependenciesConnectionCallback implements ConnectionCallback<List<String>> {

		private final String tablename;

		public ListTableDependenciesConnectionCallback(final String tablename) {
			this.tablename = tablename;
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

}
