package com.twistlet.soberspider.model.service.actual;

import javax.sql.DataSource;

public interface DropAllTablesService {
	void dropAllTables(DataSource dataSource);
}
