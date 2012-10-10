package com.twistlet.soberspider.model.service;

import static org.easymock.EasyMock.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;

public class DropAllTablesServiceImplTest {

	@Test
	public void testDropAll() throws SQLException {
		final List<String> tables = Arrays.asList("t1", "t2", "t3");
		final List<String> sortedTables = Arrays.asList("st1", "st2", "st3");
		final DatabaseService databaseService = createStrictMock(DatabaseService.class);
		final DataSource dataSource = createStrictMock(DataSource.class);
		final Connection connection = createStrictMock(Connection.class);
		final Statement statement1 = createStrictMock(Statement.class);
		final Statement statement2 = createStrictMock(Statement.class);
		final Statement statement3 = createStrictMock(Statement.class);
		expect(databaseService.listTables(dataSource)).andReturn(tables);
		expect(dataSource.getConnection()).andReturn(connection);
		expect(connection.getAutoCommit()).andReturn(false);
		expect(databaseService.sortTables(dataSource, tables)).andReturn(sortedTables);
		expect(connection.createStatement()).andReturn(statement1);
		expect(statement1.execute("DROP TABLE st3")).andReturn(true);
		expect(connection.createStatement()).andReturn(statement2);
		expect(statement2.execute("DROP TABLE st2")).andReturn(true);
		expect(connection.createStatement()).andReturn(statement3);
		expect(statement3.execute("DROP TABLE st1")).andReturn(true);
		connection.commit();
		expect(databaseService.listTables(dataSource)).andReturn(new ArrayList<String>());
		final DropAllTablesServiceImpl unit = new DropAllTablesServiceImpl(databaseService);
		replay(databaseService, dataSource, connection, statement1, statement2, statement3);
		unit.dropAllTables(dataSource);
		verify(databaseService, dataSource, connection, statement1, statement2, statement3);
	}
}
