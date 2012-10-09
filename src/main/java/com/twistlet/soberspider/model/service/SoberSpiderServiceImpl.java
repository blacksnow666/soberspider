package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.DatabaseTable;

@Service
public class SoberSpiderServiceImpl implements SoberSpiderService {

	private final DropAllTablesService dropAllTablesService;

	@Autowired
	public SoberSpiderServiceImpl(final DropAllTablesService dropAllTablesService) {
		this.dropAllTablesService = dropAllTablesService;
	}

	@Override
	public void dropAllTables(final DataSource dataSource) {
		dropAllTablesService.dropAllTables(dataSource);
	}

	@Override
	public List<DatabaseTable> listDatabaseTables(final DataSource dataSource) {
		// TODO Auto-generated method stub
		return null;
	}

}
