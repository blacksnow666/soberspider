package com.twistlet.soberspider.model.service.old;

import java.util.List;

import com.twistlet.soberspider.model.type.DatabaseColumn;
import com.twistlet.soberspider.model.type.ForeignKey;

public interface TableService {

	List<String> listTableDependenciesForTable(String tablename);

	List<String> listPrimaryKeyColumnsForTable(String tablename);

	List<DatabaseColumn> listColumnsForTable(String tablename);

	List<ForeignKey> listForeignKeysForTable(String tablename);
}
