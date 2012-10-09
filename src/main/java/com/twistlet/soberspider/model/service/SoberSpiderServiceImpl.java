package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.DatabaseTable;

@Service
public class SoberSpiderServiceImpl implements SoberSpiderService {

	private final DropAllTablesService dropAllTablesService;
	private final ListDatabaseTablesService listDatabaseTablesService;

	@Autowired
	public SoberSpiderServiceImpl(final DropAllTablesService dropAllTablesService,
			final ListDatabaseTablesService listDatabaseTablesService) {
		this.dropAllTablesService = dropAllTablesService;
		this.listDatabaseTablesService = listDatabaseTablesService;
	}

	@Override
	public void dropAllTables(final DataSource dataSource) {
		dropAllTablesService.dropAllTables(dataSource);
	}

	@Override
	public List<DatabaseTable> listDatabaseTables(final DataSource dataSource) {
		return listDatabaseTablesService.list(dataSource);

	}

}
