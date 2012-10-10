package com.twistlet.soberspider.model.type;

import java.util.List;

public class DatabaseTableIndex {

	private final List<String> columns;
	private final boolean unique;
	private final String name;

	public DatabaseTableIndex(final String name, final List<String> columns, final boolean unique) {
		this.name = name;
		this.columns = columns;
		this.unique = unique;
	}

	public List<String> getColumns() {
		return columns;
	}

	public boolean isUnique() {
		return unique;
	}

	public String getName() {
		return name;
	}

}
