package com.twistlet.soberspider.model.service;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

@ContextConfiguration("classpath:application-context-service.xml")
public class DatabaseServiceTest extends AbstractJUnit4SpringContextTests {

	@Autowired
	DatabaseService databaseService;

	@Autowired
	DataSource dataSource;

	@Test
	public void testListCount() {
		final List<String> list = databaseService.listTables(dataSource);
		assertEquals(101, list.size());
	}

	@Test
	public void testListContent() {
		final List<String> list = databaseService.listTables(dataSource);
		final String actual = StringUtils.join(list, ", ");
		final String expected = "calendar_event, committee_detail, committee_master, contract, contract_item, contract_vendor, dummy, ep_user, fais_account_code, inbox, item, item_account_need, item_agencies, item_committee, item_parameter, item_requisition, item_specification_detail, item_specification_master, job_userrole, menu_role, node_access, node_access_campus, node_access_department, node_access_ptj, node_access_state, node_access_unit, node_committee, node_contract, node_item, node_user, pb_detail, pb_detail_specification, pb_master, pkk, portal_user, pp_detail, pp_detail_item_distribution, pp_detail_user, pp_master, ref_access_level, ref_access_type, ref_agency, ref_bank, ref_campus, ref_campus_company, ref_city, ref_committee_type, ref_company, ref_company_type, ref_country, ref_delivery_field, ref_department, ref_district, ref_field, ref_file, ref_finance_group, ref_item_category, ref_pkk_category, ref_pkk_limit, ref_position, ref_postcode, ref_price, ref_procurement_activiti, ref_procurement_budget_source, ref_procurement_category, ref_procurement_numbering, ref_procurement_purpose, ref_ptj, ref_race, ref_state, ref_title, ref_unit, ref_unit_of_measurement, ref_velocity_mail_template, ref_vendor_parameter_dasar, ref_vendor_parameter_dokumen, ref_vendor_parameter_identifikasi, ref_zone, role, staff, user, user_configuration, user_role, ut_menu, vendor, vendor_activation_login, vendor_address, vendor_bank, vendor_bidang, vendor_board, vendor_contact, vendor_contact_identification, vendor_dokumen, vendor_equity, vendor_experience, vendor_ownership, vendor_pegawai_tauliah, vendor_registration_flow, vendor_registration_flow_notice, vendor_subscription_sms, vendor_utility";
		assertEquals(expected, actual);
	}

	@Test
	public void testListTables() {
		assertEquals(101, tableList().length);
	}

	@Test
	public void testSortLength() {
		final List<String> list = databaseService.sortTables(dataSource, Arrays.asList(tableList()));
		assertEquals(101, list.size());
	}

	@Test
	public void testSortContent() {
		final List<String> list = databaseService.sortTables(dataSource, Arrays.asList(tableList()));
		final String actual = StringUtils.join(list, ", ");
		final String expected = "calendar_event, dummy, ep_user, fais_account_code, pkk, portal_user, ref_access_level, ref_access_type, ref_agency, ref_bank, ref_committee_type, ref_company_type, ref_country, ref_delivery_field, ref_field, ref_file, ref_finance_group, ref_item_category, ref_pkk_category, ref_pkk_limit, ref_position, ref_price, ref_procurement_activiti, ref_procurement_budget_source, ref_procurement_category, ref_procurement_purpose, ref_race, ref_state, ref_title, ref_unit_of_measurement, ref_velocity_mail_template, ref_vendor_parameter_dasar, ref_vendor_parameter_dokumen, ref_vendor_parameter_identifikasi, role, user, user_configuration, user_role, ut_menu, vendor, vendor_bidang, vendor_board, vendor_dokumen, vendor_equity, vendor_experience, vendor_ownership, vendor_subscription_sms, vendor_utility, committee_master, contract, contract_vendor, inbox, item, item_account_need, item_agencies, item_committee, item_parameter, item_requisition, item_specification_master, job_userrole, menu_role, node_access, node_access_state, node_committee, node_contract, node_item, node_user, ref_campus, ref_campus_company, ref_city, ref_company, ref_district, ref_postcode, ref_zone, staff, vendor_address, vendor_bank, vendor_contact, vendor_contact_identification, vendor_pegawai_tauliah, vendor_registration_flow, vendor_registration_flow_notice, committee_detail, contract_item, item_specification_detail, node_access_campus, ref_ptj, vendor_activation_login, node_access_ptj, ref_department, ref_procurement_numbering, ref_unit, node_access_department, node_access_unit, pb_master, pp_master, pb_detail, pb_detail_specification, pp_detail, pp_detail_item_distribution, pp_detail_user";
		assertEquals(expected, actual);
	}

	protected String[] tableList() {
		return new String[] { "calendar_event", "committee_detail", "committee_master", "contract", "contract_item",
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
	}
}
