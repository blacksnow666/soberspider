package com.twistlet.soberspider.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.DatabaseTable;

@Service
public class ListDatabaseTablesServiceImpl implements ListDatabaseTablesService {
	private final DatabaseService databaseService;
	private final DatabaseTableService databaseTableService;
	private final ForeignKeySameTypeLengthService foreignKeySameTypeLengthService;

	@Autowired
	public ListDatabaseTablesServiceImpl(final DatabaseService databaseService, final DatabaseTableService databaseTableService,
			final ForeignKeySameTypeLengthService foreignKeySameTypeLengthService) {
		this.databaseService = databaseService;
		this.databaseTableService = databaseTableService;
		this.foreignKeySameTypeLengthService = foreignKeySameTypeLengthService;
	}

	@Override
	public List<DatabaseTable> list(final DataSource dataSource) {
		final List<String> listTables = databaseService.listTables(dataSource);
		final List<String> tables = databaseService.sortTables(dataSource, listTables);
		final List<DatabaseTable> list = new ArrayList<>();
		for (final String table : tables) {
			final DatabaseTable databaseTable = databaseTableService.create(dataSource, table);
			list.add(databaseTable);
		}
		for (final DatabaseTable databaseTable : list) {
			foreignKeySameTypeLengthService.isTableForeignKeysGood(databaseTable, list);
		}
		// TODO check for validity
		return list;
	}

}
