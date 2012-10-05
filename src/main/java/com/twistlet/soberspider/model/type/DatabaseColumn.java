package com.twistlet.soberspider.model.type;

public class DatabaseColumn {
	private final String columnName;
	private final ColumnType columnType;
	private final int columnSize;
	private final int decimalDigits;
	private final boolean nullable;
	private final boolean autoIncrement;
	private final int ordinalPosition;

	public DatabaseColumn(final String columnName, final ColumnType columnType, final int columnSize, final int decimalDigits,
			final boolean nullable, final boolean autoIncrement, final int ordinalPosition) {
		super();
		this.columnName = columnName;
		this.columnType = columnType;
		this.columnSize = columnSize;
		this.decimalDigits = decimalDigits;
		this.nullable = nullable;
		this.autoIncrement = autoIncrement;
		this.ordinalPosition = ordinalPosition;
	}

	public String getColumnName() {
		return columnName;
	}

	public ColumnType getColumnType() {
		return columnType;
	}

	public int getColumnSize() {
		return columnSize;
	}

	public int getDecimalDigits() {
		return decimalDigits;
	}

	public boolean isNullable() {
		return nullable;
	}

	public boolean isAutoIncrement() {
		return autoIncrement;
	}

	public int getOrdinalPosition() {
		return ordinalPosition;
	}

}