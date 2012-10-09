package com.twistlet.soberspider.model.service.old;

import java.util.List;

import com.twistlet.soberspider.model.type.DatabaseTable;

public interface DatabaseService {

	List<String> listTables();

	List<String> sortTablesByCreationOrder(List<String> list);

	DatabaseTable createDatabaseTable(String tablename);

}
