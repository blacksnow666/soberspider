package com.twistlet.soberspider.model.type;

import java.util.List;

public class DatabaseTable {
	private String name;
	private List<DatabaseColumn> columns;
	private List<String> primaryKeyColumns;
	private List<List<ForeignKey>> foreignKeys;
	private List<List<String>> nonUniqueIndexes;
	private List<List<String>> uniqueIndexes;

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

	public List<List<ForeignKey>> getForeignKeys() {
		return foreignKeys;
	}

	public void setForeignKeys(final List<List<ForeignKey>> foreignKeys) {
		this.foreignKeys = foreignKeys;
	}

	public List<List<String>> getNonUniqueIndexes() {
		return nonUniqueIndexes;
	}

	public void setNonUniqueIndexes(final List<List<String>> nonUniqueIndexes) {
		this.nonUniqueIndexes = nonUniqueIndexes;
	}

	public List<List<String>> getUniqueIndexes() {
		return uniqueIndexes;
	}

	public void setUniqueIndexes(final List<List<String>> uniqueIndexes) {
		this.uniqueIndexes = uniqueIndexes;
	}

}
