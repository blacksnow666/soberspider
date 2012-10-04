package com.twistlet.soberspider.model.service;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.sql.DataSource;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration("classpath:application-context.xml")
public class DatabaseServiceImplIT extends AbstractJUnit4SpringContextTests {

	@Autowired
	DataSource dataSource;

	DatabaseService databaseService;

	@Before
	public void init() {
		databaseService = new DatabaseServiceImpl(dataSource);
	}

	@Test
	public void testListTablesItem() {
		final List<String> actual = databaseService.listTables();
		final List<String> expected = generateExpected();
		assertEquals(expected, actual);
	}

	@Test
	public void testListTablesCount() {
		final Set<String> actual = new LinkedHashSet<>(databaseService.listTables());
		assertEquals(101, actual.size());
	}

	private List<String> generateExpected() {
		final String[] tables = { "calendar_event", "committee_detail", "committee_master", "contract", "contract_item",
				"contract_vendor", "dummy", "ep_user", "fais_account_code", "inbox", "item", "item_account_need", "item_agencies",
				"item_committee", "item_parameter", "item_requisition", "item_specification_detail", "item_specification_master",
				"job_userrole", "menu_role", "node_access", "node_access_campus", "node_access_department", "node_access_ptj",
				"node_access_state", "node_access_unit", "node_committee", "node_contract", "node_item", "node_user", "pb_detail",
				"pb_detail_specification", "pb_master", "pkk", "portal_user", "pp_detail", "pp_detail_item_distribution",
				"pp_detail_user", "pp_master", "ref_access_level", "ref_access_type", "ref_agency", "ref_bank", "ref_campus",
				"ref_campus_company", "ref_city", "ref_committee_type", "ref_company", "ref_company_type", "ref_country",
				"ref_delivery_field", "ref_department", "ref_district", "ref_field", "ref_file", "ref_finance_group",
				"ref_item_category", "ref_pkk_category", "ref_pkk_limit", "ref_position", "ref_postcode", "ref_price",
				"ref_procurement_activiti", "ref_procurement_budget_source", "ref_procurement_category",
				"ref_procurement_numbering", "ref_procurement_purpose", "ref_ptj", "ref_race", "ref_state", "ref_title",
				"ref_unit", "ref_unit_of_measurement", "ref_velocity_mail_template", "ref_vendor_parameter_dasar",
				"ref_vendor_parameter_dokumen", "ref_vendor_parameter_identifikasi", "ref_zone", "role", "staff", "user",
				"user_configuration", "user_role", "ut_menu", "vendor", "vendor_activation_login", "vendor_address", "vendor_bank",
				"vendor_bidang", "vendor_board", "vendor_contact", "vendor_contact_identification", "vendor_dokumen",
				"vendor_equity", "vendor_experience", "vendor_ownership", "vendor_pegawai_tauliah", "vendor_registration_flow",
				"vendor_registration_flow_notice", "vendor_subscription_sms", "vendor_utility" };
		final List<String> list = Arrays.asList(tables);
		return list;
	}

}
