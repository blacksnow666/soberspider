package com.twistlet.soberspider.model.service;

import java.util.List;

import com.twistlet.soberspider.model.type.DatabaseTable;

public interface ForeignKeySameTypeLengthService {
	boolean isTableForeignKeysGood(DatabaseTable databaseTable, List<DatabaseTable> list);
}
