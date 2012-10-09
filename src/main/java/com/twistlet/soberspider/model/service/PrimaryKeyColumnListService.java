package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

public interface PrimaryKeyColumnListService {
	List<String> listPrimaryKeyColumns(DataSource dataSource, String tablename);
}
