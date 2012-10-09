package com.twistlet.soberspider.model.service;

import javax.sql.DataSource;

import com.twistlet.soberspider.model.type.DatabaseTable;

public interface DatabaseTableService {
	DatabaseTable create(DataSource dataSource, String tablename);
}
