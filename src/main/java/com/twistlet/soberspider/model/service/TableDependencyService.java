package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

public interface TableDependencyService {
	List<String> listTableDependencies(DataSource dataSource, String tablename);

}
