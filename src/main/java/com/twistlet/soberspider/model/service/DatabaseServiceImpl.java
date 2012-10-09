package com.twistlet.soberspider.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DatabaseServiceImpl implements DatabaseService {

	private final ListTableService listTableService;
	private final TableDependencyService tableDependencyService;

	@Autowired
	public DatabaseServiceImpl(final ListTableService listTableService, final TableDependencyService tableDependencyService) {
		this.listTableService = listTableService;
		this.tableDependencyService = tableDependencyService;
	}

	@Override
	public List<String> listTables(final DataSource dataSource) {
		return listTableService.list(dataSource);
	}

	@Override
	public List<String> sortTables(final DataSource dataSource, final List<String> tables) {
		final List<String> listOk = new ArrayList<>();
		final List<String> listToBeProcessed = new ArrayList<>(tables);
		while (listToBeProcessed.size() > 0) {
			final List<String> listAdded = new ArrayList<>();
			for (final String table : listToBeProcessed) {
				final List<String> deps = tableDependencyService.listTableDependencies(dataSource, table);
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
}
