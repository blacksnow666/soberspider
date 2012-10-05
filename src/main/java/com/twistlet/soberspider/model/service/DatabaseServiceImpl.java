package com.twistlet.soberspider.model.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.DatabaseTable;

@Service
public class DatabaseServiceImpl implements DatabaseService {

	private final DataSource dataSource;
	private final TableService tableService;

	@Autowired
	public DatabaseServiceImpl(final DataSource dataSource, final TableService tableService) {
		this.dataSource = dataSource;
		this.tableService = tableService;
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
			rs.close();
			return list;
		}
	}

	@Override
	public List<String> sortTablesByCreationOrder(final List<String> list) {
		final List<String> listOk = new ArrayList<>();
		final List<String> listToBeProcessed = new ArrayList<>(list);
		while (listToBeProcessed.size() > 0) {
			final List<String> listAdded = new ArrayList<>();
			for (final String table : listToBeProcessed) {
				final List<String> deps = tableService.listTableDependenciesForTable(table);
				deps.remove(table);
				if (listOk.containsAll(deps)) {
					listAdded.add(table);
					listOk.add(table);
				}
			}
			listToBeProcessed.removeAll(listAdded);
		}
		return listOk;
	}

	@Override
	public DatabaseTable createDatabaseTable(final String tablename) {
		final DatabaseTable databaseTable = new DatabaseTable();
		databaseTable.setName(tablename);
		databaseTable.setPrimaryKeyColumns(tableService.listPrimaryKeyColumnsForTable(tablename));
		databaseTable.setColumns(tableService.listColumnsForTable(tablename));
		return databaseTable;
	}

}
