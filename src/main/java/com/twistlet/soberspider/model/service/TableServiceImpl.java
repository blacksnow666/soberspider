package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.DatabaseColumn;

@Service
public class TableServiceImpl implements TableService {

	private final ColumnListService columnListService;
	private final PrimaryKeyColumnListService primaryKeyColumnListService;
	private final TableDependencyService tableDependencyService;

	@Autowired
	public TableServiceImpl(final DataSource dataSource, final ColumnListService columnListService,
			final PrimaryKeyColumnListService primaryKeyColumnListService, final TableDependencyService tableDependencyService) {
		this.columnListService = columnListService;
		this.primaryKeyColumnListService = primaryKeyColumnListService;
		this.tableDependencyService = tableDependencyService;
	}

	@Override
	public List<String> listTableDependenciesForTable(final String tablename) {
		return tableDependencyService.listTableDependencies(tablename);
	}

	@Override
	public List<String> listPrimaryKeyColumnsForTable(final String tablename) {
		return primaryKeyColumnListService.listPrimaryKeyColumns(tablename);
	}

	@Override
	public List<DatabaseColumn> listColumnsForTable(final String tablename) {
		return columnListService.listColumns(tablename);
	}

}
