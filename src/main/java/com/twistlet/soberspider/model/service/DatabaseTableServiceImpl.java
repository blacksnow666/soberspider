package com.twistlet.soberspider.model.service;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.DatabaseTable;

@Service
public class DatabaseTableServiceImpl implements DatabaseTableService {

	private final ColumnListService columnListService;
	private final PrimaryKeyColumnListService primaryKeyColumnListService;

	@Autowired
	public DatabaseTableServiceImpl(final ColumnListService columnListService,
			final PrimaryKeyColumnListService primaryKeyColumnListService) {
		this.columnListService = columnListService;
		this.primaryKeyColumnListService = primaryKeyColumnListService;
	}

	@Override
	public DatabaseTable create(final DataSource dataSource, final String tablename) {
		final DatabaseTable databaseTable = new DatabaseTable();
		databaseTable.setColumns(columnListService.listColumns(dataSource, tablename));
		databaseTable.setPrimaryKeyColumns(primaryKeyColumnListService.listPrimaryKeyColumns(dataSource, tablename));
		// TODO: foreign keys, unique index, non-unique index
		return databaseTable;
	}
}
