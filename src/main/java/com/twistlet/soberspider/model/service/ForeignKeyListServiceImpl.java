package com.twistlet.soberspider.model.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.ForeignKey;

@Service
public class ForeignKeyListServiceImpl implements ForeignKeyListService {

	@Override
	public List<ForeignKey> listForeignKeys(final DataSource dataSource, final String tablename) {
		final JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		final ListForeignKeysConnectionCallback callback = new ListForeignKeysConnectionCallback(tablename);
		final List<ForeignKey> result = jdbcTemplate.execute(callback);
		return result;
	}

	class ListForeignKeysConnectionCallback implements ConnectionCallback<List<ForeignKey>> {
		private final String tablename;

		public ListForeignKeysConnectionCallback(final String tablename) {
			this.tablename = tablename;
		}

		@Override
		public List<ForeignKey> doInConnection(final Connection connection) throws SQLException, DataAccessException {
			final DatabaseMetaData databaseMetaData = connection.getMetaData();
			final ResultSet resultSet = databaseMetaData.getImportedKeys(null, null, tablename);
			final TableServiceRowMapperProcessor<ForeignKey> rmp = new TableServiceRowMapperProcessor<>();
			final List<ForeignKey> keys = rmp.processRowMapper(resultSet, new ListForeignKeysRowMapper());
			resultSet.close();
			return keys;
		}
	}

	class ListForeignKeysRowMapper implements RowMapper<ForeignKey> {

		@Override
		public ForeignKey mapRow(final ResultSet rs, final int rowNum) throws SQLException {
			final String tablename = rs.getString("PKTABLE_NAME");
			final String pkColumnName = rs.getString("PKCOLUMN_NAME");
			final String fkTablename = rs.getString("FKTABLE_NAME");
			final String fkColumnName = rs.getString("FKCOLUMN_NAME");
			final short updateRule = rs.getShort("UPDATE_RULE");
			final short deleteRule = rs.getShort("DELETE_RULE");

			final short keySeq = rs.getShort("KEY_SEQ");
			if (keySeq != (short) 1) {
				throw new UnsupportedOperationException("table " + tablename + ":" + pkColumnName
						+ " uses a composite foreign key with table " + fkTablename + ":" + fkColumnName);
			}
			final ForeignKey fk = new ForeignKey(fkColumnName, pkColumnName, tablename, updateRule, deleteRule);
			return fk;
		}
	}

}
