package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

import com.twistlet.soberspider.model.type.DatabaseTable;

public interface ListDatabaseTablesService {

	List<DatabaseTable> list(DataSource dataSource);
}
