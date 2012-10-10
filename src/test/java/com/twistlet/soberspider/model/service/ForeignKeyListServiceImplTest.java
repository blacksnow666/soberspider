package com.twistlet.soberspider.model.service;

import static org.easymock.EasyMock.*;
import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;

import com.twistlet.soberspider.model.type.ForeignKey;

public class ForeignKeyListServiceImplTest {

	@Test
	public void testOneItem() throws SQLException {
		final DataSource dataSource = createStrictMock(DataSource.class);
		final Connection connection = createStrictMock(Connection.class);
		final DatabaseMetaData databaseMetaData = createStrictMock(DatabaseMetaData.class);
		final ResultSet rs = createStrictMock(ResultSet.class);
		expect(dataSource.getConnection()).andReturn(connection);
		expect(connection.getMetaData()).andReturn(databaseMetaData);
		expect(databaseMetaData.getImportedKeys(null, null, "table1")).andReturn(rs);
		expect(rs.next()).andReturn(true);
		expect(rs.getString("PKTABLE_NAME")).andReturn("ref_country");
		expect(rs.getString("PKCOLUMN_NAME")).andReturn("id");
		expect(rs.getString("FKTABLE_NAME")).andReturn("student");
		expect(rs.getString("FKCOLUMN_NAME")).andReturn("country_id");
		expect(rs.getShort("UPDATE_RULE")).andReturn((short) DatabaseMetaData.importedKeyRestrict);
		expect(rs.getShort("DELETE_RULE")).andReturn((short) DatabaseMetaData.importedKeyCascade);
		expect(rs.getShort("KEY_SEQ")).andReturn(Short.valueOf("1"));
		expect(rs.next()).andReturn(false);
		rs.close();
		connection.close();
		replay(dataSource, connection, databaseMetaData, rs);
		final ForeignKeyListServiceImpl unit = new ForeignKeyListServiceImpl();
		final List<ForeignKey> list = unit.listForeignKeys(dataSource, "table1");
		assertEquals(1, list.size());
		verify(dataSource, connection, databaseMetaData, rs);
	}

	@Test
	public void testTwoItems() throws SQLException {
		final DataSource dataSource = createStrictMock(DataSource.class);
		final Connection connection = createStrictMock(Connection.class);
		final DatabaseMetaData databaseMetaData = createStrictMock(DatabaseMetaData.class);
		final ResultSet rs = createStrictMock(ResultSet.class);
		expect(dataSource.getConnection()).andReturn(connection);
		expect(connection.getMetaData()).andReturn(databaseMetaData);
		expect(databaseMetaData.getImportedKeys(null, null, "table1")).andReturn(rs);
		expect(rs.next()).andReturn(true);
		expect(rs.getString("PKTABLE_NAME")).andReturn("ref_country");
		expect(rs.getString("PKCOLUMN_NAME")).andReturn("id");
		expect(rs.getString("FKTABLE_NAME")).andReturn("student");
		expect(rs.getString("FKCOLUMN_NAME")).andReturn("country_id");
		expect(rs.getShort("UPDATE_RULE")).andReturn((short) DatabaseMetaData.importedKeyRestrict);
		expect(rs.getShort("DELETE_RULE")).andReturn((short) DatabaseMetaData.importedKeyCascade);
		expect(rs.getShort("KEY_SEQ")).andReturn(Short.valueOf("1"));
		expect(rs.next()).andReturn(true);
		expect(rs.getString("PKTABLE_NAME")).andReturn("ref_gender");
		expect(rs.getString("PKCOLUMN_NAME")).andReturn("id");
		expect(rs.getString("FKTABLE_NAME")).andReturn("student");
		expect(rs.getString("FKCOLUMN_NAME")).andReturn("gender_id");
		expect(rs.getShort("UPDATE_RULE")).andReturn((short) DatabaseMetaData.importedKeyCascade);
		expect(rs.getShort("DELETE_RULE")).andReturn((short) DatabaseMetaData.importedKeyRestrict);
		expect(rs.getShort("KEY_SEQ")).andReturn(Short.valueOf("1"));
		expect(rs.next()).andReturn(false);
		rs.close();
		connection.close();
		replay(dataSource, connection, databaseMetaData, rs);
		final ForeignKeyListServiceImpl unit = new ForeignKeyListServiceImpl();
		final List<ForeignKey> list = unit.listForeignKeys(dataSource, "table1");
		assertEquals(2, list.size());
		verify(dataSource, connection, databaseMetaData, rs);
	}

	@Test(expected = UnsupportedOperationException.class)
	public void testBadCompositeForeignKey() throws SQLException {
		final DataSource dataSource = createStrictMock(DataSource.class);
		final Connection connection = createStrictMock(Connection.class);
		final DatabaseMetaData databaseMetaData = createStrictMock(DatabaseMetaData.class);
		final ResultSet rs = createStrictMock(ResultSet.class);
		expect(dataSource.getConnection()).andReturn(connection);
		expect(connection.getMetaData()).andReturn(databaseMetaData);
		expect(databaseMetaData.getImportedKeys(null, null, "table1")).andReturn(rs);
		expect(rs.next()).andReturn(true);
		expect(rs.getString("PKTABLE_NAME")).andReturn("ref_country");
		expect(rs.getString("PKCOLUMN_NAME")).andReturn("id");
		expect(rs.getString("FKTABLE_NAME")).andReturn("student");
		expect(rs.getString("FKCOLUMN_NAME")).andReturn("country_id");
		expect(rs.getShort("UPDATE_RULE")).andReturn((short) DatabaseMetaData.importedKeyRestrict);
		expect(rs.getShort("DELETE_RULE")).andReturn((short) DatabaseMetaData.importedKeyCascade);
		expect(rs.getShort("KEY_SEQ")).andReturn(Short.valueOf("1"));
		expect(rs.next()).andReturn(true);
		expect(rs.getString("PKTABLE_NAME")).andReturn("ref_gender");
		expect(rs.getString("PKCOLUMN_NAME")).andReturn("id");
		expect(rs.getString("FKTABLE_NAME")).andReturn("student");
		expect(rs.getString("FKCOLUMN_NAME")).andReturn("gender_id");
		expect(rs.getShort("UPDATE_RULE")).andReturn((short) DatabaseMetaData.importedKeyCascade);
		expect(rs.getShort("DELETE_RULE")).andReturn((short) DatabaseMetaData.importedKeyRestrict);
		expect(rs.getShort("KEY_SEQ")).andReturn(Short.valueOf("2"));
		expect(rs.next()).andReturn(false);
		rs.close();
		connection.close();
		replay(dataSource, connection, databaseMetaData, rs);
		final ForeignKeyListServiceImpl unit = new ForeignKeyListServiceImpl();
		final List<ForeignKey> list = unit.listForeignKeys(dataSource, "table1");
		assertEquals(2, list.size());
		verify(dataSource, connection, databaseMetaData, rs);
	}
}
