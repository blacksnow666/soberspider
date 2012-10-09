package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

import com.twistlet.soberspider.model.type.ForeignKey;

public interface ForeignKeyListService {
	List<ForeignKey> listForeignKeys(DataSource dataSource, String tablename);
}
