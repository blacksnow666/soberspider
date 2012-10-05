package com.twistlet.soberspider.model.service;

import java.util.List;

import com.twistlet.soberspider.model.type.DatabaseColumn;

public interface ColumnListService {
	List<DatabaseColumn> listColumns(String tablename);
}
