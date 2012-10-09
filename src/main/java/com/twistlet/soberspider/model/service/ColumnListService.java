package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

import com.twistlet.soberspider.model.type.DatabaseColumn;

public interface ColumnListService {
	List<DatabaseColumn> listColumns(DataSource dataSource, String tablename);
}
