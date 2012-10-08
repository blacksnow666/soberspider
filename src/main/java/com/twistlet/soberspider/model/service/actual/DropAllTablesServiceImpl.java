package com.twistlet.soberspider.model.service.actual;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

@Service
public class DropAllTablesServiceImpl implements DropAllTablesService {

	private final DatabaseService databaseService;

	protected final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	public DropAllTablesServiceImpl(final DatabaseService databaseService) {
		this.databaseService = databaseService;
	}

	@Override
	public void dropAllTables(final DataSource dataSource) {
		final DataSourceTransactionManager transactionManager = new DataSourceTransactionManager(dataSource);
		final TransactionTemplate transactionTemplate = new TransactionTemplate(transactionManager);
		final List<String> tables = new ArrayList<>();
		tables.addAll(databaseService.listTables(dataSource));
		final int sizeBefore = tables.size();
		logger.info("{} tables found", sizeBefore);
		while (tables.size() > 0) {
			transactionTemplate.execute(new DropAllTablesTransactionCallback(dataSource, tables));
			tables.clear();
			tables.addAll(databaseService.listTables(dataSource));
			final int sizeAfter = tables.size();
			if (sizeAfter >= sizeBefore) {
				throw new RuntimeException("dropping tables do not seem to decrease table count");
			}
		}
	}

	class DropAllTablesTransactionCallback implements TransactionCallback<String> {
		private final DataSource dataSource;
		private final List<String> tables;

		public DropAllTablesTransactionCallback(final DataSource dataSource, final List<String> tables) {
			this.dataSource = dataSource;
			this.tables = tables;

		}

		@Override
		public String doInTransaction(final TransactionStatus status) {
			final JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
			final List<String> sortedTables = databaseService.sortTables(dataSource, tables);
			Collections.reverse(sortedTables);
			final int total = tables.size();
			int i = 0;
			for (final String table : sortedTables) {
				try {
					jdbcTemplate.execute("DROP TABLE " + table);
					i++;
				} catch (final DataAccessException e) {
					logger.error(e.toString());
				}
			}
			logger.info("{}/{} tables dropped", i, total);
			return null;
		}

	}

}
