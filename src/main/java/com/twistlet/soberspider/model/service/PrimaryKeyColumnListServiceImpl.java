package com.twistlet.soberspider.model.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

@Service
public class PrimaryKeyColumnListServiceImpl implements PrimaryKeyColumnListService {

	private final JdbcTemplate jdbcTemplate;

	@Autowired
	public PrimaryKeyColumnListServiceImpl(final JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<String> listPrimaryKeyColumns(final String tablename) {
		final ListPrimaryKeyColumnsConnectionCallback callback = new ListPrimaryKeyColumnsConnectionCallback(tablename);
		final List<String> result = jdbcTemplate.execute(callback);
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
}
