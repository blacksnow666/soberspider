package com.twistlet.soberspider.model.type;

import java.util.List;

public class DatabaseTableIndex {

	private final List<String> columns;
	private final boolean unique;

	public DatabaseTableIndex(final List<String> columns, final boolean unique) {
		this.columns = columns;
		this.unique = unique;
	}

	public List<String> getColumns() {
		return columns;
	}

	public boolean isUnique() {
		return unique;
	}

}
