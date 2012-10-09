package com.twistlet.soberspider.model.service.actual;

import java.util.List;

import javax.sql.DataSource;

public interface TableDependencyService {
	List<String> listTableDependencies(DataSource dataSource, String tablename);

}
