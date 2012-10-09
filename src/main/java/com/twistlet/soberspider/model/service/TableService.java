package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

public interface TableService {
	List<String> listTableDependencies(DataSource dataSource, List<String> tables);
}
