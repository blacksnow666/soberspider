package com.twistlet.soberspider.model.service.old;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.DatabaseColumn;
import com.twistlet.soberspider.model.type.ForeignKey;

@Service
public class TableServiceImpl implements TableService {

	private final ColumnListService columnListService;
	private final PrimaryKeyColumnListService primaryKeyColumnListService;
	private final TableDependencyService tableDependencyService;
	private final ForeignKeyListService foreignKeyListService;

	@Autowired
	public TableServiceImpl(final DataSource dataSource, final ColumnListService columnListService,
			final PrimaryKeyColumnListService primaryKeyColumnListService, final TableDependencyService tableDependencyService,
			final ForeignKeyListService foreignKeyListService) {
		this.columnListService = columnListService;
		this.primaryKeyColumnListService = primaryKeyColumnListService;
		this.tableDependencyService = tableDependencyService;
		this.foreignKeyListService = foreignKeyListService;
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

	@Override
	public List<ForeignKey> listForeignKeysForTable(final String tablename) {
		return foreignKeyListService.listForeignKeys(tablename);
	}

}
