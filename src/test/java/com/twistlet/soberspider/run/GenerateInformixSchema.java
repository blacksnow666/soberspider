package com.twistlet.soberspider.run;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.twistlet.soberspider.model.service.DatabaseService;
import com.twistlet.soberspider.model.type.DatabaseTable;

public class GenerateInformixSchema {
	public static void main(final String[] args) {
		final ConfigurableApplicationContext applicationContext = new ClassPathXmlApplicationContext("application-context.xml");
		final DatabaseService databaseService = applicationContext.getBean(DatabaseService.class);
		final List<String> unsortedTables = databaseService.listTables();
		final List<String> tables = databaseService.sortTablesByCreationOrder(unsortedTables);
		final List<DatabaseTable> databaseTables = new ArrayList<>();
		for (final String table : tables) {
			databaseTables.add(databaseService.createDatabaseTable(table));
		}
		// /final List<String> list =
		// databaseService.createTableCreationStatements(databaseTables);
		// System.out.println(StringUtils.join(list.toArray(new String[] {}),
		// "\n"));
	}
}
