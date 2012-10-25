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

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.DatabaseTableIndex;

@Service
public class TableIndexServiceImpl implements TableIndexService {

	@Override
	public List<DatabaseTableIndex> list(final DataSource dataSource, final String tablename) {
		final JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		final List<DatabaseTableIndex> listNonUnique = jdbcTemplate.execute(new TableIndexConnectionCallback(tablename, false));
		final List<DatabaseTableIndex> listUnique = jdbcTemplate.execute(new TableIndexConnectionCallback(tablename, true));
		final List<DatabaseTableIndex> list = new ArrayList<>();
		for (final DatabaseTableIndex item : listNonUnique) {
			list.add(item);
		}
		for (final DatabaseTableIndex item : listUnique) {
			list.add(item);
		}
		return list;
	}

	class TableIndexConnectionCallback implements ConnectionCallback<List<DatabaseTableIndex>> {
		private final String tablename;
		private final boolean unique;

		public TableIndexConnectionCallback(final String tablename, final boolean unique) {
			this.tablename = tablename;
			this.unique = unique;
		}

		@Override
		public List<DatabaseTableIndex> doInConnection(final Connection connection) throws SQLException, DataAccessException {
			final List<DatabaseTableIndex> list = new ArrayList<>();
			final DatabaseMetaData databaseMetaData = connection.getMetaData();
			final ResultSet resultSet = databaseMetaData.getIndexInfo(null, null, tablename, unique, false);
			final MapResultSetExtractor rse = new MapResultSetExtractor(tablename, !unique);
			final Map<String, Map<Short, String>> map = rse.extractData(resultSet);
			validateMapContent(map);
			final Set<String> set = map.keySet();
			for (final String name : set) {
				final Map<Short, String> columnMap = map.get(name);
				final List<String> columns = new ArrayList<>(columnMap.values());
				final DatabaseTableIndex databaseTableIndex = new DatabaseTableIndex(name, columns, unique);
				list.add(databaseTableIndex);
			}
			resultSet.close();
			return list;
		}

		private void validateMapContent(final Map<String, Map<Short, String>> map) {
			final Set<String> set = map.keySet();
			for (final String index : set) {
				final Map<Short, String> columnMap = map.get(index);
				final int size = columnMap.size();
				for (short i = 1; i <= size; i++) {
					final String column = columnMap.get(new Short(i));
					if (column == null) {
						throw new RuntimeException("Error processing index " + index + ". Column #" + i + " is missing.");
					}
				}
			}
		}
	}

	class MapResultSetExtractor implements ResultSetExtractor<Map<String, Map<Short, String>>> {
		private final String tablename;
		private final boolean nonUnique;

		public MapResultSetExtractor(final String tablename, final boolean nonUnique) {
			this.tablename = tablename;
			this.nonUnique = nonUnique;
		}

		@Override
		public Map<String, Map<Short, String>> extractData(final ResultSet rs) throws SQLException, DataAccessException {
			final Map<String, Map<Short, String>> map = new LinkedHashMap<>();
			while (rs.next()) {
				final boolean indexNonUnique = rs.getBoolean("NON_UNIQUE");
				if (indexNonUnique != nonUnique) {
					continue;
				}
				final String name = rs.getString("INDEX_NAME");
				if (name == null) {
					throw new RuntimeException("NULL index name");
				}
				if ("PRIMARY".equals(name)) {
					continue;
				}
				Map<Short, String> entries = map.get(name);
				if (entries == null) {
					entries = new LinkedHashMap<>();
					map.put(name, entries);
				}
				final short ordinalPosition = rs.getShort("ORDINAL_POSITION");
				final String columnName = rs.getString("COLUMN_NAME");
				final String column = entries.get(new Short(ordinalPosition));
				if (column != null) {
					throw new RuntimeException("Table " + tablename + " with index " + name + " has columns " + columnName
							+ " and " + column + " for position " + ordinalPosition);
				}
				entries.put(new Short(ordinalPosition), columnName);
			}
			return map;
		}
	}

}
