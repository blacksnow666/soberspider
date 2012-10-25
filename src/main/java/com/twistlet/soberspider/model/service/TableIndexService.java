package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

import com.twistlet.soberspider.model.type.DatabaseTableIndex;

public interface TableIndexService {

	List<DatabaseTableIndex> list(DataSource dataSource, String tablename);
}
