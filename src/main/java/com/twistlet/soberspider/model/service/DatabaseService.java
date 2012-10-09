package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

public interface DatabaseService {
	List<String> listTables(DataSource dataSource);

	List<String> sortTables(DataSource dataSource, List<String> tables);
}
