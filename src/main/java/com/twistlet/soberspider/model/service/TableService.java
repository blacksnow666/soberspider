package com.twistlet.soberspider.model.service;

import java.util.List;

import com.twistlet.soberspider.model.type.DatabaseColumn;

public interface TableService {

	List<String> listTableDependenciesForTable(String tablename);

	List<String> listPrimaryKeyColumnsForTable(String tablename);

	List<DatabaseColumn> listColumnsForTable(String tablename);
}
