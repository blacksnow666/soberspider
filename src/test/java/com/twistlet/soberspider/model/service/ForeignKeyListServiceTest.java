package com.twistlet.soberspider.model.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.twistlet.soberspider.model.type.ForeignKey;

@ContextConfiguration("classpath:application-context-service.xml")
public class ForeignKeyListServiceTest extends AbstractJUnit4SpringContextTests {

	@Autowired
	ForeignKeyListService foreignKeyListService;

	@Autowired
	DataSource dataSource;

	@Test
	public void testNoForeignKey() {
		final List<ForeignKey> list = foreignKeyListService.listForeignKeys(dataSource, "calendar_event");
		assertEquals(0, list.size());
	}

	@Test
	public void testContractVendorCount() {
		final List<ForeignKey> list = foreignKeyListService.listForeignKeys(dataSource, "contract_vendor");
		assertEquals(2, list.size());
	}

	@Test
	public void testContractVendorContent1() {
		final List<ForeignKey> list = foreignKeyListService.listForeignKeys(dataSource, "contract_vendor");
		final ForeignKey item = list.get(0);
		final String actual = item.getColumnName() + "/" + item.getForeignTable() + "/" + item.getForeignColumn() + "/"
				+ item.getUpdateRule() + "/" + item.getDeleteRule();
		final String expected = "contract_id/contract/id/3/3";
		assertEquals(expected, actual);
	}

	@Test
	public void testContractVendorContent2() {
		final List<ForeignKey> list = foreignKeyListService.listForeignKeys(dataSource, "contract_vendor");
		final ForeignKey item = list.get(1);
		final String actual = item.getColumnName() + "/" + item.getForeignTable() + "/" + item.getForeignColumn() + "/"
				+ item.getUpdateRule() + "/" + item.getDeleteRule();
		final String expected = "vendor_id/vendor/id/3/3";
		assertEquals(expected, actual);
	}

}
