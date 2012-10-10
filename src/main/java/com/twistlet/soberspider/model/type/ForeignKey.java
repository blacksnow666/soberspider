package com.twistlet.soberspider.model.type;

public class ForeignKey {

	private final String columnName;
	private final String foreignColumn;
	private final String foreignTable;
	private final short updateRule;
	private final short deleteRule;

	public ForeignKey(final String columnName, final String foreignColumn, final String foreignTable, final short updateRule,
			final short deleteRule) {
		super();
		this.columnName = columnName;
		this.foreignColumn = foreignColumn;
		this.foreignTable = foreignTable;
		this.updateRule = updateRule;
		this.deleteRule = deleteRule;
	}

	public String getColumnName() {
		return columnName;
	}

	public String getForeignColumn() {
		return foreignColumn;
	}

	public String getForeignTable() {
		return foreignTable;
	}

	public short getUpdateRule() {
		return updateRule;
	}

	public short getDeleteRule() {
		return deleteRule;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((columnName == null) ? 0 : columnName.hashCode());
		result = prime * result + deleteRule;
		result = prime * result + ((foreignColumn == null) ? 0 : foreignColumn.hashCode());
		result = prime * result + ((foreignTable == null) ? 0 : foreignTable.hashCode());
		result = prime * result + updateRule;
		return result;
	}

	@Override
	public boolean equals(final Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final ForeignKey other = (ForeignKey) obj;
		if (columnName == null) {
			if (other.columnName != null)
				return false;
		} else if (!columnName.equals(other.columnName))
			return false;
		if (deleteRule != other.deleteRule)
			return false;
		if (foreignColumn == null) {
			if (other.foreignColumn != null)
				return false;
		} else if (!foreignColumn.equals(other.foreignColumn))
			return false;
		if (foreignTable == null) {
			if (other.foreignTable != null)
				return false;
		} else if (!foreignTable.equals(other.foreignTable))
			return false;
		if (updateRule != other.updateRule)
			return false;
		return true;
	}

}
