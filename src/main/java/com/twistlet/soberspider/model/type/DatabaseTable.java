package com.twistlet.soberspider.model.type;

import java.util.List;

public class DatabaseTable {
	private String name;
	private List<DatabaseColumn> columns;
	private List<String> primaryKeyColumns;
	private List<ForeignKey> foreignKeys;
	private List<DatabaseTableIndex> tableIndexes;

	public String getName() {
		return name;
	}

	public void setName(final String name) {
		this.name = name;
	}

	public List<DatabaseColumn> getColumns() {
		return columns;
	}

	public void setColumns(final List<DatabaseColumn> columns) {
		this.columns = columns;
	}

	public List<String> getPrimaryKeyColumns() {
		return primaryKeyColumns;
	}

	public void setPrimaryKeyColumns(final List<String> primaryKeyColumns) {
		this.primaryKeyColumns = primaryKeyColumns;
	}

	public List<ForeignKey> getForeignKeys() {
		return foreignKeys;
	}

	public void setForeignKeys(final List<ForeignKey> foreignKeys) {
		this.foreignKeys = foreignKeys;
	}

	public List<DatabaseTableIndex> getTableIndexes() {
		return tableIndexes;
	}

	public void setTableIndexes(final List<DatabaseTableIndex> tableIndexes) {
		this.tableIndexes = tableIndexes;
	}

}
