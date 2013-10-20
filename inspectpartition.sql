/*
MySQL Data Transfer
Source Host: localhost
Source Database: inspectpartition
Target Host: localhost
Target Database: inspectpartition
Date: 2013/10/20 20:42:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `devname` varchar(255) NOT NULL,
  `numbers` varchar(255) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `device_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `device_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for device_type
-- ----------------------------
DROP TABLE IF EXISTS `device_type`;
CREATE TABLE `device_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `typename` varchar(255) NOT NULL,
  `typenumber` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_item
-- ----------------------------
DROP TABLE IF EXISTS `inspect_item`;
CREATE TABLE `inspect_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_input` varchar(255) NOT NULL,
  `createtime` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `numbers` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `inspecttable_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF94DFE5E2ED15500` (`tag_id`),
  KEY `FKF94DFE5E88803D14` (`inspecttable_id`),
  CONSTRAINT `FKF94DFE5E2ED15500` FOREIGN KEY (`tag_id`) REFERENCES `inspect_tag` (`id`),
  CONSTRAINT `FKF94DFE5E88803D14` FOREIGN KEY (`inspecttable_id`) REFERENCES `inspect_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_item_rec
-- ----------------------------
DROP TABLE IF EXISTS `inspect_item_rec`;
CREATE TABLE `inspect_item_rec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime NOT NULL,
  `ivalue_id` bigint(11) NOT NULL,
  `inspecttable_id` bigint(11) NOT NULL,
  `inspecttablerec_id` bigint(11) NOT NULL,
  `item_id` bigint(11) NOT NULL,
  `tag_id` bigint(11) NOT NULL,
  `worker_id` bigint(11) NOT NULL,
  `dnumber_id` bigint(11) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`createtime`)
) ENGINE=InnoDB AUTO_INCREMENT=5027 DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (YEAR(createtime))
(PARTITION p0 VALUES LESS THAN (2012) ENGINE = InnoDB,
 PARTITION p1 VALUES LESS THAN (2014) ENGINE = InnoDB,
 PARTITION p2 VALUES LESS THAN (2016) ENGINE = InnoDB,
 PARTITION p3 VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;

-- ----------------------------
-- Table structure for inspect_item_record
-- ----------------------------
DROP TABLE IF EXISTS `inspect_item_record`;
CREATE TABLE `inspect_item_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime NOT NULL,
  `ivalue_id` bigint(20) NOT NULL,
  `inspecttable_id` bigint(20) NOT NULL,
  `inspecttablerec_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  `worker_id` bigint(20) NOT NULL,
  `dnumber_id` bigint(20) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5EFD25521D0D930A` (`worker_id`),
  KEY `FK5EFD255285C62414` (`item_id`),
  KEY `FK5EFD2552BD437F29` (`inspecttablerec_id`),
  KEY `FK5EFD2552143C60A9` (`ivalue_id`),
  KEY `FK5EFD25522ED15500` (`tag_id`),
  KEY `FK5EFD255288803D14` (`inspecttable_id`),
  KEY `FK5EFD25524CCFA57D` (`dnumber_id`),
  CONSTRAINT `FK5EFD2552143C60A9` FOREIGN KEY (`ivalue_id`) REFERENCES `tvalue` (`id`),
  CONSTRAINT `FK5EFD25521D0D930A` FOREIGN KEY (`worker_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK5EFD25522ED15500` FOREIGN KEY (`tag_id`) REFERENCES `inspect_tag` (`id`),
  CONSTRAINT `FK5EFD25524CCFA57D` FOREIGN KEY (`dnumber_id`) REFERENCES `device` (`id`),
  CONSTRAINT `FK5EFD255285C62414` FOREIGN KEY (`item_id`) REFERENCES `inspect_item` (`id`),
  CONSTRAINT `FK5EFD255288803D14` FOREIGN KEY (`inspecttable_id`) REFERENCES `inspect_table` (`id`),
  CONSTRAINT `FK5EFD2552BD437F29` FOREIGN KEY (`inspecttablerec_id`) REFERENCES `inspect_table_record` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4877 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_item_tvalues
-- ----------------------------
DROP TABLE IF EXISTS `inspect_item_tvalues`;
CREATE TABLE `inspect_item_tvalues` (
  `inspect_item_id` bigint(20) NOT NULL,
  `tvalue_id` bigint(20) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`inspect_item_id`,`tvalue_id`),
  KEY `FK758DDB5732D25B4` (`tvalue_id`),
  KEY `FK758DDB5E2D8D8E9` (`inspect_item_id`),
  CONSTRAINT `FK758DDB5732D25B4` FOREIGN KEY (`tvalue_id`) REFERENCES `tvalue` (`id`),
  CONSTRAINT `FK758DDB5E2D8D8E9` FOREIGN KEY (`inspect_item_id`) REFERENCES `inspect_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_table
-- ----------------------------
DROP TABLE IF EXISTS `inspect_table`;
CREATE TABLE `inspect_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime NOT NULL,
  `tname` varchar(255) NOT NULL,
  `trole_id` bigint(20) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK310421E33FA7F8D3` (`trole_id`),
  CONSTRAINT `FK310421E33FA7F8D3` FOREIGN KEY (`trole_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_table_record
-- ----------------------------
DROP TABLE IF EXISTS `inspect_table_record`;
CREATE TABLE `inspect_table_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime NOT NULL,
  `faultcount` int(11) DEFAULT NULL,
  `inspecttable_id` bigint(20) NOT NULL,
  `worker_id` bigint(20) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEFA5F22D1D0D930A` (`worker_id`),
  KEY `FKEFA5F22D88803D14` (`inspecttable_id`),
  CONSTRAINT `FKEFA5F22D1D0D930A` FOREIGN KEY (`worker_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKEFA5F22D88803D14` FOREIGN KEY (`inspecttable_id`) REFERENCES `inspect_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_tag
-- ----------------------------
DROP TABLE IF EXISTS `inspect_tag`;
CREATE TABLE `inspect_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `numbers` varchar(255) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_tag_rf_id
-- ----------------------------
DROP TABLE IF EXISTS `inspect_tag_rf_id`;
CREATE TABLE `inspect_tag_rf_id` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `numbers` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `device_id` bigint(20) NOT NULL,
  `tagcag_id` bigint(20) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDFC1A1B67F483B34` (`device_id`),
  KEY `FKDFC1A1B6E5C5168B` (`tagcag_id`),
  CONSTRAINT `FKDFC1A1B67F483B34` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`),
  CONSTRAINT `FKDFC1A1B6E5C5168B` FOREIGN KEY (`tagcag_id`) REFERENCES `inspect_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime NOT NULL,
  `rolename` varchar(255) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for timer
-- ----------------------------
DROP TABLE IF EXISTS `timer`;
CREATE TABLE `timer` (
  `id` int(11) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tvalue
-- ----------------------------
DROP TABLE IF EXISTS `tvalue`;
CREATE TABLE `tvalue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tvalue` varchar(255) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birth` datetime DEFAULT NULL,
  `useraddress` varchar(255) NOT NULL,
  `userage` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userpwd` varchar(255) NOT NULL,
  `usersex` varchar(255) NOT NULL,
  `urole_id` bigint(20) NOT NULL,
  `hascard` varchar(255) NOT NULL,
  `version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6A68E08A78925B2` (`urole_id`),
  CONSTRAINT `FK6A68E08A78925B2` FOREIGN KEY (`urole_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `device` VALUES ('3', '描述1', '设备1', '0001', '1', '1');
INSERT INTO `device` VALUES ('7', '门座式起重机#01', '门座式起重机#01', 'menzuo001', '0', '8');
INSERT INTO `device` VALUES ('8', '门座式起重机#02', '门座式起重机#02', 'menzuo002', '0', '8');
INSERT INTO `device` VALUES ('9', '门座式起重机#03', '门座式起重机#03', 'menzuo003', '0', '8');
INSERT INTO `device` VALUES ('10', '轮胎式集装箱门式起重机#01', '轮胎式集装箱门式起重机#01', 'luntai0001', '0', '9');
INSERT INTO `device` VALUES ('11', '轮胎式集装箱门式起重机#02', '轮胎式集装箱门式起重机#02', 'luntai0002', '0', '9');
INSERT INTO `device` VALUES ('12', '轮胎式集装箱门式起重机#03', '轮胎式集装箱门式起重机#03', 'luntai0003', '0', '9');
INSERT INTO `device_type` VALUES ('1', '2', '描述1', '设备类型1', '0001');
INSERT INTO `device_type` VALUES ('8', '0', '门座式起重机', '门座式起重机', '0001');
INSERT INTO `device_type` VALUES ('9', '0', '轮胎式集装箱门式起重机', '轮胎式集装箱门式起重机', '0002');
INSERT INTO `device_type` VALUES ('10', '0', '岸边式集装箱起重机', '岸边式集装箱起重机', '0003');
INSERT INTO `inspect_item` VALUES ('53', 'false', '2011-07-10 00:00:00', '', '手动铁鞋、锚定', '12212', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('54', 'false', '2013-07-14 00:00:00', '', '行走台车', '123132312', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('55', 'false', '2009-07-15 00:00:00', '', '电动铁鞋', '121212', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('56', 'false', '2010-07-20 00:00:00', '', '行走防撞缓冲器', '21221', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('57', 'false', '2007-07-09 00:00:00', '', '行走电机护栏', '121312', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('58', 'false', '2008-07-15 00:00:00', '', '行走减速箱', '123121', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('59', 'false', '2007-07-18 00:00:00', '', '行走开式齿轮', '121312', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('60', 'false', '2007-07-12 00:00:00', '', '抓斗', '1213123', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('61', 'false', '2009-07-22 00:00:00', '', '钢丝绳及卸扣', '12312312', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('62', 'false', '2007-07-17 00:00:00', '', '旋转齿轮、齿圈', '1211', 'hh', '5', '2', '1');
INSERT INTO `inspect_item` VALUES ('63', 'false', '2005-07-12 00:00:00', '', '旋转制动器', '12112123', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('64', 'false', '2013-07-08 00:00:00', '', '旋转减速器', '2131221', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('65', 'false', '2006-07-04 00:00:00', '', '旋转电机、风机', '21212', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('66', 'false', '2002-07-10 00:00:00', '', '起升制动器', '211212', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('67', 'false', '2006-07-14 00:00:00', '', '卷筒及钢丝绳', '1221', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('68', 'false', '2013-07-17 00:00:00', '', '起升减速箱', '121312', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('69', 'false', '2009-07-07 00:00:00', '', '起升电机、风机', '12312', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('70', 'false', '2008-08-11 00:00:00', '', '起升钢丝绳', '1212221', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('71', 'false', '2009-07-12 00:00:00', '', '集中滑油', '12121', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('72', 'false', '2006-07-06 00:00:00', '', '附属工具', '1221', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('73', 'false', '2013-07-11 00:00:00', '', '机房顶出绳口', '1221312', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('74', 'false', '2008-07-08 00:00:00', '', '变幅电机、风机', '121123', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('75', 'false', '2013-07-11 00:00:00', '', '变幅制动器', '12121', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('76', 'false', '2008-07-08 00:00:00', '', '变幅减速器', '1212133', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('77', 'false', '2008-07-14 00:00:00', '', '变幅齿轮、齿条、压轮', '12121', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('78', 'false', '2007-07-16 00:00:00', '', '变幅联轴节', '12312', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('79', 'false', '2002-07-09 00:00:00', '', 'S轮处', '1212', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('80', 'false', '2007-07-16 00:00:00', '', '各主要绞点', '123123', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('81', 'false', '2011-07-11 00:00:00', '', '各主要绞点', '122123', '', '5', '2', '1');
INSERT INTO `inspect_item` VALUES ('82', 'false', '2005-07-06 00:00:00', '', '各主要绞点', '12121', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('83', 'false', '2013-07-17 00:00:00', '', '各主要绞点', '1211', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('84', 'false', '2013-07-26 00:00:00', '', '梯子及栏杆', '12321', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('85', 'false', '2013-07-18 00:00:00', '', '梯子及栏杆', '112', '', '5', '2', '1');
INSERT INTO `inspect_item` VALUES ('86', 'false', '2013-07-18 00:00:00', '', '梯子及栏杆', '121312', '', '5', '2', '1');
INSERT INTO `inspect_item` VALUES ('87', 'false', '2013-07-11 00:00:00', '', '梯子及栏杆', '12121', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('88', 'false', '2013-07-17 00:00:00', '', '梯子及栏杆', '131212', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('89', 'false', '2013-07-17 00:00:00', '', '机房司机室卫生', '1221', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('90', 'false', '2013-07-17 00:00:00', '', '支持、开闭上升限位', '1221312', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('91', 'false', '2013-07-18 00:00:00', '', '变幅增幅、减幅限位', '11312', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('92', 'false', '2013-07-18 00:00:00', '', '高压电缆及电缆坑', '12312', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('93', 'false', '2005-07-05 00:00:00', '', '联动台指示灯', '21312312', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('94', 'false', '2013-07-26 00:00:00', '', '电气室空调', '1122', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('95', 'false', '2006-07-12 00:00:00', '', '行走声光报警', '12312', '', '5', '1', '1');
INSERT INTO `inspect_item` VALUES ('96', 'false', '2007-07-11 00:00:00', '', '机上照光灯', '11212', '', '5', '2', '1');
INSERT INTO `inspect_item` VALUES ('97', 'false', '2007-07-12 00:00:00', '', ' 机上照光灯', '2112', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('98', 'false', '2008-07-17 00:00:00', '', ' 机上照光灯', '11212', '', '5', '4', '1');
INSERT INTO `inspect_item` VALUES ('99', 'false', '2013-07-08 00:00:00', '', '行走左行、右行限位', '1212', '', '3', '1', '1');
INSERT INTO `inspect_item` VALUES ('100', 'false', '2007-07-15 00:00:00', '', '行走锚定限位', '122132', '', '3', '1', '1');
INSERT INTO `inspect_item` VALUES ('101', 'false', '2008-07-07 00:00:00', '', '行走防爬限位', '1212312', '', '3', '1', '1');
INSERT INTO `inspect_item` VALUES ('102', 'false', '2013-07-22 00:00:00', '', '行走电机', '121', '', '3', '1', '1');
INSERT INTO `inspect_item` VALUES ('103', 'false', '2008-07-07 00:00:00', '', '行走部分线管', '131312', '', '3', '1', '1');
INSERT INTO `inspect_item` VALUES ('104', 'false', '2013-07-11 00:00:00', '', '高压电缆及电缆架', '1221231', '', '3', '1', '1');
INSERT INTO `inspect_item` VALUES ('105', 'false', '2013-07-18 00:00:00', '', '电缆卷盘及导缆架', '1212', '', '3', '1', '1');
INSERT INTO `inspect_item` VALUES ('106', 'false', '2013-07-10 00:00:00', '', '行走声光报警', '123213', '', '3', '1', '1');
INSERT INTO `inspect_item` VALUES ('107', 'false', '2009-07-06 00:00:00', '', '中心受电器', '1212', '', '3', '2', '1');
INSERT INTO `inspect_item` VALUES ('108', 'false', '2008-07-07 00:00:00', '', '起升/开闭制动器打开限位', '12112', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('109', 'false', '2013-07-08 00:00:00', '', '起升/开闭上升、下降限位', '121231', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('110', 'false', '2013-07-09 00:00:00', '', '起升/开闭电机及风机', '2112', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('111', 'false', '2013-07-10 00:00:00', '', '各电器柜', '121', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('112', 'false', '2013-07-17 00:00:00', '', '电器柜照明', '112', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('113', 'false', '2013-07-12 00:00:00', '', '照明变压器', '231212', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('114', 'false', '2013-07-10 00:00:00', '', '旋转电机及风机', '1121', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('115', 'false', '2013-07-09 00:00:00', '', '旋转电机刹车', '1122', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('116', 'false', '2013-07-10 00:00:00', '', '联动台', '1221', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('117', 'false', '2013-07-09 00:00:00', '', '司机室空调', '11212', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('118', 'false', '2013-07-18 00:00:00', '', '监控器及重量幅度显示器', '1221', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('119', 'false', '2013-07-11 00:00:00', '', '电气空调', '1212', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('120', 'false', '2013-07-12 00:00:00', '', '机上照明灯', '21321', '', '3', '4', '1');
INSERT INTO `inspect_item` VALUES ('121', 'false', '2013-07-11 00:00:00', '', '航空灯', '122', '', '3', '4', '1');
INSERT INTO `inspect_item` VALUES ('122', 'false', '2013-07-12 00:00:00', '', '变幅增幅、减幅限位', '1221', '', '3', '4', '1');
INSERT INTO `inspect_item` VALUES ('123', 'false', '2013-07-11 00:00:00', '', '变幅电机及风机', '1231', '', '3', '4', '1');
INSERT INTO `inspect_item` VALUES ('124', 'false', '2013-07-10 00:00:00', '', '高压房', '1212', '', '3', '2', '1');
INSERT INTO `inspect_item` VALUES ('125', 'false', '2013-07-09 00:00:00', '', '司机室配电箱', '12124', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('126', 'false', '2013-07-18 00:00:00', '', '开闭斗脚踏', '12211', '', '3', '3', '1');
INSERT INTO `inspect_item` VALUES ('127', 'false', '2013-07-04 00:00:00', '', '1#走行减速箱', '123131', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('128', 'false', '2007-07-10 00:00:00', '', '2#减速机', '123123', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('129', 'false', '2013-07-12 00:00:00', '', '3#走行减速机', '2113', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('130', 'false', '2013-07-11 00:00:00', '', '4#走行减速机', '12212', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('131', 'false', '2013-07-11 00:00:00', '', '5#走行减速机', '1232312', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('132', 'false', '2013-07-11 00:00:00', '', '6#走行减速机', '21214', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('133', 'false', '2013-07-05 00:00:00', '', '7#走行减速机', '122112', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('134', 'false', '2013-07-04 00:00:00', '', '8#走行减速机', '12123', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('135', 'false', '2013-07-05 00:00:00', '', '左回转减速机', '12123', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('136', 'false', '2013-07-11 00:00:00', '', '右回转减速机', '2123', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('137', 'false', '2013-07-11 00:00:00', '', '支持绳减速机', '12331', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('138', 'false', '2013-07-11 00:00:00', '', '开闭绳减速机', '123123', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('139', 'false', '2013-07-17 00:00:00', '', '变幅用减速机', '21123', '', '4', '1', '1');
INSERT INTO `inspect_item` VALUES ('140', 'false', '2013-07-09 00:00:00', '', '铁鞋、锚定', '', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('141', 'false', '2006-07-10 00:00:00', '', '电动铁鞋', '1231', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('142', 'false', '2007-07-10 00:00:00', '', '卷缆装置', '12323', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('143', 'false', '2007-07-13 00:00:00', '', '行走台车', '1212', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('144', 'false', '2007-07-08 00:00:00', '', '驱动装置', '1211231', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('145', 'false', '2004-07-08 00:00:00', '', '行走轮', '11221', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('146', 'false', '2006-07-17 00:00:00', '', '极限开关', '11212', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('147', 'false', '2006-07-06 00:00:00', '', '报警装置', '11221', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('148', 'false', '2013-07-10 00:00:00', '', '齿轮齿圈', '112321', '', '1', '2', '1');
INSERT INTO `inspect_item` VALUES ('149', 'false', '2005-07-08 00:00:00', '', '旋转大轴承', '123122', '', '1', '2', '1');
INSERT INTO `inspect_item` VALUES ('150', 'false', '2003-07-17 00:00:00', '', '旋转大轴承', '123211', '', '1', '2', '1');
INSERT INTO `inspect_item` VALUES ('151', 'false', '2013-07-18 00:00:00', '', '极限联轴器', '212112', '', '1', '2', '1');
INSERT INTO `inspect_item` VALUES ('152', 'false', '2004-07-12 00:00:00', '', '电机及风机', '111212', '', '1', '2', '1');
INSERT INTO `inspect_item` VALUES ('153', 'false', '2013-07-16 00:00:00', '', '减速箱', '123123', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('154', 'false', '2005-07-11 00:00:00', '', '旋转制动器', '121212', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('155', 'false', '2007-07-10 00:00:00', '', '旋转锚定', '131212', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('156', 'false', '2009-07-16 00:00:00', '', '钢丝绳', '', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('157', 'false', '2008-07-15 00:00:00', '', '钢丝绳', '1221', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('158', 'false', '2007-07-17 00:00:00', '', '钢丝绳绳端', '1211', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('159', 'false', '2007-07-15 00:00:00', '', '滑轮', '1121221', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('160', 'false', '2004-07-12 00:00:00', '', '吊钩', '1111', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('161', 'false', '2013-07-18 00:00:00', '', '抓斗', '12242', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('162', 'false', '2008-07-14 00:00:00', '', '卷筒', '12424', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('163', 'false', '2008-07-09 00:00:00', '', '减速箱', '224242', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('164', 'false', '2004-07-12 00:00:00', '', '联轴器', '12322', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('165', 'false', '2002-07-22 00:00:00', '', '制动器', '42445', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('166', 'false', '2007-07-16 00:00:00', '', '电机及风机', '1122', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('167', 'false', '2005-07-05 00:00:00', '', '齿轮齿条', '4242', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('168', 'false', '2003-07-14 00:00:00', '', '减速箱', '4544654', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('169', 'false', '2004-07-08 00:00:00', '', '联轴器', '24542', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('170', 'false', '2005-07-07 00:00:00', '', '制动器', '56757', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('171', 'false', '2002-07-10 00:00:00', '', '电机及风机', '46546', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('172', 'false', '2013-07-08 00:00:00', '', '绞点', '2242', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('173', 'false', '2013-07-18 00:00:00', '', '绞点', '546434', '', '1', '2', '1');
INSERT INTO `inspect_item` VALUES ('174', 'false', '2006-07-06 00:00:00', '', '绞点', '645654', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('175', 'false', '2013-07-18 00:00:00', '', '绞点', '2423431', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('176', 'false', '2013-07-10 00:00:00', '', '栏杆及踏板', '34535', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('177', 'false', '2013-07-15 00:00:00', '', '栏杆及踏板', '435435', '', '1', '2', '1');
INSERT INTO `inspect_item` VALUES ('178', 'false', '2013-07-19 00:00:00', '', '栏杆及踏板', '6456456', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('179', 'false', '2013-07-19 00:00:00', '', '栏杆及踏板', '46456', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('180', 'false', '2013-07-17 00:00:00', '', '钢结构', '24234', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('181', 'false', '2013-07-18 00:00:00', '', '钢结构', '24454', '', '1', '2', '1');
INSERT INTO `inspect_item` VALUES ('182', 'false', '2013-07-26 00:00:00', '', '钢结构', '4523', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('183', 'false', '2006-07-10 00:00:00', '', '钢结构', '453454', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('184', 'false', '2007-07-12 00:00:00', '', '梯子栏杆', '55345', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('185', 'false', '2013-07-12 00:00:00', '', '梯子栏杆', '42424', '', '1', '2', '1');
INSERT INTO `inspect_item` VALUES ('186', 'false', '2013-07-12 00:00:00', '', '梯子栏杆', '3452', '', '1', '3', '1');
INSERT INTO `inspect_item` VALUES ('187', 'false', '2013-07-19 00:00:00', '', '梯子栏杆', '4555', '', '1', '4', '1');
INSERT INTO `inspect_item` VALUES ('188', 'false', '2013-07-03 00:00:00', '', '1#走行减速机', '2241', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('189', 'false', '2013-07-11 00:00:00', '', '2#走行减速机', '12442', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('190', 'false', '2013-07-19 00:00:00', '', '3#走行减速机', '42424', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('191', 'false', '2013-07-11 00:00:00', '', '4#走行减速机', '242424', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('192', 'false', '2013-07-11 00:00:00', '', '5#走行减速机', '2424', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('193', 'false', '2013-07-18 00:00:00', '', '6#走行减速机', '2424', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('194', 'false', '2013-07-11 00:00:00', '', '7#走行减速机', '11231', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('195', 'false', '2013-07-11 00:00:00', '', '8#走行减速机', '132112', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('196', 'false', '2013-07-04 00:00:00', '', '左回转减速机', '12321', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('197', 'false', '2013-07-12 00:00:00', '', '右回转减速机', '1224', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('198', 'false', '2013-07-11 00:00:00', '', '支持绳减速机', '1221', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('199', 'false', '2013-07-03 00:00:00', '', '开闭绳减速机', '1212', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('200', 'false', '2013-07-12 00:00:00', '', '变幅用减速机', '13121', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('201', 'false', '2013-07-04 00:00:00', '', '压板左开闭', '42224', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('202', 'false', '2013-07-11 00:00:00', '', 'S轮段 磨损 左开闭', '22421', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('203', 'false', '2013-07-05 00:00:00', '', 'S轮段 断丝 左开闭', '452542', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('204', 'false', '2008-07-07 00:00:00', '', '象鼻梁端 左开闭 磨损', '21421', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('205', 'false', '2013-07-11 00:00:00', '', '象鼻梁端 左开闭 断丝', '542542', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('206', 'false', '2013-07-23 00:00:00', '', '绳头 左开闭', '', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('207', 'false', '2013-07-05 00:00:00', '', '卸扣 左开闭', '23121', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('208', 'false', '2013-07-09 00:00:00', '', '压板 右开闭', '2424', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('209', 'false', '2013-07-02 00:00:00', '', '压板 右支持', '12131', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('210', 'false', '2013-07-11 00:00:00', '', '压板 左支持', '12211', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('211', 'false', '2013-07-11 00:00:00', '', 'S轮段 磨损 右开闭', '13112111', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('212', 'false', '2008-07-14 00:00:00', '', ' S轮段 磨损 左支持', '21121', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('213', 'false', '2013-07-12 00:00:00', '', ' S轮段 磨损 右支持', '13112', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('214', 'false', '2013-07-17 00:00:00', '', ' S轮段 断丝 右开闭', '1121', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('215', 'false', '2013-07-12 00:00:00', '', ' S轮段 断丝 左支持', '121212', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('216', 'false', '2007-07-15 00:00:00', '', ' S轮段 断丝 右支持', '2112', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('217', 'false', '2013-07-12 00:00:00', '', '象鼻梁段 磨损 右开闭', '1121', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('218', 'false', '2013-07-19 00:00:00', '', '象鼻梁段 磨损 左支持', '123121', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('219', 'false', '2007-07-16 00:00:00', '', '象鼻梁段 磨损 右支持', '1244', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('220', 'false', '2008-07-21 00:00:00', '', '象鼻梁段 断丝 右开闭', '1123', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('221', 'false', '2013-07-10 00:00:00', '', '象鼻梁段 断丝 左支持', '131231', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('222', 'false', '2013-07-12 00:00:00', '', '象鼻梁段 断丝 右支持', '11222', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('223', 'false', '2013-07-18 00:00:00', '', '绳头 右开闭', '1211', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('224', 'false', '2013-07-19 00:00:00', '', '绳头 左支持', '1121', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('225', 'false', '2013-07-10 00:00:00', '', '绳头 右支持', '21112', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('226', 'false', '2013-07-18 00:00:00', '', '卸扣 右开闭', '1212', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('227', 'false', '2013-07-04 00:00:00', '', '卸扣 左支持', '1312123', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('228', 'false', '2013-07-18 00:00:00', '', '卸扣 右支持', '1211', '', '5', '3', '1');
INSERT INTO `inspect_item` VALUES ('229', 'false', '2007-07-16 00:00:00', '', '集中润滑油箱', '13311', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('230', 'false', '2013-07-09 00:00:00', '', '集中润滑管路泄露检查', '123121', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('231', 'false', '2013-07-12 00:00:00', '', '大齿圈', '131231', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('232', 'false', '2005-07-11 00:00:00', '', '变幅齿圈', '1312312', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('233', 'false', '2007-07-15 00:00:00', '', '行走驱动齿轮', '131212', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('234', 'false', '2013-07-18 00:00:00', '', '开闭减速箱输入输出轴', '1212312', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('235', 'false', '2004-07-12 00:00:00', '', '支持减速箱输入输出轴', '121221', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('236', 'false', '2013-07-25 00:00:00', '', '变幅减速箱输入输出轴', '1231231', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('237', 'false', '2007-07-16 00:00:00', '', '开闭减速箱高速联轴箱', '11212', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('238', 'false', '2006-07-24 00:00:00', '', '开闭卷筒联轴箱', '213123', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('239', 'false', '2006-07-18 00:00:00', '', '支持减速箱高速联轴箱', '1112', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('240', 'false', '2013-07-10 00:00:00', '', '支持卷筒联轴器', '1231123', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('241', 'false', '2013-07-10 00:00:00', '', '开闭卷筒压绳器', '11212', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('242', 'false', '2013-07-18 00:00:00', '', '支持卷筒压绳器', '123112', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('243', 'false', '2013-07-11 00:00:00', '', '象鼻梁钢丝绳托辊', '1221', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('244', 'false', '2013-07-17 00:00:00', '', '负荷取力装置绞点', '12111', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('245', 'false', '2006-07-10 00:00:00', '', '起升制动器绞点', '1211', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('246', 'false', '2013-07-23 00:00:00', '', '开闭制动器绞点', '112312', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('247', 'false', '2009-07-12 00:00:00', '', '变幅制动器绞点', '1231321', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('248', 'false', '2009-07-12 00:00:00', '', '回转制动器绞点', '11231', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('249', 'false', '2007-07-23 00:00:00', '', '脚踏制动器绞点', '1212', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('250', 'false', '2007-07-10 00:00:00', '', '各电动铁鞋绞点', '11221', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('251', 'false', '2013-07-09 00:00:00', '', '大臂支座下左绞点开裂', '1211', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('252', 'false', '2007-07-09 00:00:00', '', '大臂支座下右绞点开裂', '121', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('253', 'false', '2005-07-13 00:00:00', '', '大臂上右绞点开裂', '', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('254', 'false', '2005-07-08 00:00:00', '', '大臂上左绞点开裂', '1211', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('255', 'false', '2013-07-17 00:00:00', '', '机房底根部开裂', '12111', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('256', 'false', '2007-07-18 00:00:00', '', '大齿圈根部开裂', '1212', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('257', 'false', '2007-07-16 00:00:00', '', '象鼻梁尾部各U型槽根部开裂', '12112', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('258', 'false', '2004-07-22 00:00:00', '', '象鼻梁头部各U型槽根部开裂', '', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('259', 'false', '2003-07-22 00:00:00', '', '各机构制动器底座螺栓', '121123', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('260', 'false', '2013-07-08 00:00:00', '', '各机构制动器底座螺栓', '13121', '', '6', '2', '1');
INSERT INTO `inspect_item` VALUES ('261', 'false', '2006-07-10 00:00:00', '', '各机构制动器底座螺栓', '1122', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('262', 'false', '2003-07-23 00:00:00', '', '各机构制动器底座螺栓', '13121', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('263', 'false', '2005-07-14 00:00:00', '', '各机构电机底座螺栓', '121212', '', '6', '1', '1');
INSERT INTO `inspect_item` VALUES ('264', 'false', '2007-07-10 00:00:00', '', '各机构电机底座螺栓', '1221', '', '6', '2', '1');
INSERT INTO `inspect_item` VALUES ('265', 'false', '2005-07-12 00:00:00', '', '各机构电机底座螺栓', '121221', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('266', 'false', '2007-07-17 00:00:00', '', '各机构电机底座螺栓', '112212', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('267', 'false', '2006-07-10 00:00:00', '', '各机构电机底座螺栓', '1212', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('268', 'false', '2003-07-21 00:00:00', '', '支持开闭卷筒支座及轴承盖螺栓', '131221', '', '6', '3', '1');
INSERT INTO `inspect_item` VALUES ('269', 'false', '2008-07-21 00:00:00', '', '变幅摇架支座及轴承盖螺栓', '23112', '', '6', '4', '1');
INSERT INTO `inspect_item` VALUES ('270', 'false', '2013-07-22 00:00:00', '', '合斗时无异响，斗口无变形', '1121', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('271', 'false', '2006-07-03 00:00:00', '', '平衡梁、平衡块平衡良好，抓斗斗体无变形', '1231212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('272', 'false', '2013-07-23 00:00:00', '', '钢丝绳头连接处铝套、重型套环、卸扣无变形', '11212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('273', 'false', '2008-07-14 00:00:00', '', '检查钢丝绳无断丝，楔头处无断丝', '131212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('274', 'false', '2009-07-13 00:00:00', '', '钢丝绳无断丝，绳头检查同上，钩头无变形', '11121', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('275', 'false', '2007-07-17 00:00:00', '', '电缆卷盘无变形，行走时可靠卷放缆', '111212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('276', 'false', '2007-07-17 00:00:00', '', '行走电机风机无变形，无松动', '11212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('277', 'false', '2003-07-14 00:00:00', '', '行走电机、惯性制动器无异响', '111212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('278', 'false', '2005-07-12 00:00:00', '', '行走减速箱无漏油', '11122', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('279', 'false', '2005-07-18 00:00:00', '', '行走开式齿轮无缺油', '1121', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('280', 'false', '2005-07-12 00:00:00', '', '电动防炮器动作可靠', '13112', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('281', 'false', '2002-07-14 00:00:00', '', '手动铁楔无丢失，防风拉锁无锈蚀', '11212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('282', 'false', '2006-07-10 00:00:00', '', '防撞缓冲器无变形及损坏', '121221', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('283', 'false', '2005-07-10 00:00:00', '', '手动锚定能可靠锚定', '121221', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('284', 'false', '2006-07-10 00:00:00', '', '电气箱无碰撞变形', '12312', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('285', 'false', '2001-07-23 00:00:00', '', '行走电机风机无变形、无松动', '11221', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('286', 'false', '2008-07-14 00:00:00', '', '行走减速箱无漏油', '12112', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('287', 'false', '2006-07-12 00:00:00', '', '行走开式齿轮无缺油', '12112', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('288', 'false', '2013-07-15 00:00:00', '', '电动防跑器动作可靠', '13112', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('289', 'false', '2013-07-22 00:00:00', '', '手动铁楔无丢失，防风拉锁无锈蚀', '12121', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('290', 'false', '2004-07-12 00:00:00', '', '防撞缓冲器无变形及损坏', '21212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('291', 'false', '2007-07-17 00:00:00', '', '行走电机风机无变形、无松动', '1212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('292', 'false', '2007-07-17 00:00:00', '', '行走电机、惯性制动器无异响', '1312312', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('293', 'false', '2009-07-14 00:00:00', '', '行走减速箱无漏油', '11212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('294', 'false', '2008-07-21 00:00:00', '', '行走开式齿轮无漏油', '2112312', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('295', 'false', '2006-07-11 00:00:00', '', '电动防跑器动作可靠', '11212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('296', 'false', '2006-07-11 00:00:00', '', '手动铁楔无丢失，防风拉锁无锈蚀', '11121', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('297', 'false', '2007-07-26 00:00:00', '', '防撞缓冲器无变形及损坏', '1112', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('298', 'false', '2007-07-15 00:00:00', '', '手动锚定可靠锚定动作', '13121', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('299', 'false', '2004-07-14 00:00:00', '', '电气箱无碰撞变形', '11131', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('300', 'false', '2005-07-13 00:00:00', '', '行走电机风机无变形', '13131', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('301', 'false', '2005-07-20 00:00:00', '', '行走电机、惯性制动器无异响', '11121', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('302', 'false', '2005-07-12 00:00:00', '', '行走减速箱无漏油', '121212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('303', 'false', '2008-07-15 00:00:00', '', '行走开式齿轮无缺油', '12112', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('304', 'false', '2008-07-14 00:00:00', '', '电动防跑器动作可靠', '11212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('305', 'false', '2006-07-10 00:00:00', '', '手动铁楔无丢失，防风拉锁无锈蚀', '11212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('306', 'false', '2013-07-15 00:00:00', '', '防撞缓冲器无变形及损坏', '131231', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('307', 'false', '2008-07-15 00:00:00', '', '梯子、栏杆无变形，无松动', '11212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('308', 'false', '2013-07-15 00:00:00', '', '大法兰M42螺栓无松动', '1211', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('309', 'false', '2008-07-15 00:00:00', '', '门架内无漏水，无异物，各箱柜无晃动', '11212', '', '2', '1', '1');
INSERT INTO `inspect_item` VALUES ('310', 'false', '2013-07-15 00:00:00', '', '齿圈，小齿轮啮合良好，无漏油，无异响', '1112', '', '2', '2', '1');
INSERT INTO `inspect_item` VALUES ('311', 'false', '2013-07-22 00:00:00', '', 'M42双头螺杆无松动', '1112', '', '2', '2', '1');
INSERT INTO `inspect_item` VALUES ('312', 'false', '2008-07-22 00:00:00', '', '旋转及小齿轮接油盘污物不过多', '12312', '', '2', '2', '1');
INSERT INTO `inspect_item` VALUES ('313', 'false', '2013-07-09 00:00:00', '', '旋转刹车使用正常', '121', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('314', 'false', '2013-07-15 00:00:00', '', '司机室及机器房门和门锁活动灵活，使用可靠', '112312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('315', 'false', '2013-07-09 00:00:00', '', '进门处旋转电机、风机无异响', '1312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('316', 'false', '2013-07-15 00:00:00', '', '旋转刹车片间隙均匀且不过薄，缓冲胶圈无老化', '212131', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('317', 'false', '2007-07-19 00:00:00', '', '旋转减速机油位正常且无漏油', '2112', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('318', 'false', '2013-07-15 00:00:00', '', '旋转减速箱地脚螺栓无松动', '13131', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('319', 'false', '2013-07-22 00:00:00', '', '油桶内不缺油，且机房内各润滑管道接口无漏油', '112312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('320', 'false', '2013-07-18 00:00:00', '', '集中润滑参数设置正确且运行一个循环工作正常', '131312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('321', 'false', '2013-07-09 00:00:00', '', '旋转电机、风机无异响', '1112', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('322', 'false', '2013-07-08 00:00:00', '', '旋转刹车片间隙均匀且不过薄，缓冲胶圈无老化', '21312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('323', 'false', '2013-07-09 00:00:00', '', '旋转减速机油位正常且无漏油', '131212', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('324', 'false', '2013-07-08 00:00:00', '', '旋转减速箱地脚螺栓无松动', '12122', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('325', 'false', '2013-07-08 00:00:00', '', '盘式制动器两侧间隙均匀且制动片不过薄', '1112', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('326', 'false', '2013-07-09 00:00:00', '', '制动器各绞点润滑良好', '1112', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('327', 'false', '2013-07-09 00:00:00', '', '减速箱油位正常，油颜色正常，地脚螺栓无松动', '1123123', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('328', 'false', '2013-07-10 00:00:00', '', '电机、风机及输入联轴节无异响', '1312312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('329', 'false', '2013-07-16 00:00:00', '', '输出轴联轴器无异响', '112312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('330', 'false', '2013-07-18 00:00:00', '', '钢板绳压板无松动，卷轴轴承支座螺栓无松动，挡板无间隙', '1112', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('331', 'false', '2013-07-18 00:00:00', '', '压绳轮位置正确，无变形', '1231212', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('332', 'false', '2013-07-09 00:00:00', '', '卷桶上钢丝绳无断丝、跳槽现象', '12312312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('333', 'false', '2013-07-08 00:00:00', '', '盘式制动器两侧间隙均匀且制动片不过薄', '1212312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('334', 'false', '2013-07-15 00:00:00', '', '制动器各绞点润滑良好', '111', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('335', 'false', '2013-07-16 00:00:00', '', '减速箱油位正常，油颜色正常，地脚螺栓无松动', '212131', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('336', 'false', '2013-07-16 00:00:00', '', '减速箱输入、输出以及制动器轴端无漏油', '11212', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('337', 'false', '2013-07-15 00:00:00', '', '电机、风机及输入轴联轴节无异响', '112321', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('338', 'false', '2013-07-22 00:00:00', '', '输出轴联轴器无异响', '12131', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('339', 'false', '2013-07-17 00:00:00', '', '钢丝绳压板无松动，卷筒轴承支座螺栓无松动，挡块无间隙', '121212', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('340', 'false', '2013-07-16 00:00:00', '', '压绳轮位置正确，无变形', '1112', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('341', 'false', '2013-07-16 00:00:00', '', '卷筒上钢丝绳无断丝、跳槽现象', '1312312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('342', 'false', '2013-07-08 00:00:00', '', '集中润滑各绞点不漏油', '1121', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('343', 'false', '2013-07-15 00:00:00', '', '中心受电器万向节开口销无脱落', '11312', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('344', 'false', '2013-07-16 00:00:00', '', '旋转接油托盘处废油无过多', '1111', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('345', 'false', '2013-07-15 00:00:00', '', '联轴用高强度螺栓无松动', '1131', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('346', 'false', '2013-07-09 00:00:00', '', '钢丝绳出绳口螺栓无松动，转动灵活，铜块无脱落', '111', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('347', 'false', '2013-07-08 00:00:00', '', '集中润滑各连接点无滑油', '121312', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('348', 'false', '2013-07-15 00:00:00', '', '人字架与机器房顶连接螺栓无松动', '1311', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('349', 'false', '2013-07-17 00:00:00', '', '门机低速做起升动作检查钢丝绳断丝磨损情况', '112212', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('350', 'false', '2013-07-08 00:00:00', '', '房顶无油污或其他杂物', '1212312', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('351', 'false', '2013-07-08 00:00:00', '', '电机、风机、联轴节无异响', '131212', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('352', 'false', '2013-07-09 00:00:00', '', '集中润滑各接点无漏油，地面无油污', '1112', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('353', 'false', '2013-07-08 00:00:00', '', '齿条无缺油，压轮无松动', '113123', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('354', 'false', '2013-07-09 00:00:00', '', '地脚螺栓无松动、挡块无间隙', '112312', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('355', 'false', '2013-07-08 00:00:00', '', '低速联轴节无异响，工作正常', '1312', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('356', 'false', '2013-07-08 00:00:00', '', '减速箱输入，输出轴无漏油，油位正常', '12112', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('357', 'false', '2013-07-09 00:00:00', '', '轮式制动器动作灵活，液力推动器位置正确', '1112', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('358', 'false', '2013-07-10 00:00:00', '', '制动片不过薄，打开时双侧间隙均匀', '1312312', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('359', 'false', '2013-07-08 00:00:00', '', '各滑轮无异响，滑轮钢丝绳防跳防槽可靠有效', '1·21112', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('360', 'false', '2013-07-08 00:00:00', '', '滑油油污不严重，滑轮轴承盖螺栓无松动', '1121', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('361', 'false', '2013-07-18 00:00:00', '', '集中润滑分配器及润滑终点接头无漏油', '112121', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('362', 'false', '2013-07-10 00:00:00', '', '平衡量支撑架下焊缝无裂纹', '11212', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('363', 'false', '2013-07-08 00:00:00', '', '平衡梁钢结构无开裂变形', '131312', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('364', 'false', '2008-07-13 00:00:00', '', '绞点润滑良好，油污无过多', '131212', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('365', 'false', '2013-07-08 00:00:00', '', '栏杆无变形', '1311', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('366', 'false', '2013-07-15 00:00:00', '', '托绳轮油污无过多', '11311', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('367', 'false', '2013-07-15 00:00:00', '', '大拉杆钢结构无变形无裂纹', '131212', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('368', 'false', '2013-07-21 00:00:00', '', '钢结构无开裂变形', '11131', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('369', 'false', '2013-07-16 00:00:00', '', '顶端滑轮组罩无变形，钢丝绳防跳槽装置可靠有效', '111212', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('370', 'false', '2013-07-09 00:00:00', '', '集中润滑分配器连接头无滑油', '12313', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('371', 'false', '2013-07-09 00:00:00', '', '底部滑轮组罩无变形，钢丝绳防跳槽装置可靠有效', '1121', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('372', 'false', '2013-07-16 00:00:00', '', '底部脚踏平台及栏杆无开裂变形', '13121', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('373', 'false', '2013-07-08 00:00:00', '', '象鼻梁与大臂绞点处无裂纹', '11231', '', '2', '4', '1');
INSERT INTO `inspect_item` VALUES ('374', 'false', '2013-07-15 00:00:00', '', '栏杆无变形开焊', '11212', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('375', 'false', '2010-07-12 00:00:00', '', '油污无过多', '1121', '', '2', '3', '1');
INSERT INTO `inspect_item` VALUES ('376', 'false', '2009-07-06 00:00:00', '', '大臂与机房连接绞点无裂纹，支座底焊缝无开裂', '1212', '', '2', '3', '1');
INSERT INTO `inspect_item_rec` VALUES ('3884', '2013-09-08 00:00:00', '1', '5', '102', '53', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3885', '2013-09-08 00:00:00', '1', '5', '102', '54', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3886', '2013-09-08 00:00:00', '2', '5', '102', '55', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3887', '2013-09-08 00:00:00', '3', '5', '102', '56', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3888', '2013-09-08 00:00:00', '3', '5', '102', '57', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3889', '2013-09-08 00:00:00', '1', '5', '102', '58', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3890', '2013-09-08 00:00:00', '1', '5', '102', '59', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3891', '2013-09-08 00:00:00', '1', '5', '102', '60', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3892', '2013-09-08 00:00:00', '1', '5', '102', '61', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3893', '2013-09-08 00:00:00', '3', '5', '102', '80', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3894', '2013-09-08 00:00:00', '2', '5', '102', '84', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3895', '2013-09-08 00:00:00', '3', '5', '102', '92', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3896', '2013-09-08 00:00:00', '3', '5', '102', '95', '1', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3897', '2013-09-08 00:00:00', '1', '5', '102', '62', '2', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3898', '2013-09-08 00:00:00', '3', '5', '102', '81', '2', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3899', '2013-09-08 00:00:00', '1', '5', '102', '86', '2', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3900', '2013-09-08 00:00:00', '1', '5', '102', '86', '2', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3901', '2013-09-08 00:00:00', '3', '5', '102', '96', '2', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3902', '2013-09-08 00:00:00', '1', '5', '102', '63', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3903', '2013-09-08 00:00:00', '3', '5', '102', '64', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3904', '2013-09-08 00:00:00', '1', '5', '102', '65', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3905', '2013-09-08 00:00:00', '1', '5', '102', '66', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3906', '2013-09-08 00:00:00', '1', '5', '102', '67', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3907', '2013-09-08 00:00:00', '1', '5', '102', '68', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3908', '2013-09-08 00:00:00', '1', '5', '102', '69', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3909', '2013-09-08 00:00:00', '1', '5', '102', '70', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3910', '2013-09-08 00:00:00', '3', '5', '102', '71', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3911', '2013-09-08 00:00:00', '3', '5', '102', '72', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3912', '2013-09-08 00:00:00', '2', '5', '102', '82', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3913', '2013-09-08 00:00:00', '1', '5', '102', '87', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3914', '2013-09-08 00:00:00', '1', '5', '102', '89', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3915', '2013-09-08 00:00:00', '1', '5', '102', '90', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3916', '2013-09-08 00:00:00', '1', '5', '102', '93', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3917', '2013-09-08 00:00:00', '1', '5', '102', '94', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3918', '2013-09-08 00:00:00', '1', '5', '102', '97', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3919', '2013-09-08 00:00:00', '3', '5', '102', '228', '3', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3920', '2013-09-08 00:00:00', '1', '5', '102', '73', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3921', '2013-09-08 00:00:00', '1', '5', '102', '74', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3922', '2013-09-08 00:00:00', '1', '5', '102', '75', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3923', '2013-09-08 00:00:00', '1', '5', '102', '76', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3924', '2013-09-08 00:00:00', '1', '5', '102', '77', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3925', '2013-09-08 00:00:00', '1', '5', '102', '78', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3926', '2013-09-08 00:00:00', '1', '5', '102', '79', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3927', '2013-09-08 00:00:00', '3', '5', '102', '83', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3928', '2013-09-08 00:00:00', '1', '5', '102', '88', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3929', '2013-09-08 00:00:00', '2', '5', '102', '91', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3930', '2013-09-08 00:00:00', '1', '5', '102', '98', '4', '2', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3931', '2013-08-09 00:00:00', '1', '2', '99', '270', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3932', '2013-08-09 00:00:00', '3', '2', '99', '271', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3933', '2013-08-09 00:00:00', '2', '2', '99', '272', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3934', '2013-08-09 00:00:00', '1', '2', '99', '273', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3935', '2013-08-09 00:00:00', '1', '2', '99', '274', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3936', '2013-08-09 00:00:00', '3', '2', '99', '275', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3937', '2013-08-09 00:00:00', '1', '2', '99', '276', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3938', '2013-08-09 00:00:00', '1', '2', '99', '301', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3939', '2013-08-09 00:00:00', '1', '2', '99', '302', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3940', '2013-08-09 00:00:00', '1', '2', '99', '303', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3941', '2013-08-09 00:00:00', '1', '2', '99', '280', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3942', '2013-08-09 00:00:00', '1', '2', '99', '305', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3943', '2013-08-09 00:00:00', '1', '2', '99', '306', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3944', '2013-08-09 00:00:00', '1', '2', '99', '283', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3945', '2013-08-09 00:00:00', '1', '2', '99', '299', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3946', '2013-08-09 00:00:00', '1', '2', '99', '291', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3947', '2013-08-09 00:00:00', '1', '2', '99', '302', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3948', '2013-08-09 00:00:00', '1', '2', '99', '303', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3949', '2013-08-09 00:00:00', '1', '2', '99', '304', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3950', '2013-08-09 00:00:00', '1', '2', '99', '305', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3951', '2013-08-09 00:00:00', '1', '2', '99', '306', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3952', '2013-08-09 00:00:00', '3', '2', '99', '291', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3953', '2013-08-09 00:00:00', '2', '2', '99', '301', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3954', '2013-08-09 00:00:00', '1', '2', '99', '302', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3955', '2013-08-09 00:00:00', '1', '2', '99', '294', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3956', '2013-08-09 00:00:00', '1', '2', '99', '304', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3957', '2013-08-09 00:00:00', '3', '2', '99', '305', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3958', '2013-08-09 00:00:00', '1', '2', '99', '306', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3959', '2013-08-09 00:00:00', '3', '2', '99', '298', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3960', '2013-08-09 00:00:00', '2', '2', '99', '299', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3961', '2013-08-09 00:00:00', '1', '2', '99', '300', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3962', '2013-08-09 00:00:00', '1', '2', '99', '301', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3963', '2013-08-09 00:00:00', '1', '2', '99', '302', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3964', '2013-08-09 00:00:00', '1', '2', '99', '303', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3965', '2013-08-09 00:00:00', '3', '2', '99', '304', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3966', '2013-08-09 00:00:00', '1', '2', '99', '305', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3967', '2013-08-09 00:00:00', '1', '2', '99', '306', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3968', '2013-08-09 00:00:00', '1', '2', '99', '307', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3969', '2013-08-09 00:00:00', '3', '2', '99', '308', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3970', '2013-08-09 00:00:00', '2', '2', '99', '309', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3971', '2013-08-09 00:00:00', '1', '2', '99', '310', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3972', '2013-08-09 00:00:00', '1', '2', '99', '311', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3973', '2013-08-09 00:00:00', '3', '2', '99', '312', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3974', '2013-08-09 00:00:00', '3', '2', '99', '313', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3975', '2013-08-09 00:00:00', '2', '2', '99', '314', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3976', '2013-08-09 00:00:00', '3', '2', '99', '315', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3977', '2013-08-09 00:00:00', '3', '2', '99', '322', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3978', '2013-08-09 00:00:00', '1', '2', '99', '323', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3979', '2013-08-09 00:00:00', '1', '2', '99', '324', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3980', '2013-08-09 00:00:00', '1', '2', '99', '319', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3981', '2013-08-09 00:00:00', '3', '2', '99', '320', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3982', '2013-08-09 00:00:00', '1', '2', '99', '321', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3983', '2013-08-09 00:00:00', '3', '2', '99', '322', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3984', '2013-08-09 00:00:00', '1', '2', '99', '323', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3985', '2013-08-09 00:00:00', '3', '2', '99', '324', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3986', '2013-08-09 00:00:00', '1', '2', '99', '333', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3987', '2013-08-09 00:00:00', '3', '2', '99', '334', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3988', '2013-08-09 00:00:00', '1', '2', '99', '335', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3989', '2013-08-09 00:00:00', '1', '2', '99', '328', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3990', '2013-08-09 00:00:00', '3', '2', '99', '338', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3991', '2013-08-09 00:00:00', '2', '2', '99', '330', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3992', '2013-08-09 00:00:00', '3', '2', '99', '340', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3993', '2013-08-09 00:00:00', '3', '2', '99', '332', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3994', '2013-08-09 00:00:00', '1', '2', '99', '333', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3995', '2013-08-09 00:00:00', '1', '2', '99', '334', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3996', '2013-08-09 00:00:00', '1', '2', '99', '335', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3997', '2013-08-09 00:00:00', '1', '2', '99', '336', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3998', '2013-08-09 00:00:00', '3', '2', '99', '337', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('3999', '2013-08-09 00:00:00', '2', '2', '99', '338', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4000', '2013-08-09 00:00:00', '1', '2', '99', '339', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4001', '2013-08-09 00:00:00', '1', '2', '99', '340', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4002', '2013-08-09 00:00:00', '3', '2', '99', '341', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4003', '2013-08-09 00:00:00', '1', '2', '99', '342', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4004', '2013-08-09 00:00:00', '3', '2', '99', '343', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4005', '2013-08-09 00:00:00', '2', '2', '99', '344', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4006', '2013-08-09 00:00:00', '1', '2', '99', '345', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4007', '2013-08-09 00:00:00', '3', '2', '99', '374', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4008', '2013-08-09 00:00:00', '3', '2', '99', '375', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4009', '2013-08-09 00:00:00', '1', '2', '99', '376', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4010', '2013-08-09 00:00:00', '1', '2', '99', '346', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4011', '2013-08-09 00:00:00', '1', '2', '99', '347', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4012', '2013-08-09 00:00:00', '3', '2', '99', '348', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4013', '2013-08-09 00:00:00', '2', '2', '99', '349', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4014', '2013-08-09 00:00:00', '2', '2', '99', '350', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4015', '2013-08-09 00:00:00', '3', '2', '99', '351', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4016', '2013-08-09 00:00:00', '1', '2', '99', '352', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4017', '2013-08-09 00:00:00', '1', '2', '99', '353', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4018', '2013-08-09 00:00:00', '1', '2', '99', '354', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4019', '2013-08-09 00:00:00', '1', '2', '99', '355', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4020', '2013-08-09 00:00:00', '1', '2', '99', '356', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4021', '2013-08-09 00:00:00', '1', '2', '99', '357', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4022', '2013-08-09 00:00:00', '1', '2', '99', '358', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4023', '2013-08-09 00:00:00', '3', '2', '99', '359', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4024', '2013-08-09 00:00:00', '1', '2', '99', '360', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4025', '2013-08-09 00:00:00', '1', '2', '99', '361', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4026', '2013-08-09 00:00:00', '3', '2', '99', '362', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4027', '2013-08-09 00:00:00', '1', '2', '99', '363', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4028', '2013-08-09 00:00:00', '1', '2', '99', '364', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4029', '2013-08-09 00:00:00', '1', '2', '99', '365', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4030', '2013-08-09 00:00:00', '1', '2', '99', '366', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4031', '2013-08-09 00:00:00', '1', '2', '99', '367', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4032', '2013-08-09 00:00:00', '1', '2', '99', '368', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4033', '2013-08-09 00:00:00', '3', '2', '99', '369', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4034', '2013-08-09 00:00:00', '2', '2', '99', '370', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4035', '2013-08-09 00:00:00', '1', '2', '99', '371', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4036', '2013-08-09 00:00:00', '1', '2', '99', '372', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4037', '2013-08-09 00:00:00', '1', '2', '99', '373', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4038', '2012-08-09 00:00:00', '1', '1', '104', '140', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4039', '2012-08-09 00:00:00', '2', '1', '104', '141', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4040', '2012-08-09 00:00:00', '3', '1', '104', '142', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4041', '2012-08-09 00:00:00', '1', '1', '104', '143', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4042', '2012-08-09 00:00:00', '1', '1', '104', '144', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4043', '2012-08-09 00:00:00', '3', '1', '104', '145', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4044', '2012-08-09 00:00:00', '2', '1', '104', '146', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4045', '2012-08-09 00:00:00', '1', '1', '104', '147', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4046', '2012-08-09 00:00:00', '1', '1', '104', '158', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4047', '2012-08-09 00:00:00', '3', '1', '104', '160', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4048', '2012-08-09 00:00:00', '3', '1', '104', '161', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4049', '2012-08-09 00:00:00', '3', '1', '104', '172', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4050', '2012-08-09 00:00:00', '1', '1', '104', '176', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4051', '2012-08-09 00:00:00', '1', '1', '104', '180', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4052', '2012-08-09 00:00:00', '1', '1', '104', '184', '1', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4053', '2012-08-09 00:00:00', '1', '1', '104', '148', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4054', '2012-08-09 00:00:00', '1', '1', '104', '150', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4055', '2012-08-09 00:00:00', '1', '1', '104', '150', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4056', '2012-08-09 00:00:00', '3', '1', '104', '151', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4057', '2012-08-09 00:00:00', '1', '1', '104', '152', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4058', '2012-08-09 00:00:00', '1', '1', '104', '173', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4059', '2012-08-09 00:00:00', '1', '1', '104', '177', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4060', '2012-08-09 00:00:00', '1', '1', '104', '181', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4061', '2012-08-09 00:00:00', '3', '1', '104', '185', '2', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4062', '2012-08-09 00:00:00', '1', '1', '104', '163', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4063', '2012-08-09 00:00:00', '1', '1', '104', '154', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4064', '2012-08-09 00:00:00', '1', '1', '104', '155', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4065', '2012-08-09 00:00:00', '1', '1', '104', '156', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4066', '2012-08-09 00:00:00', '1', '1', '104', '162', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4067', '2012-08-09 00:00:00', '1', '1', '104', '163', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4068', '2012-08-09 00:00:00', '1', '1', '104', '164', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4069', '2012-08-09 00:00:00', '3', '1', '104', '165', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4070', '2012-08-09 00:00:00', '2', '1', '104', '166', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4071', '2012-08-09 00:00:00', '1', '1', '104', '174', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4072', '2012-08-09 00:00:00', '1', '1', '104', '178', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4073', '2012-08-09 00:00:00', '1', '1', '104', '182', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4074', '2012-08-09 00:00:00', '1', '1', '104', '186', '3', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4075', '2012-08-09 00:00:00', '1', '1', '104', '157', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4076', '2012-08-09 00:00:00', '1', '1', '104', '159', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4077', '2012-08-09 00:00:00', '1', '1', '104', '167', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4078', '2012-08-09 00:00:00', '1', '1', '104', '168', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4079', '2012-08-09 00:00:00', '1', '1', '104', '169', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4080', '2012-08-09 00:00:00', '1', '1', '104', '170', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4081', '2012-08-09 00:00:00', '3', '1', '104', '171', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4082', '2012-08-09 00:00:00', '3', '1', '104', '175', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4083', '2012-08-09 00:00:00', '3', '1', '104', '179', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4084', '2012-08-09 00:00:00', '1', '1', '104', '183', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4085', '2012-08-09 00:00:00', '1', '1', '104', '187', '4', '3', '3', null);
INSERT INTO `inspect_item_rec` VALUES ('4377', '2013-09-05 00:00:00', '1', '5', '112', '53', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4378', '2013-09-05 00:00:00', '1', '5', '112', '54', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4379', '2013-09-05 00:00:00', '1', '5', '112', '55', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4380', '2013-09-05 00:00:00', '1', '5', '112', '56', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4381', '2013-09-05 00:00:00', '1', '5', '112', '57', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4382', '2013-09-05 00:00:00', '1', '5', '112', '58', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4383', '2013-09-05 00:00:00', '1', '5', '112', '59', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4384', '2013-09-05 00:00:00', '1', '5', '112', '60', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4385', '2013-09-05 00:00:00', '1', '5', '112', '61', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4386', '2013-09-05 00:00:00', '1', '5', '112', '80', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4387', '2013-09-05 00:00:00', '2', '5', '112', '84', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4388', '2013-09-05 00:00:00', '1', '5', '112', '92', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4389', '2013-09-05 00:00:00', '1', '5', '112', '95', '1', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4390', '2013-09-05 00:00:00', '2', '5', '112', '62', '2', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4391', '2013-09-05 00:00:00', '1', '5', '112', '81', '2', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4392', '2013-09-05 00:00:00', '1', '5', '112', '86', '2', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4393', '2013-09-05 00:00:00', '1', '5', '112', '86', '2', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4394', '2013-09-05 00:00:00', '2', '5', '112', '96', '2', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4395', '2013-09-05 00:00:00', '1', '5', '112', '63', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4396', '2013-09-05 00:00:00', '1', '5', '112', '64', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4397', '2013-09-05 00:00:00', '1', '5', '112', '65', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4398', '2013-09-05 00:00:00', '1', '5', '112', '66', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4399', '2013-09-05 00:00:00', '1', '5', '112', '67', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4400', '2013-09-05 00:00:00', '1', '5', '112', '68', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4401', '2013-09-05 00:00:00', '1', '5', '112', '69', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4402', '2013-09-05 00:00:00', '2', '5', '112', '70', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4403', '2013-09-05 00:00:00', '1', '5', '112', '71', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4404', '2013-09-05 00:00:00', '1', '5', '112', '72', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4405', '2013-09-05 00:00:00', '2', '5', '112', '82', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4406', '2013-09-05 00:00:00', '1', '5', '112', '87', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4407', '2013-09-05 00:00:00', '1', '5', '112', '89', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4408', '2013-09-05 00:00:00', '1', '5', '112', '90', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4409', '2013-09-05 00:00:00', '1', '5', '112', '93', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4410', '2013-09-05 00:00:00', '1', '5', '112', '94', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4411', '2013-09-05 00:00:00', '1', '5', '112', '97', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4412', '2013-09-05 00:00:00', '1', '5', '112', '228', '3', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4413', '2013-09-05 00:00:00', '1', '5', '112', '73', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4414', '2013-09-05 00:00:00', '1', '5', '112', '74', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4415', '2013-09-05 00:00:00', '1', '5', '112', '75', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4416', '2013-09-05 00:00:00', '1', '5', '112', '76', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4417', '2013-09-05 00:00:00', '1', '5', '112', '77', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4418', '2013-09-05 00:00:00', '1', '5', '112', '78', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4419', '2013-09-05 00:00:00', '1', '5', '112', '79', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4420', '2013-09-05 00:00:00', '1', '5', '112', '83', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4421', '2013-09-05 00:00:00', '2', '5', '112', '88', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4422', '2013-09-05 00:00:00', '1', '5', '112', '91', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4423', '2013-09-05 00:00:00', '1', '5', '112', '98', '4', '32', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4424', '2013-09-05 00:00:00', '1', '3', '113', '99', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4425', '2013-09-05 00:00:00', '1', '3', '113', '100', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4426', '2013-09-05 00:00:00', '1', '3', '113', '101', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4427', '2013-09-05 00:00:00', '1', '3', '113', '102', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4428', '2013-09-05 00:00:00', '1', '3', '113', '103', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4429', '2013-09-05 00:00:00', '1', '3', '113', '104', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4430', '2013-09-05 00:00:00', '1', '3', '113', '105', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4431', '2013-09-05 00:00:00', '1', '3', '113', '106', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4432', '2013-09-05 00:00:00', '1', '3', '113', '107', '2', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4433', '2013-09-05 00:00:00', '2', '3', '113', '124', '2', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4434', '2013-09-05 00:00:00', '1', '3', '113', '108', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4435', '2013-09-05 00:00:00', '1', '3', '113', '109', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4436', '2013-09-05 00:00:00', '1', '3', '113', '110', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4437', '2013-09-05 00:00:00', '1', '3', '113', '111', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4438', '2013-09-05 00:00:00', '1', '3', '113', '112', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4439', '2013-09-05 00:00:00', '1', '3', '113', '113', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4440', '2013-09-05 00:00:00', '1', '3', '113', '114', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4441', '2013-09-05 00:00:00', '1', '3', '113', '115', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4442', '2013-09-05 00:00:00', '1', '3', '113', '116', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4443', '2013-09-05 00:00:00', '1', '3', '113', '117', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4444', '2013-09-05 00:00:00', '1', '3', '113', '118', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4445', '2013-09-05 00:00:00', '1', '3', '113', '119', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4446', '2013-09-05 00:00:00', '1', '3', '113', '125', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4447', '2013-09-05 00:00:00', '2', '3', '113', '126', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4448', '2013-09-05 00:00:00', '1', '3', '113', '120', '4', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4449', '2013-09-05 00:00:00', '1', '3', '113', '121', '4', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4450', '2013-09-05 00:00:00', '1', '3', '113', '122', '4', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4451', '2013-09-05 00:00:00', '2', '3', '113', '123', '4', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4452', '2013-09-01 00:00:00', '1', '5', '114', '53', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4453', '2013-09-01 00:00:00', '1', '5', '114', '54', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4454', '2013-09-01 00:00:00', '1', '5', '114', '55', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4455', '2013-09-01 00:00:00', '1', '5', '114', '56', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4456', '2013-09-01 00:00:00', '1', '5', '114', '57', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4457', '2013-09-01 00:00:00', '1', '5', '114', '58', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4458', '2013-09-01 00:00:00', '1', '5', '114', '59', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4459', '2013-09-01 00:00:00', '1', '5', '114', '60', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4460', '2013-09-01 00:00:00', '1', '5', '114', '61', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4461', '2013-09-01 00:00:00', '1', '5', '114', '80', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4462', '2013-09-01 00:00:00', '2', '5', '114', '84', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4463', '2013-09-01 00:00:00', '1', '5', '114', '92', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4464', '2013-09-01 00:00:00', '1', '5', '114', '95', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4465', '2013-09-01 00:00:00', '2', '5', '114', '62', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4466', '2013-09-01 00:00:00', '1', '5', '114', '81', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4467', '2013-09-01 00:00:00', '1', '5', '114', '86', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4468', '2013-09-01 00:00:00', '1', '5', '114', '86', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4469', '2013-09-01 00:00:00', '2', '5', '114', '96', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4470', '2013-09-01 00:00:00', '1', '5', '114', '63', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4471', '2013-09-01 00:00:00', '1', '5', '114', '64', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4472', '2013-09-01 00:00:00', '1', '5', '114', '65', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4473', '2013-09-01 00:00:00', '1', '5', '114', '66', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4474', '2013-09-01 00:00:00', '1', '5', '114', '67', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4475', '2013-09-01 00:00:00', '1', '5', '114', '68', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4476', '2013-09-01 00:00:00', '1', '5', '114', '69', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4477', '2013-09-01 00:00:00', '2', '5', '114', '70', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4478', '2013-09-01 00:00:00', '1', '5', '114', '71', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4479', '2013-09-01 00:00:00', '1', '5', '114', '72', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4480', '2013-09-01 00:00:00', '2', '5', '114', '82', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4481', '2013-09-01 00:00:00', '1', '5', '114', '87', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4482', '2013-09-01 00:00:00', '1', '5', '114', '89', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4483', '2013-09-01 00:00:00', '1', '5', '114', '90', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4484', '2013-09-01 00:00:00', '1', '5', '114', '93', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4485', '2013-09-01 00:00:00', '1', '5', '114', '94', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4486', '2013-09-01 00:00:00', '1', '5', '114', '97', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4487', '2013-09-01 00:00:00', '1', '5', '114', '228', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4488', '2013-09-01 00:00:00', '1', '5', '114', '73', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4489', '2013-09-01 00:00:00', '1', '5', '114', '74', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4490', '2013-09-01 00:00:00', '1', '5', '114', '75', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4491', '2013-09-01 00:00:00', '1', '5', '114', '76', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4492', '2013-09-01 00:00:00', '1', '5', '114', '77', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4493', '2013-09-01 00:00:00', '1', '5', '114', '78', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4494', '2013-09-01 00:00:00', '1', '5', '114', '79', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4495', '2013-09-01 00:00:00', '1', '5', '114', '83', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4496', '2013-09-01 00:00:00', '2', '5', '114', '88', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4497', '2013-09-01 00:00:00', '1', '5', '114', '91', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4498', '2013-09-01 00:00:00', '1', '5', '114', '98', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4499', '2013-08-30 00:00:00', '1', '5', '115', '53', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4500', '2013-08-30 00:00:00', '1', '5', '115', '54', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4501', '2013-08-30 00:00:00', '1', '5', '115', '55', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4502', '2013-08-30 00:00:00', '1', '5', '115', '56', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4503', '2013-08-30 00:00:00', '1', '5', '115', '57', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4504', '2013-08-30 00:00:00', '1', '5', '115', '58', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4505', '2013-08-30 00:00:00', '1', '5', '115', '59', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4506', '2013-08-30 00:00:00', '1', '5', '115', '60', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4507', '2013-08-30 00:00:00', '1', '5', '115', '61', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4508', '2013-08-30 00:00:00', '1', '5', '115', '80', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4509', '2013-08-30 00:00:00', '2', '5', '115', '84', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4510', '2013-08-30 00:00:00', '1', '5', '115', '92', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4511', '2013-08-30 00:00:00', '1', '5', '115', '95', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4512', '2013-08-30 00:00:00', '2', '5', '115', '62', '2', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4513', '2013-08-30 00:00:00', '1', '5', '115', '81', '2', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4514', '2013-08-30 00:00:00', '1', '5', '115', '86', '2', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4515', '2013-08-30 00:00:00', '1', '5', '115', '86', '2', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4516', '2013-08-30 00:00:00', '2', '5', '115', '96', '2', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4517', '2013-08-30 00:00:00', '1', '5', '115', '63', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4518', '2013-08-30 00:00:00', '1', '5', '115', '64', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4519', '2013-08-30 00:00:00', '1', '5', '115', '65', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4520', '2013-08-30 00:00:00', '1', '5', '115', '66', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4521', '2013-08-30 00:00:00', '1', '5', '115', '67', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4522', '2013-08-30 00:00:00', '1', '5', '115', '68', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4523', '2013-08-30 00:00:00', '1', '5', '115', '69', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4524', '2013-08-30 00:00:00', '2', '5', '115', '70', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4525', '2013-08-30 00:00:00', '1', '5', '115', '71', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4526', '2013-08-30 00:00:00', '1', '5', '115', '72', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4527', '2013-08-30 00:00:00', '2', '5', '115', '82', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4528', '2013-08-30 00:00:00', '1', '5', '115', '87', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4529', '2013-08-30 00:00:00', '1', '5', '115', '89', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4530', '2013-08-30 00:00:00', '1', '5', '115', '90', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4531', '2013-08-30 00:00:00', '1', '5', '115', '93', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4532', '2013-08-30 00:00:00', '1', '5', '115', '94', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4533', '2013-08-30 00:00:00', '1', '5', '115', '97', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4534', '2013-08-30 00:00:00', '1', '5', '115', '228', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4535', '2013-08-30 00:00:00', '1', '5', '115', '73', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4536', '2013-08-30 00:00:00', '1', '5', '115', '74', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4537', '2013-08-30 00:00:00', '1', '5', '115', '75', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4538', '2013-08-30 00:00:00', '1', '5', '115', '76', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4539', '2013-08-30 00:00:00', '1', '5', '115', '77', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4540', '2013-08-30 00:00:00', '1', '5', '115', '78', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4541', '2013-08-30 00:00:00', '1', '5', '115', '79', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4542', '2013-08-30 00:00:00', '1', '5', '115', '83', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4543', '2013-08-30 00:00:00', '2', '5', '115', '88', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4544', '2013-08-30 00:00:00', '1', '5', '115', '91', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4545', '2013-08-30 00:00:00', '1', '5', '115', '98', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4546', '2013-09-04 00:00:00', '1', '5', '116', '53', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4547', '2013-09-04 00:00:00', '1', '5', '116', '54', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4548', '2013-09-04 00:00:00', '1', '5', '116', '55', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4549', '2013-09-04 00:00:00', '1', '5', '116', '56', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4550', '2013-09-04 00:00:00', '1', '5', '116', '57', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4551', '2013-09-04 00:00:00', '1', '5', '116', '58', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4552', '2013-09-04 00:00:00', '1', '5', '116', '59', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4553', '2013-09-04 00:00:00', '1', '5', '116', '60', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4554', '2013-09-04 00:00:00', '1', '5', '116', '61', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4555', '2013-09-04 00:00:00', '1', '5', '116', '80', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4556', '2013-09-04 00:00:00', '2', '5', '116', '84', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4557', '2013-09-04 00:00:00', '1', '5', '116', '92', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4558', '2013-09-04 00:00:00', '1', '5', '116', '95', '1', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4559', '2013-09-04 00:00:00', '2', '5', '116', '62', '2', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4560', '2013-09-04 00:00:00', '1', '5', '116', '81', '2', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4561', '2013-09-04 00:00:00', '1', '5', '116', '86', '2', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4562', '2013-09-04 00:00:00', '1', '5', '116', '86', '2', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4563', '2013-09-04 00:00:00', '2', '5', '116', '96', '2', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4564', '2013-09-04 00:00:00', '1', '5', '116', '63', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4565', '2013-09-04 00:00:00', '1', '5', '116', '64', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4566', '2013-09-04 00:00:00', '1', '5', '116', '65', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4567', '2013-09-04 00:00:00', '1', '5', '116', '66', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4568', '2013-09-04 00:00:00', '1', '5', '116', '67', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4569', '2013-09-04 00:00:00', '1', '5', '116', '68', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4570', '2013-09-04 00:00:00', '1', '5', '116', '69', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4571', '2013-09-04 00:00:00', '2', '5', '116', '70', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4572', '2013-09-04 00:00:00', '1', '5', '116', '71', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4573', '2013-09-04 00:00:00', '1', '5', '116', '72', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4574', '2013-09-04 00:00:00', '2', '5', '116', '82', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4575', '2013-09-04 00:00:00', '1', '5', '116', '87', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4576', '2013-09-04 00:00:00', '1', '5', '116', '89', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4577', '2013-09-04 00:00:00', '1', '5', '116', '90', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4578', '2013-09-04 00:00:00', '1', '5', '116', '93', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4579', '2013-09-04 00:00:00', '1', '5', '116', '94', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4580', '2013-09-04 00:00:00', '1', '5', '116', '97', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4581', '2013-09-04 00:00:00', '1', '5', '116', '228', '3', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4582', '2013-09-04 00:00:00', '1', '5', '116', '73', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4583', '2013-09-04 00:00:00', '1', '5', '116', '74', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4584', '2013-09-04 00:00:00', '1', '5', '116', '75', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4585', '2013-09-04 00:00:00', '1', '5', '116', '76', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4586', '2013-09-04 00:00:00', '1', '5', '116', '77', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4587', '2013-09-04 00:00:00', '1', '5', '116', '78', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4588', '2013-09-04 00:00:00', '1', '5', '116', '79', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4589', '2013-09-04 00:00:00', '1', '5', '116', '83', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4590', '2013-09-04 00:00:00', '2', '5', '116', '88', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4591', '2013-09-04 00:00:00', '1', '5', '116', '91', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4592', '2013-09-04 00:00:00', '1', '5', '116', '98', '4', '2', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4593', '2013-09-06 00:00:00', '1', '3', '117', '99', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4594', '2013-09-06 00:00:00', '1', '3', '117', '100', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4595', '2013-09-06 00:00:00', '1', '3', '117', '101', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4596', '2013-09-06 00:00:00', '1', '3', '117', '102', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4597', '2013-09-06 00:00:00', '1', '3', '117', '103', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4598', '2013-09-06 00:00:00', '1', '3', '117', '104', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4599', '2013-09-06 00:00:00', '1', '3', '117', '105', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4600', '2013-09-06 00:00:00', '1', '3', '117', '106', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4601', '2013-09-06 00:00:00', '1', '3', '117', '107', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4602', '2013-09-06 00:00:00', '2', '3', '117', '124', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4603', '2013-09-06 00:00:00', '1', '3', '117', '108', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4604', '2013-09-06 00:00:00', '1', '3', '117', '109', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4605', '2013-09-06 00:00:00', '1', '3', '117', '110', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4606', '2013-09-06 00:00:00', '1', '3', '117', '111', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4607', '2013-09-06 00:00:00', '1', '3', '117', '112', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4608', '2013-09-06 00:00:00', '1', '3', '117', '113', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4609', '2013-09-06 00:00:00', '1', '3', '117', '114', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4610', '2013-09-06 00:00:00', '1', '3', '117', '115', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4611', '2013-09-06 00:00:00', '1', '3', '117', '116', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4612', '2013-09-06 00:00:00', '1', '3', '117', '117', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4613', '2013-09-06 00:00:00', '1', '3', '117', '118', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4614', '2013-09-06 00:00:00', '1', '3', '117', '119', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4615', '2013-09-06 00:00:00', '1', '3', '117', '125', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4616', '2013-09-06 00:00:00', '2', '3', '117', '126', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4617', '2013-09-06 00:00:00', '1', '3', '117', '120', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4618', '2013-09-06 00:00:00', '1', '3', '117', '121', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4619', '2013-09-06 00:00:00', '1', '3', '117', '122', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4620', '2013-09-06 00:00:00', '2', '3', '117', '123', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4705', '2013-09-03 13:27:18', '1', '3', '121', '99', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4706', '2013-09-03 13:27:18', '1', '3', '121', '100', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4707', '2013-09-03 13:27:18', '1', '3', '121', '101', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4708', '2013-09-03 13:27:18', '1', '3', '121', '102', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4709', '2013-09-03 13:27:18', '1', '3', '121', '103', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4710', '2013-09-03 13:27:18', '1', '3', '121', '104', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4711', '2013-09-03 13:27:18', '1', '3', '121', '105', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4712', '2013-09-03 13:27:18', '1', '3', '121', '106', '1', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4713', '2013-09-03 13:27:18', '1', '3', '121', '107', '2', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4714', '2013-09-03 13:27:18', '2', '3', '121', '124', '2', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4715', '2013-09-03 13:27:18', '1', '3', '121', '108', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4716', '2013-09-03 13:27:18', '1', '3', '121', '109', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4717', '2013-09-03 13:27:18', '1', '3', '121', '110', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4718', '2013-09-03 13:27:18', '1', '3', '121', '111', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4719', '2013-09-03 13:27:18', '1', '3', '121', '112', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4720', '2013-09-03 13:27:18', '1', '3', '121', '113', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4721', '2013-09-03 13:27:18', '1', '3', '121', '114', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4722', '2013-09-03 13:27:18', '1', '3', '121', '115', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4723', '2013-09-03 13:27:18', '1', '3', '121', '116', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4724', '2013-09-03 13:27:18', '1', '3', '121', '117', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4725', '2013-09-03 13:27:18', '1', '3', '121', '118', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4726', '2013-09-03 13:27:18', '1', '3', '121', '119', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4727', '2013-09-03 13:27:18', '1', '3', '121', '125', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4728', '2013-09-03 13:27:18', '2', '3', '121', '126', '3', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4729', '2013-09-03 13:27:18', '1', '3', '121', '120', '4', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4730', '2013-09-03 13:27:18', '1', '3', '121', '121', '4', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4731', '2013-09-03 13:27:18', '1', '3', '121', '122', '4', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4732', '2013-09-03 13:27:18', '2', '3', '121', '123', '4', '3', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4733', '2013-08-05 16:22:35', '1', '1', '122', '140', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4734', '2013-08-05 16:22:35', '2', '1', '122', '140', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4735', '2013-08-05 16:22:35', '3', '1', '122', '140', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4736', '2013-08-05 16:22:35', '1', '1', '122', '141', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4737', '2013-08-05 16:22:35', '2', '1', '122', '141', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4738', '2013-08-05 16:22:35', '3', '1', '122', '141', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4739', '2013-08-05 16:22:35', '1', '1', '122', '142', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4740', '2013-08-05 16:22:35', '2', '1', '122', '142', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4741', '2013-08-05 16:22:35', '3', '1', '122', '142', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4742', '2013-08-05 16:22:35', '1', '1', '122', '143', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4743', '2013-08-05 16:22:35', '2', '1', '122', '143', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4744', '2013-08-05 16:22:35', '3', '1', '122', '143', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4745', '2013-08-05 16:22:35', '1', '1', '122', '144', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4746', '2013-08-05 16:22:35', '2', '1', '122', '144', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4747', '2013-08-05 16:22:35', '3', '1', '122', '144', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4748', '2013-08-05 16:22:35', '1', '1', '122', '145', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4749', '2013-08-05 16:22:35', '2', '1', '122', '145', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4750', '2013-08-05 16:22:35', '3', '1', '122', '145', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4751', '2013-08-05 16:22:35', '1', '1', '122', '146', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4752', '2013-08-05 16:22:35', '2', '1', '122', '146', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4753', '2013-08-05 16:22:35', '3', '1', '122', '146', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4754', '2013-08-05 16:22:35', '1', '1', '122', '147', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4755', '2013-08-05 16:22:35', '2', '1', '122', '147', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4756', '2013-08-05 16:22:35', '3', '1', '122', '147', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4757', '2013-08-05 16:22:35', '1', '1', '122', '158', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4758', '2013-08-05 16:22:35', '2', '1', '122', '158', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4759', '2013-08-05 16:22:35', '3', '1', '122', '158', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4760', '2013-08-05 16:22:35', '1', '1', '122', '160', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4761', '2013-08-05 16:22:35', '2', '1', '122', '160', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4762', '2013-08-05 16:22:35', '3', '1', '122', '160', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4763', '2013-08-05 16:22:35', '1', '1', '122', '161', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4764', '2013-08-05 16:22:35', '2', '1', '122', '161', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4765', '2013-08-05 16:22:35', '3', '1', '122', '161', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4766', '2013-08-05 16:22:35', '1', '1', '122', '172', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4767', '2013-08-05 16:22:35', '2', '1', '122', '172', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4768', '2013-08-05 16:22:35', '3', '1', '122', '172', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4769', '2013-08-05 16:22:35', '1', '1', '122', '176', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4770', '2013-08-05 16:22:35', '2', '1', '122', '176', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4771', '2013-08-05 16:22:35', '3', '1', '122', '176', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4772', '2013-08-05 16:22:35', '1', '1', '122', '180', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4773', '2013-08-05 16:22:35', '2', '1', '122', '180', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4774', '2013-08-05 16:22:35', '3', '1', '122', '180', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4775', '2013-08-05 16:22:35', '1', '1', '122', '184', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4776', '2013-08-05 16:22:35', '2', '1', '122', '184', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4777', '2013-08-05 16:22:35', '3', '1', '122', '184', '1', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4778', '2013-08-05 16:22:35', '1', '1', '122', '148', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4779', '2013-08-05 16:22:35', '2', '1', '122', '148', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4780', '2013-08-05 16:22:35', '3', '1', '122', '148', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4781', '2013-08-05 16:22:35', '1', '1', '122', '150', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4782', '2013-08-05 16:22:35', '2', '1', '122', '150', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4783', '2013-08-05 16:22:35', '3', '1', '122', '150', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4784', '2013-08-05 16:22:35', '1', '1', '122', '150', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4785', '2013-08-05 16:22:35', '2', '1', '122', '150', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4786', '2013-08-05 16:22:35', '3', '1', '122', '150', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4787', '2013-08-05 16:22:35', '1', '1', '122', '151', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4788', '2013-08-05 16:22:35', '2', '1', '122', '151', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4789', '2013-08-05 16:22:35', '3', '1', '122', '151', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4790', '2013-08-05 16:22:35', '1', '1', '122', '152', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4791', '2013-08-05 16:22:35', '2', '1', '122', '152', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4792', '2013-08-05 16:22:35', '3', '1', '122', '152', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4793', '2013-08-05 16:22:35', '1', '1', '122', '173', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4794', '2013-08-05 16:22:35', '2', '1', '122', '173', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4795', '2013-08-05 16:22:35', '3', '1', '122', '173', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4796', '2013-08-05 16:22:35', '1', '1', '122', '177', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4797', '2013-08-05 16:22:35', '2', '1', '122', '177', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4798', '2013-08-05 16:22:35', '3', '1', '122', '177', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4799', '2013-08-05 16:22:35', '1', '1', '122', '181', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4800', '2013-08-05 16:22:35', '2', '1', '122', '181', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4801', '2013-08-05 16:22:35', '3', '1', '122', '181', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4802', '2013-08-05 16:22:35', '1', '1', '122', '185', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4803', '2013-08-05 16:22:35', '2', '1', '122', '185', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4804', '2013-08-05 16:22:35', '3', '1', '122', '185', '2', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4805', '2013-08-05 16:22:35', '1', '1', '122', '163', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4806', '2013-08-05 16:22:35', '2', '1', '122', '163', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4807', '2013-08-05 16:22:35', '3', '1', '122', '163', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4808', '2013-08-05 16:22:35', '1', '1', '122', '154', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4809', '2013-08-05 16:22:35', '2', '1', '122', '154', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4810', '2013-08-05 16:22:35', '3', '1', '122', '154', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4811', '2013-08-05 16:22:35', '1', '1', '122', '155', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4812', '2013-08-05 16:22:35', '2', '1', '122', '155', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4813', '2013-08-05 16:22:35', '3', '1', '122', '155', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4814', '2013-08-05 16:22:35', '1', '1', '122', '156', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4815', '2013-08-05 16:22:35', '2', '1', '122', '156', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4816', '2013-08-05 16:22:35', '3', '1', '122', '156', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4817', '2013-08-05 16:22:35', '1', '1', '122', '162', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4818', '2013-08-05 16:22:35', '2', '1', '122', '162', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4819', '2013-08-05 16:22:35', '3', '1', '122', '162', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4820', '2013-08-05 16:22:35', '1', '1', '122', '163', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4821', '2013-08-05 16:22:35', '2', '1', '122', '163', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4822', '2013-08-05 16:22:35', '3', '1', '122', '163', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4823', '2013-08-05 16:22:35', '1', '1', '122', '164', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4824', '2013-08-05 16:22:35', '2', '1', '122', '164', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4825', '2013-08-05 16:22:35', '3', '1', '122', '164', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4826', '2013-08-05 16:22:35', '1', '1', '122', '165', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4827', '2013-08-05 16:22:35', '2', '1', '122', '165', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4828', '2013-08-05 16:22:35', '3', '1', '122', '165', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4829', '2013-08-05 16:22:35', '1', '1', '122', '166', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4830', '2013-08-05 16:22:35', '2', '1', '122', '166', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4831', '2013-08-05 16:22:35', '3', '1', '122', '166', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4832', '2013-08-05 16:22:35', '1', '1', '122', '174', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4833', '2013-08-05 16:22:35', '2', '1', '122', '174', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4834', '2013-08-05 16:22:35', '3', '1', '122', '174', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4835', '2013-08-05 16:22:35', '1', '1', '122', '178', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4836', '2013-08-05 16:22:35', '2', '1', '122', '178', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4837', '2013-08-05 16:22:35', '3', '1', '122', '178', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4838', '2013-08-05 16:22:35', '1', '1', '122', '182', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4839', '2013-08-05 16:22:35', '2', '1', '122', '182', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4840', '2013-08-05 16:22:35', '3', '1', '122', '182', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4841', '2013-08-05 16:22:35', '1', '1', '122', '186', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4842', '2013-08-05 16:22:35', '2', '1', '122', '186', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4843', '2013-08-05 16:22:35', '3', '1', '122', '186', '3', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4844', '2013-08-05 16:22:35', '1', '1', '122', '157', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4845', '2013-08-05 16:22:35', '2', '1', '122', '157', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4846', '2013-08-05 16:22:35', '3', '1', '122', '157', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4847', '2013-08-05 16:22:35', '1', '1', '122', '159', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4848', '2013-08-05 16:22:35', '2', '1', '122', '159', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4849', '2013-08-05 16:22:35', '3', '1', '122', '159', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4850', '2013-08-05 16:22:35', '1', '1', '122', '167', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4851', '2013-08-05 16:22:35', '2', '1', '122', '167', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4852', '2013-08-05 16:22:35', '3', '1', '122', '167', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4853', '2013-08-05 16:22:35', '1', '1', '122', '168', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4854', '2013-08-05 16:22:35', '2', '1', '122', '168', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4855', '2013-08-05 16:22:35', '3', '1', '122', '168', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4856', '2013-08-05 16:22:35', '1', '1', '122', '169', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4857', '2013-08-05 16:22:35', '2', '1', '122', '169', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4858', '2013-08-05 16:22:35', '3', '1', '122', '169', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4859', '2013-08-05 16:22:35', '1', '1', '122', '170', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4860', '2013-08-05 16:22:35', '2', '1', '122', '170', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4861', '2013-08-05 16:22:35', '3', '1', '122', '170', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4862', '2013-08-05 16:22:35', '1', '1', '122', '171', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4863', '2013-08-05 16:22:35', '2', '1', '122', '171', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4864', '2013-08-05 16:22:35', '3', '1', '122', '171', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4865', '2013-08-05 16:22:35', '1', '1', '122', '175', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4866', '2013-08-05 16:22:35', '2', '1', '122', '175', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4867', '2013-08-05 16:22:35', '3', '1', '122', '175', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4868', '2013-08-05 16:22:35', '1', '1', '122', '179', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4869', '2013-08-05 16:22:35', '2', '1', '122', '179', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4870', '2013-08-05 16:22:35', '3', '1', '122', '179', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4871', '2013-08-05 16:22:35', '1', '1', '122', '183', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4872', '2013-08-05 16:22:35', '2', '1', '122', '183', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4873', '2013-08-05 16:22:35', '3', '1', '122', '183', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4874', '2013-08-05 16:22:35', '1', '1', '122', '187', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4875', '2013-08-05 16:22:35', '2', '1', '122', '187', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4876', '2013-08-05 16:22:35', '3', '1', '122', '187', '4', '1', '8', null);
INSERT INTO `inspect_item_rec` VALUES ('4877', '2013-10-18 14:57:00', '1', '1', '123', '140', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4878', '2013-10-18 14:57:00', '1', '1', '123', '141', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4879', '2013-10-18 14:57:00', '1', '1', '123', '142', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4880', '2013-10-18 14:57:00', '2', '1', '123', '142', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4881', '2013-10-18 14:57:00', '3', '1', '123', '142', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4882', '2013-10-18 14:57:00', '1', '1', '123', '143', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4883', '2013-10-18 14:57:00', '1', '1', '123', '144', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4884', '2013-10-18 14:57:00', '1', '1', '123', '145', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4885', '2013-10-18 14:57:00', '1', '1', '123', '146', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4886', '2013-10-18 14:57:00', '1', '1', '123', '147', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4887', '2013-10-18 14:57:00', '1', '1', '123', '158', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4888', '2013-10-18 14:57:00', '1', '1', '123', '160', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4889', '2013-10-18 14:57:00', '1', '1', '123', '161', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4890', '2013-10-18 14:57:00', '2', '1', '123', '172', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4891', '2013-10-18 14:57:00', '1', '1', '123', '176', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4892', '2013-10-18 14:57:00', '1', '1', '123', '180', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4893', '2013-10-18 14:57:00', '2', '1', '123', '184', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4894', '2013-10-18 14:57:00', '1', '1', '123', '148', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4895', '2013-10-18 14:57:00', '1', '1', '123', '150', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4896', '2013-10-18 14:57:00', '1', '1', '123', '150', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4897', '2013-10-18 14:57:00', '1', '1', '123', '151', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4898', '2013-10-18 14:57:00', '1', '1', '123', '152', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4899', '2013-10-18 14:57:00', '1', '1', '123', '173', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4900', '2013-10-18 14:57:00', '2', '1', '123', '177', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4901', '2013-10-18 14:57:00', '3', '1', '123', '181', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4902', '2013-10-18 14:57:00', '1', '1', '123', '185', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4903', '2013-10-18 14:57:00', '1', '1', '123', '163', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4904', '2013-10-18 14:57:00', '2', '1', '123', '154', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4905', '2013-10-18 14:57:00', '3', '1', '123', '155', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4906', '2013-10-18 14:57:00', '1', '1', '123', '156', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4907', '2013-10-18 14:57:00', '3', '1', '123', '162', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4908', '2013-10-18 14:57:00', '1', '1', '123', '163', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4909', '2013-10-18 14:57:00', '1', '1', '123', '164', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4910', '2013-10-18 14:57:00', '1', '1', '123', '165', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4911', '2013-10-18 14:57:00', '1', '1', '123', '166', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4912', '2013-10-18 14:57:00', '3', '1', '123', '174', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4913', '2013-10-18 14:57:00', '1', '1', '123', '178', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4914', '2013-10-18 14:57:00', '2', '1', '123', '182', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4915', '2013-10-18 14:57:00', '1', '1', '123', '186', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4916', '2013-10-18 14:57:00', '1', '1', '123', '157', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4917', '2013-10-18 14:57:00', '3', '1', '123', '159', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4918', '2013-10-18 14:57:00', '1', '1', '123', '167', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4919', '2013-10-18 14:57:00', '3', '1', '123', '168', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4920', '2013-10-18 14:57:00', '1', '1', '123', '169', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4921', '2013-10-18 14:57:00', '1', '1', '123', '170', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4922', '2013-10-18 14:57:00', '2', '1', '123', '171', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4923', '2013-10-18 14:57:00', '1', '1', '123', '175', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4924', '2013-10-18 14:57:00', '1', '1', '123', '179', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4925', '2013-10-18 14:57:00', '1', '1', '123', '183', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4926', '2013-10-18 14:57:00', '3', '1', '123', '187', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4927', '2013-10-19 17:12:00', '1', '1', '124', '140', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4928', '2013-10-19 17:12:00', '1', '1', '124', '141', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4929', '2013-10-19 17:12:00', '1', '1', '124', '142', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4930', '2013-10-19 17:12:00', '2', '1', '124', '142', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4931', '2013-10-19 17:12:00', '3', '1', '124', '142', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4932', '2013-10-19 17:12:00', '1', '1', '124', '143', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4933', '2013-10-19 17:12:00', '1', '1', '124', '144', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4934', '2013-10-19 17:12:00', '1', '1', '124', '145', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4935', '2013-10-19 17:12:00', '1', '1', '124', '146', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4936', '2013-10-19 17:12:00', '1', '1', '124', '147', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4937', '2013-10-19 17:12:00', '1', '1', '124', '158', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4938', '2013-10-19 17:12:00', '1', '1', '124', '160', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4939', '2013-10-19 17:12:00', '1', '1', '124', '161', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4940', '2013-10-19 17:12:00', '2', '1', '124', '172', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4941', '2013-10-19 17:12:00', '1', '1', '124', '176', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4942', '2013-10-19 17:12:00', '1', '1', '124', '180', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4943', '2013-10-19 17:12:00', '2', '1', '124', '184', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4944', '2013-10-19 17:12:00', '1', '1', '124', '148', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4945', '2013-10-19 17:12:00', '1', '1', '124', '150', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4946', '2013-10-19 17:12:00', '1', '1', '124', '150', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4947', '2013-10-19 17:12:00', '1', '1', '124', '151', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4948', '2013-10-19 17:12:00', '1', '1', '124', '152', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4949', '2013-10-19 17:12:00', '1', '1', '124', '173', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4950', '2013-10-19 17:12:00', '2', '1', '124', '177', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4951', '2013-10-19 17:12:00', '3', '1', '124', '181', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4952', '2013-10-19 17:12:00', '1', '1', '124', '185', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4953', '2013-10-19 17:12:00', '1', '1', '124', '163', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4954', '2013-10-19 17:12:00', '2', '1', '124', '154', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4955', '2013-10-19 17:12:00', '3', '1', '124', '155', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4956', '2013-10-19 17:12:00', '1', '1', '124', '156', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4957', '2013-10-19 17:12:00', '3', '1', '124', '162', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4958', '2013-10-19 17:12:00', '1', '1', '124', '163', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4959', '2013-10-19 17:12:00', '1', '1', '124', '164', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4960', '2013-10-19 17:12:00', '1', '1', '124', '165', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4961', '2013-10-19 17:12:00', '1', '1', '124', '166', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4962', '2013-10-19 17:12:00', '3', '1', '124', '174', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4963', '2013-10-19 17:12:00', '1', '1', '124', '178', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4964', '2013-10-19 17:12:00', '2', '1', '124', '182', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4965', '2013-10-19 17:12:00', '1', '1', '124', '186', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4966', '2013-10-19 17:12:00', '1', '1', '124', '157', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4967', '2013-10-19 17:12:00', '3', '1', '124', '159', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4968', '2013-10-19 17:12:00', '1', '1', '124', '167', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4969', '2013-10-19 17:12:00', '3', '1', '124', '168', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4970', '2013-10-19 17:12:00', '1', '1', '124', '169', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4971', '2013-10-19 17:12:00', '1', '1', '124', '170', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4972', '2013-10-19 17:12:00', '2', '1', '124', '171', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4973', '2013-10-19 17:12:00', '1', '1', '124', '175', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4974', '2013-10-19 17:12:00', '1', '1', '124', '179', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4975', '2013-10-19 17:12:00', '1', '1', '124', '183', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4976', '2013-10-19 17:12:00', '3', '1', '124', '187', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4977', '2013-10-19 17:12:00', '1', '1', '125', '140', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4978', '2013-10-19 17:12:00', '1', '1', '125', '141', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4979', '2013-10-19 17:12:00', '1', '1', '125', '142', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4980', '2013-10-19 17:12:00', '2', '1', '125', '142', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4981', '2013-10-19 17:12:00', '3', '1', '125', '142', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4982', '2013-10-19 17:12:00', '1', '1', '125', '143', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4983', '2013-10-19 17:12:00', '1', '1', '125', '144', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4984', '2013-10-19 17:12:00', '1', '1', '125', '145', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4985', '2013-10-19 17:12:00', '1', '1', '125', '146', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4986', '2013-10-19 17:12:00', '1', '1', '125', '147', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4987', '2013-10-19 17:12:00', '1', '1', '125', '158', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4988', '2013-10-19 17:12:00', '1', '1', '125', '160', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4989', '2013-10-19 17:12:00', '1', '1', '125', '161', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4990', '2013-10-19 17:12:00', '2', '1', '125', '172', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4991', '2013-10-19 17:12:00', '1', '1', '125', '176', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4992', '2013-10-19 17:12:00', '1', '1', '125', '180', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4993', '2013-10-19 17:12:00', '2', '1', '125', '184', '1', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4994', '2013-10-19 17:12:00', '1', '1', '125', '148', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4995', '2013-10-19 17:12:00', '1', '1', '125', '150', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4996', '2013-10-19 17:12:00', '1', '1', '125', '150', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4997', '2013-10-19 17:12:00', '1', '1', '125', '151', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4998', '2013-10-19 17:12:00', '1', '1', '125', '152', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('4999', '2013-10-19 17:12:00', '1', '1', '125', '173', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5000', '2013-10-19 17:12:00', '2', '1', '125', '177', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5001', '2013-10-19 17:12:00', '3', '1', '125', '181', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5002', '2013-10-19 17:12:00', '1', '1', '125', '185', '2', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5003', '2013-10-19 17:12:00', '1', '1', '125', '163', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5004', '2013-10-19 17:12:00', '2', '1', '125', '154', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5005', '2013-10-19 17:12:00', '3', '1', '125', '155', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5006', '2013-10-19 17:12:00', '1', '1', '125', '156', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5007', '2013-10-19 17:12:00', '3', '1', '125', '162', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5008', '2013-10-19 17:12:00', '1', '1', '125', '163', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5009', '2013-10-19 17:12:00', '1', '1', '125', '164', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5010', '2013-10-19 17:12:00', '1', '1', '125', '165', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5011', '2013-10-19 17:12:00', '1', '1', '125', '166', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5012', '2013-10-19 17:12:00', '3', '1', '125', '174', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5013', '2013-10-19 17:12:00', '1', '1', '125', '178', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5014', '2013-10-19 17:12:00', '2', '1', '125', '182', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5015', '2013-10-19 17:12:00', '1', '1', '125', '186', '3', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5016', '2013-10-19 17:12:00', '1', '1', '125', '157', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5017', '2013-10-19 17:12:00', '3', '1', '125', '159', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5018', '2013-10-19 17:12:00', '1', '1', '125', '167', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5019', '2013-10-19 17:12:00', '3', '1', '125', '168', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5020', '2013-10-19 17:12:00', '1', '1', '125', '169', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5021', '2013-10-19 17:12:00', '1', '1', '125', '170', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5022', '2013-10-19 17:12:00', '2', '1', '125', '171', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5023', '2013-10-19 17:12:00', '1', '1', '125', '175', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5024', '2013-10-19 17:12:00', '1', '1', '125', '179', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5025', '2013-10-19 17:12:00', '1', '1', '125', '183', '4', '1', '7', null);
INSERT INTO `inspect_item_rec` VALUES ('5026', '2013-10-19 17:12:00', '3', '1', '125', '187', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('3884', '2013-09-08 00:00:00', '1', '5', '102', '53', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3885', '2013-09-08 00:00:00', '1', '5', '102', '54', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3886', '2013-09-08 00:00:00', '2', '5', '102', '55', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3887', '2013-09-08 00:00:00', '3', '5', '102', '56', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3888', '2013-09-08 00:00:00', '3', '5', '102', '57', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3889', '2013-09-08 00:00:00', '1', '5', '102', '58', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3890', '2013-09-08 00:00:00', '1', '5', '102', '59', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3891', '2013-09-08 00:00:00', '1', '5', '102', '60', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3892', '2013-09-08 00:00:00', '1', '5', '102', '61', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3893', '2013-09-08 00:00:00', '3', '5', '102', '80', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3894', '2013-09-08 00:00:00', '2', '5', '102', '84', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3895', '2013-09-08 00:00:00', '3', '5', '102', '92', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3896', '2013-09-08 00:00:00', '3', '5', '102', '95', '1', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3897', '2013-09-08 00:00:00', '1', '5', '102', '62', '2', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3898', '2013-09-08 00:00:00', '3', '5', '102', '81', '2', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3899', '2013-09-08 00:00:00', '1', '5', '102', '86', '2', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3900', '2013-09-08 00:00:00', '1', '5', '102', '86', '2', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3901', '2013-09-08 00:00:00', '3', '5', '102', '96', '2', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3902', '2013-09-08 00:00:00', '1', '5', '102', '63', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3903', '2013-09-08 00:00:00', '3', '5', '102', '64', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3904', '2013-09-08 00:00:00', '1', '5', '102', '65', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3905', '2013-09-08 00:00:00', '1', '5', '102', '66', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3906', '2013-09-08 00:00:00', '1', '5', '102', '67', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3907', '2013-09-08 00:00:00', '1', '5', '102', '68', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3908', '2013-09-08 00:00:00', '1', '5', '102', '69', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3909', '2013-09-08 00:00:00', '1', '5', '102', '70', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3910', '2013-09-08 00:00:00', '3', '5', '102', '71', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3911', '2013-09-08 00:00:00', '3', '5', '102', '72', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3912', '2013-09-08 00:00:00', '2', '5', '102', '82', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3913', '2013-09-08 00:00:00', '1', '5', '102', '87', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3914', '2013-09-08 00:00:00', '1', '5', '102', '89', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3915', '2013-09-08 00:00:00', '1', '5', '102', '90', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3916', '2013-09-08 00:00:00', '1', '5', '102', '93', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3917', '2013-09-08 00:00:00', '1', '5', '102', '94', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3918', '2013-09-08 00:00:00', '1', '5', '102', '97', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3919', '2013-09-08 00:00:00', '3', '5', '102', '228', '3', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3920', '2013-09-08 00:00:00', '1', '5', '102', '73', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3921', '2013-09-08 00:00:00', '1', '5', '102', '74', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3922', '2013-09-08 00:00:00', '1', '5', '102', '75', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3923', '2013-09-08 00:00:00', '1', '5', '102', '76', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3924', '2013-09-08 00:00:00', '1', '5', '102', '77', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3925', '2013-09-08 00:00:00', '1', '5', '102', '78', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3926', '2013-09-08 00:00:00', '1', '5', '102', '79', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3927', '2013-09-08 00:00:00', '3', '5', '102', '83', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3928', '2013-09-08 00:00:00', '1', '5', '102', '88', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3929', '2013-09-08 00:00:00', '2', '5', '102', '91', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3930', '2013-09-08 00:00:00', '1', '5', '102', '98', '4', '2', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3931', '2013-08-09 00:00:00', '1', '2', '99', '270', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3932', '2013-08-09 00:00:00', '3', '2', '99', '271', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3933', '2013-08-09 00:00:00', '2', '2', '99', '272', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3934', '2013-08-09 00:00:00', '1', '2', '99', '273', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3935', '2013-08-09 00:00:00', '1', '2', '99', '274', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3936', '2013-08-09 00:00:00', '3', '2', '99', '275', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3937', '2013-08-09 00:00:00', '1', '2', '99', '276', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3938', '2013-08-09 00:00:00', '1', '2', '99', '301', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3939', '2013-08-09 00:00:00', '1', '2', '99', '302', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3940', '2013-08-09 00:00:00', '1', '2', '99', '303', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3941', '2013-08-09 00:00:00', '1', '2', '99', '280', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3942', '2013-08-09 00:00:00', '1', '2', '99', '305', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3943', '2013-08-09 00:00:00', '1', '2', '99', '306', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3944', '2013-08-09 00:00:00', '1', '2', '99', '283', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3945', '2013-08-09 00:00:00', '1', '2', '99', '299', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3946', '2013-08-09 00:00:00', '1', '2', '99', '291', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3947', '2013-08-09 00:00:00', '1', '2', '99', '302', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3948', '2013-08-09 00:00:00', '1', '2', '99', '303', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3949', '2013-08-09 00:00:00', '1', '2', '99', '304', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3950', '2013-08-09 00:00:00', '1', '2', '99', '305', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3951', '2013-08-09 00:00:00', '1', '2', '99', '306', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3952', '2013-08-09 00:00:00', '3', '2', '99', '291', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3953', '2013-08-09 00:00:00', '2', '2', '99', '301', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3954', '2013-08-09 00:00:00', '1', '2', '99', '302', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3955', '2013-08-09 00:00:00', '1', '2', '99', '294', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3956', '2013-08-09 00:00:00', '1', '2', '99', '304', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3957', '2013-08-09 00:00:00', '3', '2', '99', '305', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3958', '2013-08-09 00:00:00', '1', '2', '99', '306', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3959', '2013-08-09 00:00:00', '3', '2', '99', '298', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3960', '2013-08-09 00:00:00', '2', '2', '99', '299', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3961', '2013-08-09 00:00:00', '1', '2', '99', '300', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3962', '2013-08-09 00:00:00', '1', '2', '99', '301', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3963', '2013-08-09 00:00:00', '1', '2', '99', '302', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3964', '2013-08-09 00:00:00', '1', '2', '99', '303', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3965', '2013-08-09 00:00:00', '3', '2', '99', '304', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3966', '2013-08-09 00:00:00', '1', '2', '99', '305', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3967', '2013-08-09 00:00:00', '1', '2', '99', '306', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3968', '2013-08-09 00:00:00', '1', '2', '99', '307', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3969', '2013-08-09 00:00:00', '3', '2', '99', '308', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3970', '2013-08-09 00:00:00', '2', '2', '99', '309', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3971', '2013-08-09 00:00:00', '1', '2', '99', '310', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3972', '2013-08-09 00:00:00', '1', '2', '99', '311', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3973', '2013-08-09 00:00:00', '3', '2', '99', '312', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3974', '2013-08-09 00:00:00', '3', '2', '99', '313', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3975', '2013-08-09 00:00:00', '2', '2', '99', '314', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3976', '2013-08-09 00:00:00', '3', '2', '99', '315', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3977', '2013-08-09 00:00:00', '3', '2', '99', '322', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3978', '2013-08-09 00:00:00', '1', '2', '99', '323', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3979', '2013-08-09 00:00:00', '1', '2', '99', '324', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3980', '2013-08-09 00:00:00', '1', '2', '99', '319', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3981', '2013-08-09 00:00:00', '3', '2', '99', '320', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3982', '2013-08-09 00:00:00', '1', '2', '99', '321', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3983', '2013-08-09 00:00:00', '3', '2', '99', '322', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3984', '2013-08-09 00:00:00', '1', '2', '99', '323', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3985', '2013-08-09 00:00:00', '3', '2', '99', '324', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3986', '2013-08-09 00:00:00', '1', '2', '99', '333', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3987', '2013-08-09 00:00:00', '3', '2', '99', '334', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3988', '2013-08-09 00:00:00', '1', '2', '99', '335', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3989', '2013-08-09 00:00:00', '1', '2', '99', '328', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3990', '2013-08-09 00:00:00', '3', '2', '99', '338', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3991', '2013-08-09 00:00:00', '2', '2', '99', '330', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3992', '2013-08-09 00:00:00', '3', '2', '99', '340', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3993', '2013-08-09 00:00:00', '3', '2', '99', '332', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3994', '2013-08-09 00:00:00', '1', '2', '99', '333', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3995', '2013-08-09 00:00:00', '1', '2', '99', '334', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3996', '2013-08-09 00:00:00', '1', '2', '99', '335', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3997', '2013-08-09 00:00:00', '1', '2', '99', '336', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3998', '2013-08-09 00:00:00', '3', '2', '99', '337', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('3999', '2013-08-09 00:00:00', '2', '2', '99', '338', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4000', '2013-08-09 00:00:00', '1', '2', '99', '339', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4001', '2013-08-09 00:00:00', '1', '2', '99', '340', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4002', '2013-08-09 00:00:00', '3', '2', '99', '341', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4003', '2013-08-09 00:00:00', '1', '2', '99', '342', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4004', '2013-08-09 00:00:00', '3', '2', '99', '343', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4005', '2013-08-09 00:00:00', '2', '2', '99', '344', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4006', '2013-08-09 00:00:00', '1', '2', '99', '345', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4007', '2013-08-09 00:00:00', '3', '2', '99', '374', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4008', '2013-08-09 00:00:00', '3', '2', '99', '375', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4009', '2013-08-09 00:00:00', '1', '2', '99', '376', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4010', '2013-08-09 00:00:00', '1', '2', '99', '346', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4011', '2013-08-09 00:00:00', '1', '2', '99', '347', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4012', '2013-08-09 00:00:00', '3', '2', '99', '348', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4013', '2013-08-09 00:00:00', '2', '2', '99', '349', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4014', '2013-08-09 00:00:00', '2', '2', '99', '350', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4015', '2013-08-09 00:00:00', '3', '2', '99', '351', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4016', '2013-08-09 00:00:00', '1', '2', '99', '352', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4017', '2013-08-09 00:00:00', '1', '2', '99', '353', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4018', '2013-08-09 00:00:00', '1', '2', '99', '354', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4019', '2013-08-09 00:00:00', '1', '2', '99', '355', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4020', '2013-08-09 00:00:00', '1', '2', '99', '356', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4021', '2013-08-09 00:00:00', '1', '2', '99', '357', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4022', '2013-08-09 00:00:00', '1', '2', '99', '358', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4023', '2013-08-09 00:00:00', '3', '2', '99', '359', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4024', '2013-08-09 00:00:00', '1', '2', '99', '360', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4025', '2013-08-09 00:00:00', '1', '2', '99', '361', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4026', '2013-08-09 00:00:00', '3', '2', '99', '362', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4027', '2013-08-09 00:00:00', '1', '2', '99', '363', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4028', '2013-08-09 00:00:00', '1', '2', '99', '364', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4029', '2013-08-09 00:00:00', '1', '2', '99', '365', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4030', '2013-08-09 00:00:00', '1', '2', '99', '366', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4031', '2013-08-09 00:00:00', '1', '2', '99', '367', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4032', '2013-08-09 00:00:00', '1', '2', '99', '368', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4033', '2013-08-09 00:00:00', '3', '2', '99', '369', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4034', '2013-08-09 00:00:00', '2', '2', '99', '370', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4035', '2013-08-09 00:00:00', '1', '2', '99', '371', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4036', '2013-08-09 00:00:00', '1', '2', '99', '372', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4037', '2013-08-09 00:00:00', '1', '2', '99', '373', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4038', '2012-08-09 00:00:00', '1', '1', '104', '140', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4039', '2012-08-09 00:00:00', '2', '1', '104', '141', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4040', '2012-08-09 00:00:00', '3', '1', '104', '142', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4041', '2012-08-09 00:00:00', '1', '1', '104', '143', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4042', '2012-08-09 00:00:00', '1', '1', '104', '144', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4043', '2012-08-09 00:00:00', '3', '1', '104', '145', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4044', '2012-08-09 00:00:00', '2', '1', '104', '146', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4045', '2012-08-09 00:00:00', '1', '1', '104', '147', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4046', '2012-08-09 00:00:00', '1', '1', '104', '158', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4047', '2012-08-09 00:00:00', '3', '1', '104', '160', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4048', '2012-08-09 00:00:00', '3', '1', '104', '161', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4049', '2012-08-09 00:00:00', '3', '1', '104', '172', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4050', '2012-08-09 00:00:00', '1', '1', '104', '176', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4051', '2012-08-09 00:00:00', '1', '1', '104', '180', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4052', '2012-08-09 00:00:00', '1', '1', '104', '184', '1', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4053', '2012-08-09 00:00:00', '1', '1', '104', '148', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4054', '2012-08-09 00:00:00', '1', '1', '104', '150', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4055', '2012-08-09 00:00:00', '1', '1', '104', '150', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4056', '2012-08-09 00:00:00', '3', '1', '104', '151', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4057', '2012-08-09 00:00:00', '1', '1', '104', '152', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4058', '2012-08-09 00:00:00', '1', '1', '104', '173', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4059', '2012-08-09 00:00:00', '1', '1', '104', '177', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4060', '2012-08-09 00:00:00', '1', '1', '104', '181', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4061', '2012-08-09 00:00:00', '3', '1', '104', '185', '2', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4062', '2012-08-09 00:00:00', '1', '1', '104', '163', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4063', '2012-08-09 00:00:00', '1', '1', '104', '154', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4064', '2012-08-09 00:00:00', '1', '1', '104', '155', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4065', '2012-08-09 00:00:00', '1', '1', '104', '156', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4066', '2012-08-09 00:00:00', '1', '1', '104', '162', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4067', '2012-08-09 00:00:00', '1', '1', '104', '163', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4068', '2012-08-09 00:00:00', '1', '1', '104', '164', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4069', '2012-08-09 00:00:00', '3', '1', '104', '165', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4070', '2012-08-09 00:00:00', '2', '1', '104', '166', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4071', '2012-08-09 00:00:00', '1', '1', '104', '174', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4072', '2012-08-09 00:00:00', '1', '1', '104', '178', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4073', '2012-08-09 00:00:00', '1', '1', '104', '182', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4074', '2012-08-09 00:00:00', '1', '1', '104', '186', '3', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4075', '2012-08-09 00:00:00', '1', '1', '104', '157', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4076', '2012-08-09 00:00:00', '1', '1', '104', '159', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4077', '2012-08-09 00:00:00', '1', '1', '104', '167', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4078', '2012-08-09 00:00:00', '1', '1', '104', '168', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4079', '2012-08-09 00:00:00', '1', '1', '104', '169', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4080', '2012-08-09 00:00:00', '1', '1', '104', '170', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4081', '2012-08-09 00:00:00', '3', '1', '104', '171', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4082', '2012-08-09 00:00:00', '3', '1', '104', '175', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4083', '2012-08-09 00:00:00', '3', '1', '104', '179', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4084', '2012-08-09 00:00:00', '1', '1', '104', '183', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4085', '2012-08-09 00:00:00', '1', '1', '104', '187', '4', '3', '3', null);
INSERT INTO `inspect_item_record` VALUES ('4377', '2013-09-05 00:00:00', '1', '5', '112', '53', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4378', '2013-09-05 00:00:00', '1', '5', '112', '54', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4379', '2013-09-05 00:00:00', '1', '5', '112', '55', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4380', '2013-09-05 00:00:00', '1', '5', '112', '56', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4381', '2013-09-05 00:00:00', '1', '5', '112', '57', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4382', '2013-09-05 00:00:00', '1', '5', '112', '58', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4383', '2013-09-05 00:00:00', '1', '5', '112', '59', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4384', '2013-09-05 00:00:00', '1', '5', '112', '60', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4385', '2013-09-05 00:00:00', '1', '5', '112', '61', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4386', '2013-09-05 00:00:00', '1', '5', '112', '80', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4387', '2013-09-05 00:00:00', '2', '5', '112', '84', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4388', '2013-09-05 00:00:00', '1', '5', '112', '92', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4389', '2013-09-05 00:00:00', '1', '5', '112', '95', '1', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4390', '2013-09-05 00:00:00', '2', '5', '112', '62', '2', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4391', '2013-09-05 00:00:00', '1', '5', '112', '81', '2', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4392', '2013-09-05 00:00:00', '1', '5', '112', '86', '2', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4393', '2013-09-05 00:00:00', '1', '5', '112', '86', '2', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4394', '2013-09-05 00:00:00', '2', '5', '112', '96', '2', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4395', '2013-09-05 00:00:00', '1', '5', '112', '63', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4396', '2013-09-05 00:00:00', '1', '5', '112', '64', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4397', '2013-09-05 00:00:00', '1', '5', '112', '65', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4398', '2013-09-05 00:00:00', '1', '5', '112', '66', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4399', '2013-09-05 00:00:00', '1', '5', '112', '67', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4400', '2013-09-05 00:00:00', '1', '5', '112', '68', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4401', '2013-09-05 00:00:00', '1', '5', '112', '69', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4402', '2013-09-05 00:00:00', '2', '5', '112', '70', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4403', '2013-09-05 00:00:00', '1', '5', '112', '71', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4404', '2013-09-05 00:00:00', '1', '5', '112', '72', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4405', '2013-09-05 00:00:00', '2', '5', '112', '82', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4406', '2013-09-05 00:00:00', '1', '5', '112', '87', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4407', '2013-09-05 00:00:00', '1', '5', '112', '89', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4408', '2013-09-05 00:00:00', '1', '5', '112', '90', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4409', '2013-09-05 00:00:00', '1', '5', '112', '93', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4410', '2013-09-05 00:00:00', '1', '5', '112', '94', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4411', '2013-09-05 00:00:00', '1', '5', '112', '97', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4412', '2013-09-05 00:00:00', '1', '5', '112', '228', '3', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4413', '2013-09-05 00:00:00', '1', '5', '112', '73', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4414', '2013-09-05 00:00:00', '1', '5', '112', '74', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4415', '2013-09-05 00:00:00', '1', '5', '112', '75', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4416', '2013-09-05 00:00:00', '1', '5', '112', '76', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4417', '2013-09-05 00:00:00', '1', '5', '112', '77', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4418', '2013-09-05 00:00:00', '1', '5', '112', '78', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4419', '2013-09-05 00:00:00', '1', '5', '112', '79', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4420', '2013-09-05 00:00:00', '1', '5', '112', '83', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4421', '2013-09-05 00:00:00', '2', '5', '112', '88', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4422', '2013-09-05 00:00:00', '1', '5', '112', '91', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4423', '2013-09-05 00:00:00', '1', '5', '112', '98', '4', '32', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4424', '2013-09-05 00:00:00', '1', '3', '113', '99', '1', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4425', '2013-09-05 00:00:00', '1', '3', '113', '100', '1', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4426', '2013-09-05 00:00:00', '1', '3', '113', '101', '1', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4427', '2013-09-05 00:00:00', '1', '3', '113', '102', '1', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4428', '2013-09-05 00:00:00', '1', '3', '113', '103', '1', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4429', '2013-09-05 00:00:00', '1', '3', '113', '104', '1', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4430', '2013-09-05 00:00:00', '1', '3', '113', '105', '1', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4431', '2013-09-05 00:00:00', '1', '3', '113', '106', '1', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4432', '2013-09-05 00:00:00', '1', '3', '113', '107', '2', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4433', '2013-09-05 00:00:00', '2', '3', '113', '124', '2', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4434', '2013-09-05 00:00:00', '1', '3', '113', '108', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4435', '2013-09-05 00:00:00', '1', '3', '113', '109', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4436', '2013-09-05 00:00:00', '1', '3', '113', '110', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4437', '2013-09-05 00:00:00', '1', '3', '113', '111', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4438', '2013-09-05 00:00:00', '1', '3', '113', '112', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4439', '2013-09-05 00:00:00', '1', '3', '113', '113', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4440', '2013-09-05 00:00:00', '1', '3', '113', '114', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4441', '2013-09-05 00:00:00', '1', '3', '113', '115', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4442', '2013-09-05 00:00:00', '1', '3', '113', '116', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4443', '2013-09-05 00:00:00', '1', '3', '113', '117', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4444', '2013-09-05 00:00:00', '1', '3', '113', '118', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4445', '2013-09-05 00:00:00', '1', '3', '113', '119', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4446', '2013-09-05 00:00:00', '1', '3', '113', '125', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4447', '2013-09-05 00:00:00', '2', '3', '113', '126', '3', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4448', '2013-09-05 00:00:00', '1', '3', '113', '120', '4', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4449', '2013-09-05 00:00:00', '1', '3', '113', '121', '4', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4450', '2013-09-05 00:00:00', '1', '3', '113', '122', '4', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4451', '2013-09-05 00:00:00', '2', '3', '113', '123', '4', '3', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4452', '2013-09-01 00:00:00', '1', '5', '114', '53', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4453', '2013-09-01 00:00:00', '1', '5', '114', '54', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4454', '2013-09-01 00:00:00', '1', '5', '114', '55', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4455', '2013-09-01 00:00:00', '1', '5', '114', '56', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4456', '2013-09-01 00:00:00', '1', '5', '114', '57', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4457', '2013-09-01 00:00:00', '1', '5', '114', '58', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4458', '2013-09-01 00:00:00', '1', '5', '114', '59', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4459', '2013-09-01 00:00:00', '1', '5', '114', '60', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4460', '2013-09-01 00:00:00', '1', '5', '114', '61', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4461', '2013-09-01 00:00:00', '1', '5', '114', '80', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4462', '2013-09-01 00:00:00', '2', '5', '114', '84', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4463', '2013-09-01 00:00:00', '1', '5', '114', '92', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4464', '2013-09-01 00:00:00', '1', '5', '114', '95', '1', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4465', '2013-09-01 00:00:00', '2', '5', '114', '62', '2', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4466', '2013-09-01 00:00:00', '1', '5', '114', '81', '2', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4467', '2013-09-01 00:00:00', '1', '5', '114', '86', '2', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4468', '2013-09-01 00:00:00', '1', '5', '114', '86', '2', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4469', '2013-09-01 00:00:00', '2', '5', '114', '96', '2', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4470', '2013-09-01 00:00:00', '1', '5', '114', '63', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4471', '2013-09-01 00:00:00', '1', '5', '114', '64', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4472', '2013-09-01 00:00:00', '1', '5', '114', '65', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4473', '2013-09-01 00:00:00', '1', '5', '114', '66', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4474', '2013-09-01 00:00:00', '1', '5', '114', '67', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4475', '2013-09-01 00:00:00', '1', '5', '114', '68', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4476', '2013-09-01 00:00:00', '1', '5', '114', '69', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4477', '2013-09-01 00:00:00', '2', '5', '114', '70', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4478', '2013-09-01 00:00:00', '1', '5', '114', '71', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4479', '2013-09-01 00:00:00', '1', '5', '114', '72', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4480', '2013-09-01 00:00:00', '2', '5', '114', '82', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4481', '2013-09-01 00:00:00', '1', '5', '114', '87', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4482', '2013-09-01 00:00:00', '1', '5', '114', '89', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4483', '2013-09-01 00:00:00', '1', '5', '114', '90', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4484', '2013-09-01 00:00:00', '1', '5', '114', '93', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4485', '2013-09-01 00:00:00', '1', '5', '114', '94', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4486', '2013-09-01 00:00:00', '1', '5', '114', '97', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4487', '2013-09-01 00:00:00', '1', '5', '114', '228', '3', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4488', '2013-09-01 00:00:00', '1', '5', '114', '73', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4489', '2013-09-01 00:00:00', '1', '5', '114', '74', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4490', '2013-09-01 00:00:00', '1', '5', '114', '75', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4491', '2013-09-01 00:00:00', '1', '5', '114', '76', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4492', '2013-09-01 00:00:00', '1', '5', '114', '77', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4493', '2013-09-01 00:00:00', '1', '5', '114', '78', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4494', '2013-09-01 00:00:00', '1', '5', '114', '79', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4495', '2013-09-01 00:00:00', '1', '5', '114', '83', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4496', '2013-09-01 00:00:00', '2', '5', '114', '88', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4497', '2013-09-01 00:00:00', '1', '5', '114', '91', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4498', '2013-09-01 00:00:00', '1', '5', '114', '98', '4', '1', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4499', '2013-08-30 00:00:00', '1', '5', '115', '53', '1', '2', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4500', '2013-08-30 00:00:00', '1', '5', '115', '54', '1', '2', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4501', '2013-08-30 00:00:00', '1', '5', '115', '55', '1', '2', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4502', '2013-08-30 00:00:00', '1', '5', '115', '56', '1', '2', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4503', '2013-08-30 00:00:00', '1', '5', '115', '57', '1', '2', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4504', '2013-08-30 00:00:00', '1', '5', '115', '58', '1', '2', '7', null);
INSERT INTO `inspect_item_record` VALUES ('4505', '2013-08-30 00:00:00', '1', '5', '115', '59', '1', '2', '7', null);
