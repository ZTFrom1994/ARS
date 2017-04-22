/*
Navicat MySQL Data Transfer

Source Server         : web1
Source Server Version : 60011
Source Host           : 127.0.0.1:3306
Source Database       : ars

Target Server Type    : MYSQL
Target Server Version : 60011
File Encoding         : 65001

Date: 2017-04-21 23:07:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  `admin_sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for application_sheet
-- ----------------------------
DROP TABLE IF EXISTS `application_sheet`;
CREATE TABLE `application_sheet` (
  `as_id` int(11) NOT NULL AUTO_INCREMENT,
  `as_date` datetime DEFAULT NULL,
  `as_type` varchar(255) DEFAULT NULL,
  `as_invoice_check` varchar(255) DEFAULT NULL,
  `as_result` varchar(255) DEFAULT NULL,
  `as_remarks` varchar(255) DEFAULT NULL,
  `as_staff_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`as_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for assessor
-- ----------------------------
DROP TABLE IF EXISTS `assessor`;
CREATE TABLE `assessor` (
  `assessor_id` int(11) NOT NULL,
  `assessor_name` varchar(255) DEFAULT NULL,
  `assessor_password` varchar(255) DEFAULT NULL,
  `assessor_position_name` varchar(255) DEFAULT NULL,
  `assessor_state` varchar(255) DEFAULT NULL,
  `assessor_department` varchar(255) DEFAULT NULL,
  `assessor_register_date` datetime DEFAULT NULL,
  `assessor_operation_times` int(11) DEFAULT NULL,
  `assessor_sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`assessor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for assessor_operation_record
-- ----------------------------
DROP TABLE IF EXISTS `assessor_operation_record`;
CREATE TABLE `assessor_operation_record` (
  `aor_id` int(11) NOT NULL AUTO_INCREMENT,
  `aor_assessor_id` int(11) DEFAULT NULL,
  `aor_check_type` varchar(255) DEFAULT NULL,
  `aor_application_type` varchar(255) DEFAULT NULL,
  `aor_operation_time` datetime DEFAULT NULL,
  `aor_operation_result` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for borrow_application
-- ----------------------------
DROP TABLE IF EXISTS `borrow_application`;
CREATE TABLE `borrow_application` (
  `ba_id` int(11) NOT NULL AUTO_INCREMENT,
  `ba_project_id` int(11) DEFAULT NULL,
  `ba_amount` float(11,2) DEFAULT NULL,
  `ba_remarks` varchar(255) DEFAULT NULL,
  `ba_state` varchar(255) DEFAULT NULL,
  `ba_event_id` int(11) DEFAULT NULL,
  `ba_borrower_id` int(11) DEFAULT NULL,
  `ba_apply_date` datetime DEFAULT NULL,
  `ba_payment_type` varchar(255) DEFAULT NULL,
  `ba_payment_days_limit` int(11) DEFAULT NULL,
  `ba_use` varchar(255) DEFAULT NULL,
  `ba_leave_messages` varchar(255) DEFAULT NULL,
  `ba_application_sheet_id` int(11) DEFAULT '0',
  PRIMARY KEY (`ba_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for borrow_record
-- ----------------------------
DROP TABLE IF EXISTS `borrow_record`;
CREATE TABLE `borrow_record` (
  `br_id` int(11) NOT NULL AUTO_INCREMENT,
  `br_project_id` int(11) DEFAULT NULL,
  `br_amount` float(11,2) DEFAULT NULL,
  `br_remarks` varchar(255) DEFAULT NULL,
  `br_payment_time` datetime DEFAULT NULL,
  `br_state` varchar(255) DEFAULT NULL,
  `br_paid_money` float(11,2) DEFAULT NULL,
  `br_borrower_id` int(255) DEFAULT NULL,
  `br_record_date` datetime DEFAULT NULL,
  `br_use` varchar(255) DEFAULT NULL,
  `br_application_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`br_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for daily_reimbursement_application
-- ----------------------------
DROP TABLE IF EXISTS `daily_reimbursement_application`;
CREATE TABLE `daily_reimbursement_application` (
  `dra_id` int(11) NOT NULL AUTO_INCREMENT,
  `dra_remarks` varchar(255) DEFAULT NULL,
  `dra_project_id` int(11) DEFAULT NULL,
  `dra_apply_date` datetime DEFAULT NULL,
  `dra_proposer_id` int(11) DEFAULT NULL,
  `dra_state` varchar(255) DEFAULT NULL,
  `dra_payment_type` varchar(255) DEFAULT NULL,
  `dra_offset_borrowing_id` int(11) DEFAULT NULL,
  `dra_event_id` int(11) DEFAULT NULL,
  `dra_application_sheet_id` int(11) DEFAULT '0',
  `dra_leave_messages` varchar(255) DEFAULT NULL,
  `dra_total_number` int(11) DEFAULT NULL,
  `dra_total_money` varchar(255) DEFAULT NULL,
  `dra_finish_date` datetime DEFAULT NULL,
  PRIMARY KEY (`dra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for daily_reimbursement_item
-- ----------------------------
DROP TABLE IF EXISTS `daily_reimbursement_item`;
CREATE TABLE `daily_reimbursement_item` (
  `dri_id` int(11) NOT NULL AUTO_INCREMENT,
  `dri_dra_id` int(11) DEFAULT NULL,
  `dri_large_class` varchar(255) DEFAULT NULL,
  `dri_small_class` varchar(255) DEFAULT NULL,
  `dri_number` int(11) DEFAULT NULL,
  `dri_name` varchar(255) DEFAULT NULL,
  `dri_total` float(11,2) DEFAULT NULL,
  `dri_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_start_time` datetime DEFAULT NULL,
  `event_end_time` datetime DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `event_color` varchar(255) DEFAULT NULL,
  `event_state` int(1) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_object` int(1) DEFAULT NULL,
  `message_content` varchar(255) DEFAULT NULL,
  `message_state` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `message_sender_id` int(255) DEFAULT NULL,
  `message_send_date` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for no_read_message
-- ----------------------------
DROP TABLE IF EXISTS `no_read_message`;
CREATE TABLE `no_read_message` (
  `nrm_id` int(11) NOT NULL AUTO_INCREMENT,
  `nrm_user_type` int(2) DEFAULT NULL,
  `nrm_user_id` int(11) DEFAULT NULL,
  `nrm_message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nrm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for offset_borrowing
-- ----------------------------
DROP TABLE IF EXISTS `offset_borrowing`;
CREATE TABLE `offset_borrowing` (
  `ob_id` int(11) NOT NULL AUTO_INCREMENT,
  `ob_borrow_record_id` int(11) DEFAULT NULL,
  `ob_amount` float(255,2) DEFAULT NULL,
  `ob_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ob_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for payment_record
-- ----------------------------
DROP TABLE IF EXISTS `payment_record`;
CREATE TABLE `payment_record` (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_borrow_record_id` int(11) DEFAULT NULL,
  `pr_assessor_id` int(11) DEFAULT NULL,
  `pr_amount` float(11,2) DEFAULT NULL,
  PRIMARY KEY (`pr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `project_department` varchar(255) DEFAULT NULL,
  `project_principal_id` int(255) DEFAULT NULL,
  `project_reimburse_limit` float(255,2) DEFAULT NULL,
  `project_state` varchar(255) DEFAULT NULL,
  `project_balance` float(255,2) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `staff_password` varchar(255) DEFAULT NULL,
  `staff_state` varchar(255) DEFAULT NULL,
  `staff_position_name` varchar(255) DEFAULT NULL,
  `staff_credit_integral` int(255) DEFAULT NULL,
  `staff_department` varchar(255) DEFAULT NULL,
  `staff_register_date` datetime DEFAULT NULL,
  `staff_sex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for travel_reimbursement_item
-- ----------------------------
DROP TABLE IF EXISTS `travel_reimbursement_item`;
CREATE TABLE `travel_reimbursement_item` (
  `tri_id` int(11) NOT NULL AUTO_INCREMENT,
  `tri_tra_id` int(11) DEFAULT NULL,
  `tri_large_class` varchar(255) DEFAULT NULL,
  `tri_small_class` varchar(255) DEFAULT NULL,
  `tri_sheet_number` int(11) DEFAULT NULL,
  `tri_people_number` int(11) DEFAULT NULL,
  `tri_single_price` float(11,2) DEFAULT NULL,
  `tri_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for travel_reimburserment_application
-- ----------------------------
DROP TABLE IF EXISTS `travel_reimburserment_application`;
CREATE TABLE `travel_reimburserment_application` (
  `tra_id` int(11) NOT NULL AUTO_INCREMENT,
  `tra_project_id` int(11) DEFAULT NULL,
  `tra_proposer_id` int(11) DEFAULT NULL,
  `tra_place` varchar(255) DEFAULT NULL,
  `tra_number_of_people` int(11) DEFAULT NULL,
  `tra_travel_time` datetime DEFAULT NULL,
  `tra_remarks` varchar(255) DEFAULT NULL,
  `tra_state` varchar(255) DEFAULT NULL,
  `tra_apply_date` datetime DEFAULT NULL,
  `tra_payment_type` varchar(11) DEFAULT NULL,
  `tra_offset_borrowing_id` int(11) DEFAULT NULL,
  `tra_event_id` int(11) DEFAULT NULL,
  `tra_leave_messages` varchar(255) DEFAULT '无',
  `tra_application_sheet_id` int(11) DEFAULT '0',
  `tra_total_sheets` int(11) DEFAULT NULL,
  `tra_total_money` float(11,2) DEFAULT NULL,
  `tra_finish_date` datetime DEFAULT NULL,
  PRIMARY KEY (`tra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
