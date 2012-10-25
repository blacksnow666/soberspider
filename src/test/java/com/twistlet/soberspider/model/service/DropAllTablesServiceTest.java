package com.twistlet.soberspider.model.service;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration("classpath:application-context-service-test.xml")
public class DropAllTablesServiceTest extends AbstractJUnit4SpringContextTests {

	@Autowired
	DropAllTablesService dropAllTablesService;

	@Autowired
	DataSource dataSource;

	@Test
	@DirtiesContext
	public void testDrop() {
		dropAllTablesService.dropAllTables(dataSource);
		final JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		final Boolean result = jdbcTemplate.execute(new ConnectionCallback<Boolean>() {

			@Override
			public Boolean doInConnection(final Connection connection) throws SQLException, DataAccessException {
				final DatabaseMetaData databaseMetaData = connection.getMetaData();
				final ResultSet rs = databaseMetaData.getTables(null, null, null, new String[] { "TABLE" });
				boolean result;
				if (rs.next()) {
					result = false;
				} else {
					result = true;
				}
				rs.getStatement();
				rs.close();
				return result;
			}
		});
		assertEquals(true, result);
	}
}
