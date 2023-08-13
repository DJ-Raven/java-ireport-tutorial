/*
Navicat MySQL Data Transfer

Source Server         : SEVER 3305
Source Server Version : 50620
Source Host           : localhost:3305
Source Database       : simple_report

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2023-08-13 18:46:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `InvoiceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `InvoiceNumber` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `TotalQty` int(11) DEFAULT NULL,
  `TotalAmount` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`InvoiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES ('1', '0000001', '2022-01-04', '04:48:05', '19', '92.31');
INSERT INTO `invoice` VALUES ('2', '0000002', '2022-01-27', '10:22:19', '20', '50.80');
INSERT INTO `invoice` VALUES ('3', '0000003', '2022-02-26', '00:41:53', '16', '77.34');
INSERT INTO `invoice` VALUES ('4', '0000004', '2022-02-13', '23:21:18', '21', '78.29');
INSERT INTO `invoice` VALUES ('5', '0000005', '2022-01-05', '10:16:21', '12', '67.38');
INSERT INTO `invoice` VALUES ('6', '0000006', '2022-01-02', '23:42:55', '7', '50.93');
INSERT INTO `invoice` VALUES ('7', '0000007', '2022-02-28', '06:16:23', '13', '66.87');
INSERT INTO `invoice` VALUES ('8', '0000008', '2022-02-07', '14:47:54', '10', '31.90');
INSERT INTO `invoice` VALUES ('9', '0000009', '2022-02-21', '07:46:36', '16', '41.34');
INSERT INTO `invoice` VALUES ('10', '0000010', '2022-02-10', '04:43:22', '6', '10.44');
INSERT INTO `invoice` VALUES ('11', '0000011', '2022-02-22', '06:03:14', '2', '7.98');
INSERT INTO `invoice` VALUES ('12', '0000012', '2022-01-25', '13:56:05', '10', '30.90');
INSERT INTO `invoice` VALUES ('13', '0000013', '2022-01-04', '17:18:33', '16', '60.34');
INSERT INTO `invoice` VALUES ('14', '0000014', '2022-01-23', '08:20:01', '15', '40.85');
INSERT INTO `invoice` VALUES ('15', '0000015', '2022-01-18', '16:24:49', '29', '151.71');
INSERT INTO `invoice` VALUES ('17', '0000017', '2022-01-15', '17:16:41', '23', '110.77');
INSERT INTO `invoice` VALUES ('18', '0000018', '2022-01-05', '07:16:00', '28', '124.72');
INSERT INTO `invoice` VALUES ('19', '0000019', '2022-02-20', '12:59:20', '19', '83.31');
INSERT INTO `invoice` VALUES ('20', '0000020', '2022-01-29', '02:38:37', '10', '31.40');
INSERT INTO `invoice` VALUES ('21', '0000021', '2022-01-12', '22:39:02', '5', '17.95');
INSERT INTO `invoice` VALUES ('22', '0000022', '2022-01-03', '19:04:11', '23', '63.27');
INSERT INTO `invoice` VALUES ('23', '0000023', '2022-01-27', '02:17:54', '22', '95.28');
INSERT INTO `invoice` VALUES ('24', '0000024', '2022-02-25', '11:40:06', '18', '50.32');
INSERT INTO `invoice` VALUES ('25', '0000025', '2022-02-03', '00:09:48', '14', '55.36');
INSERT INTO `invoice` VALUES ('26', '0000026', '2022-01-21', '22:54:20', '11', '47.89');
INSERT INTO `invoice` VALUES ('27', '0000027', '2022-01-01', '19:22:01', '5', '11.45');
INSERT INTO `invoice` VALUES ('28', '0000028', '2022-01-19', '11:31:17', '19', '84.31');
INSERT INTO `invoice` VALUES ('29', '0000029', '2022-02-25', '07:08:44', '13', '35.87');
INSERT INTO `invoice` VALUES ('30', '0000030', '2022-01-12', '05:44:44', '20', '77.80');
INSERT INTO `invoice` VALUES ('31', '0000031', '2022-02-13', '23:55:55', '4', '11.96');
INSERT INTO `invoice` VALUES ('32', '0000032', '2022-01-14', '15:17:03', '13', '35.87');
INSERT INTO `invoice` VALUES ('33', '0000033', '2022-02-09', '16:04:20', '7', '23.93');
INSERT INTO `invoice` VALUES ('34', '0000034', '2022-02-06', '02:48:04', '9', '33.91');
INSERT INTO `invoice` VALUES ('35', '0000035', '2022-02-14', '18:56:50', '13', '51.87');
INSERT INTO `invoice` VALUES ('36', '0000036', '2022-02-12', '08:05:24', '8', '24.92');
INSERT INTO `invoice` VALUES ('37', '0000037', '2022-02-10', '16:12:20', '10', '26.40');
INSERT INTO `invoice` VALUES ('38', '0000038', '2022-01-26', '07:14:53', '24', '122.76');
INSERT INTO `invoice` VALUES ('39', '0000039', '2022-02-11', '21:26:21', '9', '46.91');
INSERT INTO `invoice` VALUES ('40', '0000040', '2022-02-20', '22:35:48', '34', '116.16');

-- ----------------------------
-- Table structure for invoice_detail
-- ----------------------------
DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE `invoice_detail` (
  `InvoiceDetailID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `InvoiceID` int(10) unsigned NOT NULL,
  `ProductID` int(10) unsigned NOT NULL,
  `Qty` int(11) DEFAULT NULL,
  `Price` float(10,2) DEFAULT NULL,
  `Total` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`InvoiceDetailID`),
  KEY `ProductID` (`ProductID`),
  KEY `InvoiceID` (`InvoiceID`),
  CONSTRAINT `invoice_detail_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `invoice_detail_ibfk_2` FOREIGN KEY (`InvoiceID`) REFERENCES `invoice` (`InvoiceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice_detail
-- ----------------------------
INSERT INTO `invoice_detail` VALUES ('2', '40', '1', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('3', '35', '19', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('4', '24', '19', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('5', '4', '9', '5', '1.99', '9.95');
INSERT INTO `invoice_detail` VALUES ('6', '18', '2', '1', '1.99', '1.99');
INSERT INTO `invoice_detail` VALUES ('7', '40', '9', '1', '1.99', '1.99');
INSERT INTO `invoice_detail` VALUES ('8', '2', '2', '1', '1.99', '1.99');
INSERT INTO `invoice_detail` VALUES ('9', '11', '13', '2', '3.99', '7.98');
INSERT INTO `invoice_detail` VALUES ('10', '18', '4', '4', '3.49', '13.96');
INSERT INTO `invoice_detail` VALUES ('11', '15', '10', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('12', '18', '11', '2', '5.99', '11.98');
INSERT INTO `invoice_detail` VALUES ('13', '1', '17', '1', '3.49', '3.49');
INSERT INTO `invoice_detail` VALUES ('14', '19', '20', '3', '6.49', '19.47');
INSERT INTO `invoice_detail` VALUES ('15', '19', '9', '4', '1.99', '7.96');
INSERT INTO `invoice_detail` VALUES ('16', '28', '14', '2', '7.99', '15.98');
INSERT INTO `invoice_detail` VALUES ('17', '15', '7', '4', '4.99', '19.96');
INSERT INTO `invoice_detail` VALUES ('18', '1', '8', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('19', '22', '8', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('20', '12', '17', '2', '3.49', '6.98');
INSERT INTO `invoice_detail` VALUES ('21', '29', '3', '2', '1.49', '2.98');
INSERT INTO `invoice_detail` VALUES ('22', '1', '5', '1', '0.99', '0.99');
INSERT INTO `invoice_detail` VALUES ('23', '17', '20', '4', '6.49', '25.96');
INSERT INTO `invoice_detail` VALUES ('24', '22', '9', '3', '1.99', '5.97');
INSERT INTO `invoice_detail` VALUES ('25', '4', '12', '4', '6.99', '27.96');
INSERT INTO `invoice_detail` VALUES ('26', '14', '19', '3', '2.99', '8.97');
INSERT INTO `invoice_detail` VALUES ('27', '17', '9', '5', '1.99', '9.95');
INSERT INTO `invoice_detail` VALUES ('28', '9', '10', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('29', '2', '9', '5', '1.99', '9.95');
INSERT INTO `invoice_detail` VALUES ('30', '32', '8', '3', '2.99', '8.97');
INSERT INTO `invoice_detail` VALUES ('31', '22', '6', '5', '2.49', '12.45');
INSERT INTO `invoice_detail` VALUES ('32', '39', '12', '1', '6.99', '6.99');
INSERT INTO `invoice_detail` VALUES ('33', '37', '18', '4', '4.49', '17.96');
INSERT INTO `invoice_detail` VALUES ('34', '27', '9', '1', '1.99', '1.99');
INSERT INTO `invoice_detail` VALUES ('35', '1', '15', '4', '8.99', '35.96');
INSERT INTO `invoice_detail` VALUES ('36', '33', '19', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('37', '23', '10', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('38', '24', '9', '2', '1.99', '3.98');
INSERT INTO `invoice_detail` VALUES ('39', '13', '5', '1', '0.99', '0.99');
INSERT INTO `invoice_detail` VALUES ('40', '4', '3', '2', '1.49', '2.98');
INSERT INTO `invoice_detail` VALUES ('41', '20', '4', '3', '3.49', '10.47');
INSERT INTO `invoice_detail` VALUES ('42', '34', '17', '4', '3.49', '13.96');
INSERT INTO `invoice_detail` VALUES ('43', '14', '9', '1', '1.99', '1.99');
INSERT INTO `invoice_detail` VALUES ('44', '18', '2', '1', '1.99', '1.99');
INSERT INTO `invoice_detail` VALUES ('45', '15', '18', '2', '4.49', '8.98');
INSERT INTO `invoice_detail` VALUES ('46', '27', '6', '3', '2.49', '7.47');
INSERT INTO `invoice_detail` VALUES ('47', '9', '9', '3', '1.99', '5.97');
INSERT INTO `invoice_detail` VALUES ('48', '24', '8', '1', '2.99', '2.99');
INSERT INTO `invoice_detail` VALUES ('49', '6', '14', '5', '7.99', '39.95');
INSERT INTO `invoice_detail` VALUES ('50', '30', '12', '3', '6.99', '20.97');
INSERT INTO `invoice_detail` VALUES ('51', '38', '18', '3', '4.49', '13.47');
INSERT INTO `invoice_detail` VALUES ('52', '18', '13', '5', '3.99', '19.95');
INSERT INTO `invoice_detail` VALUES ('53', '20', '4', '2', '3.49', '6.98');
INSERT INTO `invoice_detail` VALUES ('54', '36', '13', '3', '3.99', '11.97');
INSERT INTO `invoice_detail` VALUES ('55', '39', '17', '2', '3.49', '6.98');
INSERT INTO `invoice_detail` VALUES ('56', '13', '20', '1', '6.49', '6.49');
INSERT INTO `invoice_detail` VALUES ('57', '33', '8', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('58', '5', '12', '4', '6.99', '27.96');
INSERT INTO `invoice_detail` VALUES ('59', '26', '16', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('60', '29', '5', '5', '0.99', '4.95');
INSERT INTO `invoice_detail` VALUES ('61', '40', '18', '3', '4.49', '13.47');
INSERT INTO `invoice_detail` VALUES ('62', '6', '14', '1', '7.99', '7.99');
INSERT INTO `invoice_detail` VALUES ('63', '23', '2', '3', '1.99', '5.97');
INSERT INTO `invoice_detail` VALUES ('64', '2', '3', '3', '1.49', '4.47');
INSERT INTO `invoice_detail` VALUES ('65', '2', '1', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('66', '25', '19', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('67', '3', '11', '2', '5.99', '11.98');
INSERT INTO `invoice_detail` VALUES ('68', '33', '11', '1', '5.99', '5.99');
INSERT INTO `invoice_detail` VALUES ('69', '26', '5', '2', '0.99', '1.98');
INSERT INTO `invoice_detail` VALUES ('70', '4', '16', '3', '2.99', '8.97');
INSERT INTO `invoice_detail` VALUES ('71', '28', '13', '5', '3.99', '19.95');
INSERT INTO `invoice_detail` VALUES ('72', '35', '8', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('73', '12', '13', '2', '3.99', '7.98');
INSERT INTO `invoice_detail` VALUES ('74', '40', '18', '3', '4.49', '13.47');
INSERT INTO `invoice_detail` VALUES ('75', '32', '14', '1', '7.99', '7.99');
INSERT INTO `invoice_detail` VALUES ('76', '1', '2', '3', '1.99', '5.97');
INSERT INTO `invoice_detail` VALUES ('77', '7', '13', '4', '3.99', '15.96');
INSERT INTO `invoice_detail` VALUES ('78', '36', '4', '2', '3.49', '6.98');
INSERT INTO `invoice_detail` VALUES ('79', '17', '7', '3', '4.99', '14.97');
INSERT INTO `invoice_detail` VALUES ('80', '30', '14', '2', '7.99', '15.98');
INSERT INTO `invoice_detail` VALUES ('81', '7', '7', '1', '4.99', '4.99');
INSERT INTO `invoice_detail` VALUES ('82', '19', '6', '5', '2.49', '12.45');
INSERT INTO `invoice_detail` VALUES ('83', '15', '12', '4', '6.99', '27.96');
INSERT INTO `invoice_detail` VALUES ('84', '26', '12', '1', '6.99', '6.99');
INSERT INTO `invoice_detail` VALUES ('85', '5', '18', '1', '4.49', '4.49');
INSERT INTO `invoice_detail` VALUES ('86', '15', '12', '5', '6.99', '34.95');
INSERT INTO `invoice_detail` VALUES ('87', '29', '16', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('88', '17', '7', '2', '4.99', '9.98');
INSERT INTO `invoice_detail` VALUES ('89', '31', '19', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('90', '8', '17', '4', '3.49', '13.96');
INSERT INTO `invoice_detail` VALUES ('91', '17', '12', '4', '6.99', '27.96');
INSERT INTO `invoice_detail` VALUES ('92', '40', '3', '4', '1.49', '5.96');
INSERT INTO `invoice_detail` VALUES ('93', '37', '4', '1', '3.49', '3.49');
INSERT INTO `invoice_detail` VALUES ('94', '2', '9', '1', '1.99', '1.99');
INSERT INTO `invoice_detail` VALUES ('95', '38', '19', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('96', '24', '8', '1', '2.99', '2.99');
INSERT INTO `invoice_detail` VALUES ('97', '15', '20', '5', '6.49', '32.45');
INSERT INTO `invoice_detail` VALUES ('98', '24', '10', '3', '2.99', '8.97');
INSERT INTO `invoice_detail` VALUES ('99', '13', '1', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('100', '22', '5', '3', '0.99', '2.97');
INSERT INTO `invoice_detail` VALUES ('101', '5', '20', '4', '6.49', '25.96');
INSERT INTO `invoice_detail` VALUES ('102', '4', '11', '2', '5.99', '11.98');
INSERT INTO `invoice_detail` VALUES ('103', '22', '1', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('104', '17', '7', '3', '4.99', '14.97');
INSERT INTO `invoice_detail` VALUES ('105', '24', '5', '2', '0.99', '1.98');
INSERT INTO `invoice_detail` VALUES ('106', '30', '3', '3', '1.49', '4.47');
INSERT INTO `invoice_detail` VALUES ('107', '12', '8', '1', '2.99', '2.99');
INSERT INTO `invoice_detail` VALUES ('108', '30', '2', '1', '1.99', '1.99');
INSERT INTO `invoice_detail` VALUES ('109', '9', '9', '3', '1.99', '5.97');
INSERT INTO `invoice_detail` VALUES ('110', '36', '9', '3', '1.99', '5.97');
INSERT INTO `invoice_detail` VALUES ('111', '23', '15', '5', '8.99', '44.95');
INSERT INTO `invoice_detail` VALUES ('112', '30', '4', '3', '3.49', '10.47');
INSERT INTO `invoice_detail` VALUES ('113', '8', '10', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('114', '17', '6', '1', '2.49', '2.49');
INSERT INTO `invoice_detail` VALUES ('115', '19', '19', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('116', '35', '7', '5', '4.99', '24.95');
INSERT INTO `invoice_detail` VALUES ('117', '37', '5', '3', '0.99', '2.97');
INSERT INTO `invoice_detail` VALUES ('118', '28', '14', '2', '7.99', '15.98');
INSERT INTO `invoice_detail` VALUES ('119', '3', '6', '1', '2.49', '2.49');
INSERT INTO `invoice_detail` VALUES ('120', '22', '4', '1', '3.49', '3.49');
INSERT INTO `invoice_detail` VALUES ('121', '40', '8', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('122', '35', '11', '1', '5.99', '5.99');
INSERT INTO `invoice_detail` VALUES ('123', '3', '15', '3', '8.99', '26.97');
INSERT INTO `invoice_detail` VALUES ('124', '18', '14', '5', '7.99', '39.95');
INSERT INTO `invoice_detail` VALUES ('125', '22', '20', '1', '6.49', '6.49');
INSERT INTO `invoice_detail` VALUES ('126', '23', '6', '3', '2.49', '7.47');
INSERT INTO `invoice_detail` VALUES ('127', '40', '16', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('128', '25', '6', '3', '2.49', '7.47');
INSERT INTO `invoice_detail` VALUES ('129', '14', '16', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('130', '15', '2', '2', '1.99', '3.98');
INSERT INTO `invoice_detail` VALUES ('131', '40', '4', '5', '3.49', '17.45');
INSERT INTO `invoice_detail` VALUES ('132', '14', '9', '1', '1.99', '1.99');
INSERT INTO `invoice_detail` VALUES ('133', '3', '19', '3', '2.99', '8.97');
INSERT INTO `invoice_detail` VALUES ('134', '30', '8', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('135', '10', '3', '5', '1.49', '7.45');
INSERT INTO `invoice_detail` VALUES ('136', '13', '18', '3', '4.49', '13.47');
INSERT INTO `invoice_detail` VALUES ('137', '24', '13', '2', '3.99', '7.98');
INSERT INTO `invoice_detail` VALUES ('138', '24', '1', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('139', '5', '16', '3', '2.99', '8.97');
INSERT INTO `invoice_detail` VALUES ('140', '38', '11', '5', '5.99', '29.95');
INSERT INTO `invoice_detail` VALUES ('141', '9', '3', '1', '1.49', '1.49');
INSERT INTO `invoice_detail` VALUES ('142', '31', '19', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('143', '21', '1', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('144', '38', '20', '5', '6.49', '32.45');
INSERT INTO `invoice_detail` VALUES ('145', '15', '17', '5', '3.49', '17.45');
INSERT INTO `invoice_detail` VALUES ('146', '38', '11', '4', '5.99', '23.96');
INSERT INTO `invoice_detail` VALUES ('147', '30', '8', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('148', '27', '9', '1', '1.99', '1.99');
INSERT INTO `invoice_detail` VALUES ('149', '13', '13', '2', '3.99', '7.98');
INSERT INTO `invoice_detail` VALUES ('150', '21', '11', '1', '5.99', '5.99');
INSERT INTO `invoice_detail` VALUES ('151', '4', '6', '1', '2.49', '2.49');
INSERT INTO `invoice_detail` VALUES ('152', '32', '17', '4', '3.49', '13.96');
INSERT INTO `invoice_detail` VALUES ('153', '1', '1', '1', '2.99', '2.99');
INSERT INTO `invoice_detail` VALUES ('154', '28', '16', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('155', '18', '13', '5', '3.99', '19.95');
INSERT INTO `invoice_detail` VALUES ('156', '3', '7', '3', '4.99', '14.97');
INSERT INTO `invoice_detail` VALUES ('157', '9', '11', '1', '5.99', '5.99');
INSERT INTO `invoice_detail` VALUES ('158', '1', '12', '4', '6.99', '27.96');
INSERT INTO `invoice_detail` VALUES ('159', '19', '15', '2', '8.99', '17.98');
INSERT INTO `invoice_detail` VALUES ('160', '9', '6', '4', '2.49', '9.96');
INSERT INTO `invoice_detail` VALUES ('161', '33', '19', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('162', '24', '4', '1', '3.49', '3.49');
INSERT INTO `invoice_detail` VALUES ('163', '8', '19', '1', '2.99', '2.99');
INSERT INTO `invoice_detail` VALUES ('164', '19', '20', '3', '6.49', '19.47');
INSERT INTO `invoice_detail` VALUES ('165', '13', '13', '2', '3.99', '7.98');
INSERT INTO `invoice_detail` VALUES ('166', '6', '10', '1', '2.99', '2.99');
INSERT INTO `invoice_detail` VALUES ('167', '23', '6', '3', '2.49', '7.47');
INSERT INTO `invoice_detail` VALUES ('168', '3', '8', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('169', '14', '16', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('170', '4', '4', '4', '3.49', '13.96');
INSERT INTO `invoice_detail` VALUES ('171', '37', '5', '2', '0.99', '1.98');
INSERT INTO `invoice_detail` VALUES ('172', '40', '12', '1', '6.99', '6.99');
INSERT INTO `invoice_detail` VALUES ('173', '22', '17', '4', '3.49', '13.96');
INSERT INTO `invoice_detail` VALUES ('174', '23', '16', '1', '2.99', '2.99');
INSERT INTO `invoice_detail` VALUES ('175', '40', '5', '1', '0.99', '0.99');
INSERT INTO `invoice_detail` VALUES ('176', '32', '5', '5', '0.99', '4.95');
INSERT INTO `invoice_detail` VALUES ('177', '17', '18', '1', '4.49', '4.49');
INSERT INTO `invoice_detail` VALUES ('178', '34', '11', '1', '5.99', '5.99');
INSERT INTO `invoice_detail` VALUES ('179', '18', '10', '5', '2.99', '14.95');
INSERT INTO `invoice_detail` VALUES ('180', '7', '9', '3', '1.99', '5.97');
INSERT INTO `invoice_detail` VALUES ('181', '25', '11', '5', '5.99', '29.95');
INSERT INTO `invoice_detail` VALUES ('182', '39', '14', '3', '7.99', '23.97');
INSERT INTO `invoice_detail` VALUES ('183', '12', '19', '4', '2.99', '11.96');
INSERT INTO `invoice_detail` VALUES ('184', '26', '14', '3', '7.99', '23.97');
INSERT INTO `invoice_detail` VALUES ('185', '29', '14', '2', '7.99', '15.98');
INSERT INTO `invoice_detail` VALUES ('186', '20', '11', '1', '5.99', '5.99');
INSERT INTO `invoice_detail` VALUES ('187', '20', '9', '4', '1.99', '7.96');
INSERT INTO `invoice_detail` VALUES ('188', '39', '10', '3', '2.99', '8.97');
INSERT INTO `invoice_detail` VALUES ('189', '23', '20', '1', '6.49', '6.49');
INSERT INTO `invoice_detail` VALUES ('190', '2', '4', '5', '3.49', '17.45');
INSERT INTO `invoice_detail` VALUES ('191', '12', '5', '1', '0.99', '0.99');
INSERT INTO `invoice_detail` VALUES ('192', '23', '13', '2', '3.99', '7.98');
INSERT INTO `invoice_detail` VALUES ('193', '10', '16', '1', '2.99', '2.99');
INSERT INTO `invoice_detail` VALUES ('194', '13', '4', '5', '3.49', '17.45');
INSERT INTO `invoice_detail` VALUES ('195', '34', '17', '4', '3.49', '13.96');
INSERT INTO `invoice_detail` VALUES ('196', '25', '1', '2', '2.99', '5.98');
INSERT INTO `invoice_detail` VALUES ('197', '14', '5', '1', '0.99', '0.99');
INSERT INTO `invoice_detail` VALUES ('198', '28', '17', '5', '3.49', '17.45');
INSERT INTO `invoice_detail` VALUES ('199', '7', '14', '5', '7.99', '39.95');
INSERT INTO `invoice_detail` VALUES ('200', '40', '7', '4', '4.99', '19.96');
INSERT INTO `invoice_detail` VALUES ('201', '38', '13', '2', '3.99', '7.98');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ProductID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(255) DEFAULT NULL,
  `SellPrice` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'Coffee', '2.99');
INSERT INTO `product` VALUES ('2', 'Tea', '1.99');
INSERT INTO `product` VALUES ('3', 'Soda', '1.49');
INSERT INTO `product` VALUES ('4', 'Juice', '3.49');
INSERT INTO `product` VALUES ('5', 'Water', '0.99');
INSERT INTO `product` VALUES ('6', 'Milk', '2.49');
INSERT INTO `product` VALUES ('7', 'Smoothie', '4.99');
INSERT INTO `product` VALUES ('8', 'Lemonade', '2.99');
INSERT INTO `product` VALUES ('9', 'Iced Tea', '1.99');
INSERT INTO `product` VALUES ('10', 'Hot Chocolate', '2.99');
INSERT INTO `product` VALUES ('11', 'Mojito', '5.99');
INSERT INTO `product` VALUES ('12', 'Margarita', '6.99');
INSERT INTO `product` VALUES ('13', 'Beer', '3.99');
INSERT INTO `product` VALUES ('14', 'Wine', '7.99');
INSERT INTO `product` VALUES ('15', 'Cocktail', '8.99');
INSERT INTO `product` VALUES ('16', 'Limeade', '2.99');
INSERT INTO `product` VALUES ('17', 'Fruit Punch', '3.49');
INSERT INTO `product` VALUES ('18', 'Milkshake', '4.49');
INSERT INTO `product` VALUES ('19', 'Energy Drink', '2.99');
INSERT INTO `product` VALUES ('20', 'Smoothie Bowl', '6.49');
