-- MySQL dump 10.13  Distrib 5.5.8, for Win32 (x86)
--
-- Host: localhost    Database: eperolehan
-- ------------------------------------------------------
-- Server version	5.5.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agihan_detail`
--

DROP TABLE IF EXISTS `agihan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agihan_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agihan_master_id` int(11) DEFAULT NULL,
  `account_code` varchar(5) DEFAULT NULL,
  `request_amount` decimal(17,2) DEFAULT NULL,
  `approved_amount` decimal(17,2) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agihan_master_id` (`agihan_master_id`),
  KEY `account_code` (`account_code`),
  CONSTRAINT `agihan_detail_ibfk_1` FOREIGN KEY (`agihan_master_id`) REFERENCES `agihan_master` (`id`),
  CONSTRAINT `agihan_detail_ibfk_2` FOREIGN KEY (`account_code`) REFERENCES `fais_account_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agihan_detail_distribution`
--

DROP TABLE IF EXISTS `agihan_detail_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agihan_detail_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agihan_detail_id` int(11) DEFAULT NULL,
  `pp_pb_distribution_id` int(11) DEFAULT NULL,
  `request_amount` decimal(17,2) DEFAULT NULL,
  `approved_amount` decimal(17,2) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agihan_detail_id` (`agihan_detail_id`),
  KEY `pp_pb_distribution_id` (`pp_pb_distribution_id`),
  CONSTRAINT `agihan_detail_distribution_ibfk_1` FOREIGN KEY (`agihan_detail_id`) REFERENCES `agihan_detail` (`id`),
  CONSTRAINT `agihan_detail_distribution_ibfk_4` FOREIGN KEY (`pp_pb_distribution_id`) REFERENCES `pp_pb_distribution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `agihan_master`
--

DROP TABLE IF EXISTS `agihan_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agihan_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ptj_id` int(11) DEFAULT NULL,
  `request_amount` decimal(17,2) DEFAULT NULL,
  `received_amount` decimal(17,2) DEFAULT NULL,
  `balance` decimal(17,2) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `dasar` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ptj_id` (`ptj_id`),
  CONSTRAINT `agihan_master_ibfk_2` FOREIGN KEY (`ptj_id`) REFERENCES `ref_ptj` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar_event`
--

DROP TABLE IF EXISTS `calendar_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `jenis` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `committee_detail`
--

DROP TABLE IF EXISTS `committee_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `committee_master_id` int(11) DEFAULT NULL,
  `username` varchar(12) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_committe_detail_user` (`username`),
  KEY `FK_committee_detail_ref_position` (`position_id`),
  KEY `FK_committee_detail_committee_master` (`committee_master_id`),
  CONSTRAINT `FK_committee_detail_committee_master` FOREIGN KEY (`committee_master_id`) REFERENCES `committee_master` (`id`),
  CONSTRAINT `FK_committee_detail_ref_position` FOREIGN KEY (`position_id`) REFERENCES `ref_position` (`id`),
  CONSTRAINT `FK_committee_detail_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `committee_master`
--

DROP TABLE IF EXISTS `committee_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `committee_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `committee_type_id` int(11) DEFAULT NULL,
  `access_level_id` char(1) DEFAULT NULL,
  `start_price` int(11) DEFAULT NULL,
  `end_price` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `purpose` varchar(100) DEFAULT NULL,
  `establishment_date` date DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `start_price` (`start_price`),
  KEY `end_price` (`end_price`),
  KEY `access_level_id` (`access_level_id`),
  KEY `FK_committee_master_ref_committee_type` (`committee_type_id`),
  CONSTRAINT `committee_master_ibfk_1` FOREIGN KEY (`start_price`) REFERENCES `ref_price` (`id`),
  CONSTRAINT `committee_master_ibfk_2` FOREIGN KEY (`end_price`) REFERENCES `ref_price` (`id`),
  CONSTRAINT `committee_master_ibfk_3` FOREIGN KEY (`access_level_id`) REFERENCES `ref_access_level` (`id`),
  CONSTRAINT `FK_committee_master_ref_committee_type` FOREIGN KEY (`committee_type_id`) REFERENCES `ref_committee_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_number` varchar(100) DEFAULT NULL,
  `contract_type` int(11) DEFAULT NULL,
  `contract_amount` decimal(14,2) DEFAULT NULL,
  `bon_type` int(11) DEFAULT NULL,
  `bon_amount` decimal(14,2) DEFAULT NULL,
  `bank` varchar(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `contract_date` date DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `termination_reason` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bank` (`bank`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`bank`) REFERENCES `ref_bank` (`swift_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_item`
--

DROP TABLE IF EXISTS `contract_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_id` (`contract_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `FK_contract_item_contract` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`),
  CONSTRAINT `FK_contract_item_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_vendor`
--

DROP TABLE IF EXISTS `contract_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contract_id` (`contract_id`,`vendor_id`),
  KEY `FK_contract_vendor_vendor` (`vendor_id`),
  CONSTRAINT `FK_contract_vendor_contract` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`),
  CONSTRAINT `FK_contract_vendor_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `debit_credit_note`
--

DROP TABLE IF EXISTS `debit_credit_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debit_credit_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_master_id` int(11) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL,
  `prepared_by` varchar(12) DEFAULT NULL,
  `prepared_date` datetime DEFAULT NULL,
  `review_by` varchar(12) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_master_id` (`invoice_master_id`),
  CONSTRAINT `debit_credit_note_ibfk_1` FOREIGN KEY (`invoice_master_id`) REFERENCES `invoice_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_notice_confirmation`
--

DROP TABLE IF EXISTS `delivery_notice_confirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_notice_confirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_notice_detail_id` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_notice_detail_id` (`delivery_notice_detail_id`),
  CONSTRAINT `delivery_notice_confirmation_ibfk_1` FOREIGN KEY (`delivery_notice_detail_id`) REFERENCES `delivery_notice_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_notice_detail`
--

DROP TABLE IF EXISTS `delivery_notice_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_notice_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_notice_master_id` int(11) DEFAULT NULL,
  `lo_detail_id` int(11) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  `training_date` datetime DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_notice_master_id` (`delivery_notice_master_id`),
  KEY `lo_detail_id` (`lo_detail_id`),
  CONSTRAINT `delivery_notice_detail_ibfk_1` FOREIGN KEY (`delivery_notice_master_id`) REFERENCES `delivery_notice_master` (`id`),
  CONSTRAINT `delivery_notice_detail_ibfk_2` FOREIGN KEY (`lo_detail_id`) REFERENCES `lo_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_notice_distribution`
--

DROP TABLE IF EXISTS `delivery_notice_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_notice_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lo_detail_id` int(11) DEFAULT NULL,
  `delivery_notice_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lo_detail_id` (`lo_detail_id`),
  KEY `delivery_notice_detail_id` (`delivery_notice_detail_id`),
  CONSTRAINT `delivery_notice_distribution_ibfk_2` FOREIGN KEY (`delivery_notice_detail_id`) REFERENCES `delivery_notice_detail` (`id`),
  CONSTRAINT `delivery_notice_distribution_ibfk_1` FOREIGN KEY (`lo_detail_id`) REFERENCES `lo_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_notice_distribution_attribute`
--

DROP TABLE IF EXISTS `delivery_notice_distribution_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_notice_distribution_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_notice_distribution_id` int(11) DEFAULT NULL,
  `item_attribute_need_id` int(11) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_notice_distribution_id` (`delivery_notice_distribution_id`),
  KEY `item_attribute_need_id` (`item_attribute_need_id`),
  CONSTRAINT `delivery_notice_distribution_attribute_ibfk_2` FOREIGN KEY (`item_attribute_need_id`) REFERENCES `item_attribute_need` (`id`),
  CONSTRAINT `delivery_notice_distribution_attribute_ibfk_1` FOREIGN KEY (`delivery_notice_distribution_id`) REFERENCES `delivery_notice_distribution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_notice_master`
--

DROP TABLE IF EXISTS `delivery_notice_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_notice_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` int(11) DEFAULT NULL,
  `lo_master_id` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_no` (`ref_no`),
  KEY `lo_master_id` (`lo_master_id`),
  CONSTRAINT `delivery_notice_master_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `ref_procurement_numbering` (`id`),
  CONSTRAINT `delivery_notice_master_ibfk_2` FOREIGN KEY (`lo_master_id`) REFERENCES `lo_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery_notice_suggestion`
--

DROP TABLE IF EXISTS `delivery_notice_suggestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_notice_suggestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_notice_confirmation_id` int(11) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  `training_date` datetime DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_notice_confirmation_id` (`delivery_notice_confirmation_id`),
  CONSTRAINT `delivery_notice_suggestion_ibfk_1` FOREIGN KEY (`delivery_notice_confirmation_id`) REFERENCES `delivery_notice_confirmation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dummy`
--

DROP TABLE IF EXISTS `dummy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dummy` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ep_user`
--

DROP TABLE IF EXISTS `ep_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ep_user` (
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluation_detail_price`
--

DROP TABLE IF EXISTS `evaluation_detail_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluation_detail_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_master_id` int(11) DEFAULT NULL,
  `pelawaan_vendor_offer_id` int(11) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `committee_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluation_master_id` (`evaluation_master_id`),
  KEY `pelawaan_vendor_offer_id` (`pelawaan_vendor_offer_id`),
  KEY `committee_detail_id` (`committee_detail_id`),
  CONSTRAINT `evaluation_detail_price_ibfk_3` FOREIGN KEY (`committee_detail_id`) REFERENCES `committee_detail` (`id`),
  CONSTRAINT `evaluation_detail_price_ibfk_1` FOREIGN KEY (`evaluation_master_id`) REFERENCES `evaluation_master` (`id`),
  CONSTRAINT `evaluation_detail_price_ibfk_2` FOREIGN KEY (`pelawaan_vendor_offer_id`) REFERENCES `pelawaan_vendor_offer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluation_detail_specification`
--

DROP TABLE IF EXISTS `evaluation_detail_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluation_detail_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_master_id` int(11) DEFAULT NULL,
  `pelawaan_vendor_offer_specification_id` int(11) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `committee_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `evaluation_master_id` (`evaluation_master_id`),
  KEY `pelawaan_vendor_offer_specification_id` (`pelawaan_vendor_offer_specification_id`),
  KEY `committee_detail_id` (`committee_detail_id`),
  CONSTRAINT `evaluation_detail_specification_ibfk_3` FOREIGN KEY (`committee_detail_id`) REFERENCES `committee_detail` (`id`),
  CONSTRAINT `evaluation_detail_specification_ibfk_1` FOREIGN KEY (`evaluation_master_id`) REFERENCES `evaluation_master` (`id`),
  CONSTRAINT `evaluation_detail_specification_ibfk_2` FOREIGN KEY (`pelawaan_vendor_offer_specification_id`) REFERENCES `pelawaan_vendor_offer_specification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `evaluation_master`
--

DROP TABLE IF EXISTS `evaluation_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluation_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelawaan_master_id` int(11) DEFAULT NULL,
  `committee_master_id` int(11) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pelawaan_master_id` (`pelawaan_master_id`),
  KEY `committee_master_id` (`committee_master_id`),
  CONSTRAINT `evaluation_master_ibfk_2` FOREIGN KEY (`committee_master_id`) REFERENCES `committee_master` (`id`),
  CONSTRAINT `evaluation_master_ibfk_1` FOREIGN KEY (`pelawaan_master_id`) REFERENCES `pelawaan_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fais_account_code`
--

DROP TABLE IF EXISTS `fais_account_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fais_account_code` (
  `code` varchar(5) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grn_detail`
--

DROP TABLE IF EXISTS `grn_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grn_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grn_master_id` int(11) DEFAULT NULL,
  `delivery_notice_distribution_id` int(11) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `test_date` datetime DEFAULT NULL,
  `training_date` datetime DEFAULT NULL,
  `kod_harta` varchar(25) DEFAULT NULL,
  `custodian` int(11) DEFAULT NULL,
  `responsible` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grn_master_id` (`grn_master_id`),
  KEY `delivery_notice_distribution_id` (`delivery_notice_distribution_id`),
  KEY `custodian` (`custodian`),
  KEY `responsible` (`responsible`),
  CONSTRAINT `grn_detail_ibfk_4` FOREIGN KEY (`responsible`) REFERENCES `pp_pb_distribution_user` (`id`),
  CONSTRAINT `grn_detail_ibfk_1` FOREIGN KEY (`grn_master_id`) REFERENCES `grn_master` (`id`),
  CONSTRAINT `grn_detail_ibfk_2` FOREIGN KEY (`delivery_notice_distribution_id`) REFERENCES `delivery_notice_distribution` (`id`),
  CONSTRAINT `grn_detail_ibfk_3` FOREIGN KEY (`custodian`) REFERENCES `pp_pb_distribution_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grn_master`
--

DROP TABLE IF EXISTS `grn_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grn_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` int(11) DEFAULT NULL,
  `receiver` int(11) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `delivery_notice_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_no` (`ref_no`),
  KEY `receiver` (`receiver`),
  KEY `delivery_notice_master_id` (`delivery_notice_master_id`),
  CONSTRAINT `grn_master_ibfk_3` FOREIGN KEY (`delivery_notice_master_id`) REFERENCES `delivery_notice_master` (`id`),
  CONSTRAINT `grn_master_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `ref_procurement_numbering` (`id`),
  CONSTRAINT `grn_master_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `lo_detail_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inbox`
--

DROP TABLE IF EXISTS `inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sender_add` varchar(30) DEFAULT NULL,
  `sent_date` date DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `user` varchar(12) NOT NULL DEFAULT '',
  `opened` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  CONSTRAINT `inbox_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_detail`
--

DROP TABLE IF EXISTS `invoice_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_master_id` int(11) DEFAULT NULL,
  `grn_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_master_id` (`invoice_master_id`),
  KEY `grn_master_id` (`grn_master_id`),
  CONSTRAINT `invoice_detail_ibfk_2` FOREIGN KEY (`grn_master_id`) REFERENCES `grn_master` (`id`),
  CONSTRAINT `invoice_detail_ibfk_1` FOREIGN KEY (`invoice_master_id`) REFERENCES `invoice_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `invoice_master`
--

DROP TABLE IF EXISTS `invoice_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` int(11) DEFAULT NULL,
  `vendor_ref_no` varchar(50) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL,
  `vendor_bank_id` int(11) DEFAULT NULL,
  `review_by` varchar(12) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  `payment_type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_no` (`ref_no`),
  KEY `vendor_bank_id` (`vendor_bank_id`),
  CONSTRAINT `invoice_master_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `ref_procurement_numbering` (`id`),
  CONSTRAINT `invoice_master_ibfk_2` FOREIGN KEY (`vendor_bank_id`) REFERENCES `vendor_bank` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `item_code` varchar(5) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `control_amount_direct_purchase` decimal(14,2) DEFAULT NULL,
  `control_amount_property` decimal(14,2) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `combine_code` varchar(25) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created_by` varchar(12) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(12) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `uom` int(11) DEFAULT NULL,
  `estimate_price` decimal(14,2) DEFAULT NULL,
  `procurement_category_id` int(11) DEFAULT NULL,
  `item_category_id` int(11) DEFAULT NULL,
  `direct_nego_price_id` int(11) DEFAULT NULL,
  `direct_purchase_price_id` int(11) DEFAULT NULL,
  `tender_price_id` int(11) DEFAULT NULL,
  `direct_nego_value_type` varchar(1) DEFAULT NULL,
  `direct_purchase_value_type` varchar(1) DEFAULT NULL,
  `tender_value_type` varchar(1) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  `gst` decimal(14,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_id` (`parent_id`,`item_code`),
  KEY `FK_item_ref_unit_of_measurement` (`uom`),
  KEY `FK_item_ref_procurement_category` (`procurement_category_id`),
  KEY `FK_item_ref_category` (`item_category_id`),
  KEY `FK_item_direct_nego_ref_price` (`direct_nego_price_id`),
  KEY `FK_item_direct_purchase_ref_price` (`direct_purchase_price_id`),
  KEY `FK_item_tender_price_ref_price` (`tender_price_id`),
  KEY `FK_item_contract` (`contract_id`),
  CONSTRAINT `FK_item_direct_nego_ref_price` FOREIGN KEY (`direct_nego_price_id`) REFERENCES `ref_price` (`id`),
  CONSTRAINT `FK_item_direct_purchase_ref_price` FOREIGN KEY (`direct_purchase_price_id`) REFERENCES `ref_price` (`id`),
  CONSTRAINT `FK_item_item` FOREIGN KEY (`parent_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_item_ref_category` FOREIGN KEY (`item_category_id`) REFERENCES `ref_item_category` (`id`),
  CONSTRAINT `FK_item_ref_procurement_category` FOREIGN KEY (`procurement_category_id`) REFERENCES `ref_procurement_category` (`id`),
  CONSTRAINT `FK_item_ref_unit_of_measurement` FOREIGN KEY (`uom`) REFERENCES `ref_unit_of_measurement` (`id`),
  CONSTRAINT `FK_item_tender_price_ref_price` FOREIGN KEY (`tender_price_id`) REFERENCES `ref_price` (`id`),
  CONSTRAINT `FK_item_contract` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1166 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_account_need`
--

DROP TABLE IF EXISTS `item_account_need`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_account_need` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `activiti_id` int(11) DEFAULT NULL,
  `purpose_id` int(11) DEFAULT NULL,
  `account_code` varchar(5) NOT NULL,
  `field_code` varchar(6) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`,`activiti_id`,`purpose_id`,`account_code`,`field_code`),
  KEY `FK_item_account_need_ref_procurement_activiti` (`activiti_id`),
  KEY `FK_item_account_need_ref_procurement_purpose` (`purpose_id`),
  KEY `FK_item_account_need_fais_account_code` (`account_code`),
  KEY `FK_item_account_need_ref_field` (`field_code`),
  CONSTRAINT `FK_item_account_need_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_item_account_need_ref_field` FOREIGN KEY (`field_code`) REFERENCES `ref_field` (`field_code`),
  CONSTRAINT `FK_item_account_need_ref_procurement_activiti` FOREIGN KEY (`activiti_id`) REFERENCES `ref_procurement_activiti` (`id`),
  CONSTRAINT `FK_item_account_need_ref_procurement_purpose` FOREIGN KEY (`purpose_id`) REFERENCES `ref_procurement_purpose` (`id`),
  CONSTRAINT `FK_item_account_need_fais_account_code` FOREIGN KEY (`account_code`) REFERENCES `fais_account_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_agencies`
--

DROP TABLE IF EXISTS `item_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_agencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `amount_control` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`,`agency_id`),
  KEY `agency_id` (`agency_id`),
  KEY `amount_control` (`amount_control`),
  CONSTRAINT `FK_item_agencies_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_item_agencies_ref_agency` FOREIGN KEY (`agency_id`) REFERENCES `ref_agency` (`id`),
  CONSTRAINT `FK_item_agencies_ref_price` FOREIGN KEY (`amount_control`) REFERENCES `ref_price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_attribute_need`
--

DROP TABLE IF EXISTS `item_attribute_need`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_attribute_need` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `item_attribute_id` int(11) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_id` (`item_id`,`item_attribute_id`),
  KEY `item_attribute_id` (`item_attribute_id`),
  CONSTRAINT `item_attribute_need_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `item_attribute_need_ibfk_2` FOREIGN KEY (`item_attribute_id`) REFERENCES `ref_item_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_committee`
--

DROP TABLE IF EXISTS `item_committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `committee_master_id` int(11) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `price_from` int(11) DEFAULT NULL,
  `price_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `committee_master_id` (`committee_master_id`),
  KEY `price_from` (`price_from`),
  KEY `price_to` (`price_to`),
  CONSTRAINT `FK_item_committee_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_item_committee_committee_master` FOREIGN KEY (`committee_master_id`) REFERENCES `committee_master` (`id`),
  CONSTRAINT `FK_item_committee_ref_price_1` FOREIGN KEY (`price_from`) REFERENCES `ref_price` (`id`),
  CONSTRAINT `FK_item_committee_ref_price_2` FOREIGN KEY (`price_to`) REFERENCES `ref_price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_parameter`
--

DROP TABLE IF EXISTS `item_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_parameter` (
  `item_id` int(11) NOT NULL,
  `enable_access_control` varchar(1) DEFAULT NULL,
  `enable_direct_purchase` varchar(1) DEFAULT NULL,
  `enable_quotation` varchar(1) DEFAULT NULL,
  `enable_tender` varchar(1) DEFAULT NULL,
  `enable_unit` varchar(1) DEFAULT NULL,
  `enable_committee` varchar(1) DEFAULT NULL,
  `enable_agency` varchar(1) DEFAULT NULL,
  `enable_gst` varchar(1) DEFAULT NULL,
  `enable_direct_quotation` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `item_parameter_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_requisition`
--

DROP TABLE IF EXISTS `item_requisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_requisition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `description` varchar(25) DEFAULT NULL,
  `request_by` varchar(25) DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `review_by` varchar(25) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  `approve_by` varchar(25) DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `reason` varchar(250) DEFAULT NULL,
  `review_comment` varchar(250) DEFAULT NULL,
  `approve_comment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `item_requisition_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_specification_detail`
--

DROP TABLE IF EXISTS `item_specification_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_specification_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_specification_master_id` int(11) DEFAULT NULL,
  `label` varchar(25) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `susunan` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `vendor_feedback` varchar(1) DEFAULT NULL,
  `mandatory` varchar(1) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `weightage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_specification_master_id` (`item_specification_master_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `item_specification_detail_ibfk_1` FOREIGN KEY (`item_specification_master_id`) REFERENCES `item_specification_master` (`id`),
  CONSTRAINT `item_specification_detail_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `item_specification_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_specification_master`
--

DROP TABLE IF EXISTS `item_specification_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_specification_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_by` varchar(25) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `procurement_category_id` int(11) DEFAULT NULL,
  `is_approved` int(1) DEFAULT '0',
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `history_spec` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `procurement_category_id` (`procurement_category_id`),
  KEY `history_spec` (`history_spec`),
  CONSTRAINT `FK_item_specification_master_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_item_specification_master_ref_procurement_category` FOREIGN KEY (`procurement_category_id`) REFERENCES `ref_procurement_category` (`id`),
  CONSTRAINT `FK_item_specification_master_item_specification_master` FOREIGN KEY (`history_spec`) REFERENCES `item_specification_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_userrole`
--

DROP TABLE IF EXISTS `job_userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_userrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) DEFAULT NULL,
  `role_name` varchar(32) DEFAULT NULL,
  `operation_type` varchar(3) DEFAULT NULL,
  `operation_date` date DEFAULT NULL,
  `created_by` varchar(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(11) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `role_id` (`role_name`),
  CONSTRAINT `FK_job_userrole_role` FOREIGN KEY (`role_name`) REFERENCES `role` (`role_name`),
  CONSTRAINT `job_userrole_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lo_detail`
--

DROP TABLE IF EXISTS `lo_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lo_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_pb_distribution_id` int(11) DEFAULT NULL,
  `kod_ruang` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `notes` varchar(250) DEFAULT NULL,
  `submission_date` date DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL,
  `delivery_period` int(11) DEFAULT NULL,
  `lo_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pp_pb_distribution_id` (`pp_pb_distribution_id`),
  KEY `lo_master_id` (`lo_master_id`),
  CONSTRAINT `lo_detail_ibfk_2` FOREIGN KEY (`lo_master_id`) REFERENCES `lo_master` (`id`),
  CONSTRAINT `lo_detail_ibfk_1` FOREIGN KEY (`pp_pb_distribution_id`) REFERENCES `pp_pb_distribution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lo_detail_user`
--

DROP TABLE IF EXISTS `lo_detail_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lo_detail_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lo_detail_id` int(11) DEFAULT NULL,
  `pp_pb_distribution_user_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lo_detail_id` (`lo_detail_id`),
  KEY `pp_pb_distribution_user_id` (`pp_pb_distribution_user_id`),
  CONSTRAINT `lo_detail_user_ibfk_2` FOREIGN KEY (`pp_pb_distribution_user_id`) REFERENCES `pp_pb_distribution_user` (`id`),
  CONSTRAINT `lo_detail_user_ibfk_1` FOREIGN KEY (`lo_detail_id`) REFERENCES `lo_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lo_master`
--

DROP TABLE IF EXISTS `lo_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lo_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` int(11) DEFAULT NULL,
  `offer_master_id` int(11) DEFAULT NULL,
  `lo_prepare_date` timestamp NULL DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_no` (`ref_no`),
  KEY `offer_master_id` (`offer_master_id`),
  CONSTRAINT `lo_master_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `ref_procurement_numbering` (`id`),
  CONSTRAINT `lo_master_ibfk_2` FOREIGN KEY (`offer_master_id`) REFERENCES `offer_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_role`
--

DROP TABLE IF EXISTS `menu_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `role_name` varchar(32) NOT NULL,
  `created_by` varchar(11) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(11) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id_role_id` (`menu_id`,`role_name`),
  KEY `mr_menu_fk` (`menu_id`),
  KEY `mr_role_fk` (`role_name`),
  CONSTRAINT `FK_menu_role_role` FOREIGN KEY (`role_name`) REFERENCES `role` (`role_name`),
  CONSTRAINT `mr_menu_fk` FOREIGN KEY (`menu_id`) REFERENCES `ut_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=764 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miti_approval`
--

DROP TABLE IF EXISTS `miti_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miti_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` int(11) DEFAULT NULL,
  `miti_ack_date` date DEFAULT NULL,
  `miti_ref_no` varchar(100) DEFAULT NULL,
  `meeting_date` date DEFAULT NULL,
  `meeting_ref_no` varchar(25) DEFAULT NULL,
  `status_date` date DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `created_by` varchar(12) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(12) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_no` (`ref_no`),
  CONSTRAINT `miti_approval_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `ref_procurement_numbering` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `miti_approval_vendor`
--

DROP TABLE IF EXISTS `miti_approval_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miti_approval_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `miti_approval_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `created_by` varchar(12) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(12) DEFAULT NULL,
  `updated_date` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `miti_approval_id` (`miti_approval_id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `miti_approval_vendor_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`),
  CONSTRAINT `miti_approval_vendor_ibfk_1` FOREIGN KEY (`miti_approval_id`) REFERENCES `miti_approval` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_access`
--

DROP TABLE IF EXISTS `node_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_level` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_node_access_ref_access_level` (`access_level`),
  CONSTRAINT `FK_node_access_ref_access_level` FOREIGN KEY (`access_level`) REFERENCES `ref_access_level` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_access_campus`
--

DROP TABLE IF EXISTS `node_access_campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access_campus` (
  `id` int(11) NOT NULL,
  `campus_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_access_campus_id` (`campus_id`),
  KEY `FK_node_access_campus_ref_campus` (`campus_id`),
  CONSTRAINT `FK_node_access_campus_node_access` FOREIGN KEY (`id`) REFERENCES `node_access` (`id`),
  CONSTRAINT `FK_node_access_campus_ref_campus` FOREIGN KEY (`campus_id`) REFERENCES `ref_campus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_access_department`
--

DROP TABLE IF EXISTS `node_access_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access_department` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_access_department_id` (`department_id`),
  KEY `FK_node_access_department_ref_department` (`department_id`),
  CONSTRAINT `FK_node_access_department_node_access` FOREIGN KEY (`id`) REFERENCES `node_access` (`id`),
  CONSTRAINT `FK_node_access_department_ref_department` FOREIGN KEY (`department_id`) REFERENCES `ref_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_access_ptj`
--

DROP TABLE IF EXISTS `node_access_ptj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access_ptj` (
  `id` int(11) NOT NULL,
  `ptj_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_access_ptj_id` (`ptj_id`),
  KEY `FK_node_access_ptj_ref_ptj` (`ptj_id`),
  CONSTRAINT `FK_node_access_ptj_node_access` FOREIGN KEY (`id`) REFERENCES `node_access` (`id`),
  CONSTRAINT `FK_node_access_ptj_ref_ptj` FOREIGN KEY (`ptj_id`) REFERENCES `ref_ptj` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_access_state`
--

DROP TABLE IF EXISTS `node_access_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access_state` (
  `id` int(11) NOT NULL,
  `state_id` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_access_state_id` (`state_id`),
  KEY `FK_node_access_state_ref_state` (`state_id`),
  CONSTRAINT `FK_node_access_state_node_access` FOREIGN KEY (`id`) REFERENCES `node_access` (`id`),
  CONSTRAINT `FK_node_access_state_ref_state` FOREIGN KEY (`state_id`) REFERENCES `ref_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_access_unit`
--

DROP TABLE IF EXISTS `node_access_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access_unit` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `node_access_unit_id` (`unit_id`),
  KEY `FK_node_access_unit_ref_unit` (`unit_id`),
  CONSTRAINT `FK_node_access_unit_node_access` FOREIGN KEY (`id`) REFERENCES `node_access` (`id`),
  CONSTRAINT `FK_node_access_unit_ref_unit` FOREIGN KEY (`unit_id`) REFERENCES `ref_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_committee`
--

DROP TABLE IF EXISTS `node_committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_committee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `committee_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_node_committee_node_access` (`node_id`),
  KEY `FK_node_committee_committee_master` (`committee_master_id`),
  CONSTRAINT `FK_node_committee_committee_master` FOREIGN KEY (`committee_master_id`) REFERENCES `committee_master` (`id`),
  CONSTRAINT `FK_node_committee_node_access` FOREIGN KEY (`node_id`) REFERENCES `node_access` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_contract`
--

DROP TABLE IF EXISTS `node_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `contract_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `node_id` (`node_id`),
  KEY `contract_id` (`contract_id`),
  CONSTRAINT `FK_node_contract_node_access` FOREIGN KEY (`node_id`) REFERENCES `node_access` (`id`),
  CONSTRAINT `FK_node_contract_contract` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_item`
--

DROP TABLE IF EXISTS `node_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_node_item_node_access` (`node_id`),
  KEY `FK_node_item_item` (`item_id`),
  CONSTRAINT `FK_node_item_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_node_item_node_access` FOREIGN KEY (`node_id`) REFERENCES `node_access` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_user`
--

DROP TABLE IF EXISTS `node_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `username` varchar(12) DEFAULT NULL,
  `defaultLocation` varchar(1) DEFAULT NULL,
  `manager` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_node_user_node_access` (`node_id`),
  KEY `FK_node_user_user` (`username`),
  CONSTRAINT `FK_node_user_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FK_node_user_node_access` FOREIGN KEY (`node_id`) REFERENCES `node_access` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offer_detail`
--

DROP TABLE IF EXISTS `offer_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_master_id` int(11) DEFAULT NULL,
  `pelawaan_detail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `offer_master_id` (`offer_master_id`),
  KEY `pelawaan_detail_id` (`pelawaan_detail_id`),
  CONSTRAINT `offer_detail_ibfk_2` FOREIGN KEY (`pelawaan_detail_id`) REFERENCES `pelawaan_detail` (`id`),
  CONSTRAINT `offer_detail_ibfk_1` FOREIGN KEY (`offer_master_id`) REFERENCES `offer_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offer_master`
--

DROP TABLE IF EXISTS `offer_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` int(11) DEFAULT NULL,
  `pelawaan_master_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_no` (`ref_no`),
  KEY `pelawaan_master_id` (`pelawaan_master_id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `offer_master_ibfk_3` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`),
  CONSTRAINT `offer_master_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `ref_procurement_numbering` (`id`),
  CONSTRAINT `offer_master_ibfk_2` FOREIGN KEY (`pelawaan_master_id`) REFERENCES `pelawaan_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pb_head`
--

DROP TABLE IF EXISTS `pb_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_no` (`ref_no`),
  KEY `node_id` (`node_id`),
  CONSTRAINT `pb_head_ibfk_2` FOREIGN KEY (`node_id`) REFERENCES `node_access` (`id`),
  CONSTRAINT `pb_head_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `ref_procurement_numbering` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pbm`
--

DROP TABLE IF EXISTS `pbm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_level_id` char(1) DEFAULT NULL,
  `start_price` int(11) DEFAULT NULL,
  `end_price` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `purpose` varchar(100) DEFAULT NULL,
  `establishment_date` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `access_level_id` (`access_level_id`),
  KEY `price` (`price`),
  KEY `start_price` (`start_price`),
  KEY `end_price` (`end_price`),
  CONSTRAINT `FK_pbm_1` FOREIGN KEY (`start_price`) REFERENCES `ref_price` (`id`),
  CONSTRAINT `FK_pbm_2` FOREIGN KEY (`end_price`) REFERENCES `ref_price` (`id`),
  CONSTRAINT `FK_pbm_3` FOREIGN KEY (`access_level_id`) REFERENCES `ref_access_level` (`id`),
  CONSTRAINT `FK_pbm_4` FOREIGN KEY (`price`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelawaan_detail`
--

DROP TABLE IF EXISTS `pelawaan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelawaan_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelawaan_master_id` int(11) DEFAULT NULL,
  `pp_pb_distribution_id` int(11) DEFAULT NULL,
  `jenis_pesanan` varchar(1) DEFAULT NULL,
  `jenis_penghantaran` varchar(1) DEFAULT NULL,
  `jenis_terimaan` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pelawaan_master_id` (`pelawaan_master_id`),
  KEY `pp_pb_distribution_id` (`pp_pb_distribution_id`),
  CONSTRAINT `pelawaan_detail_ibfk_2` FOREIGN KEY (`pp_pb_distribution_id`) REFERENCES `pp_pb_distribution` (`id`),
  CONSTRAINT `pelawaan_detail_ibfk_1` FOREIGN KEY (`pelawaan_master_id`) REFERENCES `pelawaan_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelawaan_kod_bidang`
--

DROP TABLE IF EXISTS `pelawaan_kod_bidang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelawaan_kod_bidang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelawaan_master_id` int(11) DEFAULT NULL,
  `field_code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pelawaan_master_id` (`pelawaan_master_id`),
  KEY `field_code` (`field_code`),
  CONSTRAINT `pelawaan_kod_bidang_ibfk_2` FOREIGN KEY (`field_code`) REFERENCES `ref_field` (`field_code`),
  CONSTRAINT `pelawaan_kod_bidang_ibfk_1` FOREIGN KEY (`pelawaan_master_id`) REFERENCES `pelawaan_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelawaan_master`
--

DROP TABLE IF EXISTS `pelawaan_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelawaan_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` int(11) DEFAULT NULL,
  `dominan_field_code` varchar(6) DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_no` (`ref_no`),
  KEY `dominan_field_code` (`dominan_field_code`),
  CONSTRAINT `pelawaan_master_ibfk_2` FOREIGN KEY (`dominan_field_code`) REFERENCES `ref_field` (`field_code`),
  CONSTRAINT `pelawaan_master_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `ref_procurement_numbering` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelawaan_vendor`
--

DROP TABLE IF EXISTS `pelawaan_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelawaan_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelawaan_master_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pelawaan_master_id` (`pelawaan_master_id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `pelawaan_vendor_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`),
  CONSTRAINT `pelawaan_vendor_ibfk_1` FOREIGN KEY (`pelawaan_master_id`) REFERENCES `pelawaan_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelawaan_vendor_offer`
--

DROP TABLE IF EXISTS `pelawaan_vendor_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelawaan_vendor_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelawaan_vendor_id` int(11) DEFAULT NULL,
  `pelawaan_detail_id` int(11) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `model` varchar(250) DEFAULT NULL,
  `made_in` varchar(3) DEFAULT NULL,
  `warranty_period` int(11) DEFAULT NULL,
  `delivery_period` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `offer_price` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pelawaan_vendor_id` (`pelawaan_vendor_id`),
  KEY `pelawaan_detail_id` (`pelawaan_detail_id`),
  KEY `made_in` (`made_in`),
  CONSTRAINT `pelawaan_vendor_offer_ibfk_3` FOREIGN KEY (`made_in`) REFERENCES `ref_country` (`id`),
  CONSTRAINT `pelawaan_vendor_offer_ibfk_1` FOREIGN KEY (`pelawaan_vendor_id`) REFERENCES `pelawaan_vendor` (`id`),
  CONSTRAINT `pelawaan_vendor_offer_ibfk_2` FOREIGN KEY (`pelawaan_detail_id`) REFERENCES `pelawaan_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pelawaan_vendor_offer_specification`
--

DROP TABLE IF EXISTS `pelawaan_vendor_offer_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelawaan_vendor_offer_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pelawaan_vendor_offer_id` int(11) DEFAULT NULL,
  `item_specification_detail_id` int(11) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pelawaan_vendor_offer_id` (`pelawaan_vendor_offer_id`),
  KEY `item_specification_detail_id` (`item_specification_detail_id`),
  CONSTRAINT `pelawaan_vendor_offer_specification_ibfk_2` FOREIGN KEY (`item_specification_detail_id`) REFERENCES `item_specification_detail` (`id`),
  CONSTRAINT `pelawaan_vendor_offer_specification_ibfk_1` FOREIGN KEY (`pelawaan_vendor_offer_id`) REFERENCES `pelawaan_vendor_offer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pkk`
--

DROP TABLE IF EXISTS `pkk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pkk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `label` varchar(10) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_self` (`parent_id`),
  CONSTRAINT `fk_self` FOREIGN KEY (`parent_id`) REFERENCES `pkk` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_user`
--

DROP TABLE IF EXISTS `portal_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_user` (
  `staff_id` int(10) NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL DEFAULT '0',
  `company_code` varchar(10) NOT NULL DEFAULT '0',
  `zone` varchar(5) DEFAULT '0',
  `ptj` varchar(10) DEFAULT '0',
  `division` varchar(10) DEFAULT '0',
  `unit` varchar(10) DEFAULT '0',
  PRIMARY KEY (`staff_id`),
  KEY `name` (`name`),
  KEY `company_code` (`company_code`),
  KEY `zone` (`zone`),
  KEY `ptj` (`ptj`),
  KEY `division` (`division`),
  KEY `unit` (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_detail`
--

DROP TABLE IF EXISTS `pp_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pp_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `master_id` int(11) DEFAULT NULL,
  `item_account_need` int(11) DEFAULT NULL,
  `item_code` varchar(250) DEFAULT NULL COMMENT 'nama item',
  `item_level4_id` int(11) DEFAULT NULL COMMENT 'kod item',
  `condition_type` int(2) DEFAULT NULL COMMENT 'kondisi jenis perolehan',
  `requirement_type` int(2) DEFAULT NULL COMMENT 'keperluan perolehan',
  `account_code` varchar(45) DEFAULT NULL COMMENT 'kod akaun',
  `bidang_code` varchar(45) DEFAULT NULL COMMENT 'kod bidang',
  `item_name` varchar(250) DEFAULT NULL COMMENT 'nama barangan',
  `is_spec_validate` int(2) DEFAULT NULL COMMENT 'Dokumen Spesifikasi Disahkan Jawatankusa Teknikal Berkaitan',
  `is_committee` int(1) DEFAULT NULL COMMENT 'Keperluan Jawatankuasa',
  `pb_no` varchar(45) DEFAULT NULL COMMENT '***No PB 3/80',
  `unit_estimate` decimal(20,2) DEFAULT NULL COMMENT 'Anggaran Harga Pasaran Seunit/Lot/Set',
  `unit_number` int(10) DEFAULT NULL COMMENT 'Bilangan Unit/Lot/Set',
  `market_price` decimal(20,2) DEFAULT NULL COMMENT 'Jumlah Anggaran Harga Pasaran',
  `budget_source` int(2) DEFAULT NULL COMMENT 'Sumber Peruntukan',
  `project_code` varchar(45) DEFAULT NULL COMMENT 'Kod Projek (Sila masukkan selain sumber Pengurusan)',
  `is_purchased` int(2) DEFAULT NULL COMMENT 'Anggaran Harga Pembelian Terdahulu (RM) / (Tahun), Jika Ada',
  `reason_repurchase` varchar(1024) DEFAULT NULL COMMENT 'Jika Pernah Beli dalam Tempoh Satu Tahun, Nyatakan Alasan Pembelian Berulang Bagi Jenis Item yang Sama',
  `is_imported` int(2) DEFAULT NULL COMMENT 'jika barangan import > 50K',
  `purpose` varchar(1024) DEFAULT NULL COMMENT 'Tujuan Penggunaan',
  `frequency_use` varchar(250) DEFAULT NULL COMMENT 'Kekerapan Penggunaan',
  `effect` varchar(1024) DEFAULT NULL COMMENT 'Kesan Jika Tiada Barangan Ini',
  `is_site_visit` int(1) DEFAULT NULL COMMENT 'Perlu Lawatan Tapak/Taklimat',
  `date_use` date DEFAULT NULL COMMENT 'Tarikh Item Dijangka Digunakan',
  `is_internal_training` int(2) DEFAULT NULL COMMENT 'Latihan Dalam Negeri Telah Dimasukkan Di Dalam Dokumen Spesifikasi (Diwajibkan)',
  `room_no` varchar(1024) DEFAULT NULL COMMENT '***Nombor Bilik Penempatan Barangan',
  `is_renovate` int(2) DEFAULT NULL COMMENT '***Ruang Perlu Diubahsuai? Jika Ya, Sila Nyatakan Tarikh Ruang dan Infrastuktur Akan Siap Diubahsuai.',
  `is_company_invited` int(2) DEFAULT NULL COMMENT '***Senarai Syarikat Untuk Dipelawa Sebut Harga Rasmi (Jika Ada)',
  `other_remarks` varchar(1024) DEFAULT NULL COMMENT 'Catitan Lain',
  `fais_no` varchar(45) DEFAULT NULL COMMENT '***Nombor Permohonan Belian (FAIS)',
  `fais_amount` decimal(20,2) DEFAULT NULL COMMENT '***Nilai Belian Dalam FAIS',
  `status` int(2) DEFAULT NULL COMMENT 'status proses',
  `estimate_pb_date` date DEFAULT NULL COMMENT '***Tarikh Dijangka akan buat proses PB',
  `estimate_use` varchar(250) DEFAULT NULL COMMENT '*** Jangka Masa Tahun Penggunaan',
  `staff_contact` varchar(1024) DEFAULT NULL,
  `staff_responsible` varchar(1024) DEFAULT NULL,
  `is_spec_approved` int(2) DEFAULT NULL,
  `sitevisit_start` datetime DEFAULT NULL,
  `sitevisit_end` datetime DEFAULT NULL,
  `sitevisit_location` varchar(250) DEFAULT NULL,
  `created_by` varchar(250) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(250) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `entity_code` int(11) DEFAULT NULL,
  `spec_master_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_level4_id` (`item_level4_id`),
  KEY `FK_pp_master` (`master_id`),
  KEY `FK_pp_detail_condition_type` (`condition_type`),
  KEY `FK_pp_detail_budget_source` (`budget_source`),
  KEY `FK_pp_detail_requirement_type` (`requirement_type`),
  KEY `FK_pp_detail_item_specification_master` (`spec_master_id`),
  KEY `FK_pp_detail_item_account_need` (`item_account_need`) USING BTREE,
  CONSTRAINT `FK_pp_detail_item_account_need` FOREIGN KEY (`item_account_need`) REFERENCES `item_account_need` (`id`),
  CONSTRAINT `FK_pp_detail_budget_source` FOREIGN KEY (`budget_source`) REFERENCES `ref_procurement_budget_source` (`id`),
  CONSTRAINT `FK_pp_detail_condition_type` FOREIGN KEY (`condition_type`) REFERENCES `ref_procurement_activiti` (`id`),
  CONSTRAINT `FK_pp_detail_item_specification_master` FOREIGN KEY (`spec_master_id`) REFERENCES `item_specification_master` (`id`),
  CONSTRAINT `FK_pp_detail_requirement_type` FOREIGN KEY (`requirement_type`) REFERENCES `ref_procurement_purpose` (`id`),
  CONSTRAINT `FK_pp_master` FOREIGN KEY (`master_id`) REFERENCES `pp_master` (`id`),
  CONSTRAINT `pp_detail_ibfk_1` FOREIGN KEY (`item_level4_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_detail_item_distribution`
--

DROP TABLE IF EXISTS `pp_detail_item_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pp_detail_item_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_detail` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `price` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pp_detail` (`pp_detail`),
  CONSTRAINT `FK_pp_detail` FOREIGN KEY (`pp_detail`) REFERENCES `pp_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_detail_user`
--

DROP TABLE IF EXISTS `pp_detail_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pp_detail_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_detail_id` int(11) DEFAULT NULL,
  `username` varchar(12) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pp_detail_id` (`pp_detail_id`),
  KEY `username` (`username`),
  CONSTRAINT `pp_detail_user_ibfk_1` FOREIGN KEY (`pp_detail_id`) REFERENCES `pp_detail` (`id`),
  CONSTRAINT `pp_detail_user_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_head`
--

DROP TABLE IF EXISTS `pp_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pp_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `year_start` int(11) DEFAULT NULL,
  `year_end` int(11) DEFAULT NULL,
  `is_package` varchar(1) DEFAULT NULL,
  `procurement_category` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `plan_type` varchar(25) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ref_no` (`ref_no`),
  KEY `node_id` (`node_id`),
  KEY `procurement_category` (`procurement_category`),
  CONSTRAINT `pp_head_ibfk_1` FOREIGN KEY (`ref_no`) REFERENCES `ref_procurement_numbering` (`id`),
  CONSTRAINT `pp_head_ibfk_2` FOREIGN KEY (`node_id`) REFERENCES `node_access` (`id`),
  CONSTRAINT `pp_head_ibfk_3` FOREIGN KEY (`procurement_category`) REFERENCES `ref_procurement_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_master`
--

DROP TABLE IF EXISTS `pp_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pp_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_year` int(4) DEFAULT NULL COMMENT 'tahun perolehan dari',
  `pp_year_to` int(4) DEFAULT NULL COMMENT 'tahun perolehan hingga',
  `state_id` char(1) DEFAULT NULL,
  `campus_id` int(11) DEFAULT NULL,
  `ptj_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `ref_no` varchar(250) DEFAULT NULL COMMENT 'no. rujukan PP',
  `category` int(2) DEFAULT NULL COMMENT 'kategory PP',
  `description` varchar(250) DEFAULT NULL COMMENT 'butiran perolehan',
  `amount` decimal(20,2) DEFAULT '0.00' COMMENT 'jumlah perolehan',
  `status` varchar(2) DEFAULT '1' COMMENT 'status PP',
  `is_package` int(2) NOT NULL,
  `created_by` varchar(250) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(250) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `entity_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `campus_id` (`campus_id`),
  KEY `ptj_id` (`ptj_id`),
  KEY `dept_id` (`dept_id`),
  KEY `unit_id` (`unit_id`),
  KEY `FK_pp_master_category` (`category`),
  KEY `FK_pp_master_6` (`state_id`),
  CONSTRAINT `FK_pp_master_6` FOREIGN KEY (`state_id`) REFERENCES `ref_state` (`id`),
  CONSTRAINT `FK_pp_master_category` FOREIGN KEY (`category`) REFERENCES `ref_procurement_category` (`id`),
  CONSTRAINT `pp_master_ibfk_1` FOREIGN KEY (`campus_id`) REFERENCES `ref_campus` (`id`),
  CONSTRAINT `pp_master_ibfk_2` FOREIGN KEY (`ptj_id`) REFERENCES `ref_ptj` (`id`),
  CONSTRAINT `pp_master_ibfk_3` FOREIGN KEY (`dept_id`) REFERENCES `ref_department` (`id`),
  CONSTRAINT `pp_master_ibfk_4` FOREIGN KEY (`unit_id`) REFERENCES `ref_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_pb_detl`
--

DROP TABLE IF EXISTS `pp_pb_detl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pp_pb_detl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_head_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_description` varchar(250) DEFAULT NULL,
  `mp_code` varchar(5) DEFAULT NULL,
  `total_unit` int(11) DEFAULT NULL,
  `amount` decimal(17,2) DEFAULT NULL,
  `item_spec_master_id` int(11) DEFAULT NULL,
  `item_account_need_id` int(11) DEFAULT NULL,
  `purchase_type` int(11) DEFAULT NULL,
  `finance_group_id` char(2) DEFAULT NULL,
  `date_use` date DEFAULT NULL,
  `effect` varchar(250) DEFAULT NULL,
  `purpose` varchar(250) DEFAULT NULL,
  `frequency_use` varchar(250) DEFAULT NULL,
  `other_remarks` varchar(250) DEFAULT NULL,
  `reason_repurchase` varchar(250) DEFAULT NULL,
  `project_code` varchar(25) DEFAULT NULL,
  `miti_approval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pp_head_id` (`pp_head_id`),
  KEY `item_id` (`item_id`),
  KEY `item_spec_master_id` (`item_spec_master_id`),
  KEY `item_account_need_id` (`item_account_need_id`),
  KEY `finance_group_id` (`finance_group_id`),
  KEY `miti_approval_id` (`miti_approval_id`),
  KEY `ministry_program_id` (`mp_code`),
  CONSTRAINT `pp_pb_detl_ibfk_1` FOREIGN KEY (`pp_head_id`) REFERENCES `pp_head` (`id`),
  CONSTRAINT `pp_pb_detl_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `pp_pb_detl_ibfk_3` FOREIGN KEY (`item_spec_master_id`) REFERENCES `item_specification_master` (`id`),
  CONSTRAINT `pp_pb_detl_ibfk_4` FOREIGN KEY (`item_account_need_id`) REFERENCES `item_account_need` (`id`),
  CONSTRAINT `pp_pb_detl_ibfk_5` FOREIGN KEY (`finance_group_id`) REFERENCES `ref_finance_group` (`id`),
  CONSTRAINT `pp_pb_detl_ibfk_6` FOREIGN KEY (`miti_approval_id`) REFERENCES `miti_approval` (`id`),
  CONSTRAINT `pp_pb_detl_ibfk_7` FOREIGN KEY (`mp_code`) REFERENCES `ref_ministry_program` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_pb_detl_survey`
--

DROP TABLE IF EXISTS `pp_pb_detl_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pp_pb_detl_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_pb_detl_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `lo_detail_id` int(11) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pp_pb_detl_id` (`pp_pb_detl_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `pp_pb_detl_survey_ibfk_1` FOREIGN KEY (`pp_pb_detl_id`) REFERENCES `pp_pb_detl` (`id`),
  CONSTRAINT `pp_pb_detl_survey_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `ref_file` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_pb_distribution`
--

DROP TABLE IF EXISTS `pp_pb_distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pp_pb_distribution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_pb_detl_id` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `pb_head_id` int(11) DEFAULT NULL,
  `estimated_qty` int(11) DEFAULT NULL,
  `estimated_price` decimal(17,2) DEFAULT NULL,
  `pp_pb_detl_sequence` int(11) DEFAULT NULL,
  `actual_qty` int(11) DEFAULT NULL,
  `actual_price` decimal(17,2) DEFAULT NULL,
  `priority_sequence` int(11) DEFAULT NULL,
  `item_spec_master_id` int(11) DEFAULT NULL,
  `pp_pb_balance` decimal(17,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pp_pb_detl_id` (`pp_pb_detl_id`),
  KEY `pb_head_id` (`pb_head_id`),
  KEY `item_spec_master_id` (`item_spec_master_id`),
  CONSTRAINT `pp_pb_distribution_ibfk_1` FOREIGN KEY (`pp_pb_detl_id`) REFERENCES `pp_pb_detl` (`id`),
  CONSTRAINT `pp_pb_distribution_ibfk_2` FOREIGN KEY (`pb_head_id`) REFERENCES `pb_head` (`id`),
  CONSTRAINT `pp_pb_distribution_ibfk_4` FOREIGN KEY (`item_spec_master_id`) REFERENCES `item_specification_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_pb_distribution_control`
--

DROP TABLE IF EXISTS `pp_pb_distribution_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pp_pb_distribution_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_control_id` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_control_id` (`purchase_control_id`),
  CONSTRAINT `pp_pb_distribution_control_ibfk_1` FOREIGN KEY (`purchase_control_id`) REFERENCES `purchase_control` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pp_pb_distribution_user`
--

DROP TABLE IF EXISTS `pp_pb_distribution_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pp_pb_distribution_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pp_pb_distribution_id` int(11) DEFAULT NULL,
  `username` varchar(12) DEFAULT NULL,
  `receiver` varchar(1) DEFAULT NULL,
  `custodian` varchar(1) DEFAULT NULL,
  `responsible` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pp_pb_distribution_id` (`pp_pb_distribution_id`),
  KEY `username` (`username`),
  CONSTRAINT `pp_pb_distribution_user_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `pp_pb_distribution_user_ibfk_1` FOREIGN KEY (`pp_pb_distribution_id`) REFERENCES `pp_pb_distribution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_control`
--

DROP TABLE IF EXISTS `purchase_control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(25) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_access_level`
--

DROP TABLE IF EXISTS `ref_access_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_access_level` (
  `id` char(1) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_access_type`
--

DROP TABLE IF EXISTS `ref_access_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_access_type` (
  `id` char(1) NOT NULL,
  `label` varchar(30) NOT NULL,
  `level` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_agency`
--

DROP TABLE IF EXISTS `ref_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_agency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_bank`
--

DROP TABLE IF EXISTS `ref_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_bank` (
  `swift_code` varchar(11) NOT NULL DEFAULT '',
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`swift_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_campus`
--

DROP TABLE IF EXISTS `ref_campus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_campus` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `state_id` char(1) NOT NULL,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_campus_state` (`state_id`,`label`) USING BTREE,
  KEY `FK_ref_campus_ref_state` (`state_id`),
  CONSTRAINT `FK_ref_campus_ref_state` FOREIGN KEY (`state_id`) REFERENCES `ref_state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_campus_company`
--

DROP TABLE IF EXISTS `ref_campus_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_campus_company` (
  `code` varchar(5) NOT NULL DEFAULT '',
  `campus_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_ref_campus_company_ref_campus` (`campus_id`),
  CONSTRAINT `FK_ref_campus_company_ref_campus` FOREIGN KEY (`campus_id`) REFERENCES `ref_campus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_city`
--

DROP TABLE IF EXISTS `ref_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_code` char(2) DEFAULT NULL,
  `state_code` char(1) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_code` (`city_code`,`state_code`),
  KEY `state_code` (`state_code`),
  CONSTRAINT `ref_city_ibfk_1` FOREIGN KEY (`state_code`) REFERENCES `ref_state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_committee_type`
--

DROP TABLE IF EXISTS `ref_committee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_committee_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_company`
--

DROP TABLE IF EXISTS `ref_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_company` (
  `id` varchar(8) NOT NULL DEFAULT '',
  `campus_id` int(11) DEFAULT NULL,
  `finance_group_id` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `campus_id_finance_group_id` (`campus_id`,`finance_group_id`),
  KEY `FK_ref_company_code_ref_finance_group` (`finance_group_id`),
  CONSTRAINT `FK_ref_company_code_ref_campus` FOREIGN KEY (`campus_id`) REFERENCES `ref_campus` (`id`),
  CONSTRAINT `FK_ref_company_code_ref_money_group` FOREIGN KEY (`finance_group_id`) REFERENCES `ref_finance_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_company_type`
--

DROP TABLE IF EXISTS `ref_company_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_company_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_country`
--

DROP TABLE IF EXISTS `ref_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_country` (
  `id` varchar(3) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_currency`
--

DROP TABLE IF EXISTS `ref_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_currency` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `country` varchar(100) NOT NULL,
  `value` decimal(17,2) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_delivery_field`
--

DROP TABLE IF EXISTS `ref_delivery_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_delivery_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_en` varchar(200) DEFAULT NULL,
  `label_my` varchar(200) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_department`
--

DROP TABLE IF EXISTS `ref_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ptj_id` int(10) NOT NULL DEFAULT '0',
  `dept_code` char(3) DEFAULT NULL,
  `label` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ptj_id_dept_code` (`ptj_id`,`dept_code`),
  CONSTRAINT `FK_ref_department_ref_ptj` FOREIGN KEY (`ptj_id`) REFERENCES `ref_ptj` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=277 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_district`
--

DROP TABLE IF EXISTS `ref_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_code` char(2) DEFAULT NULL,
  `state_id` char(1) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ref_district_ref_state` (`state_id`),
  CONSTRAINT `FK_ref_district_ref_state` FOREIGN KEY (`state_id`) REFERENCES `ref_state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_field`
--

DROP TABLE IF EXISTS `ref_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_field` (
  `field_code` varchar(6) NOT NULL DEFAULT '',
  `parent_field_id` varchar(6) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `category` varchar(5) DEFAULT NULL,
  `pseudocode` varchar(25) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`field_code`),
  KEY `FK_ref_field_ref_field` (`parent_field_id`),
  CONSTRAINT `FK_ref_field_ref_field` FOREIGN KEY (`parent_field_id`) REFERENCES `ref_field` (`field_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_field_agency`
--

DROP TABLE IF EXISTS `ref_field_agency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_field_agency` (
  `id` varchar(5) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_field_gred`
--

DROP TABLE IF EXISTS `ref_field_gred`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_field_gred` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gred_code` varchar(5) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `field_code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ref_field_gred_ref_field` (`field_code`),
  CONSTRAINT `FK_ref_field_gred_ref_field` FOREIGN KEY (`field_code`) REFERENCES `ref_field` (`field_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_file`
--

DROP TABLE IF EXISTS `ref_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) DEFAULT NULL,
  `file_type` varchar(25) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `content` longblob,
  `created_by` varchar(25) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_finance_group`
--

DROP TABLE IF EXISTS `ref_finance_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_finance_group` (
  `id` char(2) NOT NULL DEFAULT '0',
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_item_attribute`
--

DROP TABLE IF EXISTS `ref_item_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_item_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_item_category`
--

DROP TABLE IF EXISTS `ref_item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_item_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_ministry_outcome`
--

DROP TABLE IF EXISTS `ref_ministry_outcome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_ministry_outcome` (
  `id` varchar(5) NOT NULL DEFAULT '',
  `label` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_ministry_program`
--

DROP TABLE IF EXISTS `ref_ministry_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_ministry_program` (
  `id` varchar(5) NOT NULL DEFAULT '',
  `label` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_pkk_category`
--

DROP TABLE IF EXISTS `ref_pkk_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_pkk_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_pkk_limit`
--

DROP TABLE IF EXISTS `ref_pkk_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_pkk_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `label` varchar(45) NOT NULL,
  `min` decimal(12,0) DEFAULT NULL,
  `max` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pkk_category` (`category_id`),
  CONSTRAINT `fk_pkk_category` FOREIGN KEY (`category_id`) REFERENCES `ref_pkk_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_position`
--

DROP TABLE IF EXISTS `ref_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_postcode`
--

DROP TABLE IF EXISTS `ref_postcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_postcode` (
  `postcode` varchar(5) NOT NULL,
  `city_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`postcode`),
  KEY `city_code` (`city_code`),
  CONSTRAINT `ref_postcode_ibfk_1` FOREIGN KEY (`city_code`) REFERENCES `ref_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_price`
--

DROP TABLE IF EXISTS `ref_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_procurement_activiti`
--

DROP TABLE IF EXISTS `ref_procurement_activiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_procurement_activiti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_procurement_budget_source`
--

DROP TABLE IF EXISTS `ref_procurement_budget_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_procurement_budget_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_procurement_category`
--

DROP TABLE IF EXISTS `ref_procurement_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_procurement_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_procurement_numbering`
--

DROP TABLE IF EXISTS `ref_procurement_numbering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_procurement_numbering` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(2) DEFAULT NULL,
  `company_code` varchar(8) DEFAULT NULL,
  `ptj_code` int(11) DEFAULT NULL,
  `month_year` varchar(6) DEFAULT NULL,
  `numbering` int(11) DEFAULT NULL,
  `fais_numbering` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module` (`module`,`company_code`,`ptj_code`,`month_year`,`numbering`),
  KEY `ptj_code` (`ptj_code`),
  KEY `company_code` (`company_code`),
  CONSTRAINT `ref_procurement_numbering_ref_ptj` FOREIGN KEY (`ptj_code`) REFERENCES `ref_ptj` (`id`),
  CONSTRAINT `ref_procurement_numbering_ref_company` FOREIGN KEY (`company_code`) REFERENCES `ref_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_procurement_purpose`
--

DROP TABLE IF EXISTS `ref_procurement_purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_procurement_purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_ptj`
--

DROP TABLE IF EXISTS `ref_ptj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_ptj` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `zone_id` int(10) NOT NULL DEFAULT '0',
  `ptj_code` varchar(50) NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_ref_ptj_ref_zone` (`zone_id`),
  CONSTRAINT `FK_ref_ptj_ref_zone` FOREIGN KEY (`zone_id`) REFERENCES `ref_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_race`
--

DROP TABLE IF EXISTS `ref_race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_race` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_state`
--

DROP TABLE IF EXISTS `ref_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_state` (
  `id` char(1) NOT NULL DEFAULT '0',
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_title`
--

DROP TABLE IF EXISTS `ref_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_unit`
--

DROP TABLE IF EXISTS `ref_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_unit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) DEFAULT NULL,
  `unit_code` char(3) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dept_id_unit_code` (`dept_id`,`unit_code`),
  CONSTRAINT `FK_ref_unit_ref_department` FOREIGN KEY (`dept_id`) REFERENCES `ref_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_unit_of_measurement`
--

DROP TABLE IF EXISTS `ref_unit_of_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_unit_of_measurement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_velocity_mail_template`
--

DROP TABLE IF EXISTS `ref_velocity_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_velocity_mail_template` (
  `id` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `content` varchar(5120) CHARACTER SET latin1 DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_vendor_parameter_dasar`
--

DROP TABLE IF EXISTS `ref_vendor_parameter_dasar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_vendor_parameter_dasar` (
  `id` int(11) NOT NULL DEFAULT '0',
  `new_registration_completion` int(11) DEFAULT NULL,
  `review_period` int(11) DEFAULT NULL,
  `reminder_review_by_hour` int(11) DEFAULT NULL,
  `reminder_approve_by_hour` int(11) DEFAULT NULL,
  `reminder_vendor_update_company` int(11) DEFAULT NULL,
  `subscribe_sms` varchar(1) DEFAULT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(25) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_vendor_parameter_dokumen`
--

DROP TABLE IF EXISTS `ref_vendor_parameter_dokumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_vendor_parameter_dokumen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_code` varchar(25) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `document_code` (`document_code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_vendor_parameter_identifikasi`
--

DROP TABLE IF EXISTS `ref_vendor_parameter_identifikasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_vendor_parameter_identifikasi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `soalan_my` varchar(255) NOT NULL,
  `soalan_en` varchar(255) NOT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(25) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_soalan_my` (`soalan_my`) USING BTREE,
  UNIQUE KEY `idx_unique_soalan_en` (`soalan_en`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ref_zone`
--

DROP TABLE IF EXISTS `ref_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_zone` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_id` varchar(8) DEFAULT NULL,
  `zone_code` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id_zone_code` (`company_id`,`zone_code`),
  CONSTRAINT `FK_ref_zone_ref_company` FOREIGN KEY (`company_id`) REFERENCES `ref_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_name` varchar(32) NOT NULL DEFAULT '',
  `label` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` varchar(12) NOT NULL DEFAULT '',
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_staff_user` FOREIGN KEY (`id`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(12) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `vendor` char(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_configuration`
--

DROP TABLE IF EXISTS `user_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) DEFAULT NULL,
  `table_length` int(11) DEFAULT NULL,
  `language` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  CONSTRAINT `user_configuration_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL DEFAULT '',
  `role_name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username_fk` (`username`),
  KEY `role_fk` (`role_name`),
  CONSTRAINT `FK_user_role_role` FOREIGN KEY (`role_name`) REFERENCES `role` (`role_name`),
  CONSTRAINT `username_fk` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ut_menu`
--

DROP TABLE IF EXISTS `ut_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ut_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(25) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active_flag` varchar(1) DEFAULT NULL,
  `label_en` varchar(100) DEFAULT NULL,
  `label_my` varchar(100) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `description_en` varchar(100) DEFAULT NULL,
  `description_my` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `ut_menu_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ut_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=677 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_code` varchar(15) DEFAULT NULL,
  `vendor_type` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `nonactive_date` date DEFAULT NULL,
  `current_amount_money` decimal(16,2) DEFAULT NULL,
  `balance_amount_money` decimal(16,2) DEFAULT NULL,
  `type_code` varchar(3) DEFAULT NULL,
  `term_code` varchar(3) DEFAULT NULL,
  `tax_code` varchar(3) DEFAULT NULL,
  `hold_code` varchar(3) DEFAULT NULL,
  `highest_balance_amount` decimal(16,2) DEFAULT NULL,
  `ytd_amount` decimal(16,2) DEFAULT NULL,
  `average_day_paid` int(10) DEFAULT NULL,
  `last_po_date` date DEFAULT NULL,
  `last_voucher_date` date DEFAULT NULL,
  `last_payment_date` date DEFAULT NULL,
  `paid_up_capital` decimal(16,2) DEFAULT NULL,
  `approval_capital` decimal(16,2) DEFAULT NULL,
  `next_seq_num` int(10) DEFAULT NULL,
  `tax_text` varchar(10) DEFAULT NULL,
  `drop_flag` varchar(1) DEFAULT NULL,
  `create_company` varchar(4) DEFAULT NULL,
  `create_code` varchar(8) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_code` varchar(8) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `mandatory_flag` varchar(1) DEFAULT NULL,
  `prestasi_code` varchar(2) DEFAULT NULL,
  `active_status` varchar(1) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `verify_code` varchar(8) DEFAULT NULL,
  `verify_date` date DEFAULT NULL,
  `desc_text1` varchar(255) DEFAULT NULL,
  `approve_code` varchar(8) DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `desc_text2` varchar(255) DEFAULT NULL,
  `last_debit` date DEFAULT NULL,
  `usual_acct_code` varchar(18) DEFAULT NULL,
  `verify_flag` varchar(1) DEFAULT NULL,
  `ownership_status` varchar(7) DEFAULT NULL,
  `establish_year` varchar(4) DEFAULT NULL,
  `markah` decimal(5,2) DEFAULT NULL,
  `created_by` varchar(12) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `registration_flag` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vendor_ref_company_type` (`vendor_type`),
  CONSTRAINT `FK_vendor_ref_company_type` FOREIGN KEY (`vendor_type`) REFERENCES `ref_company_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_activation_login`
--

DROP TABLE IF EXISTS `vendor_activation_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_activation_login` (
  `id` varchar(12) NOT NULL DEFAULT '0',
  `activation_code` varchar(200) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_vendor_activation_login_vendor_contact` FOREIGN KEY (`id`) REFERENCES `vendor_contact` (`ic_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_address`
--

DROP TABLE IF EXISTS `vendor_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_code` int(11) DEFAULT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `name_text` varchar(40) DEFAULT NULL,
  `address1` varchar(125) DEFAULT NULL,
  `address2` varchar(125) DEFAULT NULL,
  `address3` varchar(125) DEFAULT NULL,
  `city_code` int(11) DEFAULT NULL,
  `district_code` int(11) DEFAULT NULL,
  `state_code` char(1) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `country_code` varchar(25) DEFAULT NULL,
  `country_text` varchar(20) DEFAULT NULL,
  `tel_no` varchar(20) DEFAULT NULL,
  `extension` varchar(7) DEFAULT NULL,
  `fax_no` varchar(20) DEFAULT NULL,
  `status_ind` varchar(1) DEFAULT NULL,
  `create_code` varchar(8) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_code` varchar(8) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `approve_code` varchar(8) DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `url` varchar(125) DEFAULT NULL,
  `verify_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_code` (`vendor_code`),
  KEY `FK_vendor_address_ref_state` (`state_code`),
  KEY `FK_vendor_address_ref_city` (`city_code`),
  KEY `FK_vendor_address_ref_district` (`district_code`),
  CONSTRAINT `FK_vendor_address_ref_city` FOREIGN KEY (`city_code`) REFERENCES `ref_city` (`id`),
  CONSTRAINT `FK_vendor_address_ref_district` FOREIGN KEY (`district_code`) REFERENCES `ref_district` (`id`),
  CONSTRAINT `FK_vendor_address_ref_state` FOREIGN KEY (`state_code`) REFERENCES `ref_state` (`id`),
  CONSTRAINT `vendor_address_ibfk_1` FOREIGN KEY (`vendor_code`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_bank`
--

DROP TABLE IF EXISTS `vendor_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_address_code` int(11) DEFAULT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `type_code` varchar(1) DEFAULT NULL,
  `bank_account_code` varchar(40) DEFAULT NULL,
  `bank_code` varchar(11) DEFAULT NULL,
  `bank_address1` varchar(125) DEFAULT NULL,
  `bank_address2` varchar(125) DEFAULT NULL,
  `bank_address3` varchar(125) DEFAULT NULL,
  `city_code` int(11) DEFAULT NULL,
  `district_code` int(11) DEFAULT NULL,
  `state_code` char(1) DEFAULT NULL,
  `postcode` varchar(5) DEFAULT NULL,
  `tel_no` varchar(20) DEFAULT NULL,
  `fax_no` varchar(20) DEFAULT NULL,
  `status_ind` varchar(1) DEFAULT NULL,
  `verify_flag` varchar(1) DEFAULT NULL,
  `factoring_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_address_code` (`vendor_address_code`),
  KEY `FK_vendor_bank_ref_state` (`state_code`),
  KEY `FK_vendor_bank_ref_district` (`district_code`),
  KEY `FK_vendor_bank_ref_city` (`city_code`),
  KEY `FK_vendor_bank_ref_bank` (`bank_code`),
  CONSTRAINT `FK_vendor_bank_ref_bank` FOREIGN KEY (`bank_code`) REFERENCES `ref_bank` (`swift_code`),
  CONSTRAINT `FK_vendor_bank_ref_city` FOREIGN KEY (`city_code`) REFERENCES `ref_city` (`id`),
  CONSTRAINT `FK_vendor_bank_ref_district` FOREIGN KEY (`district_code`) REFERENCES `ref_district` (`id`),
  CONSTRAINT `FK_vendor_bank_ref_state` FOREIGN KEY (`state_code`) REFERENCES `ref_state` (`id`),
  CONSTRAINT `vendor_bank_ibfk_1` FOREIGN KEY (`vendor_address_code`) REFERENCES `vendor_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_bidang`
--

DROP TABLE IF EXISTS `vendor_bidang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_bidang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_code` int(11) DEFAULT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `pelanggan` varchar(5) DEFAULT NULL,
  `no_daftar` varchar(20) DEFAULT NULL,
  `class` int(10) DEFAULT NULL,
  `kep_bidang` varchar(6) DEFAULT NULL,
  `create_code` varchar(8) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `verify_flag` varchar(1) DEFAULT NULL,
  `sent_invitation` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_code` (`vendor_code`),
  KEY `FK_vendor_bidang_ref_field` (`kep_bidang`),
  KEY `FK_vendor_bidang_ref_field_gred` (`class`),
  CONSTRAINT `FK_vendor_bidang_ref_field` FOREIGN KEY (`kep_bidang`) REFERENCES `ref_field` (`field_code`),
  CONSTRAINT `FK_vendor_bidang_ref_field_gred` FOREIGN KEY (`class`) REFERENCES `ref_field_gred` (`id`),
  CONSTRAINT `vendor_bidang_ibfk_1` FOREIGN KEY (`vendor_code`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_board`
--

DROP TABLE IF EXISTS `vendor_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_code` int(11) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `nationality` varchar(3) DEFAULT NULL,
  `race` int(10) DEFAULT NULL,
  `ic_no` varchar(14) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `appoint` varchar(125) DEFAULT NULL,
  `other_desc` varchar(125) DEFAULT NULL,
  `share_percent` varchar(100) DEFAULT NULL,
  `address1` varchar(125) DEFAULT NULL,
  `address2` varchar(125) DEFAULT NULL,
  `address3` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vendor_board_vendor` (`vendor_code`),
  KEY `FK_vendor_board_ref_country` (`nationality`),
  CONSTRAINT `FK_vendor_board_ref_country` FOREIGN KEY (`nationality`) REFERENCES `ref_country` (`id`),
  CONSTRAINT `FK_vendor_board_vendor` FOREIGN KEY (`vendor_code`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_contact`
--

DROP TABLE IF EXISTS `vendor_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_contact` (
  `ic_no` varchar(12) NOT NULL DEFAULT '',
  `vendor_address_code` int(11) DEFAULT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `name_text` varchar(125) DEFAULT NULL,
  `role_text` varchar(125) DEFAULT NULL,
  `tel_no` varchar(20) DEFAULT NULL,
  `tel_no_hp` varchar(20) DEFAULT NULL,
  `fax_no` varchar(20) DEFAULT NULL,
  `email` varchar(125) DEFAULT NULL,
  `temp_password` varchar(100) DEFAULT NULL,
  `verify_flag` varchar(1) DEFAULT NULL,
  `panggilan` int(11) DEFAULT NULL,
  `tarikh_lahir` date DEFAULT NULL,
  `jantina` varchar(1) DEFAULT NULL,
  `warganegara` varchar(3) DEFAULT NULL,
  `taraf_warganegara` varchar(1) DEFAULT NULL,
  `tauliah` char(1) DEFAULT 'N',
  `tauliah_file` int(11) DEFAULT NULL,
  `register_type` char(1) DEFAULT '1',
  PRIMARY KEY (`ic_no`),
  UNIQUE KEY `tauliah_file` (`tauliah_file`),
  KEY `vendor_address_code` (`vendor_address_code`),
  KEY `FK_vendor_contact_ref_title` (`panggilan`),
  CONSTRAINT `FK_vendor_contact_ref_file` FOREIGN KEY (`tauliah_file`) REFERENCES `ref_file` (`id`),
  CONSTRAINT `FK_vendor_contact_ref_title` FOREIGN KEY (`panggilan`) REFERENCES `ref_title` (`id`),
  CONSTRAINT `vendor_contact_ibfk_1` FOREIGN KEY (`vendor_address_code`) REFERENCES `vendor_address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_contact_identification`
--

DROP TABLE IF EXISTS `vendor_contact_identification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_contact_identification` (
  `vendor_contact_code` varchar(12) NOT NULL,
  `identification_code_1` int(11) DEFAULT NULL,
  `answer_1` varchar(25) DEFAULT NULL,
  `identification_code_2` int(11) DEFAULT NULL,
  `answer_2` varchar(25) DEFAULT NULL,
  `identification_code_3` int(11) DEFAULT NULL,
  `answer_3` varchar(25) DEFAULT NULL,
  `created_by` varchar(25) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(25) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`vendor_contact_code`),
  KEY `identification_code_1` (`identification_code_1`),
  KEY `identification_code_2` (`identification_code_2`),
  KEY `identification_code_3` (`identification_code_3`),
  CONSTRAINT `FK_vendor_contact_identification_vendor_contact` FOREIGN KEY (`vendor_contact_code`) REFERENCES `vendor_contact` (`ic_no`),
  CONSTRAINT `vendor_contact_identification_ibfk_1` FOREIGN KEY (`identification_code_1`) REFERENCES `ref_vendor_parameter_identifikasi` (`id`),
  CONSTRAINT `vendor_contact_identification_ibfk_2` FOREIGN KEY (`identification_code_2`) REFERENCES `ref_vendor_parameter_identifikasi` (`id`),
  CONSTRAINT `vendor_contact_identification_ibfk_3` FOREIGN KEY (`identification_code_3`) REFERENCES `ref_vendor_parameter_identifikasi` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_dokumen`
--

DROP TABLE IF EXISTS `vendor_dokumen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_dokumen` (
  `id` int(11) NOT NULL DEFAULT '0',
  `vendor_code` int(11) NOT NULL DEFAULT '0',
  `document_id` int(11) NOT NULL DEFAULT '0',
  `class` varchar(50) DEFAULT NULL,
  `registration_no` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `vendor_ownership_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendor_code_document_id` (`vendor_code`,`document_id`),
  KEY `FK_vendor_dokumen_ref_vendor_parameter_dokumen` (`document_id`),
  CONSTRAINT `FK_vendor_dokumen_ref_file` FOREIGN KEY (`id`) REFERENCES `ref_file` (`id`),
  CONSTRAINT `FK_vendor_dokumen_ref_vendor_parameter_dokumen` FOREIGN KEY (`document_id`) REFERENCES `ref_vendor_parameter_dokumen` (`id`),
  CONSTRAINT `FK_vendor_dokumen_vendor` FOREIGN KEY (`vendor_code`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_equity`
--

DROP TABLE IF EXISTS `vendor_equity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_equity` (
  `vendor_code` int(11) NOT NULL DEFAULT '0',
  `capital_authorised` decimal(14,2) DEFAULT NULL,
  `capital_paid_money` decimal(14,2) DEFAULT NULL,
  `capital_paid_bumi` decimal(14,2) DEFAULT NULL,
  `capital_paid_non_bumi` decimal(14,2) DEFAULT NULL,
  `capital_paid_government` decimal(14,2) DEFAULT NULL,
  `capital_paid_corporate` decimal(14,2) DEFAULT NULL,
  `capital_paid_foreign` decimal(14,2) DEFAULT NULL,
  `capital_percent_bumi` decimal(5,2) DEFAULT NULL,
  `capital_percent_non_bumi` decimal(5,2) DEFAULT NULL,
  `capital_percent_government` decimal(5,2) DEFAULT NULL,
  `capital_percent_corporate` decimal(5,2) DEFAULT NULL,
  `capital_percent_foreign` decimal(5,2) DEFAULT NULL,
  `staff_mgt_bumi` int(11) DEFAULT NULL,
  `staff_mgt_nonbumi` int(11) DEFAULT NULL,
  `staff_mgt_foreign` int(11) DEFAULT NULL,
  `staff_pro_bumi` int(11) DEFAULT NULL,
  `staff_pro_nonbumi` int(11) DEFAULT NULL,
  `staff_pro_foreign` int(11) DEFAULT NULL,
  `staff_low_bumi` int(11) DEFAULT NULL,
  `staff_low_nonbumi` int(11) DEFAULT NULL,
  `staff_low_foreign` int(11) DEFAULT NULL,
  `create_code` varchar(8) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `pra_update_code` varchar(8) DEFAULT NULL,
  `pra_update_date` date DEFAULT NULL,
  `update_code` varchar(8) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `verify_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`vendor_code`),
  CONSTRAINT `vendor_equity_ibfk_1` FOREIGN KEY (`vendor_code`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_experience`
--

DROP TABLE IF EXISTS `vendor_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_code` int(11) DEFAULT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `description_text` varchar(255) DEFAULT NULL,
  `ref_no` varchar(125) DEFAULT NULL,
  `name_text` varchar(125) DEFAULT NULL,
  `address1` varchar(125) DEFAULT NULL,
  `address2` varchar(125) DEFAULT NULL,
  `address3` varchar(125) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `complete_date` date DEFAULT NULL,
  `value` decimal(14,2) DEFAULT NULL,
  `create_code` varchar(8) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `update_code` varchar(8) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `verify_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_code` (`vendor_code`),
  CONSTRAINT `vendor_experience_ibfk_1` FOREIGN KEY (`vendor_code`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_ownership`
--

DROP TABLE IF EXISTS `vendor_ownership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_ownership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_code` int(11) DEFAULT NULL,
  `category_code` varchar(5) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `nationality` varchar(3) DEFAULT NULL,
  `race` int(11) DEFAULT NULL,
  `ic_no` varchar(14) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `share_percent` decimal(5,2) DEFAULT NULL,
  `share_amount` decimal(14,2) DEFAULT NULL,
  `address1` varchar(125) DEFAULT NULL,
  `address2` varchar(125) DEFAULT NULL,
  `address3` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vendor_ownership_vendor` (`vendor_code`),
  KEY `FK_vendor_ownership_ref_country` (`nationality`),
  CONSTRAINT `FK_vendor_ownership_ref_country` FOREIGN KEY (`nationality`) REFERENCES `ref_country` (`id`),
  CONSTRAINT `FK_vendor_ownership_vendor` FOREIGN KEY (`vendor_code`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_pegawai_tauliah`
--

DROP TABLE IF EXISTS `vendor_pegawai_tauliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_pegawai_tauliah` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_address_code` int(11) DEFAULT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `name_text` varchar(125) DEFAULT NULL,
  `ic_no` varchar(14) DEFAULT NULL,
  `role_text` varchar(125) DEFAULT NULL,
  `verify_flag` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_address_code` (`vendor_address_code`),
  CONSTRAINT `vendor_pegawai_tauliah_ibfk_1` FOREIGN KEY (`vendor_address_code`) REFERENCES `vendor_address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_registration_flow`
--

DROP TABLE IF EXISTS `vendor_registration_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_registration_flow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_code` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `flow_type` char(1) DEFAULT NULL,
  `review_status` char(1) DEFAULT NULL,
  `review_description` varchar(1000) DEFAULT NULL,
  `review_by` varchar(50) DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  `approve_status` char(1) DEFAULT NULL,
  `approve_description` varchar(1000) DEFAULT NULL,
  `approve_by` varchar(50) DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `ref_number` varchar(50) DEFAULT NULL,
  `vendor_contact` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_code` (`vendor_code`),
  KEY `vendor_contact` (`vendor_contact`),
  CONSTRAINT `vendor_registration_flow_ibfk_1` FOREIGN KEY (`vendor_code`) REFERENCES `vendor` (`id`),
  CONSTRAINT `vendor_registration_flow_ibfk_2` FOREIGN KEY (`vendor_contact`) REFERENCES `vendor_contact` (`ic_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_registration_flow_notice`
--

DROP TABLE IF EXISTS `vendor_registration_flow_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_registration_flow_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_registration_flow_id` int(11) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `ref_number` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_registration_flow_id` (`vendor_registration_flow_id`),
  CONSTRAINT `vendor_registration_flow_notice_ibfk_1` FOREIGN KEY (`vendor_registration_flow_id`) REFERENCES `vendor_registration_flow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_subscription_sms`
--

DROP TABLE IF EXISTS `vendor_subscription_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_subscription_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_code` int(11) DEFAULT NULL,
  `endorse_flag` varchar(1) DEFAULT NULL,
  `hp_no` varchar(25) DEFAULT NULL,
  `tender_ads` varchar(1) DEFAULT NULL,
  `sebutharga_ads` varchar(1) DEFAULT NULL,
  `tender_result` varchar(1) DEFAULT NULL,
  `sebutharga_result` varchar(1) DEFAULT NULL,
  `tender_rank_schedule` varchar(1) DEFAULT NULL,
  `sebutharga_rank_schedule` varchar(1) DEFAULT NULL,
  `action_charge_notice` varchar(1) DEFAULT NULL,
  `closing_date_notice` varchar(1) DEFAULT NULL,
  `payment_received_info` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_code` (`vendor_code`),
  CONSTRAINT `vendor_subscription_sms_ibfk_1` FOREIGN KEY (`vendor_code`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor_utility`
--

DROP TABLE IF EXISTS `vendor_utility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor_utility` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_code` int(11) DEFAULT NULL,
  `seq_num` int(11) DEFAULT NULL,
  `type_description` varchar(125) DEFAULT NULL,
  `cc` varchar(20) DEFAULT NULL,
  `make_year` varchar(4) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `make_type` varchar(40) DEFAULT NULL,
  `license_date` date DEFAULT NULL,
  `current_value` decimal(14,2) DEFAULT NULL,
  `storage` varchar(125) DEFAULT NULL,
  `ownership` varchar(125) DEFAULT NULL,
  `address1` varchar(125) DEFAULT NULL,
  `address2` varchar(125) DEFAULT NULL,
  `address3` varchar(125) DEFAULT NULL,
  `verify_flag` varchar(1) DEFAULT NULL,
  `type_code` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_code` (`vendor_code`),
  CONSTRAINT `vendor_utility_ibfk_1` FOREIGN KEY (`vendor_code`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-17 12:43:45
