package com.twistlet.soberspider.model.exporter;

import com.twistlet.soberspider.model.type.DatabaseTable;

public interface SchemaExporter {
	String exportTable(DatabaseTable databaseTable);
}
