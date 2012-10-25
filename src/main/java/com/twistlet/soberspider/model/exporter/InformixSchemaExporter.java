package com.twistlet.soberspider.model.exporter;

import java.sql.DatabaseMetaData;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import com.twistlet.soberspider.model.type.DatabaseColumn;
import com.twistlet.soberspider.model.type.DatabaseTable;
import com.twistlet.soberspider.model.type.DatabaseTableIndex;
import com.twistlet.soberspider.model.type.ForeignKey;

@Component
public class InformixSchemaExporter implements SchemaExporter {

	@Override
	public String exportTable(final DatabaseTable databaseTable) {
		final String createStatement = basicCreate(databaseTable);
		return createStatement;
	}

	private String basicCreate(final DatabaseTable databaseTable) {
		final List<DatabaseColumn> columns = getSortedColumns(databaseTable);
		final List<String> lines = new ArrayList<>();
		final StringBuilder sb = new StringBuilder("CREATE TABLE " + databaseTable.getName() + "\n");
		sb.append("(\n");
		createColumns(columns, lines);
		createPrimaryKey(databaseTable, lines);
		createForeignKeys(databaseTable.getForeignKeys(), lines);
		final String insideCreate = StringUtils.join(lines.toArray(new String[] {}), ",\n");
		sb.append(insideCreate);
		sb.append("\n);\n");
		final List<String> listIndex = createIndexes(databaseTable.getTableIndexes(), databaseTable.getName());
		sb.append(StringUtils.join(listIndex, "\n"));
		return sb.toString();
	}

	private List<String> createIndexes(final List<DatabaseTableIndex> tableIndexes, final String table) {
		final List<String> list = new ArrayList<>();
		int indexId = 0;
		for (final DatabaseTableIndex tableIndex : tableIndexes) {
			indexId++;
			final List<String> columns = tableIndex.getColumns();
			final String columnList = StringUtils.join(columns, ", ");
			final String unique = tableIndex.isUnique() ? "UNIQUE " : "";
			final String line = "CREATE " + unique + "INDEX idx_" + table + "_" + indexId + " ON " + table + "(" + columnList
					+ ");";
			list.add(line);
		}
		return list;
	}

	private void createForeignKeys(final List<ForeignKey> listForeignKeys, final List<String> lines) {
		for (final ForeignKey foreignKey : listForeignKeys) {
			final StringBuilder sb = new StringBuilder();
			sb.append("\tFOREIGN KEY (" + foreignKey.getColumnName() + ") REFERENCES " + foreignKey.getForeignTable() + " ("
					+ foreignKey.getForeignColumn() + ") ON DELETE " + decodeRule(foreignKey.getDeleteRule()) + " ON UPDATE "
					+ decodeRule(foreignKey.getUpdateRule()));
			lines.add(sb.toString());
		}
	}

	private String decodeRule(final short rule) {
		switch (rule) {
		case DatabaseMetaData.importedKeyCascade:
			return "CASCADE";
		case DatabaseMetaData.importedKeyNoAction:
		case DatabaseMetaData.importedKeyRestrict:
			return "RESTRICT";
		case DatabaseMetaData.importedKeySetNull:
			return "SET NULL";
		default:
			throw new RuntimeException("unknown import key rule:" + rule);
		}
	}

	private void createPrimaryKey(final DatabaseTable databaseTable, final List<String> lines) {
		if (databaseTable.getPrimaryKeyColumns().size() == 0) {
			throw new RuntimeException("no pk for table " + databaseTable.getName());
		}
		lines.add("\t" + primaryKeyLine(databaseTable));
	}

	private void createColumns(final List<DatabaseColumn> columns, final List<String> lines) {
		for (final DatabaseColumn databaseColumn : columns) {
			final List<String> words = new ArrayList<>();
			words.add(databaseColumn.getColumnName());
			words.add(columnType(databaseColumn));
			if (!databaseColumn.isNullable()) {
				words.add("NOT NULL");
			}
			final String line = "\t" + StringUtils.join(words.toArray(new String[] {}), " ");
			lines.add(line);
		}
	}

	private String primaryKeyLine(final DatabaseTable databaseTable) {
		final List<String> list = databaseTable.getPrimaryKeyColumns();
		final String inside = StringUtils.join(list.toArray(new String[] {}), ", ");
		return "PRIMARY KEY (" + inside + ")";
	}

	protected String columnType(final DatabaseColumn databaseColumn) {
		if (databaseColumn.isAutoIncrement()) {
			return "SERIAL";
		}
		switch (databaseColumn.getColumnType()) {
		case COLUMN_TYPE_VARCHAR:
			if (databaseColumn.getColumnSize() <= 250) {
				return "VARCHAR(" + databaseColumn.getColumnSize() + ")";
			} else {
				return "LVARCHAR(" + databaseColumn.getColumnSize() + ")";
			}
		case COLUMN_TYPE_CHAR:
			return "CHAR(" + databaseColumn.getColumnSize() + ")";
		case COLUMN_TYPE_TIMESTAMP:
			return "DATETIME YEAR to FRACTION";
		case COLUMN_TYPE_LONGVARBINARY:
			return "BYTE";
		case COLUMN_TYPE_INTEGER:
			return "INT";
		case COLUMN_TYPE_DECIMAL:
			return "DECIMAL(" + databaseColumn.getColumnSize() + "," + databaseColumn.getDecimalDigits() + ")";
		case COLUMN_TYPE_DATE:
			return "DATE";
		case COLUMN_TYPE_DATETIME:
			return "DATETIME YEAR to FRACTION";
		case COLUMN_TYPE_BOOLEAN:
			return "BOOLEAN";
		default:
			throw new IllegalArgumentException("no known column type");
		}
	}

	private List<DatabaseColumn> getSortedColumns(final DatabaseTable databaseTable) {
		final List<DatabaseColumn> columns = databaseTable.getColumns();
		Collections.sort(columns, new Comparator<DatabaseColumn>() {

			@Override
			public int compare(final DatabaseColumn o1, final DatabaseColumn o2) {
				return new Integer(o1.getOrdinalPosition()).compareTo(o2.getOrdinalPosition());
			}
		});
		return columns;
	}

}
