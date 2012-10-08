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
	PRIMARY KEY (id)
);
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
	description VARCHAR(250),
	category VARCHAR(5),
	pseudocode VARCHAR(25),
	level INT,
	PRIMARY KEY (field_code)
);
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
CREATE TABLE ref_item_category
(
	id SERIAL NOT NULL,
	label VARCHAR(100),
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
CREATE TABLE user_role
(
	id SERIAL NOT NULL,
	username VARCHAR(12) NOT NULL,
	role_name VARCHAR(32) NOT NULL,
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
CREATE TABLE vendor_bidang
(
	id SERIAL NOT NULL,
	vendor_code INT,
	seq_num INT,
	pelanggan VARCHAR(5),
	no_daftar VARCHAR(20),
	class VARCHAR(3),
	kep_bidang VARCHAR(6),
	create_code VARCHAR(8),
	create_date DATE,
	verify_flag VARCHAR(1),
	sent_invitation VARCHAR(1),
	PRIMARY KEY (id)
);
CREATE TABLE vendor_board
(
	id SERIAL NOT NULL,
	vendor_code INT,
	name VARCHAR(125),
	nationality VARCHAR(3),
	race VARCHAR(125),
	ic_no VARCHAR(14),
	title VARCHAR(50),
	birthdate DATE,
	appoint VARCHAR(125),
	other_desc VARCHAR(125),
	share_percent VARCHAR(100),
	address1 VARCHAR(125),
	address2 VARCHAR(125),
	address3 VARCHAR(125),
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (vendor_code)
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
	PRIMARY KEY (id)
);
CREATE TABLE vendor_ownership
(
	id SERIAL NOT NULL,
	vendor_code INT,
	category_code VARCHAR(5),
	name VARCHAR(125),
	nationality VARCHAR(3),
	race VARCHAR(125),
	ic_no VARCHAR(14),
	title VARCHAR(50),
	birthdate DATE,
	share_percent VARCHAR(100),
	share_amount DECIMAL(14,2),
	address1 VARCHAR(125),
	address2 VARCHAR(125),
	address3 VARCHAR(125),
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
CREATE TABLE contract_vendor
(
	id SERIAL NOT NULL,
	contract_id INT,
	vendor_id INT,
	PRIMARY KEY (id)
);
CREATE TABLE inbox
(
	id SERIAL NOT NULL,
	sender_add VARCHAR(30),
	sent_date DATE,
	title VARCHAR(100),
	user VARCHAR(12) NOT NULL,
	opened BOOLEAN,
	PRIMARY KEY (id)
);
CREATE TABLE item
(
	id SERIAL NOT NULL,
	parent_id INT,
	item_code VARCHAR(5),
	description VARCHAR(200),
	status CHAR(1),
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
	PRIMARY KEY (id)
);
CREATE TABLE item_account_need
(
	id SERIAL NOT NULL,
	item_id INT NOT NULL,
	activiti_id INT,
	purpose_id INT,
	account_code VARCHAR(5) NOT NULL,
	field_code VARCHAR(6),
	status VARCHAR(1),
	PRIMARY KEY (id)
);
CREATE TABLE item_agencies
(
	id SERIAL NOT NULL,
	item_id INT,
	agency_id INT,
	amount_control INT,
	PRIMARY KEY (id)
);
CREATE TABLE item_committee
(
	id SERIAL NOT NULL,
	item_id INT,
	committee_master_id INT,
	sequence INT,
	price_from INT,
	price_to INT,
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (item_id)
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
CREATE TABLE menu_role
(
	id SERIAL NOT NULL,
	menu_id INT NOT NULL,
	role_name VARCHAR(32) NOT NULL,
	created_by VARCHAR(11),
	created_date DATETIME YEAR to FRACTION,
	updated_by VARCHAR(11),
	updated_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (id)
);
CREATE TABLE node_access
(
	id SERIAL NOT NULL,
	access_level CHAR(1) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE node_access_state
(
	id INT NOT NULL,
	state_id CHAR(1) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE node_committee
(
	id SERIAL NOT NULL,
	node_id INT,
	committee_master_id INT,
	PRIMARY KEY (id)
);
CREATE TABLE node_contract
(
	id SERIAL NOT NULL,
	node_id INT,
	contract_id INT,
	PRIMARY KEY (id)
);
CREATE TABLE node_item
(
	id SERIAL NOT NULL,
	node_id INT,
	item_id INT,
	PRIMARY KEY (id)
);
CREATE TABLE node_user
(
	id SERIAL NOT NULL,
	node_id INT,
	username VARCHAR(12),
	defaultLocation VARCHAR(1),
	manager VARCHAR(1),
	PRIMARY KEY (id)
);
CREATE TABLE ref_campus
(
	id SERIAL NOT NULL,
	state_id CHAR(1) NOT NULL,
	label VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE ref_campus_company
(
	code VARCHAR(5) NOT NULL,
	campus_id INT,
	PRIMARY KEY (code)
);
CREATE TABLE ref_city
(
	id SERIAL NOT NULL,
	city_code CHAR(2),
	state_code CHAR(1),
	label VARCHAR(50),
	PRIMARY KEY (id)
);
CREATE TABLE ref_company
(
	id VARCHAR(8) NOT NULL,
	campus_id INT,
	finance_group_id CHAR(2),
	PRIMARY KEY (id)
);
CREATE TABLE ref_district
(
	id SERIAL NOT NULL,
	district_code CHAR(2),
	state_id CHAR(1),
	label VARCHAR(50),
	PRIMARY KEY (id)
);
CREATE TABLE ref_postcode
(
	postcode VARCHAR(5) NOT NULL,
	city_code INT,
	PRIMARY KEY (postcode)
);
CREATE TABLE ref_zone
(
	id SERIAL NOT NULL,
	company_id VARCHAR(8),
	zone_code CHAR(2),
	PRIMARY KEY (id)
);
CREATE TABLE staff
(
	id VARCHAR(12) NOT NULL,
	email VARCHAR(50),
	PRIMARY KEY (id)
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (ic_no)
);
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
	PRIMARY KEY (vendor_contact_code)
);
CREATE TABLE vendor_pegawai_tauliah
(
	id SERIAL NOT NULL,
	vendor_address_code INT,
	seq_num INT,
	name_text VARCHAR(125),
	ic_no VARCHAR(14),
	role_text VARCHAR(125),
	verify_flag VARCHAR(1),
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
CREATE TABLE committee_detail
(
	id SERIAL NOT NULL,
	committee_master_id INT,
	username VARCHAR(12),
	position_id INT,
	start_date DATE,
	end_date DATE,
	PRIMARY KEY (id)
);
CREATE TABLE contract_item
(
	id SERIAL NOT NULL,
	contract_id INT,
	item_id INT,
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
CREATE TABLE node_access_campus
(
	id INT NOT NULL,
	campus_id INT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE ref_ptj
(
	id SERIAL NOT NULL,
	zone_id INT NOT NULL,
	ptj_code VARCHAR(50) NOT NULL,
	label VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE vendor_activation_login
(
	id VARCHAR(12) NOT NULL,
	activation_code VARCHAR(200),
	activation_date DATETIME YEAR to FRACTION,
	created_by VARCHAR(25),
	created_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (id)
);
CREATE TABLE node_access_ptj
(
	id INT NOT NULL,
	ptj_id INT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE ref_department
(
	id SERIAL NOT NULL,
	ptj_id INT NOT NULL,
	dept_code CHAR(3),
	label VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE ref_procurement_numbering
(
	id SERIAL NOT NULL,
	module VARCHAR(2),
	company_code VARCHAR(8),
	ptj_code INT,
	month_year VARCHAR(6),
	numbering INT,
	PRIMARY KEY (id)
);
CREATE TABLE ref_unit
(
	id SERIAL NOT NULL,
	dept_id INT,
	unit_code CHAR(3),
	label VARCHAR(50),
	PRIMARY KEY (id)
);
CREATE TABLE node_access_department
(
	id INT NOT NULL,
	department_id INT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE node_access_unit
(
	id INT NOT NULL,
	unit_id INT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE pb_master
(
	id SERIAL NOT NULL,
	pb_year INT,
	campus_id INT,
	ptj_id INT,
	dept_id INT,
	unit_id INT,
	ref_no VARCHAR(50),
	app_no VARCHAR(50),
	app_date DATETIME YEAR to FRACTION,
	category INT,
	amount DECIMAL(20,2),
	description VARCHAR(100),
	status VARCHAR(1),
	created_by VARCHAR(45),
	created_date DATETIME YEAR to FRACTION,
	PRIMARY KEY (id)
);
CREATE TABLE pp_master
(
	id SERIAL NOT NULL,
	pp_year INT,
	pp_year_to INT,
	state_id VARCHAR(11),
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
	PRIMARY KEY (id)
);
CREATE TABLE pb_detail
(
	id SERIAL NOT NULL,
	master_id INT NOT NULL,
	item_code VARCHAR(30) NOT NULL,
	item_level4_id INT NOT NULL,
	condition_type INT,
	requirement_type INT,
	account_code VARCHAR(45),
	bidang_code VARCHAR(12),
	item_name VARCHAR(100),
	is_spec_validate INT,
	is_committee INT,
	pb_no VARCHAR(45),
	unit_estimate DECIMAL(12,2),
	unit_number INT,
	market_price DECIMAL(12,2),
	budget_source INT,
	is_purchased INT,
	reason_repurchase VARCHAR(100),
	is_imported INT,
	purpose VARCHAR(100),
	frequency_use VARCHAR(45),
	effect VARCHAR(100),
	is_site_visit INT,
	date_use DATETIME YEAR to FRACTION,
	is_internal_training INT,
	room_no VARCHAR(45),
	is_renovate INT,
	is_company_invited INT,
	other_remarks VARCHAR(100),
	fais_no VARCHAR(45),
	fais_amount DECIMAL(12,2),
	status INT,
	estimate_pb_date DATETIME YEAR to FRACTION,
	estimate_use INT,
	spec_master_id INT,
	PRIMARY KEY (id)
);
CREATE TABLE pb_detail_specification
(
	id SERIAL NOT NULL,
	parent_id INT,
	label VARCHAR(25),
	description LVARCHAR(1000),
	harga DECIMAL(14,2),
	unit INT,
	susunan INT,
	level INT,
	status VARCHAR(1),
	pb_detail_id INT,
	PRIMARY KEY (id)
);
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
	PRIMARY KEY (id)
);
CREATE TABLE pp_detail_item_distribution
(
	id SERIAL NOT NULL,
	pp_detail INT,
	year INT,
	quantity INT,
	price DECIMAL(20,2),
	PRIMARY KEY (id)
);
CREATE TABLE pp_detail_user
(
	id SERIAL NOT NULL,
	pp_detail_id INT,
	username VARCHAR(12),
	type VARCHAR(1),
	PRIMARY KEY (id)
);