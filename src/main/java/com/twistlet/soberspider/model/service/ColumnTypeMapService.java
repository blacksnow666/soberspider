package com.twistlet.soberspider.model.service;

import com.twistlet.soberspider.model.type.ColumnType;

public interface ColumnTypeMapService {
	ColumnType resolveColumnType(int dataType);
}
