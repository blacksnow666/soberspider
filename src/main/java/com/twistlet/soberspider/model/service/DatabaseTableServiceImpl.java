package com.twistlet.soberspider.model.service;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.DatabaseTable;

@Service
public class DatabaseTableServiceImpl implements DatabaseTableService {

	private final ColumnListService columnListService;
	private final PrimaryKeyColumnListService primaryKeyColumnListService;
	private final ForeignKeyListService foreignKeyListService;
	private final TableIndexService tableIndexService;

	@Autowired
	public DatabaseTableServiceImpl(final ColumnListService columnListService,
			final PrimaryKeyColumnListService primaryKeyColumnListService, final ForeignKeyListService foreignKeyListService,
			final TableIndexService tableIndexService) {
		this.columnListService = columnListService;
		this.primaryKeyColumnListService = primaryKeyColumnListService;
		this.foreignKeyListService = foreignKeyListService;
		this.tableIndexService = tableIndexService;
	}

	@Override
	public DatabaseTable create(final DataSource dataSource, final String tablename) {
		final DatabaseTable databaseTable = new DatabaseTable();
		databaseTable.setName(tablename);
		databaseTable.setColumns(columnListService.listColumns(dataSource, tablename));
		databaseTable.setPrimaryKeyColumns(primaryKeyColumnListService.listPrimaryKeyColumns(dataSource, tablename));
		databaseTable.setForeignKeys(foreignKeyListService.listForeignKeys(dataSource, tablename));
		databaseTable.setTableIndexes(tableIndexService.list(dataSource, tablename));
		return databaseTable;
	}
}
