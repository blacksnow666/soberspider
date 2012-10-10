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

	@Autowired
	public DatabaseTableServiceImpl(final ColumnListService columnListService,
			final PrimaryKeyColumnListService primaryKeyColumnListService, final ForeignKeyListService foreignKeyListService) {
		this.columnListService = columnListService;
		this.primaryKeyColumnListService = primaryKeyColumnListService;
		this.foreignKeyListService = foreignKeyListService;
	}

	@Override
	public DatabaseTable create(final DataSource dataSource, final String tablename) {
		final DatabaseTable databaseTable = new DatabaseTable();
		databaseTable.setName(tablename);
		databaseTable.setColumns(columnListService.listColumns(dataSource, tablename));
		databaseTable.setPrimaryKeyColumns(primaryKeyColumnListService.listPrimaryKeyColumns(dataSource, tablename));
		databaseTable.setForeignKeys(foreignKeyListService.listForeignKeys(dataSource, tablename));
		// TODO: set indexes (unique and non-unique)
		return databaseTable;
	}
}
