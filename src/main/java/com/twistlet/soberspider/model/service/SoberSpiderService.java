package com.twistlet.soberspider.model.service;

import javax.sql.DataSource;

public interface SoberSpiderService {

	void dropAllTables(DataSource dataSource);
}
