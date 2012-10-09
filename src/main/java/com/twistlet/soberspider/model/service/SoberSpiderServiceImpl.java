package com.twistlet.soberspider.model.service.actual;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
