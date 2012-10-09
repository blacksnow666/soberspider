package com.twistlet.soberspider.model.service.old;

import com.twistlet.soberspider.model.type.ColumnType;

public interface ColumnTypeMapService {
	ColumnType resolveColumnType(int dataType);
}
