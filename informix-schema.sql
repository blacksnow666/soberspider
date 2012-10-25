CREATE TABLE calendar_event
(
	id SERIAL NOT NULL,
	title VARCHAR(50),
	content LVARCHAR(1000),
	start_date DATETIME YEAR to FRACTION,
	end_date DATETIME YEAR to FRACTION,
	jenis VARCHAR(2),
	PRIMARY KEY (id)
);

CREATE TABLE dummy
(
	id INT NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE ep_user
(
	username VARCHAR(50) NOT NULL,
	PRIMARY KEY (username)
);

CREATE TABLE fais_account_code
(
	code VARCHAR(5) NOT NULL,
	description VARCHAR(100),
	PRIMARY KEY (code)
);

CREATE TABLE pkk
(
	id SERIAL NOT NULL,
	parent_id INT,
	label VARCHAR(10),
	description VARCHAR(100),
	PRIMARY KEY (id),
	FOREIGN KEY (parent_id) REFERENCES pkk (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pkk_1 ON pkk(parent_id);
CREATE TABLE portal_user
(
	staff_id INT NOT NULL,
	name VARCHAR(150) NOT NULL,
	company_code VARCHAR(10) NOT NULL,
	zone VARCHAR(5),
	ptj VARCHAR(10),
	division VARCHAR(10),
	unit VARCHAR(10),
	PRIMARY KEY (staff_id)
);
CREATE INDEX idx_portal_user_1 ON portal_user(name);
CREATE INDEX idx_portal_user_2 ON portal_user(company_code);
CREATE INDEX idx_portal_user_3 ON portal_user(zone);
CREATE INDEX idx_portal_user_4 ON portal_user(ptj);
CREATE INDEX idx_portal_user_5 ON portal_user(division);
CREATE INDEX idx_portal_user_6 ON portal_user(unit);
CREATE TABLE purchase_control
(
	id SERIAL NOT NULL,
	label VARCHAR(25),
	type VARCHAR(1),
	PRIMARY KEY (id)
);

CREATE TABLE ref_access_level
(
	id CHAR(1) NOT NULL,
	label VARCHAR(50),
	level INT,
	PRIMARY KEY (id)
);

CREATE TABLE ref_access_type
(
	id CHAR(1) NOT NULL,
	label VARCHAR(30) NOT NULL,
	level INT NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE ref_agency
(
	id SERIAL NOT NULL,
	label VARCHAR(100),
	PRIMARY KEY (id)
);

CREATE TABLE ref_bank
(
	swift_code VARCHAR(11) NOT NULL,
	label VARCHAR(100),
	PRIMARY KEY (swift_code)
);

CREATE TABLE ref_committee_type
(
	id SERIAL NOT NULL,
	label VARCHAR(100),
	PRIMARY KEY (id)
);

CREATE TABLE ref_company_type
(
	id SERIAL NOT NULL,
	label VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE ref_country
(
	id VARCHAR(3) NOT NULL,
	label VARCHAR(100),
	PRIMARY KEY (id)
);

CREATE TABLE ref_currency
(
	id SERIAL NOT NULL,
	code VARCHAR(10) NOT NULL,
	country VARCHAR(100) NOT NULL,
	value DECIMAL(17,2),
	currency VARCHAR(100),
	PRIMARY KEY (id)
);

CREATE TABLE ref_delivery_field
(
	id SERIAL NOT NULL,
	label_en VARCHAR(200),
	label_my VARCHAR(200),
	status VARCHAR(1),
	PRIMARY KEY (id)
);

CREATE TABLE ref_field
(
	field_code VARCHAR(6) NOT NULL,
	parent_field_id VARCHAR(6),
	label VARCHAR(250),
	description VARCHAR(250),
	category VARCHAR(5),
	pseudocode VARCHAR(25),
	level INT,
	PRIMARY KEY (field_code),
	FOREIGN KEY (parent_field_id) REFERENCES ref_field (field_code) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_field_1 ON ref_field(parent_field_id);
CREATE TABLE ref_field_agency
(
	id VARCHAR(5) NOT NULL,
	label VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE ref_field_gred
(
	id SERIAL NOT NULL,
	gred_code VARCHAR(5),
	label VARCHAR(50),
	field_code VARCHAR(6),
	PRIMARY KEY (id),
	FOREIGN KEY (field_code) REFERENCES ref_field (field_code) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_field_gred_1 ON ref_field_gred(field_code);
CREATE TABLE ref_file
(
	id SERIAL NOT NULL,
	file_name VARCHAR(100),
	file_type VARCHAR(25),
	file_size INT,
	content BYTE,
	created_by VARCHAR(25),
	created_date DATETIME YEAR to FRACTION NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE ref_finance_group
(
	id CHAR(2) NOT NULL,
	label VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE ref_item_attribute
(
	id SERIAL NOT NULL,
	label VARCHAR(50),
	status VARCHAR(1),
	PRIMARY KEY (id)
);

CREATE TABLE ref_item_category
(
	id SERIAL NOT NULL,
	label VARCHAR(100),
	PRIMARY KEY (id)
);

CREATE TABLE ref_ministry_outcome
(
	id VARCHAR(5) NOT NULL,
	label VARCHAR(200),
	PRIMARY KEY (id)
);

CREATE TABLE ref_ministry_program
(
	id VARCHAR(5) NOT NULL,
	label VARCHAR(200),
	PRIMARY KEY (id)
);

CREATE TABLE ref_pkk_category
(
	id SERIAL NOT NULL,
	label VARCHAR(45) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE ref_pkk_limit
(
	id SERIAL NOT NULL,
	category_id INT NOT NULL,
	label VARCHAR(45) NOT NULL,
	min DECIMAL(12,0),
	max DECIMAL(12,0),
	PRIMARY KEY (id),
	FOREIGN KEY (category_id) REFERENCES ref_pkk_category (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_pkk_limit_1 ON ref_pkk_limit(category_id);
CREATE TABLE ref_position
(
	id SERIAL NOT NULL,
	label VARCHAR(100),
	level INT,
	PRIMARY KEY (id)
);

CREATE TABLE ref_price
(
	id SERIAL NOT NULL,
	value VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE ref_procurement_activiti
(
	id SERIAL NOT NULL,
	label VARCHAR(100),
	PRIMARY KEY (id)
);

CREATE TABLE ref_procurement_budget_source
(
	id SERIAL NOT NULL,
	label VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE ref_procurement_category
(
	id SERIAL NOT NULL,
	label VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE ref_procurement_purpose
(
	id SERIAL NOT NULL,
	label VARCHAR(100),
	PRIMARY KEY (id)
);

CREATE TABLE ref_race
(
	id SERIAL NOT NULL,
	label VARCHAR(50),
	status VARCHAR(1),
	PRIMARY KEY (id)
);

CREATE TABLE ref_state
(
	id CHAR(1) NOT NULL,
	label VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE ref_title
(
	id SERIAL NOT NULL,
	label VARCHAR(50),
	PRIMARY KEY (id)
);

CREATE TABLE ref_unit_of_measurement
(
	id SERIAL NOT NULL,
	label VARCHAR(100),
	PRIMARY KEY (id)
);

CREATE TABLE ref_velocity_mail_template
(
	id VARCHAR(100) NOT NULL,
	content LVARCHAR(5120),
	timestamp DATETIME YEAR to FRACTION,
	PRIMARY KEY (id)
);

CREATE TABLE ref_vendor_parameter_dasar
(
	id INT NOT NULL,
	new_registration_completion INT,
	review_period INT,
	reminder_review_by_hour INT,
	reminder_approve_by_hour INT,
	reminder_vendor_update_company INT,
	subscribe_sms VARCHAR(1),
	created_by VARCHAR(25),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(25),
	updated_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (id)
);

CREATE TABLE ref_vendor_parameter_dokumen
(
	id SERIAL NOT NULL,
	document_code VARCHAR(25),
	label LVARCHAR(255),
	created_date DATETIME YEAR to FRACTION,
	created_by VARCHAR(25),
	updated_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(25),
	PRIMARY KEY (id)
);
CREATE UNIQUE INDEX idx_ref_vendor_parameter_dokumen_1 ON ref_vendor_parameter_dokumen(document_code);
CREATE TABLE ref_vendor_parameter_identifikasi
(
	id SERIAL NOT NULL,
	soalan_my LVARCHAR(255) NOT NULL,
	soalan_en LVARCHAR(255) NOT NULL,
	created_by VARCHAR(25),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(25),
	updated_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (id)
);
CREATE UNIQUE INDEX idx_ref_vendor_parameter_identifikasi_1 ON ref_vendor_parameter_identifikasi(soalan_my);
CREATE UNIQUE INDEX idx_ref_vendor_parameter_identifikasi_2 ON ref_vendor_parameter_identifikasi(soalan_en);
CREATE TABLE role
(
	role_name VARCHAR(32) NOT NULL,
	label VARCHAR(32),
	PRIMARY KEY (role_name)
);

CREATE TABLE user
(
	username VARCHAR(12) NOT NULL,
	enabled BOOLEAN NOT NULL,
	name VARCHAR(200) NOT NULL,
	password VARCHAR(100) NOT NULL,
	vendor CHAR(1),
	PRIMARY KEY (username)
);

CREATE TABLE user_configuration
(
	id SERIAL NOT NULL,
	username VARCHAR(12),
	table_length INT,
	language VARCHAR(2),
	PRIMARY KEY (id),
	FOREIGN KEY (username) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_user_configuration_1 ON user_configuration(username);
CREATE TABLE user_role
(
	id SERIAL NOT NULL,
	username VARCHAR(12) NOT NULL,
	role_name VARCHAR(32) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (role_name) REFERENCES role (role_name) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (username) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_user_role_1 ON user_role(username);
CREATE INDEX idx_user_role_2 ON user_role(role_name);
CREATE TABLE ut_menu
(
	id SERIAL NOT NULL,
	parent_id INT,
	name VARCHAR(50),
	url VARCHAR(200),
	created_by VARCHAR(25),
	created_date DATETIME YEAR to FRACTION NOT NULL,
	updated_by VARCHAR(25),
	updated_date DATETIME YEAR to FRACTION NOT NULL,
	active_flag VARCHAR(1),
	label_en VARCHAR(100),
	label_my VARCHAR(100),
	sequence INT,
	description_en VARCHAR(100),
	description_my VARCHAR(100),
	PRIMARY KEY (id),
	FOREIGN KEY (parent_id) REFERENCES ut_menu (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ut_menu_1 ON ut_menu(parent_id);
CREATE TABLE vendor
(
	id SERIAL NOT NULL,
	vendor_code VARCHAR(15),
	vendor_type INT,
	name VARCHAR(40),
	currency_code VARCHAR(3),
	nonactive_date DATE,
	current_amount_money DECIMAL(16,2),
	balance_amount_money DECIMAL(16,2),
	type_code VARCHAR(3),
	term_code VARCHAR(3),
	tax_code VARCHAR(3),
	hold_code VARCHAR(3),
	highest_balance_amount DECIMAL(16,2),
	ytd_amount DECIMAL(16,2),
	average_day_paid INT,
	last_po_date DATE,
	last_voucher_date DATE,
	last_payment_date DATE,
	paid_up_capital DECIMAL(16,2),
	approval_capital DECIMAL(16,2),
	next_seq_num INT,
	tax_text VARCHAR(10),
	drop_flag VARCHAR(1),
	create_company VARCHAR(4),
	create_code VARCHAR(8),
	create_date DATE,
	update_code VARCHAR(8),
	update_date DATE,
	mandatory_flag VARCHAR(1),
	prestasi_code VARCHAR(2),
	active_status VARCHAR(1),
	status VARCHAR(1),
	verify_code VARCHAR(8),
	verify_date DATE,
	desc_text1 LVARCHAR(255),
	approve_code VARCHAR(8),
	approve_date DATE,
	desc_text2 LVARCHAR(255),
	last_debit DATE,
	usual_acct_code VARCHAR(18),
	verify_flag VARCHAR(1),
	ownership_status VARCHAR(7),
	establish_year VARCHAR(4),
	markah DECIMAL(5,2),
	created_by VARCHAR(12),
	created_date DATETIME YEAR to FRACTION,
	registration_flag VARCHAR(10),
	PRIMARY KEY (id),
	FOREIGN KEY (vendor_type) REFERENCES ref_company_type (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_1 ON vendor(vendor_type);
CREATE TABLE vendor_bidang
(
	id SERIAL NOT NULL,
	vendor_code INT,
	seq_num INT,
	pelanggan VARCHAR(5),
	no_daftar VARCHAR(20),
	class INT,
	kep_bidang VARCHAR(6),
	create_code VARCHAR(8),
	create_date DATE,
	verify_flag VARCHAR(1),
	sent_invitation VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (kep_bidang) REFERENCES ref_field (field_code) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (class) REFERENCES ref_field_gred (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (vendor_code) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_bidang_1 ON vendor_bidang(vendor_code);
CREATE INDEX idx_vendor_bidang_2 ON vendor_bidang(kep_bidang);
CREATE INDEX idx_vendor_bidang_3 ON vendor_bidang(class);
CREATE TABLE vendor_board
(
	id SERIAL NOT NULL,
	vendor_code INT,
	name VARCHAR(125),
	nationality VARCHAR(3),
	race INT,
	ic_no VARCHAR(14),
	title VARCHAR(50),
	birthdate DATE,
	appoint VARCHAR(125),
	other_desc VARCHAR(125),
	share_percent VARCHAR(100),
	address1 VARCHAR(125),
	address2 VARCHAR(125),
	address3 VARCHAR(125),
	PRIMARY KEY (id),
	FOREIGN KEY (nationality) REFERENCES ref_country (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (vendor_code) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_board_1 ON vendor_board(vendor_code);
CREATE INDEX idx_vendor_board_2 ON vendor_board(nationality);
CREATE TABLE vendor_dokumen
(
	id INT NOT NULL,
	vendor_code INT NOT NULL,
	document_id INT NOT NULL,
	class VARCHAR(50),
	registration_no VARCHAR(50),
	start_date DATE,
	expiry_date DATE,
	vendor_ownership_status VARCHAR(10),
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES ref_file (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (document_id) REFERENCES ref_vendor_parameter_dokumen (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (vendor_code) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_dokumen_1 ON vendor_dokumen(document_id);
CREATE UNIQUE INDEX idx_vendor_dokumen_2 ON vendor_dokumen(vendor_code, document_id);
CREATE TABLE vendor_equity
(
	vendor_code INT NOT NULL,
	capital_authorised DECIMAL(14,2),
	capital_paid_money DECIMAL(14,2),
	capital_paid_bumi DECIMAL(14,2),
	capital_paid_non_bumi DECIMAL(14,2),
	capital_paid_government DECIMAL(14,2),
	capital_paid_corporate DECIMAL(14,2),
	capital_paid_foreign DECIMAL(14,2),
	capital_percent_bumi DECIMAL(5,2),
	capital_percent_non_bumi DECIMAL(5,2),
	capital_percent_government DECIMAL(5,2),
	capital_percent_corporate DECIMAL(5,2),
	capital_percent_foreign DECIMAL(5,2),
	staff_mgt_bumi INT,
	staff_mgt_nonbumi INT,
	staff_mgt_foreign INT,
	staff_pro_bumi INT,
	staff_pro_nonbumi INT,
	staff_pro_foreign INT,
	staff_low_bumi INT,
	staff_low_nonbumi INT,
	staff_low_foreign INT,
	create_code VARCHAR(8),
	create_date DATE,
	pra_update_code VARCHAR(8),
	pra_update_date DATE,
	update_code VARCHAR(8),
	update_date DATE,
	verify_flag VARCHAR(1),
	PRIMARY KEY (vendor_code),
	FOREIGN KEY (vendor_code) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE vendor_experience
(
	id SERIAL NOT NULL,
	vendor_code INT,
	seq_num INT,
	description_text LVARCHAR(255),
	ref_no VARCHAR(125),
	name_text VARCHAR(125),
	address1 VARCHAR(125),
	address2 VARCHAR(125),
	address3 VARCHAR(125),
	start_date DATE,
	end_date DATE,
	complete_date DATE,
	value DECIMAL(14,2),
	create_code VARCHAR(8),
	create_date DATE,
	update_code VARCHAR(8),
	update_date DATE,
	verify_flag VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (vendor_code) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_experience_1 ON vendor_experience(vendor_code);
CREATE TABLE vendor_ownership
(
	id SERIAL NOT NULL,
	vendor_code INT,
	category_code VARCHAR(5),
	name VARCHAR(125),
	nationality VARCHAR(3),
	race INT,
	ic_no VARCHAR(14),
	title VARCHAR(50),
	birthdate DATE,
	share_percent DECIMAL(5,2),
	share_amount DECIMAL(14,2),
	address1 VARCHAR(125),
	address2 VARCHAR(125),
	address3 VARCHAR(125),
	PRIMARY KEY (id),
	FOREIGN KEY (nationality) REFERENCES ref_country (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (vendor_code) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_ownership_1 ON vendor_ownership(vendor_code);
CREATE INDEX idx_vendor_ownership_2 ON vendor_ownership(nationality);
CREATE TABLE vendor_subscription_sms
(
	id SERIAL NOT NULL,
	vendor_code INT,
	endorse_flag VARCHAR(1),
	hp_no VARCHAR(25),
	tender_ads VARCHAR(1),
	sebutharga_ads VARCHAR(1),
	tender_result VARCHAR(1),
	sebutharga_result VARCHAR(1),
	tender_rank_schedule VARCHAR(1),
	sebutharga_rank_schedule VARCHAR(1),
	action_charge_notice VARCHAR(1),
	closing_date_notice VARCHAR(1),
	payment_received_info VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (vendor_code) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_subscription_sms_1 ON vendor_subscription_sms(vendor_code);
CREATE TABLE vendor_utility
(
	id SERIAL NOT NULL,
	vendor_code INT,
	seq_num INT,
	type_description VARCHAR(125),
	cc VARCHAR(20),
	make_year VARCHAR(4),
	category VARCHAR(40),
	make_type VARCHAR(40),
	license_date DATE,
	current_value DECIMAL(14,2),
	storage VARCHAR(125),
	ownership VARCHAR(125),
	address1 VARCHAR(125),
	address2 VARCHAR(125),
	address3 VARCHAR(125),
	verify_flag VARCHAR(1),
	type_code VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (vendor_code) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_utility_1 ON vendor_utility(vendor_code);
CREATE TABLE committee_master
(
	id SERIAL NOT NULL,
	committee_type_id INT,
	access_level_id CHAR(1),
	start_price INT,
	end_price INT,
	description VARCHAR(100),
	purpose VARCHAR(100),
	establishment_date DATE,
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (start_price) REFERENCES ref_price (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (end_price) REFERENCES ref_price (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (access_level_id) REFERENCES ref_access_level (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (committee_type_id) REFERENCES ref_committee_type (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_committee_master_1 ON committee_master(start_price);
CREATE INDEX idx_committee_master_2 ON committee_master(end_price);
CREATE INDEX idx_committee_master_3 ON committee_master(access_level_id);
CREATE INDEX idx_committee_master_4 ON committee_master(committee_type_id);
CREATE TABLE contract
(
	id SERIAL NOT NULL,
	reference_number VARCHAR(100),
	contract_type INT,
	contract_amount DECIMAL(14,2),
	bon_type INT,
	bon_amount DECIMAL(14,2),
	bank VARCHAR(11),
	start_date DATE,
	end_date DATE,
	contract_date DATE,
	description VARCHAR(250),
	status VARCHAR(1),
	termination_date DATE,
	termination_reason INT,
	PRIMARY KEY (id),
	FOREIGN KEY (bank) REFERENCES ref_bank (swift_code) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_contract_1 ON contract(bank);
CREATE TABLE contract_vendor
(
	id SERIAL NOT NULL,
	contract_id INT,
	vendor_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (contract_id) REFERENCES contract (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (vendor_id) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_contract_vendor_1 ON contract_vendor(vendor_id);
CREATE UNIQUE INDEX idx_contract_vendor_2 ON contract_vendor(contract_id, vendor_id);
CREATE TABLE inbox
(
	id SERIAL NOT NULL,
	sender_add VARCHAR(30),
	sent_date DATE,
	title VARCHAR(100),
	user VARCHAR(12) NOT NULL,
	opened BOOLEAN,
	PRIMARY KEY (id),
	FOREIGN KEY (user) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_inbox_1 ON inbox(user);
CREATE TABLE item
(
	id SERIAL NOT NULL,
	parent_id INT,
	item_code VARCHAR(5),
	description VARCHAR(200),
	status VARCHAR(1),
	control_amount_direct_purchase DECIMAL(14,2),
	control_amount_property DECIMAL(14,2),
	effective_date DATE,
	combine_code VARCHAR(25),
	level INT,
	created_by VARCHAR(12),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(12),
	updated_date DATETIME YEAR to FRACTION,
	uom INT,
	estimate_price DECIMAL(14,2),
	procurement_category_id INT,
	item_category_id INT,
	direct_nego_price_id INT,
	direct_purchase_price_id INT,
	tender_price_id INT,
	direct_nego_value_type VARCHAR(1),
	direct_purchase_value_type VARCHAR(1),
	tender_value_type VARCHAR(1),
	contract_id INT,
	gst DECIMAL(14,2),
	PRIMARY KEY (id),
	FOREIGN KEY (direct_nego_price_id) REFERENCES ref_price (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (direct_purchase_price_id) REFERENCES ref_price (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (parent_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (item_category_id) REFERENCES ref_item_category (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (procurement_category_id) REFERENCES ref_procurement_category (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (uom) REFERENCES ref_unit_of_measurement (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (tender_price_id) REFERENCES ref_price (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (contract_id) REFERENCES contract (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_item_1 ON item(uom);
CREATE INDEX idx_item_2 ON item(procurement_category_id);
CREATE INDEX idx_item_3 ON item(item_category_id);
CREATE INDEX idx_item_4 ON item(direct_nego_price_id);
CREATE INDEX idx_item_5 ON item(direct_purchase_price_id);
CREATE INDEX idx_item_6 ON item(tender_price_id);
CREATE INDEX idx_item_7 ON item(contract_id);
CREATE UNIQUE INDEX idx_item_8 ON item(parent_id, item_code);
CREATE TABLE item_account_need
(
	id SERIAL NOT NULL,
	item_id INT NOT NULL,
	activiti_id INT,
	purpose_id INT,
	account_code VARCHAR(5) NOT NULL,
	field_code VARCHAR(6),
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (field_code) REFERENCES ref_field (field_code) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (activiti_id) REFERENCES ref_procurement_activiti (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (purpose_id) REFERENCES ref_procurement_purpose (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (account_code) REFERENCES fais_account_code (code) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_item_account_need_1 ON item_account_need(activiti_id);
CREATE INDEX idx_item_account_need_2 ON item_account_need(purpose_id);
CREATE INDEX idx_item_account_need_3 ON item_account_need(account_code);
CREATE INDEX idx_item_account_need_4 ON item_account_need(field_code);
CREATE UNIQUE INDEX idx_item_account_need_5 ON item_account_need(item_id, activiti_id, purpose_id, account_code, field_code);
CREATE TABLE item_agencies
(
	id SERIAL NOT NULL,
	item_id INT,
	agency_id INT,
	amount_control INT,
	PRIMARY KEY (id),
	FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (agency_id) REFERENCES ref_agency (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (amount_control) REFERENCES ref_price (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_item_agencies_1 ON item_agencies(agency_id);
CREATE INDEX idx_item_agencies_2 ON item_agencies(amount_control);
CREATE UNIQUE INDEX idx_item_agencies_3 ON item_agencies(item_id, agency_id);
CREATE TABLE item_attribute_need
(
	id SERIAL NOT NULL,
	item_id INT,
	item_attribute_id INT,
	status VARCHAR(25),
	PRIMARY KEY (id),
	FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (item_attribute_id) REFERENCES ref_item_attribute (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_item_attribute_need_1 ON item_attribute_need(item_attribute_id);
CREATE UNIQUE INDEX idx_item_attribute_need_2 ON item_attribute_need(item_id, item_attribute_id);
CREATE TABLE item_committee
(
	id SERIAL NOT NULL,
	item_id INT,
	committee_master_id INT,
	sequence INT,
	price_from INT,
	price_to INT,
	PRIMARY KEY (id),
	FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (committee_master_id) REFERENCES committee_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (price_from) REFERENCES ref_price (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (price_to) REFERENCES ref_price (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_item_committee_1 ON item_committee(item_id);
CREATE INDEX idx_item_committee_2 ON item_committee(committee_master_id);
CREATE INDEX idx_item_committee_3 ON item_committee(price_from);
CREATE INDEX idx_item_committee_4 ON item_committee(price_to);
CREATE TABLE item_parameter
(
	item_id INT NOT NULL,
	enable_access_control VARCHAR(1),
	enable_direct_purchase VARCHAR(1),
	enable_quotation VARCHAR(1),
	enable_tender VARCHAR(1),
	enable_unit VARCHAR(1),
	enable_committee VARCHAR(1),
	enable_agency VARCHAR(1),
	enable_gst VARCHAR(1),
	enable_direct_quotation VARCHAR(1),
	PRIMARY KEY (item_id),
	FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE item_requisition
(
	id SERIAL NOT NULL,
	parent_id INT,
	description VARCHAR(25),
	request_by VARCHAR(25),
	request_date DATETIME YEAR to FRACTION,
	review_by VARCHAR(25),
	review_date DATETIME YEAR to FRACTION,
	approve_by VARCHAR(25),
	approve_date DATETIME YEAR to FRACTION,
	status VARCHAR(1),
	reason VARCHAR(250),
	review_comment VARCHAR(250),
	approve_comment VARCHAR(250),
	PRIMARY KEY (id),
	FOREIGN KEY (parent_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_item_requisition_1 ON item_requisition(parent_id);
CREATE TABLE item_specification_master
(
	id SERIAL NOT NULL,
	item_id INT,
	label VARCHAR(50),
	status CHAR(1),
	created_by VARCHAR(25),
	created_date DATE,
	updated_by VARCHAR(25),
	updated_date DATE,
	procurement_category_id INT,
	is_approved INT,
	valid_from DATE,
	valid_to DATE,
	history_spec INT,
	PRIMARY KEY (id),
	FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (procurement_category_id) REFERENCES ref_procurement_category (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (history_spec) REFERENCES item_specification_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_item_specification_master_1 ON item_specification_master(item_id);
CREATE INDEX idx_item_specification_master_2 ON item_specification_master(procurement_category_id);
CREATE INDEX idx_item_specification_master_3 ON item_specification_master(history_spec);
CREATE TABLE job_userrole
(
	id SERIAL NOT NULL,
	username VARCHAR(12),
	role_name VARCHAR(32),
	operation_type VARCHAR(3),
	operation_date DATE,
	created_by VARCHAR(11),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(11),
	updated_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (id),
	FOREIGN KEY (role_name) REFERENCES role (role_name) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (username) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_job_userrole_1 ON job_userrole(username);
CREATE INDEX idx_job_userrole_2 ON job_userrole(role_name);
CREATE TABLE menu_role
(
	id SERIAL NOT NULL,
	menu_id INT NOT NULL,
	role_name VARCHAR(32) NOT NULL,
	created_by VARCHAR(11),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(11),
	updated_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (id),
	FOREIGN KEY (role_name) REFERENCES role (role_name) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (menu_id) REFERENCES ut_menu (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_menu_role_1 ON menu_role(menu_id);
CREATE INDEX idx_menu_role_2 ON menu_role(role_name);
CREATE UNIQUE INDEX idx_menu_role_3 ON menu_role(menu_id, role_name);
CREATE TABLE node_access
(
	id SERIAL NOT NULL,
	access_level CHAR(1) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (access_level) REFERENCES ref_access_level (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_node_access_1 ON node_access(access_level);
CREATE TABLE node_access_state
(
	id INT NOT NULL,
	state_id CHAR(1) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (state_id) REFERENCES ref_state (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_node_access_state_1 ON node_access_state(state_id);
CREATE UNIQUE INDEX idx_node_access_state_2 ON node_access_state(state_id);
CREATE TABLE node_committee
(
	id SERIAL NOT NULL,
	node_id INT,
	committee_master_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (committee_master_id) REFERENCES committee_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (node_id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_node_committee_1 ON node_committee(node_id);
CREATE INDEX idx_node_committee_2 ON node_committee(committee_master_id);
CREATE TABLE node_contract
(
	id SERIAL NOT NULL,
	node_id INT,
	contract_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (node_id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (contract_id) REFERENCES contract (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_node_contract_1 ON node_contract(node_id);
CREATE INDEX idx_node_contract_2 ON node_contract(contract_id);
CREATE TABLE node_item
(
	id SERIAL NOT NULL,
	node_id INT,
	item_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (node_id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_node_item_1 ON node_item(node_id);
CREATE INDEX idx_node_item_2 ON node_item(item_id);
CREATE TABLE node_user
(
	id SERIAL NOT NULL,
	node_id INT,
	username VARCHAR(12),
	defaultLocation VARCHAR(1),
	manager VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (username) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (node_id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_node_user_1 ON node_user(node_id);
CREATE INDEX idx_node_user_2 ON node_user(username);
CREATE TABLE pbm
(
	id SERIAL NOT NULL,
	access_level_id CHAR(1),
	start_price INT,
	end_price INT,
	description VARCHAR(100),
	purpose VARCHAR(100),
	establishment_date DATE,
	price INT,
	status VARCHAR(45),
	PRIMARY KEY (id),
	FOREIGN KEY (start_price) REFERENCES ref_price (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (end_price) REFERENCES ref_price (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (access_level_id) REFERENCES ref_access_level (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (price) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pbm_1 ON pbm(access_level_id);
CREATE INDEX idx_pbm_2 ON pbm(price);
CREATE INDEX idx_pbm_3 ON pbm(start_price);
CREATE INDEX idx_pbm_4 ON pbm(end_price);
CREATE TABLE pp_pb_distribution_control
(
	id SERIAL NOT NULL,
	purchase_control_id INT,
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (purchase_control_id) REFERENCES purchase_control (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pp_pb_distribution_control_1 ON pp_pb_distribution_control(purchase_control_id);
CREATE TABLE ref_campus
(
	id SERIAL NOT NULL,
	state_id CHAR(1) NOT NULL,
	label VARCHAR(50) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (state_id) REFERENCES ref_state (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_campus_1 ON ref_campus(state_id);
CREATE UNIQUE INDEX idx_ref_campus_2 ON ref_campus(state_id, label);
CREATE TABLE ref_campus_company
(
	code VARCHAR(5) NOT NULL,
	campus_id INT,
	PRIMARY KEY (code),
	FOREIGN KEY (campus_id) REFERENCES ref_campus (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_campus_company_1 ON ref_campus_company(campus_id);
CREATE TABLE ref_city
(
	id SERIAL NOT NULL,
	city_code CHAR(2),
	state_code CHAR(1),
	label VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (state_code) REFERENCES ref_state (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_city_1 ON ref_city(state_code);
CREATE UNIQUE INDEX idx_ref_city_2 ON ref_city(city_code, state_code);
CREATE TABLE ref_company
(
	id VARCHAR(8) NOT NULL,
	campus_id INT,
	finance_group_id CHAR(2),
	PRIMARY KEY (id),
	FOREIGN KEY (campus_id) REFERENCES ref_campus (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (finance_group_id) REFERENCES ref_finance_group (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_company_1 ON ref_company(finance_group_id);
CREATE UNIQUE INDEX idx_ref_company_2 ON ref_company(campus_id, finance_group_id);
CREATE TABLE ref_district
(
	id SERIAL NOT NULL,
	district_code CHAR(2),
	state_id CHAR(1),
	label VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (state_id) REFERENCES ref_state (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_district_1 ON ref_district(state_id);
CREATE TABLE ref_postcode
(
	postcode VARCHAR(5) NOT NULL,
	city_code INT,
	PRIMARY KEY (postcode),
	FOREIGN KEY (city_code) REFERENCES ref_city (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_postcode_1 ON ref_postcode(city_code);
CREATE TABLE ref_zone
(
	id SERIAL NOT NULL,
	company_id VARCHAR(8),
	zone_code CHAR(2),
	PRIMARY KEY (id),
	FOREIGN KEY (company_id) REFERENCES ref_company (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE UNIQUE INDEX idx_ref_zone_1 ON ref_zone(company_id, zone_code);
CREATE TABLE staff
(
	id VARCHAR(12) NOT NULL,
	email VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE vendor_address
(
	id SERIAL NOT NULL,
	vendor_code INT,
	seq_num INT,
	name_text VARCHAR(40),
	address1 VARCHAR(125),
	address2 VARCHAR(125),
	address3 VARCHAR(125),
	city_code INT,
	district_code INT,
	state_code CHAR(1),
	postcode VARCHAR(10),
	country_code VARCHAR(25),
	country_text VARCHAR(20),
	tel_no VARCHAR(20),
	extension VARCHAR(7),
	fax_no VARCHAR(20),
	status_ind VARCHAR(1),
	create_code VARCHAR(8),
	create_date DATE,
	update_code VARCHAR(8),
	update_date DATE,
	approve_code VARCHAR(8),
	approve_date DATE,
	email VARCHAR(40),
	url VARCHAR(125),
	verify_flag VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (city_code) REFERENCES ref_city (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (district_code) REFERENCES ref_district (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (state_code) REFERENCES ref_state (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (vendor_code) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_address_1 ON vendor_address(vendor_code);
CREATE INDEX idx_vendor_address_2 ON vendor_address(state_code);
CREATE INDEX idx_vendor_address_3 ON vendor_address(city_code);
CREATE INDEX idx_vendor_address_4 ON vendor_address(district_code);
CREATE TABLE vendor_bank
(
	id SERIAL NOT NULL,
	vendor_address_code INT,
	seq_num INT,
	type_code VARCHAR(1),
	bank_account_code VARCHAR(40),
	bank_code VARCHAR(11),
	bank_address1 VARCHAR(125),
	bank_address2 VARCHAR(125),
	bank_address3 VARCHAR(125),
	city_code INT,
	district_code INT,
	state_code CHAR(1),
	postcode VARCHAR(5),
	tel_no VARCHAR(20),
	fax_no VARCHAR(20),
	status_ind VARCHAR(1),
	verify_flag VARCHAR(1),
	factoring_flag CHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (bank_code) REFERENCES ref_bank (swift_code) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (city_code) REFERENCES ref_city (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (district_code) REFERENCES ref_district (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (state_code) REFERENCES ref_state (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (vendor_address_code) REFERENCES vendor_address (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_bank_1 ON vendor_bank(vendor_address_code);
CREATE INDEX idx_vendor_bank_2 ON vendor_bank(state_code);
CREATE INDEX idx_vendor_bank_3 ON vendor_bank(district_code);
CREATE INDEX idx_vendor_bank_4 ON vendor_bank(city_code);
CREATE INDEX idx_vendor_bank_5 ON vendor_bank(bank_code);
CREATE TABLE vendor_contact
(
	ic_no VARCHAR(12) NOT NULL,
	vendor_address_code INT,
	seq_num INT,
	name_text VARCHAR(125),
	role_text VARCHAR(125),
	tel_no VARCHAR(20),
	tel_no_hp VARCHAR(20),
	fax_no VARCHAR(20),
	email VARCHAR(125),
	temp_password VARCHAR(100),
	verify_flag VARCHAR(1),
	panggilan INT,
	tarikh_lahir DATE,
	jantina VARCHAR(1),
	warganegara VARCHAR(3),
	taraf_warganegara VARCHAR(1),
	tauliah CHAR(1),
	tauliah_file INT,
	register_type CHAR(1),
	PRIMARY KEY (ic_no),
	FOREIGN KEY (tauliah_file) REFERENCES ref_file (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (panggilan) REFERENCES ref_title (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (vendor_address_code) REFERENCES vendor_address (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_contact_1 ON vendor_contact(vendor_address_code);
CREATE INDEX idx_vendor_contact_2 ON vendor_contact(panggilan);
CREATE UNIQUE INDEX idx_vendor_contact_3 ON vendor_contact(tauliah_file);
CREATE TABLE vendor_contact_identification
(
	vendor_contact_code VARCHAR(12) NOT NULL,
	identification_code_1 INT,
	answer_1 VARCHAR(25),
	identification_code_2 INT,
	answer_2 VARCHAR(25),
	identification_code_3 INT,
	answer_3 VARCHAR(25),
	created_by VARCHAR(25),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(25),
	updated_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (vendor_contact_code),
	FOREIGN KEY (vendor_contact_code) REFERENCES vendor_contact (ic_no) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (identification_code_1) REFERENCES ref_vendor_parameter_identifikasi (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (identification_code_2) REFERENCES ref_vendor_parameter_identifikasi (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (identification_code_3) REFERENCES ref_vendor_parameter_identifikasi (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_contact_identification_1 ON vendor_contact_identification(identification_code_1);
CREATE INDEX idx_vendor_contact_identification_2 ON vendor_contact_identification(identification_code_2);
CREATE INDEX idx_vendor_contact_identification_3 ON vendor_contact_identification(identification_code_3);
CREATE TABLE vendor_pegawai_tauliah
(
	id SERIAL NOT NULL,
	vendor_address_code INT,
	seq_num INT,
	name_text VARCHAR(125),
	ic_no VARCHAR(14),
	role_text VARCHAR(125),
	verify_flag VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (vendor_address_code) REFERENCES vendor_address (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_pegawai_tauliah_1 ON vendor_pegawai_tauliah(vendor_address_code);
CREATE TABLE vendor_registration_flow
(
	id SERIAL NOT NULL,
	vendor_code INT,
	status CHAR(1),
	created_date DATETIME YEAR to FRACTION,
	flow_type CHAR(1),
	review_status CHAR(1),
	review_description LVARCHAR(1000),
	review_by VARCHAR(50),
	review_date DATETIME YEAR to FRACTION,
	approve_status CHAR(1),
	approve_description LVARCHAR(1000),
	approve_by VARCHAR(50),
	approve_date DATETIME YEAR to FRACTION,
	ref_number VARCHAR(50),
	vendor_contact VARCHAR(12),
	PRIMARY KEY (id),
	FOREIGN KEY (vendor_code) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (vendor_contact) REFERENCES vendor_contact (ic_no) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_registration_flow_1 ON vendor_registration_flow(vendor_code);
CREATE INDEX idx_vendor_registration_flow_2 ON vendor_registration_flow(vendor_contact);
CREATE TABLE vendor_registration_flow_notice
(
	id SERIAL NOT NULL,
	vendor_registration_flow_id INT,
	subject VARCHAR(100),
	content LVARCHAR(1000),
	created_by VARCHAR(50),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(50),
	updated_date DATETIME YEAR to FRACTION,
	ref_number VARCHAR(50),
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (vendor_registration_flow_id) REFERENCES vendor_registration_flow (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_vendor_registration_flow_notice_1 ON vendor_registration_flow_notice(vendor_registration_flow_id);
CREATE TABLE committee_detail
(
	id SERIAL NOT NULL,
	committee_master_id INT,
	username VARCHAR(12),
	position_id INT,
	start_date DATE,
	end_date DATE,
	PRIMARY KEY (id),
	FOREIGN KEY (committee_master_id) REFERENCES committee_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (position_id) REFERENCES ref_position (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (username) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_committee_detail_1 ON committee_detail(username);
CREATE INDEX idx_committee_detail_2 ON committee_detail(position_id);
CREATE INDEX idx_committee_detail_3 ON committee_detail(committee_master_id);
CREATE TABLE contract_item
(
	id SERIAL NOT NULL,
	contract_id INT,
	item_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (contract_id) REFERENCES contract (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_contract_item_1 ON contract_item(item_id);
CREATE UNIQUE INDEX idx_contract_item_2 ON contract_item(contract_id, item_id);
CREATE TABLE item_specification_detail
(
	id SERIAL NOT NULL,
	item_specification_master_id INT,
	label VARCHAR(25),
	description LVARCHAR(1000),
	susunan INT,
	status CHAR(1),
	parent_id INT,
	level INT,
	vendor_feedback VARCHAR(1),
	mandatory VARCHAR(1),
	marks INT,
	weightage INT,
	PRIMARY KEY (id),
	FOREIGN KEY (item_specification_master_id) REFERENCES item_specification_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (parent_id) REFERENCES item_specification_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_item_specification_detail_1 ON item_specification_detail(item_specification_master_id);
CREATE INDEX idx_item_specification_detail_2 ON item_specification_detail(parent_id);
CREATE TABLE node_access_campus
(
	id INT NOT NULL,
	campus_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (campus_id) REFERENCES ref_campus (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_node_access_campus_1 ON node_access_campus(campus_id);
CREATE UNIQUE INDEX idx_node_access_campus_2 ON node_access_campus(campus_id);
CREATE TABLE ref_ptj
(
	id SERIAL NOT NULL,
	zone_id INT NOT NULL,
	ptj_code VARCHAR(50) NOT NULL,
	label VARCHAR(50) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (zone_id) REFERENCES ref_zone (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_ptj_1 ON ref_ptj(zone_id);
CREATE TABLE vendor_activation_login
(
	id VARCHAR(12) NOT NULL,
	activation_code VARCHAR(200),
	activation_date DATETIME YEAR to FRACTION,
	created_by VARCHAR(25),
	created_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES vendor_contact (ic_no) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE agihan_master
(
	id SERIAL NOT NULL,
	ptj_id INT,
	request_amount DECIMAL(17,2),
	received_amount DECIMAL(17,2),
	balance DECIMAL(17,2),
	year INT,
	dasar INT,
	PRIMARY KEY (id),
	FOREIGN KEY (ptj_id) REFERENCES ref_ptj (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_agihan_master_1 ON agihan_master(ptj_id);
CREATE TABLE node_access_ptj
(
	id INT NOT NULL,
	ptj_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (ptj_id) REFERENCES ref_ptj (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_node_access_ptj_1 ON node_access_ptj(ptj_id);
CREATE UNIQUE INDEX idx_node_access_ptj_2 ON node_access_ptj(ptj_id);
CREATE TABLE ref_department
(
	id SERIAL NOT NULL,
	ptj_id INT NOT NULL,
	dept_code CHAR(3),
	label VARCHAR(50) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (ptj_id) REFERENCES ref_ptj (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE UNIQUE INDEX idx_ref_department_1 ON ref_department(ptj_id, dept_code);
CREATE TABLE ref_procurement_numbering
(
	id SERIAL NOT NULL,
	module VARCHAR(2),
	company_code VARCHAR(8),
	ptj_code INT,
	month_year VARCHAR(6),
	numbering INT,
	fais_numbering INT,
	PRIMARY KEY (id),
	FOREIGN KEY (ptj_code) REFERENCES ref_ptj (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (company_code) REFERENCES ref_company (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_ref_procurement_numbering_1 ON ref_procurement_numbering(ptj_code);
CREATE INDEX idx_ref_procurement_numbering_2 ON ref_procurement_numbering(company_code);
CREATE UNIQUE INDEX idx_ref_procurement_numbering_3 ON ref_procurement_numbering(module, company_code, ptj_code, month_year, numbering);
CREATE TABLE ref_unit
(
	id SERIAL NOT NULL,
	dept_id INT,
	unit_code CHAR(3),
	label VARCHAR(50),
	PRIMARY KEY (id),
	FOREIGN KEY (dept_id) REFERENCES ref_department (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE UNIQUE INDEX idx_ref_unit_1 ON ref_unit(dept_id, unit_code);
CREATE TABLE agihan_detail
(
	id SERIAL NOT NULL,
	agihan_master_id INT,
	account_code VARCHAR(5),
	request_amount DECIMAL(17,2),
	approved_amount DECIMAL(17,2),
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (agihan_master_id) REFERENCES agihan_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (account_code) REFERENCES fais_account_code (code) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_agihan_detail_1 ON agihan_detail(agihan_master_id);
CREATE INDEX idx_agihan_detail_2 ON agihan_detail(account_code);
CREATE TABLE invoice_master
(
	id SERIAL NOT NULL,
	ref_no INT,
	vendor_ref_no VARCHAR(50),
	amount DECIMAL(17,2),
	vendor_bank_id INT,
	review_by VARCHAR(12),
	review_date DATETIME YEAR to FRACTION,
	payment_type VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (ref_no) REFERENCES ref_procurement_numbering (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (vendor_bank_id) REFERENCES vendor_bank (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_invoice_master_1 ON invoice_master(ref_no);
CREATE INDEX idx_invoice_master_2 ON invoice_master(vendor_bank_id);
CREATE TABLE miti_approval
(
	id SERIAL NOT NULL,
	ref_no INT,
	miti_ack_date DATE,
	miti_ref_no VARCHAR(100),
	meeting_date DATE,
	meeting_ref_no VARCHAR(25),
	status_date DATE,
	status VARCHAR(1),
	created_by VARCHAR(12),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(12),
	updated_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (id),
	FOREIGN KEY (ref_no) REFERENCES ref_procurement_numbering (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_miti_approval_1 ON miti_approval(ref_no);
CREATE TABLE miti_approval_vendor
(
	id SERIAL NOT NULL,
	miti_approval_id INT,
	vendor_id INT,
	status VARCHAR(25),
	created_by VARCHAR(12),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(12),
	updated_date VARCHAR(25),
	PRIMARY KEY (id),
	FOREIGN KEY (vendor_id) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (miti_approval_id) REFERENCES miti_approval (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_miti_approval_vendor_1 ON miti_approval_vendor(miti_approval_id);
CREATE INDEX idx_miti_approval_vendor_2 ON miti_approval_vendor(vendor_id);
CREATE TABLE node_access_department
(
	id INT NOT NULL,
	department_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (department_id) REFERENCES ref_department (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_node_access_department_1 ON node_access_department(department_id);
CREATE UNIQUE INDEX idx_node_access_department_2 ON node_access_department(department_id);
CREATE TABLE node_access_unit
(
	id INT NOT NULL,
	unit_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (unit_id) REFERENCES ref_unit (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_node_access_unit_1 ON node_access_unit(unit_id);
CREATE UNIQUE INDEX idx_node_access_unit_2 ON node_access_unit(unit_id);
CREATE TABLE pb_head
(
	id SERIAL NOT NULL,
	ref_no INT,
	node_id INT,
	year INT,
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (node_id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (ref_no) REFERENCES ref_procurement_numbering (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pb_head_1 ON pb_head(ref_no);
CREATE INDEX idx_pb_head_2 ON pb_head(node_id);
CREATE TABLE pelawaan_master
(
	id SERIAL NOT NULL,
	ref_no INT,
	dominan_field_code VARCHAR(6),
	type VARCHAR(2),
	status VARCHAR(25),
	PRIMARY KEY (id),
	FOREIGN KEY (dominan_field_code) REFERENCES ref_field (field_code) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (ref_no) REFERENCES ref_procurement_numbering (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pelawaan_master_1 ON pelawaan_master(ref_no);
CREATE INDEX idx_pelawaan_master_2 ON pelawaan_master(dominan_field_code);
CREATE TABLE pelawaan_vendor
(
	id SERIAL NOT NULL,
	pelawaan_master_id INT,
	vendor_id INT,
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (vendor_id) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pelawaan_master_id) REFERENCES pelawaan_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pelawaan_vendor_1 ON pelawaan_vendor(pelawaan_master_id);
CREATE INDEX idx_pelawaan_vendor_2 ON pelawaan_vendor(vendor_id);
CREATE TABLE pp_head
(
	id SERIAL NOT NULL,
	ref_no INT,
	node_id INT,
	year_start INT,
	year_end INT,
	is_package VARCHAR(1),
	procurement_category INT,
	description VARCHAR(250),
	plan_type VARCHAR(25),
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (ref_no) REFERENCES ref_procurement_numbering (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (node_id) REFERENCES node_access (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (procurement_category) REFERENCES ref_procurement_category (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pp_head_1 ON pp_head(ref_no);
CREATE INDEX idx_pp_head_2 ON pp_head(node_id);
CREATE INDEX idx_pp_head_3 ON pp_head(procurement_category);
CREATE TABLE pp_master
(
	id SERIAL NOT NULL,
	pp_year INT,
	pp_year_to INT,
	state_id CHAR(1),
	campus_id INT,
	ptj_id INT,
	dept_id INT,
	unit_id INT,
	ref_no VARCHAR(250),
	category INT,
	description VARCHAR(250),
	amount DECIMAL(20,2),
	status VARCHAR(2),
	is_package INT NOT NULL,
	created_by VARCHAR(250),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(250),
	updated_date DATETIME YEAR to FRACTION,
	entity_code INT,
	PRIMARY KEY (id),
	FOREIGN KEY (state_id) REFERENCES ref_state (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (category) REFERENCES ref_procurement_category (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (campus_id) REFERENCES ref_campus (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (ptj_id) REFERENCES ref_ptj (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (dept_id) REFERENCES ref_department (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (unit_id) REFERENCES ref_unit (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pp_master_1 ON pp_master(campus_id);
CREATE INDEX idx_pp_master_2 ON pp_master(ptj_id);
CREATE INDEX idx_pp_master_3 ON pp_master(dept_id);
CREATE INDEX idx_pp_master_4 ON pp_master(unit_id);
CREATE INDEX idx_pp_master_5 ON pp_master(category);
CREATE INDEX idx_pp_master_6 ON pp_master(state_id);
CREATE TABLE pp_pb_detl
(
	id SERIAL NOT NULL,
	pp_head_id INT,
	item_id INT,
	item_description VARCHAR(250),
	mp_code VARCHAR(5),
	total_unit INT,
	amount DECIMAL(17,2),
	item_spec_master_id INT,
	item_account_need_id INT,
	purchase_type INT,
	finance_group_id CHAR(2),
	date_use DATE,
	effect VARCHAR(250),
	purpose VARCHAR(250),
	frequency_use VARCHAR(250),
	other_remarks VARCHAR(250),
	reason_repurchase VARCHAR(250),
	project_code VARCHAR(25),
	miti_approval_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (pp_head_id) REFERENCES pp_head (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (item_spec_master_id) REFERENCES item_specification_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (item_account_need_id) REFERENCES item_account_need (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (finance_group_id) REFERENCES ref_finance_group (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (miti_approval_id) REFERENCES miti_approval (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (mp_code) REFERENCES ref_ministry_program (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pp_pb_detl_1 ON pp_pb_detl(pp_head_id);
CREATE INDEX idx_pp_pb_detl_2 ON pp_pb_detl(item_id);
CREATE INDEX idx_pp_pb_detl_3 ON pp_pb_detl(item_spec_master_id);
CREATE INDEX idx_pp_pb_detl_4 ON pp_pb_detl(item_account_need_id);
CREATE INDEX idx_pp_pb_detl_5 ON pp_pb_detl(finance_group_id);
CREATE INDEX idx_pp_pb_detl_6 ON pp_pb_detl(miti_approval_id);
CREATE INDEX idx_pp_pb_detl_7 ON pp_pb_detl(mp_code);
CREATE TABLE pp_pb_detl_survey
(
	id SERIAL NOT NULL,
	pp_pb_detl_id INT,
	file_id INT,
	lo_detail_id INT,
	type VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (pp_pb_detl_id) REFERENCES pp_pb_detl (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (file_id) REFERENCES ref_file (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pp_pb_detl_survey_1 ON pp_pb_detl_survey(pp_pb_detl_id);
CREATE INDEX idx_pp_pb_detl_survey_2 ON pp_pb_detl_survey(file_id);
CREATE TABLE pp_pb_distribution
(
	id SERIAL NOT NULL,
	pp_pb_detl_id INT,
	year INT,
	pb_head_id INT,
	estimated_qty INT,
	estimated_price DECIMAL(17,2),
	pp_pb_detl_sequence INT,
	actual_qty INT,
	actual_price DECIMAL(17,2),
	priority_sequence INT,
	item_spec_master_id INT,
	pp_pb_balance DECIMAL(17,2),
	PRIMARY KEY (id),
	FOREIGN KEY (pp_pb_detl_id) REFERENCES pp_pb_detl (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pb_head_id) REFERENCES pb_head (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (item_spec_master_id) REFERENCES item_specification_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pp_pb_distribution_1 ON pp_pb_distribution(pp_pb_detl_id);
CREATE INDEX idx_pp_pb_distribution_2 ON pp_pb_distribution(pb_head_id);
CREATE INDEX idx_pp_pb_distribution_3 ON pp_pb_distribution(item_spec_master_id);
CREATE TABLE pp_pb_distribution_user
(
	id SERIAL NOT NULL,
	pp_pb_distribution_id INT,
	username VARCHAR(12),
	receiver VARCHAR(1),
	custodian VARCHAR(1),
	responsible VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (username) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pp_pb_distribution_id) REFERENCES pp_pb_distribution (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pp_pb_distribution_user_1 ON pp_pb_distribution_user(pp_pb_distribution_id);
CREATE INDEX idx_pp_pb_distribution_user_2 ON pp_pb_distribution_user(username);
CREATE TABLE agihan_detail_distribution
(
	id SERIAL NOT NULL,
	agihan_detail_id INT,
	pp_pb_distribution_id INT,
	request_amount DECIMAL(17,2),
	approved_amount DECIMAL(17,2),
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (agihan_detail_id) REFERENCES agihan_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pp_pb_distribution_id) REFERENCES pp_pb_distribution (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_agihan_detail_distribution_1 ON agihan_detail_distribution(agihan_detail_id);
CREATE INDEX idx_agihan_detail_distribution_2 ON agihan_detail_distribution(pp_pb_distribution_id);
CREATE TABLE debit_credit_note
(
	id SERIAL NOT NULL,
	invoice_master_id INT,
	type VARCHAR(1),
	amount DECIMAL(17,2),
	prepared_by VARCHAR(12),
	prepared_date DATETIME YEAR to FRACTION,
	review_by VARCHAR(12),
	review_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (id),
	FOREIGN KEY (invoice_master_id) REFERENCES invoice_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_debit_credit_note_1 ON debit_credit_note(invoice_master_id);
CREATE TABLE evaluation_master
(
	id SERIAL NOT NULL,
	pelawaan_master_id INT,
	committee_master_id INT,
	type VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (committee_master_id) REFERENCES committee_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pelawaan_master_id) REFERENCES pelawaan_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_evaluation_master_1 ON evaluation_master(pelawaan_master_id);
CREATE INDEX idx_evaluation_master_2 ON evaluation_master(committee_master_id);
CREATE TABLE offer_master
(
	id SERIAL NOT NULL,
	ref_no INT,
	pelawaan_master_id INT,
	vendor_id INT,
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (vendor_id) REFERENCES vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (ref_no) REFERENCES ref_procurement_numbering (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pelawaan_master_id) REFERENCES pelawaan_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_offer_master_1 ON offer_master(ref_no);
CREATE INDEX idx_offer_master_2 ON offer_master(pelawaan_master_id);
CREATE INDEX idx_offer_master_3 ON offer_master(vendor_id);
CREATE TABLE pelawaan_detail
(
	id SERIAL NOT NULL,
	pelawaan_master_id INT,
	pp_pb_distribution_id INT,
	jenis_pesanan VARCHAR(1),
	jenis_penghantaran VARCHAR(1),
	jenis_terimaan VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (pp_pb_distribution_id) REFERENCES pp_pb_distribution (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pelawaan_master_id) REFERENCES pelawaan_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pelawaan_detail_1 ON pelawaan_detail(pelawaan_master_id);
CREATE INDEX idx_pelawaan_detail_2 ON pelawaan_detail(pp_pb_distribution_id);
CREATE TABLE pelawaan_kod_bidang
(
	id SERIAL NOT NULL,
	pelawaan_master_id INT,
	field_code VARCHAR(6),
	PRIMARY KEY (id),
	FOREIGN KEY (field_code) REFERENCES ref_field (field_code) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pelawaan_master_id) REFERENCES pelawaan_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pelawaan_kod_bidang_1 ON pelawaan_kod_bidang(pelawaan_master_id);
CREATE INDEX idx_pelawaan_kod_bidang_2 ON pelawaan_kod_bidang(field_code);
CREATE TABLE pelawaan_vendor_offer
(
	id SERIAL NOT NULL,
	pelawaan_vendor_id INT,
	pelawaan_detail_id INT,
	brand VARCHAR(100),
	model VARCHAR(250),
	made_in VARCHAR(3),
	warranty_period INT,
	delivery_period INT,
	quantity INT,
	currency INT,
	offer_price VARCHAR(25),
	PRIMARY KEY (id),
	FOREIGN KEY (made_in) REFERENCES ref_country (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pelawaan_vendor_id) REFERENCES pelawaan_vendor (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pelawaan_detail_id) REFERENCES pelawaan_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pelawaan_vendor_offer_1 ON pelawaan_vendor_offer(pelawaan_vendor_id);
CREATE INDEX idx_pelawaan_vendor_offer_2 ON pelawaan_vendor_offer(pelawaan_detail_id);
CREATE INDEX idx_pelawaan_vendor_offer_3 ON pelawaan_vendor_offer(made_in);
CREATE TABLE pelawaan_vendor_offer_specification
(
	id SERIAL NOT NULL,
	pelawaan_vendor_offer_id INT,
	item_specification_detail_id INT,
	answer LVARCHAR(500),
	PRIMARY KEY (id),
	FOREIGN KEY (item_specification_detail_id) REFERENCES item_specification_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pelawaan_vendor_offer_id) REFERENCES pelawaan_vendor_offer (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pelawaan_vendor_offer_specification_1 ON pelawaan_vendor_offer_specification(pelawaan_vendor_offer_id);
CREATE INDEX idx_pelawaan_vendor_offer_specification_2 ON pelawaan_vendor_offer_specification(item_specification_detail_id);
CREATE TABLE pp_detail
(
	id SERIAL NOT NULL,
	master_id INT,
	item_account_need INT,
	item_code VARCHAR(250),
	item_level4_id INT,
	condition_type INT,
	requirement_type INT,
	account_code VARCHAR(45),
	bidang_code VARCHAR(45),
	item_name VARCHAR(250),
	is_spec_validate INT,
	is_committee INT,
	pb_no VARCHAR(45),
	unit_estimate DECIMAL(20,2),
	unit_number INT,
	market_price DECIMAL(20,2),
	budget_source INT,
	project_code VARCHAR(45),
	is_purchased INT,
	reason_repurchase LVARCHAR(1024),
	is_imported INT,
	purpose LVARCHAR(1024),
	frequency_use VARCHAR(250),
	effect LVARCHAR(1024),
	is_site_visit INT,
	date_use DATE,
	is_internal_training INT,
	room_no LVARCHAR(1024),
	is_renovate INT,
	is_company_invited INT,
	other_remarks LVARCHAR(1024),
	fais_no VARCHAR(45),
	fais_amount DECIMAL(20,2),
	status INT,
	estimate_pb_date DATE,
	estimate_use VARCHAR(250),
	staff_contact LVARCHAR(1024),
	staff_responsible LVARCHAR(1024),
	is_spec_approved INT,
	sitevisit_start DATETIME YEAR to FRACTION,
	sitevisit_end DATETIME YEAR to FRACTION,
	sitevisit_location VARCHAR(250),
	created_by VARCHAR(250),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(250),
	updated_date DATETIME YEAR to FRACTION,
	entity_code INT,
	spec_master_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (item_account_need) REFERENCES item_account_need (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (budget_source) REFERENCES ref_procurement_budget_source (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (condition_type) REFERENCES ref_procurement_activiti (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (spec_master_id) REFERENCES item_specification_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (requirement_type) REFERENCES ref_procurement_purpose (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (master_id) REFERENCES pp_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (item_level4_id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pp_detail_1 ON pp_detail(item_level4_id);
CREATE INDEX idx_pp_detail_2 ON pp_detail(master_id);
CREATE INDEX idx_pp_detail_3 ON pp_detail(condition_type);
CREATE INDEX idx_pp_detail_4 ON pp_detail(budget_source);
CREATE INDEX idx_pp_detail_5 ON pp_detail(requirement_type);
CREATE INDEX idx_pp_detail_6 ON pp_detail(spec_master_id);
CREATE INDEX idx_pp_detail_7 ON pp_detail(item_account_need);
CREATE TABLE pp_detail_item_distribution
(
	id SERIAL NOT NULL,
	pp_detail INT,
	year INT,
	quantity INT,
	price DECIMAL(20,2),
	PRIMARY KEY (id),
	FOREIGN KEY (pp_detail) REFERENCES pp_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pp_detail_item_distribution_1 ON pp_detail_item_distribution(pp_detail);
CREATE TABLE pp_detail_user
(
	id SERIAL NOT NULL,
	pp_detail_id INT,
	username VARCHAR(12),
	type VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (pp_detail_id) REFERENCES pp_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (username) REFERENCES user (username) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_pp_detail_user_1 ON pp_detail_user(pp_detail_id);
CREATE INDEX idx_pp_detail_user_2 ON pp_detail_user(username);
CREATE TABLE evaluation_detail_price
(
	id SERIAL NOT NULL,
	evaluation_master_id INT,
	pelawaan_vendor_offer_id INT,
	mark INT,
	committee_detail_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (committee_detail_id) REFERENCES committee_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (evaluation_master_id) REFERENCES evaluation_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pelawaan_vendor_offer_id) REFERENCES pelawaan_vendor_offer (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_evaluation_detail_price_1 ON evaluation_detail_price(evaluation_master_id);
CREATE INDEX idx_evaluation_detail_price_2 ON evaluation_detail_price(pelawaan_vendor_offer_id);
CREATE INDEX idx_evaluation_detail_price_3 ON evaluation_detail_price(committee_detail_id);
CREATE TABLE evaluation_detail_specification
(
	id SERIAL NOT NULL,
	evaluation_master_id INT,
	pelawaan_vendor_offer_specification_id INT,
	mark INT,
	committee_detail_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (committee_detail_id) REFERENCES committee_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (evaluation_master_id) REFERENCES evaluation_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pelawaan_vendor_offer_specification_id) REFERENCES pelawaan_vendor_offer_specification (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_evaluation_detail_specification_1 ON evaluation_detail_specification(evaluation_master_id);
CREATE INDEX idx_evaluation_detail_specification_2 ON evaluation_detail_specification(pelawaan_vendor_offer_specification_id);
CREATE INDEX idx_evaluation_detail_specification_3 ON evaluation_detail_specification(committee_detail_id);
CREATE TABLE lo_master
(
	id SERIAL NOT NULL,
	ref_no INT,
	offer_master_id INT,
	lo_prepare_date DATETIME YEAR to FRACTION,
	status VARCHAR(1),
	amount DECIMAL(17,2),
	PRIMARY KEY (id),
	FOREIGN KEY (ref_no) REFERENCES ref_procurement_numbering (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (offer_master_id) REFERENCES offer_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_lo_master_1 ON lo_master(ref_no);
CREATE INDEX idx_lo_master_2 ON lo_master(offer_master_id);
CREATE TABLE offer_detail
(
	id SERIAL NOT NULL,
	offer_master_id INT,
	pelawaan_detail_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (pelawaan_detail_id) REFERENCES pelawaan_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (offer_master_id) REFERENCES offer_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_offer_detail_1 ON offer_detail(offer_master_id);
CREATE INDEX idx_offer_detail_2 ON offer_detail(pelawaan_detail_id);
CREATE TABLE delivery_notice_master
(
	id SERIAL NOT NULL,
	ref_no INT,
	lo_master_id INT,
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (ref_no) REFERENCES ref_procurement_numbering (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (lo_master_id) REFERENCES lo_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_delivery_notice_master_1 ON delivery_notice_master(ref_no);
CREATE INDEX idx_delivery_notice_master_2 ON delivery_notice_master(lo_master_id);
CREATE TABLE lo_detail
(
	id SERIAL NOT NULL,
	pp_pb_distribution_id INT,
	kod_ruang VARCHAR(100),
	quantity INT,
	notes VARCHAR(250),
	submission_date DATE,
	amount DECIMAL(17,2),
	delivery_period INT,
	lo_master_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (lo_master_id) REFERENCES lo_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (pp_pb_distribution_id) REFERENCES pp_pb_distribution (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_lo_detail_1 ON lo_detail(pp_pb_distribution_id);
CREATE INDEX idx_lo_detail_2 ON lo_detail(lo_master_id);
CREATE TABLE lo_detail_user
(
	id SERIAL NOT NULL,
	lo_detail_id INT,
	pp_pb_distribution_user_id INT,
	quantity INT,
	PRIMARY KEY (id),
	FOREIGN KEY (pp_pb_distribution_user_id) REFERENCES pp_pb_distribution_user (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (lo_detail_id) REFERENCES lo_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_lo_detail_user_1 ON lo_detail_user(lo_detail_id);
CREATE INDEX idx_lo_detail_user_2 ON lo_detail_user(pp_pb_distribution_user_id);
CREATE TABLE delivery_notice_detail
(
	id SERIAL NOT NULL,
	delivery_notice_master_id INT,
	lo_detail_id INT,
	delivery_date DATETIME YEAR to FRACTION,
	test_date DATETIME YEAR to FRACTION,
	training_date DATETIME YEAR to FRACTION,
	notes VARCHAR(250),
	quantity INT,
	PRIMARY KEY (id),
	FOREIGN KEY (delivery_notice_master_id) REFERENCES delivery_notice_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (lo_detail_id) REFERENCES lo_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_delivery_notice_detail_1 ON delivery_notice_detail(delivery_notice_master_id);
CREATE INDEX idx_delivery_notice_detail_2 ON delivery_notice_detail(lo_detail_id);
CREATE TABLE delivery_notice_distribution
(
	id SERIAL NOT NULL,
	lo_detail_id INT,
	delivery_notice_detail_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (delivery_notice_detail_id) REFERENCES delivery_notice_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (lo_detail_id) REFERENCES lo_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_delivery_notice_distribution_1 ON delivery_notice_distribution(lo_detail_id);
CREATE INDEX idx_delivery_notice_distribution_2 ON delivery_notice_distribution(delivery_notice_detail_id);
CREATE TABLE delivery_notice_distribution_attribute
(
	id SERIAL NOT NULL,
	delivery_notice_distribution_id INT,
	item_attribute_need_id INT,
	value VARCHAR(100),
	PRIMARY KEY (id),
	FOREIGN KEY (item_attribute_need_id) REFERENCES item_attribute_need (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (delivery_notice_distribution_id) REFERENCES delivery_notice_distribution (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_delivery_notice_distribution_attribute_1 ON delivery_notice_distribution_attribute(delivery_notice_distribution_id);
CREATE INDEX idx_delivery_notice_distribution_attribute_2 ON delivery_notice_distribution_attribute(item_attribute_need_id);
CREATE TABLE grn_master
(
	id SERIAL NOT NULL,
	ref_no INT,
	receiver INT,
	status VARCHAR(25),
	delivery_notice_master_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (delivery_notice_master_id) REFERENCES delivery_notice_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (ref_no) REFERENCES ref_procurement_numbering (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (receiver) REFERENCES lo_detail_user (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_grn_master_1 ON grn_master(ref_no);
CREATE INDEX idx_grn_master_2 ON grn_master(receiver);
CREATE INDEX idx_grn_master_3 ON grn_master(delivery_notice_master_id);
CREATE TABLE invoice_detail
(
	id SERIAL NOT NULL,
	invoice_master_id INT,
	grn_master_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (grn_master_id) REFERENCES grn_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (invoice_master_id) REFERENCES invoice_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_invoice_detail_1 ON invoice_detail(invoice_master_id);
CREATE INDEX idx_invoice_detail_2 ON invoice_detail(grn_master_id);
CREATE TABLE delivery_notice_confirmation
(
	id SERIAL NOT NULL,
	delivery_notice_detail_id INT,
	status VARCHAR(1),
	PRIMARY KEY (id),
	FOREIGN KEY (delivery_notice_detail_id) REFERENCES delivery_notice_detail (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_delivery_notice_confirmation_1 ON delivery_notice_confirmation(delivery_notice_detail_id);
CREATE TABLE delivery_notice_suggestion
(
	id SERIAL NOT NULL,
	delivery_notice_confirmation_id INT,
	delivery_date DATETIME YEAR to FRACTION,
	test_date DATETIME YEAR to FRACTION,
	training_date DATETIME YEAR to FRACTION,
	notes VARCHAR(250),
	PRIMARY KEY (id),
	FOREIGN KEY (delivery_notice_confirmation_id) REFERENCES delivery_notice_confirmation (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_delivery_notice_suggestion_1 ON delivery_notice_suggestion(delivery_notice_confirmation_id);
CREATE TABLE grn_detail
(
	id SERIAL NOT NULL,
	grn_master_id INT,
	delivery_notice_distribution_id INT,
	delivery_date DATETIME YEAR to FRACTION,
	test_date DATETIME YEAR to FRACTION,
	training_date DATETIME YEAR to FRACTION,
	kod_harta VARCHAR(25),
	custodian INT,
	responsible INT,
	PRIMARY KEY (id),
	FOREIGN KEY (responsible) REFERENCES pp_pb_distribution_user (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (grn_master_id) REFERENCES grn_master (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (delivery_notice_distribution_id) REFERENCES delivery_notice_distribution (id) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY (custodian) REFERENCES pp_pb_distribution_user (id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_grn_detail_1 ON grn_detail(grn_master_id);
CREATE INDEX idx_grn_detail_2 ON grn_detail(delivery_notice_distribution_id);
CREATE INDEX idx_grn_detail_3 ON grn_detail(custodian);
CREATE INDEX idx_grn_detail_4 ON grn_detail(responsible);