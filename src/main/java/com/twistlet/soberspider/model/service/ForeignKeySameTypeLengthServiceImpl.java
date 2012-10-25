package com.twistlet.soberspider.model.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.twistlet.soberspider.model.type.DatabaseColumn;
import com.twistlet.soberspider.model.type.DatabaseTable;
import com.twistlet.soberspider.model.type.ForeignKey;

@Service
public class ForeignKeySameTypeLengthServiceImpl implements ForeignKeySameTypeLengthService {

	protected final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public boolean isTableForeignKeysGood(final DatabaseTable databaseTable, final List<DatabaseTable> list) {
		final String name = databaseTable.getName();
		final List<ForeignKey> foreignKeys = databaseTable.getForeignKeys();
		for (final ForeignKey foreignKey : foreignKeys) {
			final String foreignTableName = foreignKey.getForeignTable();
			final DatabaseTable foreignTable = findForeignTable(foreignTableName, list);
			final DatabaseColumn localColumn = findDatabaseColumn(foreignKey.getColumnName(), databaseTable);
			final DatabaseColumn foreignColumn = findDatabaseColumn(foreignKey.getForeignColumn(), foreignTable);
			checkForeignAndLocalColum(name, localColumn, foreignColumn);
			logger.info("checking foreign key validity for table " + name + ", column " + localColumn.getColumnName());
		}

		return true;

	}

	private void checkForeignAndLocalColum(final String name, final DatabaseColumn localColumn, final DatabaseColumn foreignColumn) {
		if (localColumn.getColumnType() != foreignColumn.getColumnType()) {
			throw new RuntimeException("column type mismatch for table " + name + ", column " + localColumn.getColumnName());
		}
		if (localColumn.getColumnSize() != foreignColumn.getColumnSize()) {
			throw new RuntimeException("column size mismatch for table " + name + ", column " + localColumn.getColumnName());
		}
		if (localColumn.getDecimalDigits() != localColumn.getDecimalDigits()) {
			throw new RuntimeException("column decimal mismatch for table " + name + ", column " + localColumn.getColumnName());
		}
	}

	private DatabaseColumn findDatabaseColumn(final String columnName, final DatabaseTable table) {
		for (final DatabaseColumn c : table.getColumns()) {
			if (columnName.equals(c.getColumnName())) {
				return c;
			}
		}
		throw new RuntimeException("column " + columnName + " not found in table " + table.getName());
	}

	private DatabaseTable findForeignTable(final String tableName, final List<DatabaseTable> list) {
		for (final DatabaseTable databaseTable : list) {
			if (StringUtils.equals(tableName, databaseTable.getName())) {
				return databaseTable;
			}
		}
		throw new RuntimeException("table " + tableName + " not found");
	}

}
