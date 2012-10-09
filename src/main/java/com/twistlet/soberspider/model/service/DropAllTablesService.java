package com.twistlet.soberspider.model.service;

import javax.sql.DataSource;

public interface DropAllTablesService {
	void dropAllTables(DataSource dataSource);
}
