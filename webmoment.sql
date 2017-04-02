/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : webmoment

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-04-02 14:17:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `content` tinytext COLLATE utf8_unicode_ci,
  `author` int(11) DEFAULT NULL,
  `publishtime` date DEFAULT NULL,
  `pass` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'U',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `cid_UNIQUE` (`cid`),
  KEY `eid_idx` (`eid`),
  KEY `uid_idx` (`author`),
  CONSTRAINT `eid` FOREIGN KEY (`eid`) REFERENCES `essay` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uid` FOREIGN KEY (`author`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('3', '29', 'test', '5', '2017-03-31', 'N');
INSERT INTO `comment` VALUES ('4', '29', 'llalalala', '5', '2017-03-31', 'N');

-- ----------------------------
-- Table structure for `essay`
-- ----------------------------
DROP TABLE IF EXISTS `essay`;
CREATE TABLE `essay` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `author` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publisher` int(11) DEFAULT NULL,
  `publishtime` date DEFAULT NULL,
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `viewercount` int(11) DEFAULT '0',
  `likecount` int(11) DEFAULT '0',
  PRIMARY KEY (`eid`),
  UNIQUE KEY `eid_UNIQUE` (`eid`),
  KEY `publisher_idx` (`publisher`),
  CONSTRAINT `publisher` FOREIGN KEY (`publisher`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of essay
-- ----------------------------
INSERT INTO `essay` VALUES ('29', '测试发布07', '<p>测试发布</p>', '许焕峰', '5', '2017-03-18', 'Y', '0', '0');
INSERT INTO `essay` VALUES ('30', '测试发布2017年3月30日20:06:30', '<p>测试发布2017年3月30日20:06:38</p>', '许焕峰', '5', '2017-03-30', 'Y', '0', '0');
INSERT INTO `essay` VALUES ('31', '测试发布2017年3月30日20:08:09', '<p>测试发布2017年3月30日20:08:14</p>', '许焕峰', '5', '2017-03-30', 'Y', '0', '0');
INSERT INTO `essay` VALUES ('32', '测试发布2017年3月30日20:28:54', '<p>测试发布2017年3月30日20:29:05</p>', '许焕峰', '5', '2017-03-30', 'Y', '0', '0');
INSERT INTO `essay` VALUES ('33', '测试发布2017年3月30日20:31:10', '<p>测试发布2017年3月30日20:31:19</p>', '许焕峰', '5', '2017-03-30', 'Y', '0', '0');
INSERT INTO `essay` VALUES ('34', '测试发布_最终版', '<p>测试发布最终版_2017年4月1日21:13:10</p><p><br></p>', '许焕峰', '5', '2017-04-01', 'Y', '0', '0');

-- ----------------------------
-- Table structure for `follow`
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `oid_idx` (`oid`),
  KEY `pid_idx` (`pid`),
  CONSTRAINT `oid` FOREIGN KEY (`oid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('3', '5', '9');
INSERT INTO `follow` VALUES ('10', '5', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` tinytext COLLATE utf8_unicode_ci,
  `enrolltime` date DEFAULT NULL,
  `status` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `type` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid_UNIQUE` (`uid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'xuhuanfeng232@gmail.com', '15889610395', 'xuhuanfeng', 'http://oio4hn5r8.bkt.clouddn.com/16-12-24/29658892-file_1482554089006_10955.jpg', '2017-03-05', 'Y', 'O', '世界你好', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('5', '1290789001@qq.com', '13542877443', 'xuhuanfeng232', 'http://oio4hn5r8.bkt.clouddn.com/16-12-24/29658892-file_1482554089006_10955.jpg', '2017-03-06', 'Y', 'P', '致力于Java开发，爱生活，爱Java', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('7', '1290789002@qq.com', '13542877442', 'xuhuanfeng123', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-06', 'Y', 'P', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('9', '1234@qq.com', '1234567890', 'test01', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('10', 'ff@qq.com', '234565', 'test02', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('12', 'huan@qq.com', '43453', 'test03', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('14', 'huanhuan@qq.com', '34564', 'test05', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('16', '545@qq.com', '3434', 'test07', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('17', '2239200@qq.com', '41394190', 'test06', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('18', '232@99qq.com', '598989', 'test09', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('21', '3333@qq.com', '34252', 'cece', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('22', '2323223@qq.com', '5235235', 'test001', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('23', '42hu@qq.com', '98998', 'test0009', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('24', 'huhuhu@qq.com', '79989', 'test009', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('25', '4124@qq.com', '3235325235', 'test333', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('26', 'xuhua@gmail.com', '1588961032', 'test0013', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('27', '674@qq.com', '090909', 'test23', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
INSERT INTO `user` VALUES ('28', '2345@qq.com', '90909', 'test78', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '872694b2ab50601615cbad2bc50d98d6');
INSERT INTO `user` VALUES ('29', 'sfasf@qq.com', '898989', 'sllsl', 'http://oio4hn5r8.bkt.clouddn.com/17-3-3/88485926-file_1488513473512_17266.jpg', '2017-03-30', 'Y', 'O', 'Hello World', '71a0e91e6406451aecccb9707940de07');
