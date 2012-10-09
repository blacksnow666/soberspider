package com.twistlet.soberspider.model.service;

import java.util.Map;

import com.twistlet.soberspider.model.type.ColumnType;

public class ColumnTypeServiceMapImpl implements ColumnTypeMapService {
	private final Map<Integer, ColumnType> columnTypeMap;

	public ColumnTypeServiceMapImpl(final Map<Integer, ColumnType> columnTypeMap) {
		this.columnTypeMap = columnTypeMap;
	}

	@Override
	public ColumnType resolveColumnType(final int dataType) {
		return columnTypeMap.get(new Integer(dataType));
	}

}
