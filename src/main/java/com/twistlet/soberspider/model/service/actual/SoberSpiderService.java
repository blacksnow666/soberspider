package com.twistlet.soberspider.model.service.actual;

import javax.sql.DataSource;

public interface SoberSpiderService {

	void dropAllTables(DataSource dataSource);
}
