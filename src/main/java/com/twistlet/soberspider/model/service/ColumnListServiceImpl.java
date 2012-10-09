package com.twistlet.soberspider.model.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.ColumnType;
import com.twistlet.soberspider.model.type.DatabaseColumn;

@Service
public class ColumnListServiceImpl implements ColumnListService {

	private final ColumnTypeMapService columnTypeMapService;

	@Autowired
	public ColumnListServiceImpl(final ColumnTypeMapService columnTypeMapService) {
		this.columnTypeMapService = columnTypeMapService;
	}

	@Override
	public List<DatabaseColumn> listColumns(final DataSource dataSource, final String tablename) {
		final JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		final ListColumnsConnectionCallback callback = new ListColumnsConnectionCallback(tablename);
		final List<DatabaseColumn> result = jdbcTemplate.execute(callback);
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
			final List<DatabaseColumn> columns = rmp.processRowMapper(resultSet, new ListColumnsRowMapper());
			resultSet.close();
			return columns;
		}
	}

	class ListColumnsRowMapper implements RowMapper<DatabaseColumn> {

		@Override
		public DatabaseColumn mapRow(final ResultSet rs, final int rowNum) throws SQLException {
			final String columnName = rs.getString("COLUMN_NAME");
			final int dataType = rs.getInt("DATA_TYPE");
			final ColumnType columnType = columnTypeMapService.resolveColumnType(dataType);
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

}
