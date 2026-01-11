/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 11/01/2026 11:52:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 't_book', '图书信息管理', '', NULL, 'TBookEntity', 'crud', 'com.ruoyi.system', 'system', 'book', '图书信息管理', 'liusc', '0', '/', '{\"parentMenuId\":\"4\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"图书管理\",\"treeCode\":\"\"}', 'admin', '2022-05-27 21:44:12', '', '2022-05-27 21:55:14', '');
INSERT INTO `gen_table` VALUES (2, 't_book_type', '图书分类', '', NULL, 'TBookTypeEntity', 'crud', 'com.ruoyi.system', 'system', 'type', '图书分类管理', 'liusc', '0', '/', '{\"parentMenuId\":\"4\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"图书管理\",\"treeCode\":\"\"}', 'admin', '2022-05-27 21:44:12', '', '2022-05-27 21:54:38', '');
INSERT INTO `gen_table` VALUES (3, 't_reader_info', '读者信息表', '', NULL, 'TReaderInfoEntity', 'crud', 'com.ruoyi.system', 'system', 'reader', '读者信息', 'zhangyuan', '0', '/', '{\"parentMenuId\":\"4\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"图书管理\",\"treeCode\":\"\"}', 'admin', '2022-06-04 22:28:43', '', '2022-06-04 23:05:29', '');
INSERT INTO `gen_table` VALUES (4, 't_reader_card', '借阅卡', 't_reader_info', 'id', 'ReaderCard', 'crud', 'com.ruoyi.library', 'library', 'reader_card', '借阅卡', 'liusc', '0', '/', '{\"parentMenuId\":\"4\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"图书管理\",\"treeCode\":\"\"}', 'admin', '2022-06-05 16:53:21', '', '2023-05-18 16:07:58', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', 'id主键', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:14');
INSERT INTO `gen_table_column` VALUES (2, '1', 'name', '图书名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:14');
INSERT INTO `gen_table_column` VALUES (3, '1', 'author', '图书作者', 'varchar(255)', 'String', 'author', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:14');
INSERT INTO `gen_table_column` VALUES (4, '1', 'number', '图书数量', 'bigint', 'Long', 'number', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:14');
INSERT INTO `gen_table_column` VALUES (5, '1', 'publish', '出版社', 'varchar(255)', 'String', 'publish', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:14');
INSERT INTO `gen_table_column` VALUES (6, '1', 'pub_time', '出版时间', 'timestamp', 'Date', 'pubTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (7, '1', 'introduction', '简介', 'longtext', 'String', 'introduction', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (8, '1', 'isbn', '标准书号', 'varchar(255)', 'String', 'isbn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (9, '1', 'language', '语言 1中文 2英语 3其他语言', 'int', 'Long', 'language', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (10, '1', 'price', '图书价格', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (11, '1', 'book_type', '图书分类', 'bigint', 'Long', 'bookType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 11, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (12, '1', 'del_flag', '删除标识 0未删除1已删除', 'int', 'Long', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (13, '1', 'create_user', '创建人', 'bigint', 'Long', 'createUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (14, '1', 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (15, '1', 'update_user', '更新人', 'bigint', 'Long', 'updateUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (16, '1', 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (17, '1', 'ts', '数据库时间戳', 'timestamp', 'Date', 'ts', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 17, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:55:15');
INSERT INTO `gen_table_column` VALUES (18, '2', 'id', 'id主键', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:54:38');
INSERT INTO `gen_table_column` VALUES (19, '2', 'name', '图书分类', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:54:38');
INSERT INTO `gen_table_column` VALUES (20, '2', 'type_code', '分类编码', 'varchar(255)', 'String', 'typeCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:54:38');
INSERT INTO `gen_table_column` VALUES (21, '2', 'del_flag', '删除标识0未删除1已删除', 'int', 'Long', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:54:38');
INSERT INTO `gen_table_column` VALUES (22, '2', 'create_user', '创建人', 'bigint', 'Long', 'createUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:54:38');
INSERT INTO `gen_table_column` VALUES (23, '2', 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:54:38');
INSERT INTO `gen_table_column` VALUES (24, '2', 'update_user', '更新人', 'bigint', 'Long', 'updateUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:54:38');
INSERT INTO `gen_table_column` VALUES (25, '2', 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:54:38');
INSERT INTO `gen_table_column` VALUES (26, '2', 'ts', '数据库时间戳', 'timestamp', 'Date', 'ts', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2022-05-27 21:44:12', NULL, '2022-05-27 21:54:38');
INSERT INTO `gen_table_column` VALUES (27, '3', 'id', '主键id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-06-04 22:28:44', NULL, '2022-06-04 23:05:29');
INSERT INTO `gen_table_column` VALUES (28, '3', 'name', '读者姓名', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-06-04 22:28:44', NULL, '2022-06-04 23:05:29');
INSERT INTO `gen_table_column` VALUES (29, '3', 'sex', '读者性别', 'varchar(255)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2022-06-04 22:28:44', NULL, '2022-06-04 23:05:29');
INSERT INTO `gen_table_column` VALUES (30, '3', 'birth', '读者生日', 'date', 'Date', 'birth', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2022-06-04 22:28:44', NULL, '2022-06-04 23:05:29');
INSERT INTO `gen_table_column` VALUES (31, '3', 'address', '读者地址', 'varchar(255)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2022-06-04 22:28:44', NULL, '2022-06-04 23:05:29');
INSERT INTO `gen_table_column` VALUES (32, '3', 'phone', '读者电话', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-06-04 22:28:44', NULL, '2022-06-04 23:05:29');
INSERT INTO `gen_table_column` VALUES (33, '4', 'id', '主键id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-06-05 16:53:21', NULL, '2023-05-18 16:07:58');
INSERT INTO `gen_table_column` VALUES (35, '4', 'user_name', '用户名', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-06-05 16:53:21', NULL, '2023-05-18 16:07:58');
INSERT INTO `gen_table_column` VALUES (36, '4', 'user_password', '用户密码', 'varchar(255)', 'String', 'userPassword', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-06-05 16:53:21', NULL, '2023-05-18 16:07:58');
INSERT INTO `gen_table_column` VALUES (37, '4', 'card_number', '读者卡号', 'bigint', 'Long', 'cardNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2023-05-18 16:04:43', NULL, '2023-05-18 16:07:58');
INSERT INTO `gen_table_column` VALUES (38, '4', 'card_status', '借阅卡状态', 'int', 'Long', 'cardStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, '', '2023-05-18 16:04:43', NULL, '2023-05-18 16:07:58');
INSERT INTO `gen_table_column` VALUES (39, '4', 'del_flag', '删除标识', 'int', 'Long', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, '', '2023-05-18 16:04:43', NULL, '2023-05-18 16:07:58');
INSERT INTO `gen_table_column` VALUES (40, '4', 'create_user', '创建人id', 'bigint', 'Long', 'createUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, '', '2023-05-18 16:04:43', NULL, '2023-05-18 16:07:58');
INSERT INTO `gen_table_column` VALUES (41, '4', 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, '', '2023-05-18 16:04:43', NULL, '2023-05-18 16:07:58');
INSERT INTO `gen_table_column` VALUES (42, '4', 'update_user', '更新人id', 'bigint', 'Long', 'updateUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2023-05-18 16:04:43', NULL, '2023-05-18 16:07:58');
INSERT INTO `gen_table_column` VALUES (43, '4', 'update_time', '更新人时间', 'timestamp', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, '', '2023-05-18 16:04:43', NULL, '2023-05-18 16:07:58');
INSERT INTO `gen_table_column` VALUES (44, '4', 'ts', '更新时间戳', 'timestamp', 'Date', 'ts', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, '', '2023-05-18 16:04:43', NULL, '2023-05-18 16:07:58');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-05-25 22:40:53', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-05-25 22:40:53', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-05-25 22:40:53', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-05-25 22:40:53', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-05-25 22:40:53', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-05-25 22:40:53', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-05-25 22:40:53', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2022-05-25 22:40:53', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2022-05-25 22:40:53', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-05-25 22:40:53', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-25 22:40:52', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-25 22:40:52', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-25 22:40:52', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-25 22:40:52', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-25 22:40:52', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-25 22:40:52', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-25 22:40:52', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-25 22:40:52', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-25 22:40:52', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-05-25 22:40:52', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '中文', '1', 'book_language', NULL, NULL, 'Y', '0', 'admin', '2022-05-28 12:50:15', '', NULL, '语言 1中文 2英语 3其他语言');
INSERT INTO `sys_dict_data` VALUES (101, 2, '英语', '2', 'book_language', NULL, NULL, 'Y', '0', 'admin', '2022-05-28 12:50:33', '', NULL, '语言 1中文 2英语 3其他语言');
INSERT INTO `sys_dict_data` VALUES (102, 3, '其他语言', '3', 'book_language', NULL, NULL, 'Y', '0', 'admin', '2022-05-28 12:50:45', '', NULL, '语言 1中文 2英语 3其他语言');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '语言', 'book_language', '0', 'admin', '2022-05-28 12:48:36', '', NULL, '书类语言');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-05-25 22:40:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 189 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-27 21:42:25');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-27 22:04:01');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-27 22:08:54');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-27 22:17:06');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-27 22:18:07');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 10:23:50');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 12:23:30');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 12:37:21');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 12:45:45');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '192.168.1.7', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 12:49:00');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 12:58:34');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 13:10:00');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 13:23:49');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 18:27:33');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 18:33:31');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 22:42:48');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 23:20:35');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '192.168.1.7', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-28 23:24:09');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '192.168.1.7', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-29 00:02:42');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '192.168.1.4', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-30 15:11:05');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '192.168.1.4', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-30 17:46:37');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '192.168.1.6', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-06-01 17:16:45');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '192.168.1.6', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-06-02 15:33:19');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-04 19:16:36');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-04 21:19:48');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-04 22:19:33');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-04 23:05:16');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-04 23:30:54');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-04 23:35:53');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-04 23:42:43');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 00:40:08');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-06-05 12:54:04');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-06-05 12:58:12');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 15:18:10');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 15:52:46');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 16:52:50');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 17:39:00');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-06-05 17:42:26');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 17:42:27');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 17:42:58');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 17:47:46');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 17:57:10');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 18:01:07');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 18:14:36');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 18:20:09');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 21:55:25');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-05 23:40:05');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-06 00:12:56');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-17 23:38:38');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 10:09:09');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-05-18 10:10:53');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 10:10:54');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 10:14:14');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 11:16:31');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 11:23:31');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 11:23:40');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 11:27:11');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 11:31:40');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 11:32:22');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 11:33:30');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 11:56:14');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 14:02:00');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 14:47:07');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 14:51:52');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 14:54:07');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 14:55:23');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 15:05:32');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 15:59:39');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 16:03:35');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 16:13:38');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 16:21:25');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 16:24:02');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 16:25:45');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 16:40:21');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-05-18 17:13:03');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 22:40:47');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 22:42:36');
INSERT INTO `sys_logininfor` VALUES (192, 'zhangyuan', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 22:42:41');
INSERT INTO `sys_logininfor` VALUES (193, 'zhangyuan', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 22:42:51');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 22:42:53');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 22:45:05');
INSERT INTO `sys_logininfor` VALUES (196, 'zhangyuan', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 22:45:08');
INSERT INTO `sys_logininfor` VALUES (197, 'zhangyuan', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 22:45:16');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 22:45:19');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 22:46:24');
INSERT INTO `sys_logininfor` VALUES (200, 'zhangyuan', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 22:46:26');
INSERT INTO `sys_logininfor` VALUES (201, 'zhangyuan', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 22:46:32');
INSERT INTO `sys_logininfor` VALUES (202, 'zhangyuan', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 22:46:35');
INSERT INTO `sys_logininfor` VALUES (203, 'zhangyuan', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 22:46:47');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 22:46:49');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 23:06:12');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 23:06:13');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 23:06:36');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 23:09:37');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 23:11:01');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 23:15:37');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 23:15:38');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 23:16:06');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 23:16:07');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2026-01-10 23:16:25');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 23:16:27');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 23:17:34');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 23:46:07');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-10 23:53:42');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 00:03:43');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 00:32:56');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 00:41:47');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 00:45:11');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 00:47:03');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 00:50:21');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 01:32:53');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 01:35:37');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 01:36:30');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 01:38:28');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 01:42:06');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 01:49:21');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 01:51:37');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 01:53:47');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 01:56:48');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 02:01:59');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 02:04:07');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2026-01-11 02:10:27');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2010 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-05-25 22:40:53', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2022-05-25 22:40:53', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2022-05-25 22:40:53', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'JSON对比管理', 0, 4, '/system/record', 'menuItem', 'M', '0', '1', 'system:record:view', 'fa fa-book', 'admin', '2022-05-25 22:40:53', 'admin', '2026-01-10 23:16:20', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2022-05-25 22:40:53', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2022-05-25 22:40:53', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2022-05-25 22:40:53', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2022-05-25 22:40:53', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2022-05-25 22:40:53', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2022-05-25 22:40:53', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2022-05-25 22:40:53', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2022-05-25 22:40:53', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2022-05-25 22:40:53', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2022-05-25 22:40:53', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2022-05-25 22:40:53', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2022-05-25 22:40:53', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2022-05-25 22:40:53', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2022-05-25 22:40:53', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2022-05-25 22:40:53', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2022-05-25 22:40:53', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2022-05-25 22:40:53', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2022-05-25 22:40:53', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2022-05-25 22:40:53', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, 'JSON查询', 4, 1, '#', 'menuItem', 'F', '0', '1', 'system:record:list', '#', 'admin', '2026-01-10 23:03:07', 'admin', '2026-01-10 23:14:53', '');
INSERT INTO `sys_menu` VALUES (2013, 'JSON删除', 4, 3, '#', 'menuItem', 'F', '0', '1', 'system:record:remove', '#', 'admin', '2026-01-10 23:04:07', 'admin', '2026-01-10 23:15:14', '');
INSERT INTO `sys_menu` VALUES (2014, 'JSON添加', 4, 2, '#', 'menuItem', 'F', '0', '1', 'system:record:add', '#', 'admin', '2026-01-10 23:05:05', 'admin', '2026-01-10 23:15:05', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (103, '登录日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'POST', 1, 'admin', '研发部门', '/monitor/logininfor/remove', '192.168.1.7', '内网IP', '{\"ids\":[\"114,113,112,111,110,109,108,107,106,105\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 11:21:58');
INSERT INTO `sys_oper_log` VALUES (104, '登录日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'POST', 1, 'admin', '研发部门', '/monitor/logininfor/remove', '192.168.1.7', '内网IP', '{\"ids\":[\"104,103,102,101,100\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 11:22:00');
INSERT INTO `sys_oper_log` VALUES (105, '操作日志', 3, 'com.ruoyi.web.controller.monitor.SysOperlogController.remove()', 'POST', 1, 'admin', '研发部门', '/monitor/operlog/remove', '192.168.1.7', '内网IP', '{\"ids\":[\"102,101,100\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 11:22:05');
INSERT INTO `sys_oper_log` VALUES (106, '创建表', 0, 'com.ruoyi.generator.controller.GenController.create()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":[\"CREATE TABLE `t_book_type1` (\\n  `id` bigint NOT NULL AUTO_INCREMENT COMMENT \'id主键\',\\n  `name` varchar(255) DEFAULT NULL COMMENT \'图书分类\',\\n  `type_code` varchar(255) DEFAULT NULL COMMENT \'分类编码\',\\n  `del_flag` int DEFAULT NULL COMMENT \'删除标识0未删除1已删除\',\\n  `create_user` bigint DEFAULT NULL COMMENT \'创建人\',\\n  `create_time` timestamp NULL DEFAULT NULL COMMENT \'创建时间\',\\n  `update_user` bigint DEFAULT NULL COMMENT \'更新人\',\\n  `update_time` timestamp NULL DEFAULT NULL COMMENT \'更新时间\',\\n  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT \'数据库时间戳\',\\n  PRIMARY KEY (`id`)\\n) ENGINE=InnoDB DEFAULT CHARSET=utf8;\"]}', '{\"msg\":\"创建表结构异常[参数存在SQL注入风险]\",\"code\":500}', 0, NULL, '2022-05-27 21:43:51');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_book_type,t_book\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 21:44:12');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2022-05-27 21:49:53');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"图书管理\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 21:51:38');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"图书管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 21:51:49');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"图书管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 21:51:55');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"图书管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 21:52:05');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"图书管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 21:53:35');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"t_book_type\"],\"tableComment\":[\"图书分类\"],\"className\":[\"TBookTypeEntity\"],\"functionAuthor\":[\"liusc\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"18\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"id主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"19\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"图书分类\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"20\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"分类编码\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"typeCode\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"21\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"删除标识0未删除1已删除\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"delFlag\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"22\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建人\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"createUser\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"23\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"datetime\"],\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 21:54:38');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"t_book\"],\"tableComment\":[\"图书信息管理\"],\"className\":[\"TBookEntity\"],\"functionAuthor\":[\"liusc\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"id主键\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"图书名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"图书作者\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"author\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"图书数量\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"number\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"出版社\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"publish\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"6\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"出版时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"pubTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isE', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 21:55:15');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_book,t_book_type\"]}', NULL, 0, NULL, '2022-05-27 21:55:45');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"4\"],\"menuType\":[\"M\"],\"menuName\":[\"图书分类\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 22:05:03');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"图书分类\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 22:05:56');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"图书信息\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bookmark\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 22:06:21');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"图书信息\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bookmark\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 22:06:40');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"图书分类\"],\"url\":[\"/system/booktype\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 22:08:08');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"图书信息\"],\"url\":[\"/system/book\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bookmark\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 22:08:17');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"图书分类\"],\"url\":[\"/system/booktype\"],\"target\":[\"menuItem\"],\"perms\":[\"system:booktype:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 22:12:05');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"图书信息\"],\"url\":[\"/system/book\"],\"target\":[\"menuItem\"],\"perms\":[\"system:book:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bookmark\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-27 22:12:16');
INSERT INTO `sys_oper_log` VALUES (125, '图书分类管理', 1, 'com.ruoyi.web.controller.library.TBookTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/booktype/add', '127.0.0.1', '内网IP', '{\"name\":[\"科技类\"],\"typeCode\":[\"001\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 10:24:11');
INSERT INTO `sys_oper_log` VALUES (126, '图书分类管理', 2, 'com.ruoyi.web.controller.library.TBookTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/booktype/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"科技类\"],\"typeCode\":[\"002\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 12:39:19');
INSERT INTO `sys_oper_log` VALUES (127, '图书分类管理', 3, 'com.ruoyi.web.controller.library.TBookTypeController.remove()', 'POST', 1, 'admin', '研发部门', '/system/booktype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 12:40:15');
INSERT INTO `sys_oper_log` VALUES (128, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/add', '127.0.0.1', '内网IP', '{\"dictName\":[\"语言\"],\"dictType\":[\"book_language\"],\"status\":[\"0\"],\"remark\":[\"书类语言\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 12:48:37');
INSERT INTO `sys_oper_log` VALUES (129, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"中文\"],\"dictValue\":[\"1\"],\"dictType\":[\"book_language\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"语言 1中文 2英语 3其他语言\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 12:50:15');
INSERT INTO `sys_oper_log` VALUES (130, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"英语\"],\"dictValue\":[\"2\"],\"dictType\":[\"book_language\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"语言 1中文 2英语 3其他语言\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 12:50:33');
INSERT INTO `sys_oper_log` VALUES (131, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', '内网IP', '{\"dictLabel\":[\"其他语言\"],\"dictValue\":[\"3\"],\"dictType\":[\"book_language\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"语言 1中文 2英语 3其他语言\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 12:50:45');
INSERT INTO `sys_oper_log` VALUES (132, '图书分类管理', 1, 'com.ruoyi.web.controller.library.TBookTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/booktype/add', '127.0.0.1', '内网IP', '{\"name\":[\"少儿类\"],\"typeCode\":[\"001\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 18:59:45');
INSERT INTO `sys_oper_log` VALUES (133, '图书信息管理', 1, 'com.ruoyi.web.controller.library.TBookController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/book/add', '127.0.0.1', '内网IP', '{\"name\":[\"mysql必知必会\"],\"author\":[\"张媛\"],\"number\":[\"5\"],\"publish\":[\"张媛出版社\"],\"pubTime\":[\"2022-05-28\"],\"introduction\":[\"mysql必知必会\"],\"isbn\":[\"101\"],\"language\":[\"1\"],\"price\":[\"999.5\"]}', '{\"msg\":\"图书分类不允许为空!\",\"code\":500}', 0, NULL, '2022-05-28 22:43:37');
INSERT INTO `sys_oper_log` VALUES (134, '图书信息管理', 1, 'com.ruoyi.web.controller.library.TBookController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/book/add', '127.0.0.1', '内网IP', '{\"bookType\":[\"1\"],\"name\":[\"MySQL必知必会\"],\"author\":[\"张媛\"],\"number\":[\"5\"],\"publish\":[\"张媛出版社\"],\"pubTime\":[\"2022-05-28\"],\"introduction\":[\"MySQL必知必会\"],\"isbn\":[\"101\"],\"language\":[\"1\"],\"price\":[\"999.5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 22:46:54');
INSERT INTO `sys_oper_log` VALUES (135, '图书信息管理', 1, 'com.ruoyi.web.controller.library.TBookController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/book/add', '127.0.0.1', '内网IP', '{\"bookType\":[\"2\"],\"name\":[\"没有共产党就没有新中国\"],\"author\":[\"张媛\"],\"number\":[\"2\"],\"publish\":[\"机械出版社\"],\"pubTime\":[\"2022-05-26\"],\"introduction\":[\"没有共产党就没有新中国\"],\"isbn\":[\"102\"],\"language\":[\"1\"],\"price\":[\"120.8\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 23:03:20');
INSERT INTO `sys_oper_log` VALUES (136, '图书信息管理', 2, 'com.ruoyi.web.controller.library.TBookController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"MySQL必知必会1\"],\"author\":[\"张媛1\"],\"number\":[\"1\"],\"publish\":[\"张媛出版社1\"],\"pubTime\":[\"2022-05-29\"],\"introduction\":[\"MySQL必知必会1\"],\"isbn\":[\"101\"],\"language\":[\"3\"],\"price\":[\"999.51\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 23:10:28');
INSERT INTO `sys_oper_log` VALUES (137, '图书信息管理', 3, 'com.ruoyi.web.controller.library.TBookController.remove()', 'POST', 1, 'admin', '研发部门', '/system/book/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 23:11:15');
INSERT INTO `sys_oper_log` VALUES (138, '图书信息管理', 2, 'com.ruoyi.web.controller.library.TBookController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"MySQL必知必会\"],\"author\":[\"张媛\"],\"number\":[\"3\"],\"publish\":[\"张媛出版社\"],\"pubTime\":[\"2022-05-29\"],\"introduction\":[\"MySQL必知必会\"],\"isbn\":[\"101\"],\"language\":[\"2\"],\"price\":[\"999.51\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 23:11:56');
INSERT INTO `sys_oper_log` VALUES (139, '图书信息管理', 2, 'com.ruoyi.web.controller.library.TBookController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"bookType\":[\"2\"],\"name\":[\"MySQL必知必会\"],\"author\":[\"张媛\"],\"number\":[\"3\"],\"publish\":[\"张媛出版社\"],\"pubTime\":[\"2022-05-29\"],\"introduction\":[\"MySQL必知必会\"],\"isbn\":[\"101\"],\"language\":[\"2\"],\"price\":[\"999.51\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 23:17:04');
INSERT INTO `sys_oper_log` VALUES (140, '图书信息管理', 2, 'com.ruoyi.web.controller.library.TBookController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/book/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"bookType\":[\"1\"],\"name\":[\"没有共产党就没有新中国\"],\"author\":[\"张媛\"],\"number\":[\"2\"],\"publish\":[\"机械出版社\"],\"pubTime\":[\"2022-05-26\"],\"introduction\":[\"没有共产党就没有新中国\"],\"isbn\":[\"102\"],\"language\":[\"1\"],\"price\":[\"120.80\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-05-28 23:17:22');
INSERT INTO `sys_oper_log` VALUES (141, '图书信息管理', 5, 'com.ruoyi.web.controller.library.TBookController.export()', 'POST', 1, 'admin', '研发部门', '/system/book/export', '127.0.0.1', '内网IP', '{\"name\":[\"\"],\"author\":[\"\"],\"publish\":[\"\"],\"language\":[\"\"],\"orderByColumn\":[\"\"],\"isAsc\":[\"asc\"]}', '{\"msg\":\"bde95d63-87ad-45e6-bd27-3b288cae3fe2_图书信息管理数据.xlsx\",\"code\":0}', 0, NULL, '2022-06-04 21:31:52');
INSERT INTO `sys_oper_log` VALUES (142, '图书分类管理', 3, 'com.ruoyi.web.controller.library.TBookTypeController.remove()', 'POST', 1, 'admin', '研发部门', '/system/booktype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 21:32:24');
INSERT INTO `sys_oper_log` VALUES (143, '图书分类管理', 1, 'com.ruoyi.web.controller.library.TBookTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/booktype/add', '127.0.0.1', '内网IP', '{\"name\":[\"科技类\"],\"typeCode\":[\"002\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 21:34:38');
INSERT INTO `sys_oper_log` VALUES (144, '图书分类管理', 2, 'com.ruoyi.web.controller.library.TBookTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/booktype/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"少儿类1\"],\"typeCode\":[\"001\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 21:37:28');
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_reader_info\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 22:28:44');
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_reader_info\"],\"tableComment\":[\"读者信息表\"],\"className\":[\"TReaderInfoEntity\"],\"functionAuthor\":[\"zhangyuan\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"27\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"28\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"29\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"读者性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"30\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"读者生日\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"birth\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"31\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"读者地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"32\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"读者电话\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"phone\"],\"columns[5].isInsert', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 22:37:46');
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_reader_info\"],\"tableComment\":[\"读者信息表\"],\"className\":[\"TReaderInfoEntity\"],\"functionAuthor\":[\"zhangyuan\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"27\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"28\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"29\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"读者性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"30\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"读者生日\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"birth\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"31\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"读者地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"32\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"读者电话\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"phone\"],\"columns[5].isInse', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 22:42:09');
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_reader_info\"],\"tableComment\":[\"读者信息表\"],\"className\":[\"TReaderInfoEntity\"],\"functionAuthor\":[\"zhangyuan\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"27\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"28\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"29\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"读者性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"30\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"读者生日\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"birth\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"31\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"读者地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"32\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"读者电话\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"phone\"],\"columns[5].isInse', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 22:42:31');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_reader_info\"],\"tableComment\":[\"读者信息表\"],\"className\":[\"TReaderInfoEntity\"],\"functionAuthor\":[\"zhangyuan\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"27\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"28\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"29\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"读者性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"30\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"读者生日\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"birth\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"31\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"读者地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"32\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"读者电话\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"phone\"],\"columns[5].isInse', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 22:43:34');
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_reader_info', '127.0.0.1', '内网IP', '\"t_reader_info\"', NULL, 0, NULL, '2022-06-04 22:43:57');
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_reader_info', '127.0.0.1', '内网IP', '\"t_reader_info\"', NULL, 0, NULL, '2022-06-04 22:45:13');
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_reader_info\"],\"tableComment\":[\"读者信息表\"],\"className\":[\"TReaderInfoEntity\"],\"functionAuthor\":[\"zhangyuan\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"27\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"28\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"29\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"读者性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"30\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"读者生日\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"birth\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"31\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"读者地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"32\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"读者电话\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"phone\"],\"columns[5].isInse', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 22:49:03');
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.genCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/genCode/t_reader_info', '127.0.0.1', '内网IP', '\"t_reader_info\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 22:49:08');
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_reader_info\"]}', NULL, 0, NULL, '2022-06-04 22:51:13');
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_reader_info\"],\"tableComment\":[\"读者信息表\"],\"className\":[\"TReaderInfoEntity\"],\"functionAuthor\":[\"zhangyuan\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"27\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"28\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"29\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"读者性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"30\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"读者生日\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"birth\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"31\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"读者地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"32\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"读者电话\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"phone\"],\"columns[5].isInse', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 22:51:31');
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_reader_info\"]}', NULL, 0, NULL, '2022-06-04 22:51:40');
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"3\"],\"tableName\":[\"t_reader_info\"],\"tableComment\":[\"读者信息表\"],\"className\":[\"TReaderInfoEntity\"],\"functionAuthor\":[\"zhangyuan\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"27\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"28\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者姓名\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"name\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"29\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"读者性别\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"sex\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"select\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"30\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"读者生日\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"birth\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"31\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"读者地址\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"address\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"LIKE\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"32\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"读者电话\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"phone\"],\"columns[5].isInse', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 23:05:29');
INSERT INTO `sys_oper_log` VALUES (158, '图书分类管理', 1, 'com.ruoyi.web.controller.library.TBookTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/booktype/add', '127.0.0.1', '内网IP', '{\"name\":[\"童话类\"],\"typeCode\":[\"003\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 23:35:33');
INSERT INTO `sys_oper_log` VALUES (159, '图书分类管理', 1, 'com.ruoyi.web.controller.library.TBookTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/booktype/add', '127.0.0.1', '内网IP', '{\"name\":[\"神话类\"],\"typeCode\":[\"004\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 23:42:20');
INSERT INTO `sys_oper_log` VALUES (160, '图书分类管理', 1, 'com.ruoyi.web.controller.library.TBookTypeController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/booktype/add', '127.0.0.1', '内网IP', '{\"name\":[\"股票分红张媛测试-001\"],\"typeCode\":[\"003\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-04 23:55:20');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"读者\"],\"url\":[\"/system/reader\"],\"target\":[\"menuItem\"],\"perms\":[\"system:reader:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 00:44:21');
INSERT INTO `sys_oper_log` VALUES (162, '读者信息', 1, 'com.ruoyi.web.controller.library.TReaderInfoEntityController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/reader/add', '127.0.0.1', '内网IP', '{\"name\":[\"股票分红张媛测试-001\"],\"birth\":[\"2022-06-22\"],\"address\":[\"1\"],\"phone\":[\"17610132811\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 00:45:39');
INSERT INTO `sys_oper_log` VALUES (163, '读者信息', 2, 'com.ruoyi.web.controller.library.TReaderInfoEntityController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-24\"],\"address\":[\"2\"],\"phone\":[\"17610132822\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 00:45:59');
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"t_reader_card\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 16:53:21');
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"t_reader_card\"],\"tableComment\":[\"借阅卡\"],\"className\":[\"TReaderCard\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"33\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id(卡号)\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"34\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"readerId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"35\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"登录卡号用户名\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"36\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"登录卡号密码\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"userPassword\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"reader_card\"],\"functionName\":[\"借阅卡\"],\"params[parentMenuId]\":[\"4\"],\"params[parentMenuName]\":[\"图书管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 16:56:16');
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"t_reader_card\"]}', NULL, 0, NULL, '2022-06-05 16:56:20');
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"t_reader_card\"],\"tableComment\":[\"借阅卡\"],\"className\":[\"TReaderCard\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"33\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id(卡号)\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"34\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者id\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"readerId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"35\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"登录卡号用户名\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"36\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"登录卡号密码\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"userPassword\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"sub\"],\"packageName\":[\"com.ruoyi.system\"],\"moduleName\":[\"system\"],\"businessName\":[\"reader_card\"],\"functionName\":[\"借阅卡\"],\"params[parentMenuId]\":[\"4\"],\"params[parentMenuName]\":[\"图书管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"t_reader_info\"],\"subTableFkName\":[\"id\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 17:04:20');
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_reader_card', '127.0.0.1', '内网IP', '\"t_reader_card\"', NULL, 0, NULL, '2022-06-05 17:04:27');
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_reader_card', '127.0.0.1', '内网IP', '\"t_reader_card\"', NULL, 0, NULL, '2022-06-05 17:04:54');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅卡信息管理\"],\"url\":[\"/system/reader_card\"],\"target\":[\"menuItem\"],\"perms\":[\"system:reader_card:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 17:41:00');
INSERT INTO `sys_oper_log` VALUES (171, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"超级管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"超级管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,4,2000,2001,2002,2003\"]}', NULL, 1, '不允许操作超级管理员角色', '2022-06-05 17:41:57');
INSERT INTO `sys_oper_log` VALUES (172, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"1\"],\"roleName\":[\"超级管理员\"],\"roleKey\":[\"admin\"],\"roleSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"超级管理员\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116,4,2000,2001,2002,2003\"]}', NULL, 1, '不允许操作超级管理员角色', '2022-06-05 17:42:04');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"读者\"],\"url\":[\"/system/reader1\"],\"target\":[\"menuItem\"],\"perms\":[\"system:reader:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 18:04:39');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"读者\"],\"url\":[\"/system/reader\"],\"target\":[\"menuItem\"],\"perms\":[\"system:reader:view1\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 18:06:19');
INSERT INTO `sys_oper_log` VALUES (175, '读者信息', 1, 'com.ruoyi.web.controller.library.TReaderInfoEntityController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/reader/add', '127.0.0.1', '内网IP', '{\"name\":[\"1\"],\"birth\":[\"2022-06-05\"],\"address\":[\"1\"],\"phone\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 18:06:46');
INSERT INTO `sys_oper_log` VALUES (176, '读者信息', 3, 'com.ruoyi.web.controller.library.TReaderInfoEntityController.remove()', 'POST', 1, 'admin', '研发部门', '/system/reader/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-06-05 18:06:54');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2000\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"图书分类\"],\"url\":[\"/library/booktype\"],\"target\":[\"menuItem\"],\"perms\":[\"library:booktype:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-archive\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 10:09:53');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2004\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅卡\"],\"url\":[\"/library/reader_card\"],\"target\":[\"menuItem\"],\"perms\":[\"library:reader_card:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 10:10:07');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"图书信息\"],\"url\":[\"/library/book\"],\"target\":[\"menuItem\"],\"perms\":[\"library:book:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bookmark\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 10:10:15');
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"读者\"],\"url\":[\"/library/reader\"],\"target\":[\"menuItem\"],\"perms\":[\"library:reader:view1\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 10:10:23');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅卡信息管理\"],\"url\":[\"/library/reader_card\"],\"target\":[\"menuItem\"],\"perms\":[\"library:reader_card:view\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 10:10:31');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2004\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅卡\"],\"url\":[\"/library/reader\"],\"target\":[\"menuItem\"],\"perms\":[\"library:reader:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 10:12:09');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"读者\"],\"url\":[\"/library/reader\"],\"target\":[\"menuItem\"],\"perms\":[\"library:reader:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 10:14:35');
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2004\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅卡\"],\"url\":[\"/library/borrowing\"],\"target\":[\"menuItem\"],\"perms\":[\"library:borrowingview\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 10:15:26');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2003', '127.0.0.1', '内网IP', '2003', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 10:16:23');
INSERT INTO `sys_oper_log` VALUES (186, '图书分类管理', 2, 'com.ruoyi.web.controller.library.BookTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/booktype/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"少儿类\"],\"typeCode\":[\"001\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 11:16:50');
INSERT INTO `sys_oper_log` VALUES (187, '读者信息', 2, 'com.ruoyi.web.controller.library.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-24\"],\"userSex\":[\"1\"],\"address\":[\"2\"],\"phone\":[\"17610132822\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 11:23:52');
INSERT INTO `sys_oper_log` VALUES (188, '读者信息', 2, 'com.ruoyi.web.controller.library.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-24\"],\"userSex\":[\"0\"],\"address\":[\"2\"],\"phone\":[\"17610132822\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 11:25:57');
INSERT INTO `sys_oper_log` VALUES (189, '读者信息', 2, 'com.ruoyi.web.controller.library.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-24\"],\"sex\":[\"1\"],\"address\":[\"2\"],\"phone\":[\"17610132822\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 11:27:30');
INSERT INTO `sys_oper_log` VALUES (190, '读者信息', 2, 'com.ruoyi.web.controller.library.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-24\"],\"sex\":[\"1\"],\"address\":[\"2\"],\"phone\":[\"17610132822\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 11:32:37');
INSERT INTO `sys_oper_log` VALUES (191, '读者信息', 2, 'com.ruoyi.web.controller.library.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-24\"],\"sex\":[\"1\"],\"address\":[\"北京市昌平区天通苑西一区31号楼4单元602\"],\"phone\":[\"17610132822\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 11:33:53');
INSERT INTO `sys_oper_log` VALUES (192, '读者信息', 2, 'com.ruoyi.web.controller.library.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-24\"],\"sex\":[\"1\"],\"address\":[\"北京市昌平区天通苑西一区31号楼4单元602\"],\"phone\":[\"17610132811\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 11:34:01');
INSERT INTO `sys_oper_log` VALUES (193, '读者信息', 1, 'com.ruoyi.web.controller.library.ReaderInfoController.addSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/add', '127.0.0.1', '内网IP', '{\"name\":[\"liusc\"],\"sex\":[\"0\"],\"birth\":[\"2023-05-18\"],\"address\":[\"河北省唐山市滦南县倴城镇\"],\"phone\":[\"17610071080\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 11:34:30');
INSERT INTO `sys_oper_log` VALUES (194, '读者信息', 2, 'com.ruoyi.web.controller.library.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"刘帅辰\"],\"birth\":[\"2023-05-18\"],\"sex\":[\"0\"],\"address\":[\"河北省唐山市滦南县倴城镇\"],\"phone\":[\"17610071080\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 11:34:40');
INSERT INTO `sys_oper_log` VALUES (195, '读者信息', 2, 'com.ruoyi.library.controller.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-23\"],\"sex\":[\"1\"],\"address\":[\"北京市昌平区天通苑西一区31号楼4单元602\"],\"phone\":[\"2023-05-18 14:39:44\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 14:47:21');
INSERT INTO `sys_oper_log` VALUES (196, '读者信息', 2, 'com.ruoyi.library.controller.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"刘帅辰\"],\"birth\":[\"2023-05-17\"],\"sex\":[\"0\"],\"address\":[\"河北省唐山市滦南县倴城镇\"],\"phone\":[\"2023-05-18 14:39:46\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 14:47:26');
INSERT INTO `sys_oper_log` VALUES (197, '读者信息', 2, 'com.ruoyi.library.controller.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-22\"],\"sex\":[\"1\"],\"address\":[\"北京市昌平区天通苑西一区31号楼4单元602\"],\"phone\":[\"2023-05-18 14:47:21\"]}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1\',\n            \'2023-05-18 14:52:06.218\' \n        where id = 1\' at line 7\r\n### The error may exist in file [D:\\library_20230517\\libraryDemo\\library\\target\\classes\\mapper\\library\\ReaderInfoEntityMapper.xml]\r\n### The error may involve com.ruoyi.library.mapper.ReaderInfoEntityMapper.updateTReaderInfoEntity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_reader_info          SET name = ?,             sex = ?,             birth = ?,             address = ?,             phone = ?,             ?,             ?          where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1\',\n            \'2023-05-18 14:52:06.218\' \n        where id = 1\' at line 7\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'1\',\n            \'2023-05-18 14:52:06.218\' \n        where id = 1\' at line 7', '2023-05-18 14:52:06');
INSERT INTO `sys_oper_log` VALUES (198, '读者信息', 2, 'com.ruoyi.library.controller.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-22\"],\"sex\":[\"1\"],\"address\":[\"北京市昌平区天通苑西一区31号楼4单元602\"],\"phone\":[\"2023-05-18 14:47:21\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 14:54:14');
INSERT INTO `sys_oper_log` VALUES (199, '读者信息', 2, 'com.ruoyi.library.controller.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"刘帅辰\"],\"birth\":[\"2023-05-16\"],\"sex\":[\"0\"],\"address\":[\"河北省唐山市滦南县倴城镇\"],\"phone\":[\"2023-05-18 14:47:26\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 14:54:34');
INSERT INTO `sys_oper_log` VALUES (200, '读者信息', 2, 'com.ruoyi.library.controller.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"1\"],\"name\":[\"股票分红张媛测试-002\"],\"birth\":[\"2022-06-22\"],\"sex\":[\"1\"],\"address\":[\"北京市昌平区天通苑西一区31号楼4单元602\"],\"phone\":[\"17610132811\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 14:55:33');
INSERT INTO `sys_oper_log` VALUES (201, '读者信息', 2, 'com.ruoyi.library.controller.ReaderInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/library/reader/edit', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"name\":[\"刘帅辰\"],\"birth\":[\"2023-05-16\"],\"sex\":[\"0\"],\"address\":[\"河北省唐山市滦南县倴城镇\"],\"phone\":[\"17610071080\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 14:55:39');
INSERT INTO `sys_oper_log` VALUES (202, '图书分类管理', 3, 'com.ruoyi.library.controller.BookTypeController.remove()', 'POST', 1, 'admin', '研发部门', '/library/booktype/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 14:56:14');
INSERT INTO `sys_oper_log` VALUES (203, '图书信息管理', 3, 'com.ruoyi.library.controller.BookController.remove()', 'POST', 1, 'admin', '研发部门', '/library/book/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 15:05:44');
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/t_reader_card', '127.0.0.1', '内网IP', '\"t_reader_card\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 16:04:44');
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_reader_card', '127.0.0.1', '内网IP', '\"t_reader_card\"', NULL, 0, NULL, '2023-05-18 16:06:23');
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"t_reader_card\"],\"tableComment\":[\"借阅卡\"],\"className\":[\"ReaderCard\"],\"functionAuthor\":[\"liusc\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"33\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者卡号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"cardNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"35\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户名\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"36\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"用户密码\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"userPassword\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"38\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"借阅卡状态\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"cardStatus\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"radio\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"39\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"删除标识\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"delFlag\"],\"columns[5].isInse', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 16:07:27');
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"4\"],\"tableName\":[\"t_reader_card\"],\"tableComment\":[\"借阅卡\"],\"className\":[\"ReaderCard\"],\"functionAuthor\":[\"liusc\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"33\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"读者卡号\"],\"columns[1].javaType\":[\"Long\"],\"columns[1].javaField\":[\"cardNumber\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"35\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"用户名\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"userName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"36\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"用户密码\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"userPassword\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"38\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"借阅卡状态\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"cardStatus\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"radio\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"39\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"删除标识\"],\"columns[5].javaType\":[\"Long\"],\"columns[5].javaField\":[\"delFlag\"],\"columns[5].isInse', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 16:07:58');
INSERT INTO `sys_oper_log` VALUES (208, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/t_reader_card', '127.0.0.1', '内网IP', '\"t_reader_card\"', NULL, 0, NULL, '2023-05-18 16:08:03');
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2023-05-18 16:11:12');
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2005', '127.0.0.1', '内网IP', '2005', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 16:11:16');
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2006', '127.0.0.1', '内网IP', '2006', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 16:11:30');
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":301}', 0, NULL, '2023-05-18 16:11:36');
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2007', '127.0.0.1', '内网IP', '2007', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 16:11:42');
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2008', '127.0.0.1', '内网IP', '2008', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 16:11:50');
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2009', '127.0.0.1', '内网IP', '2009', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 16:11:55');
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2004', '127.0.0.1', '内网IP', '2004', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 16:12:01');
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅卡\"],\"url\":[\"/library/reader_card\"],\"target\":[\"menuItem\"],\"perms\":[\"library:reader_card:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 17:13:25');
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"借阅卡\"],\"url\":[\"/library/reader_card\"],\"target\":[\"menuItem\"],\"perms\":[\"library:reader_card:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 17:14:03');
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"读者信息\"],\"url\":[\"/library/reader\"],\"target\":[\"menuItem\"],\"perms\":[\"library:reader:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-calculator\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-05-18 17:14:26');
INSERT INTO `sys_oper_log` VALUES (220, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"zhangyuan\"],\"deptName\":[\"研发部门\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"zhangyuan\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:42:01');
INSERT INTO `sys_oper_log` VALUES (221, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '研发部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"roleIds\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:42:34');
INSERT INTO `sys_oper_log` VALUES (222, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"dev\"],\"roleKey\":[\"dev\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"dev\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:44:54');
INSERT INTO `sys_oper_log` VALUES (223, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'POST', 1, 'admin', '研发部门', '/system/user/authRole/insertAuthRole', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"roleIds\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:45:03');
INSERT INTO `sys_oper_log` VALUES (224, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '研发部门', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"dev\"],\"roleKey\":[\"dev\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:45:53');
INSERT INTO `sys_oper_log` VALUES (225, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"dev\"],\"roleKey\":[\"dev\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"dev\"],\"menuIds\":[\"4,2000,2001,2002,2010\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:46:20');
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"JSON对比管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:51:05');
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2026-01-10 22:51:15');
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2026-01-10 22:52:46');
INSERT INTO `sys_oper_log` VALUES (229, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:53:00');
INSERT INTO `sys_oper_log` VALUES (230, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"dev\"],\"roleKey\":[\"dev\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"dev\"],\"menuIds\":[\"\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:53:05');
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2000', '127.0.0.1', '内网IP', '2000', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:53:13');
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"record\"],\"url\":[\"/system/record\"],\"target\":[\"menuItem\"],\"perms\":[\"system:record:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bookmark\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:54:02');
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2002', '127.0.0.1', '内网IP', '2002', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:54:12');
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2010', '127.0.0.1', '内网IP', '2010', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 22:54:16');
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"JSON查询\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:03:07');
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2011\"],\"menuType\":[\"F\"],\"menuName\":[\"JSON删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:03:42');
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2012', '127.0.0.1', '内网IP', '2012', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:03:56');
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"JSON删除\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:04:07');
INSERT INTO `sys_oper_log` VALUES (239, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"JSON查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:record:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:04:34');
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"JSON删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:record:remove\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:04:46');
INSERT INTO `sys_oper_log` VALUES (241, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"JSON添加\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"system:record:add\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:05:05');
INSERT INTO `sys_oper_log` VALUES (242, '添加JSON数据对比源', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/record/add', '127.0.0.1', '内网IP', '{\"id\":[\"2\"],\"clustag\":[\"2\"],\"accountId\":[\"2\"],\"responseJson\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:11:10');
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"F\"],\"menuName\":[\"JSON对比管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:record:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:14:40');
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"4\"],\"menuType\":[\"F\"],\"menuName\":[\"JSON查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:record:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:14:53');
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2014\"],\"parentId\":[\"4\"],\"menuType\":[\"F\"],\"menuName\":[\"JSON添加\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:record:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:15:05');
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2013\"],\"parentId\":[\"4\"],\"menuType\":[\"F\"],\"menuName\":[\"JSON删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"system:record:remove\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:15:14');
INSERT INTO `sys_oper_log` VALUES (247, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/2001', '127.0.0.1', '内网IP', '2001', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:15:32');
INSERT INTO `sys_oper_log` VALUES (248, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"JSON对比管理\"],\"url\":[\"/system/record\"],\"target\":[\"menuItem\"],\"perms\":[\"system:record:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:16:01');
INSERT INTO `sys_oper_log` VALUES (249, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"JSON对比管理\"],\"url\":[\"/system/record\"],\"target\":[\"menuItem\"],\"perms\":[\"system:record:view\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:16:20');
INSERT INTO `sys_oper_log` VALUES (250, '添加JSON数据对比源', 3, 'com.ruoyi.web.controller.system.AssetRecordController.remove()', 'POST', 1, 'admin', '研发部门', '/system/record/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4,1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:46:16');
INSERT INTO `sys_oper_log` VALUES (251, '添加JSON数据对比源', 3, 'com.ruoyi.web.controller.system.AssetRecordController.remove()', 'POST', 1, 'admin', '研发部门', '/system/record/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-10 23:46:24');
INSERT INTO `sys_oper_log` VALUES (252, '添加JSON数据对比源', 3, 'com.ruoyi.web.controller.system.AssetRecordController.diffJson()', 'POST', 1, 'admin', '研发部门', '/system/record/diffJson', '127.0.0.1', '内网IP', '{\"ids\":[\"2,3\"]}', NULL, 0, NULL, '2026-01-11 00:03:52');
INSERT INTO `sys_oper_log` VALUES (253, '添加JSON数据对比源', 3, 'com.ruoyi.web.controller.system.AssetRecordController.diffJson()', 'POST', 1, 'admin', '研发部门', '/system/record/diffJson', '127.0.0.1', '内网IP', '{\"ids\":[\"2,3\"]}', NULL, 0, NULL, '2026-01-11 00:04:11');
INSERT INTO `sys_oper_log` VALUES (254, '添加JSON数据对比源', 0, 'com.ruoyi.web.controller.system.AssetRecordController.diffJson()', 'POST', 1, 'admin', '研发部门', '/system/record/diffJson', '127.0.0.1', '内网IP', '{\"ids\":[\"2,3\"]}', '\"<html>  <head>    <meta charset=\\\"utf-8\\\">    <title>JSON 对比结果</title>  </head>  <body style=\\\"padding:16px\\\">    <h2>JSON 对比结果</h2>    <div style=\\\"margin-bottom:12px\\\">      不同项数量：<b>1</b>（与第一列不一致处标黄）    </div>    <table style=\'border-collapse:collapse;font-family:Arial,Helvetica,sans-serif;font-size:14px\'><tr><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>Path</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>2_2_2</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>3_3_3</th></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>2</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>3</td></tr></table>  </body></html>\"', 0, NULL, '2026-01-11 00:33:02');
INSERT INTO `sys_oper_log` VALUES (255, '添加JSON数据对比源', 0, 'com.ruoyi.web.controller.system.AssetRecordController.diffJson()', 'POST', 1, 'admin', '研发部门', '/system/record/diffJson', '127.0.0.1', '内网IP', '{\"ids\":[\"2,3\"]}', '\"<html>  <head>    <meta charset=\\\"utf-8\\\">    <title>JSON 对比结果</title>  </head>  <body style=\\\"padding:16px\\\">    <h2>JSON 对比结果</h2>    <div style=\\\"margin-bottom:12px\\\">      不同项数量：<b>4</b>（与第一列不一致处标黄）    </div>    <table style=\'border-collapse:collapse;font-family:Arial,Helvetica,sans-serif;font-size:14px\'><tr><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>Path</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>2_2_2</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>3_3_3</th></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.account.balance</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>9800.5</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>9800.5</td></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.account.status</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>ACTIVE</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>FROZEN</td></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.id</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>1001</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>1001</td></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.tags[0]</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>VIP</td><td style=\'padding:8px;', 0, NULL, '2026-01-11 00:35:31');
INSERT INTO `sys_oper_log` VALUES (256, '添加JSON数据对比源', 0, 'com.ruoyi.web.controller.system.AssetRecordController.diffJson()', 'POST', 1, 'admin', '研发部门', '/system/record/diffJson', '127.0.0.1', '内网IP', '{\"ids\":[\"2,3,4\"]}', '\"<html>  <head>    <meta charset=\\\"utf-8\\\">    <title>JSON 对比结果</title>  </head>  <body style=\\\"padding:16px\\\">    <h2>JSON 对比结果</h2>    <div style=\\\"margin-bottom:12px\\\">      不同项数量：<b>12</b>（与第一列不一致处标黄）    </div>    <table style=\'border-collapse:collapse;font-family:Arial,Helvetica,sans-serif;font-size:14px\'><tr><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>Path</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>2_2_2</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>3_3_3</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>4_4_4</th></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>{&quot;id&quot;:1001,&quot;user&quot;:{&quot;name&quot;:&quot;张三&quot;,&quot;age&quot;:29,&quot;gender&quot;:&quot;男&quot;,&quot;contact&quot;:{&quot;phone&quot;:&quot;13800000002&quot;,&quot;email&quot;:&quot;zhangsan@example.com&quot;}},&quot;account&quot;:{&quot;balance&quot;:9800.5,&quot;status&quot;:&quot;ACTIVE&quot;},&quot;tags&quot;:[&quot;VIP&quot;,&quot;白名单&quot;],&quot;updateTime&quot;:...</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>{&quot;id&quot;:1001,&quot;user&quot;:{&quot;name&quot;:&quot;张三&quot;,&quot;age&quot;:29,&quot;gender&quot;:&quot;男&quot;,&quot;contact&quot;:{&quot;phone&quot;:&quot;13800000002&quot;,&quot;email&quot;:&quot;zhangsan_new@example.com&quot;}},&quot;account&quot;:{&quot;balance&quot;:9800.5,&quot;status&quot;:&quot;FROZEN&quot;},&quot;tags&quot;:[&quot;VIP&quot;,&quot;风控&quot;],&quot;updateTim...</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>4</td></tr><tr><td style=\'padding:8px;bo', 0, NULL, '2026-01-11 00:35:40');
INSERT INTO `sys_oper_log` VALUES (257, '添加JSON数据对比源', 0, 'com.ruoyi.web.controller.system.AssetRecordController.diffJson()', 'POST', 1, 'admin', '研发部门', '/system/record/diffJson', '127.0.0.1', '内网IP', '{\"ids\":[\"2,3,1\"]}', '\"<html>  <head>    <meta charset=\\\"utf-8\\\">    <title>JSON 对比结果</title>  </head>  <body style=\\\"padding:16px\\\">    <h2>JSON 对比结果</h2>    <div style=\\\"margin-bottom:12px\\\">      不同项数量：<b>7</b>（与第一列不一致处标黄）    </div>    <table style=\'border-collapse:collapse;font-family:Arial,Helvetica,sans-serif;font-size:14px\'><tr><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>Path</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>1_1_1</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>2_2_2</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>3_3_3</th></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.account.balance</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>10250.75</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>9800.5</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>9800.5</td></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.account.status</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>ACTIVE</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>ACTIVE</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>FROZEN</td></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.id</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>1001</td><td style=\'padding:', 0, NULL, '2026-01-11 00:35:51');
INSERT INTO `sys_oper_log` VALUES (258, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-dev.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBSG\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"需要自定义ID!\",\"code\":500}', 0, NULL, '2026-01-11 01:37:54');
INSERT INTO `sys_oper_log` VALUES (259, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-dev.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBSG\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"需要自定义ID!\",\"code\":500}', 0, NULL, '2026-01-11 01:37:57');
INSERT INTO `sys_oper_log` VALUES (260, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBSG\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', NULL, 0, NULL, '2026-01-11 01:38:37');
INSERT INTO `sys_oper_log` VALUES (261, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBSG\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'clustag\' at row 1\r\n### The error may exist in file [D:\\20260110\\libraryDemo\\ruoyi-admin\\target\\classes\\mapper\\system\\AssetRecordMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into test_asset_record(clustag, account_id, response_json, create_time, id)         values(?, ?, ?, ?, ?)\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'clustag\' at row 1\n; Data truncation: Data too long for column \'clustag\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'clustag\' at row 1', '2026-01-11 01:42:14');
INSERT INTO `sys_oper_log` VALUES (262, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBSG\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 01:43:28');
INSERT INTO `sys_oper_log` VALUES (263, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBHK\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 01:43:41');
INSERT INTO `sys_oper_log` VALUES (264, '添加JSON数据对比源', 0, 'com.ruoyi.web.controller.system.AssetRecordController.diffJson()', 'POST', 1, 'admin', '研发部门', '/system/record/diffJson', '127.0.0.1', '内网IP', '{\"ids\":[\"6,5\"]}', '\"<html>  <head>    <meta charset=\\\"utf-8\\\">    <title>JSON 对比结果</title>  </head>  <body style=\\\"padding:16px\\\">    <h2>JSON 对比结果</h2>    <div style=\\\"margin-bottom:12px\\\">      不同项数量：<b>240</b>（与第一列不一致处标黄）    </div>    <table style=\'border-collapse:collapse;font-family:Arial,Helvetica,sans-serif;font-size:14px\'><tr><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>Path</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>5_bos-qa31.qa.tigerbrokers.net_600021022437</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>6_bos-qa31.qa.tigerbrokers.net_600021022437</th></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.data.segmentAssetResp.CONSOLIDATED.accountNo</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>600021022437</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>—</td></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.data.segmentAssetResp.CONSOLIDATED.accountType</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>MARGIN</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>—</td></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.data.segmentAssetResp.CONSOLIDATED.availableBuyingPower</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>1415.04</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>—</td></tr><tr><td style=\'padding:8px;border:1px sol', 0, NULL, '2026-01-11 01:43:52');
INSERT INTO `sys_oper_log` VALUES (265, '添加JSON数据对比源', 3, 'com.ruoyi.web.controller.system.AssetRecordController.remove()', 'POST', 1, 'admin', '研发部门', '/system/record/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6,5,2,3,4,1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 01:55:31');
INSERT INTO `sys_oper_log` VALUES (266, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBSG\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 01:56:56');
INSERT INTO `sys_oper_log` VALUES (267, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBHK\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 01:57:16');
INSERT INTO `sys_oper_log` VALUES (268, '添加JSON数据对比源', 3, 'com.ruoyi.web.controller.system.AssetRecordController.remove()', 'POST', 1, 'admin', '研发部门', '/system/record/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"8,7\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 02:02:04');
INSERT INTO `sys_oper_log` VALUES (269, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBSG\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 02:02:10');
INSERT INTO `sys_oper_log` VALUES (270, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBHK\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 02:02:19');
INSERT INTO `sys_oper_log` VALUES (271, '添加JSON数据对比源', 0, 'com.ruoyi.web.controller.system.AssetRecordController.diffJson()', 'POST', 1, 'admin', '研发部门', '/system/record/diffJson', '127.0.0.1', '内网IP', '{\"ids\":[\"10,9\"]}', '\"<html>  <head>    <meta charset=\\\"utf-8\\\">    <title>JSON 对比结果</title>  </head>  <body style=\\\"padding:16px\\\">    <h2>JSON 对比结果</h2>    <div style=\\\"margin-bottom:12px\\\">      不同项数量：<b>0</b>（与第一列不一致处标黄）    </div>    <table style=\'border-collapse:collapse;font-family:Arial,Helvetica,sans-serif;font-size:14px\'><tr><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>Path</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>9_bos-qa31.qa.tigerbrokers.net_600021022437</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>10_bos-qa31.qa.tigerbrokers.net_600021022437</th></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>—</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>—</td></tr></table>  </body></html>\"', 0, NULL, '2026-01-11 02:02:23');
INSERT INTO `sys_oper_log` VALUES (272, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBSG\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 02:03:31');
INSERT INTO `sys_oper_log` VALUES (273, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBSG\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 02:04:20');
INSERT INTO `sys_oper_log` VALUES (274, '通过接口调用触发测试', 1, 'com.ruoyi.web.controller.system.AssetRecordController.addJsonSave()', 'POST', 1, 'admin', '研发部门', '/system/record/addJson', '127.0.0.1', '内网IP', '{\"clustag\":[\"bos-qa31.qa.tigerbrokers.net\"],\"baggage\":[\"entityId=TBHK\"],\"accountId\":[\"600021022437\"],\"authorization\":[\"Basic ST-052de905f9ca42feb9cfee0c336ca216\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2026-01-11 02:04:37');
INSERT INTO `sys_oper_log` VALUES (275, '添加JSON数据对比源', 0, 'com.ruoyi.web.controller.system.AssetRecordController.diffJson()', 'POST', 1, 'admin', '研发部门', '/system/record/diffJson', '127.0.0.1', '内网IP', '{\"ids\":[\"13,12\"]}', '\"<html>  <head>    <meta charset=\\\"utf-8\\\">    <title>JSON 对比结果</title>  </head>  <body style=\\\"padding:16px\\\">    <h2>JSON 对比结果</h2>    <div style=\\\"margin-bottom:12px\\\">      不同项数量：<b>239</b>（与第一列不一致处标黄）    </div>    <table style=\'border-collapse:collapse;font-family:Arial,Helvetica,sans-serif;font-size:14px\'><tr><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>Path</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>12_bos-qa31.qa.tigerbrokers.net_600021022437</th><th style=\'padding:8px;border:1px solid #ddd;background:#f6f6f6;text-align:left\'>13_bos-qa31.qa.tigerbrokers.net_600021022437</th></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.segmentAssetResp.CONSOLIDATED.accountNo</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>600021022437</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>—</td></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.segmentAssetResp.CONSOLIDATED.accountType</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>MARGIN</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>—</td></tr><tr><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>$.segmentAssetResp.CONSOLIDATED.availableBuyingPower</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;\'>1415.04</td><td style=\'padding:8px;border:1px solid #ddd;vertical-align:top;white-space:pre-wrap;word-break:break-word;background:#fff3a3;\'>—</td></tr><tr><td style=\'padding:8px;border:1px solid #ddd;verti', 0, NULL, '2026-01-11 02:04:41');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-05-25 22:40:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-05-25 22:40:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2022-05-25 22:40:53', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2022-05-25 22:40:53', 'admin', '2026-01-10 22:53:00', '普通角色');
INSERT INTO `sys_role` VALUES (3, 'dev', 'dev', 3, '1', '0', '0', 'admin', '2026-01-10 22:44:54', 'admin', '2026-01-10 22:53:05', 'dev');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2026-01-11 02:10:28', '2022-05-25 22:40:52', 'admin', '2022-05-25 22:40:52', '', '2026-01-11 02:10:27', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2022-05-25 22:40:52', '2022-05-25 22:40:52', 'admin', '2022-05-25 22:40:52', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, 103, 'zhangyuan', 'zhangyuan', '00', '', '', '0', '', '5ec4269938da525402c1548f834b0971', '7f8a6e', '0', '0', '127.0.0.1', '2026-01-10 22:46:36', NULL, 'admin', '2026-01-10 22:42:01', '', '2026-01-10 22:46:35', NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(0) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('69568a38-e1f6-45f4-a22a-136d28f3524d', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', 'on_line', '2026-01-11 01:32:52', '2026-01-11 02:10:28', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书作者',
  `number` bigint(0) NULL DEFAULT NULL COMMENT '图书数量',
  `publish` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `pub_time` timestamp(0) NULL DEFAULT NULL COMMENT '出版时间',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `isbn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标准书号',
  `language` int(0) NULL DEFAULT NULL COMMENT '语言 1中文 2英语 3其他语言',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '图书价格',
  `book_type` bigint(0) NULL DEFAULT NULL COMMENT '图书分类',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标识 0未删除1已删除',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `ts` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES (1, 'MySQL必知必会', '张媛', 3, '张媛出版社', '2022-05-29 00:00:00', 'MySQL必知必会', '101', 2, 999.51, 2, 0, 1, '2023-05-18 15:06:25', 1, '2023-05-18 15:05:44', '2023-05-18 15:06:25');
INSERT INTO `t_book` VALUES (2, '没有共产党就没有新中国', '张媛', 2, '机械出版社', '2022-05-26 00:00:00', '没有共产党就没有新中国', '102', 1, 120.80, 1, 0, 1, '2022-05-28 23:17:22', 1, '2022-05-28 23:17:22', '2022-05-28 23:17:22');

-- ----------------------------
-- Table structure for t_book_type
-- ----------------------------
DROP TABLE IF EXISTS `t_book_type`;
CREATE TABLE `t_book_type`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书分类',
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类编码',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标识0未删除1已删除',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `ts` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_book_type
-- ----------------------------
INSERT INTO `t_book_type` VALUES (1, '科技类', '002', 0, 1, '2022-05-28 10:24:12', 1, '2022-05-28 12:39:20', '2023-05-18 14:56:42');
INSERT INTO `t_book_type` VALUES (2, '少儿类', '001', 0, 1, '2022-05-28 18:59:45', 1, '2023-05-18 11:16:50', '2023-05-18 11:16:50');
INSERT INTO `t_book_type` VALUES (3, '科技类', '002', 0, 1, '2022-06-04 21:34:38', NULL, NULL, '2022-06-04 21:34:38');
INSERT INTO `t_book_type` VALUES (4, '童话类', '003', 0, 1, '2022-06-04 23:35:32', NULL, NULL, '2022-06-04 23:35:32');
INSERT INTO `t_book_type` VALUES (5, '神话类', '004', 0, 1, '2022-06-04 23:39:35', NULL, NULL, '2022-06-04 23:39:35');
INSERT INTO `t_book_type` VALUES (6, '股票分红张媛测试-001', '003', 1, 1, '2022-06-04 23:55:20', NULL, NULL, '2023-05-18 14:56:13');

-- ----------------------------
-- Table structure for t_reader_card
-- ----------------------------
DROP TABLE IF EXISTS `t_reader_card`;
CREATE TABLE `t_reader_card`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `card_number` bigint(0) NULL DEFAULT NULL COMMENT '读者卡号',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `card_status` int(0) NULL DEFAULT NULL COMMENT '借阅卡状态',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标识',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新人时间',
  `ts` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_reader_card
-- ----------------------------

-- ----------------------------
-- Table structure for t_reader_info
-- ----------------------------
DROP TABLE IF EXISTS `t_reader_info`;
CREATE TABLE `t_reader_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '读者名称',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birth` date NULL DEFAULT NULL COMMENT '生日',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `create_user` bigint(0) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(0) NULL DEFAULT NULL COMMENT '更新人id',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标识',
  `ts` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据库时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_reader_info
-- ----------------------------
INSERT INTO `t_reader_info` VALUES (1, '股票分红张媛测试-002', '1', '2022-06-22', '北京市昌平区天通苑西一区31号楼4单元602', '17610132811', 1, '2023-05-18 14:55:04', 1, '2023-05-18 14:55:33', 0, '2023-05-18 14:55:33');
INSERT INTO `t_reader_info` VALUES (2, '刘帅辰', '0', '2023-05-16', '河北省唐山市滦南县倴城镇', '17610071080', 1, '2023-05-18 14:55:07', 1, '2023-05-18 14:55:39', 0, '2023-05-18 14:55:39');

-- ----------------------------
-- Table structure for test_asset_dict
-- ----------------------------
DROP TABLE IF EXISTS `test_asset_dict`;
CREATE TABLE `test_asset_dict`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `dict_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `dict_value` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `dict_mark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_asset_dict
-- ----------------------------
INSERT INTO `test_asset_dict` VALUES (1, 'clustag', 'bos-qa31.qa.tigerbrokers.net', NULL, '2026-01-11 01:19:42');
INSERT INTO `test_asset_dict` VALUES (2, 'clustag', 'bos-dev.qa.tigerbrokers.net', NULL, '2026-01-11 01:19:42');
INSERT INTO `test_asset_dict` VALUES (3, 'baggage', 'entityId=TBSG', NULL, '2026-01-11 01:19:43');
INSERT INTO `test_asset_dict` VALUES (4, 'baggage', 'entityId=TBHK', NULL, '2026-01-11 01:19:43');

-- ----------------------------
-- Table structure for test_asset_record
-- ----------------------------
DROP TABLE IF EXISTS `test_asset_record`;
CREATE TABLE `test_asset_record`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `clustag` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `account_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `baggage` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL DEFAULT NULL,
  `response_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_asset_record
-- ----------------------------
INSERT INTO `test_asset_record` VALUES (12, 'bos-qa31.qa.tigerbrokers.net', '600021022437', 'entityId=TBSG', '{\"segmentAssetResp\":{\"FUND\":{\"leverage\":-1,\"equalization\":0,\"overnightMarginReq\":0,\"equityWithLoan\":0,\"availableBuyingPower\":0,\"availableSettledCash\":0,\"intradayRiskLevel\":\"LOW\",\"positionValues\":[{\"rowName\":\"基金持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"总持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"positionInitMarginReq\":0,\"positionMaintainMarginReq\":0,\"buyingPower\":0,\"accountNo\":\"600021022437\",\"overnightLiquidation\":0,\"currency\":\"USD\",\"netLiquidation\":0,\"maintainMarginReq\":0,\"lockedValues\":[{\"rowName\":\"已锁定的现金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"LockedTotalCash= ALC+LP+LUS + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定的剩余资产\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"LockedTotalEE= ALM+LIM+LECM+LPD + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定购买\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金减免值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定收费金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"佣金 + 消费税 + 申购费用\"},{\"rowName\":\"已锁定提现\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定供股\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅融资公式使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅现金公式使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(融资、现金公式均使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定基金未结算卖出/LUS\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定总计未结算卖出/LAUS\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"锁定卖出/LockedSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"未结算卖/UnsettledSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"availableEE\":0,\"totalTodayPnlPercent\":0,\"overnightRiskRatio\":0,\"accountType\":\"MARGIN\",\"instantDeposit\":0,\"excessEquity\":0,\"totalPositionPnl\":0,\"tradeCurrencyMarginReq\":0,\"excessLiquidation\":0,\"postAEE\":null,\"postEE\":null,\"totalTodayPnl\":0,\"totalPositionPnlIncludeZero\":0,\"initMarginReq\":0,\"intradayRiskRatio\":0,\"segType\":\"FUND\",\"canMargin\":true,\"overnightRiskLevel\":\"LOW\",\"cashValues\":[{\"rowName\":\"各币种NLV\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"现金余额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"现金余额=已结算现金+未结算现金\"},{\"rowName\":\"在途资金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"在途资金 = （IPO申购金额+IPO中签竞价费）*IPO IM% + 基金申购订单金额 + 基金申购订单费用\"},{\"rowName\":\"可用现金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用现金=现金余额-冻结现金\"},{\"rowName\":\"可用现金与闲钱/AvailableCashWithVault\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用现金与闲钱=现金余额-冻结现金+Vault市值-Vault保证金 (CashBalance-LockedCash+Vault.MV-Vault.IM)\"},{\"rowName\":\"可用资金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用资金=现金余额+老虎钱袋子基金持仓市值-冻结现金-老虎钱袋子基金保证金\"},{\"rowName\":\"可用已结算现金/AvailableT0SettledCash\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用T0已结算现金=可用现金-已锁定总计未结算卖出+已锁定基金未结算卖出 (AvailableCash-LAUS+LUS)\"},{\"rowName\":\"现金可买金额/TradeCashAmount\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可买金额= min( 单币种Available Cash - 单币种ShortPositionCollateral + 单币种Tiger Vault 市值 - 单币种Tiger Vault IM + 单币种Tiger Vault Locked Cash - 单币种Tiger Vault Locked IM + 聚合Credit Line，聚合Available Cash - 聚合ShortPositionCollateral + 聚合Tiger Vault 市值 - 聚合Tiger Vault IM + 聚合Tiger Vault Locked Cash - 聚合Tiger Vault Locked IM + 聚合Credit Line，聚合AEE/开仓品种的初始保证金率)\"},{\"rowName\":\"可用已结算现金/AvailableT1SettledCash (20260112) 结算\",\"amounts\":{},\"rowDesc\":\"可用T1已结算现金=可用T0已结算现金 + 已锁定总计未结算卖出(结算日<=T1)\"},{\"rowName\":\"外汇保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"外汇保证金 = ∑(|币种NLV[i]| * FX_MarginRate[j])币种i的NLV为负数，币种j的NLV为正数，FX_MarginRate[j]表示币种j的保证金比率\"},{\"rowName\":\"应计利息\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"应计分红\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"未对账金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已对账金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已结算金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"Instant Funding\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"信贷额度/CreditLimit\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"lockedEE\":0},\"FUT\":{\"leverage\":0,\"equalization\":0,\"overnightMarginReq\":0,\"equityWithLoan\":0,\"availableBuyingPower\":0,\"availableSettledCash\":0,\"intradayRiskLevel\":\"LOW\",\"positionValues\":[{\"rowName\":\"期货持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"总持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"positionInitMarginReq\":0,\"positionMaintainMarginReq\":0,\"buyingPower\":0,\"accountNo\":\"600021022437\",\"overnightLiquidation\":0,\"currency\":\"USD\",\"netLiquidation\":0,\"maintainMarginReq\":0,\"lockedValues\":[{\"rowName\":\"已锁定的现金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"LockedTotalCash= ALC+LP+LUS + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定的剩余资产\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"LockedTotalEE= ALM+LIM+LECM+LPD + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定购买\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金减免值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定收费金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"佣金 + 消费税 + 申购费用\"},{\"rowName\":\"已锁定提现\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定供股\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅融资公式使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅现金公式使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(融资、现金公式均使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定基金未结算卖出/LUS\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定总计未结算卖出/LAUS\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"锁定卖出/LockedSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"未结算卖/UnsettledSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"availableEE\":0,\"totalTodayPnlPercent\":0,\"overnightRiskRatio\":0,\"accountType\":\"MARGIN\",\"instantDeposit\":0,\"excessEquity\":0,\"totalPositionPnl\":0,\"tradeCurrencyMarginReq\":0,\"excessLiquidation\":0,\"postAEE\":null,\"postEE\":null,\"totalTodayPnl\":0,\"totalPositionPnlIncludeZero\":0,\"initMarginReq\":0,\"intradayRiskRatio\":0,\"segType\":\"FUT\",\"canMargin\":true,\"overnightRiskLevel\":\"LOW\",\"cashValues\":[{\"rowName\":\"各币种NLV\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"现金余额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"现金余额=已结算现金+未结算现金\"},{\"rowName\":\"在途资金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"在途资金 = （IPO申购金额+IPO中签竞价费）*IPO IM% + 基金申购订单金额 + 基金申购订单费用\"},{\"rowName\":\"可用现金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用现金=现金余额-冻结现金\"},{\"rowName\":\"可用现金与闲钱/AvailableCashWithVault\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用现金与闲钱=现金余额-冻结现金+Vault市值-Vault保证金 (CashBalance-LockedCash+Vault.MV-Vault.IM)\"},{\"rowName\":\"可用资金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用资金=现金余额+老虎钱袋子基金持仓市值-冻结现金-老虎钱袋子基金保证金\"},{\"rowName\":\"可用已结算现金/AvailableT0SettledCash\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用T0已结算现金=可用现金-已锁定总计未结算卖出+已锁定基金未结算卖出 (AvailableCash-LAUS+LUS)\"},{\"rowName\":\"现金可买金额/TradeCashAmount\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可买金额= min( 单币种Available Cash - 单币种ShortPositionCollateral + 单币种Tiger Vault 市值 - 单币种Tiger Vault IM + 单币种Tiger Vault Locked Cash - 单币种Tiger Vault Locked IM + 聚合Credit Line，聚合Available Cash - 聚合ShortPositionCollateral + 聚合Tiger Vault 市值 - 聚合Tiger Vault IM + 聚合Tiger Vault Locked Cash - 聚合Tiger Vault Locked IM + 聚合Credit Line，聚合AEE/开仓品种的初始保证金率)\"},{\"rowName\":\"可用已结算现金/AvailableT1SettledCash (20260112) 结算\",\"amounts\":{},\"rowDesc\":\"可用T1已结算现金=可用T0已结算现金 + 已锁定总计未结算卖出(结算日<=T1)\"},{\"rowName\":\"外汇保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"外汇保证金 = ∑(|币种NLV[i]| * FX_MarginRate[j])币种i的NLV为负数，币种j的NLV为正数，FX_MarginRate[j]表示币种j的保证金比率\"},{\"rowName\":\"应计利息\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"应计分红\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"未对账金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已对账金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已结算金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"Instant Funding\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"信贷额度/CreditLimit\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"lockedEE\":0},\"SEC\":{\"leverage\":0,\"equalization\":0,\"overnightMarginReq\":0,\"equityWithLoan\":897.98,\"availableBuyingPower\":1415.04,\"availableSettledCash\":353.76,\"intradayRiskLevel\":\"LOW\",\"positionValues\":[{\"rowName\":\"股票持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"期权持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"总持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"positionInitMarginReq\":0,\"positionMaintainMarginReq\":0,\"buyingPower\":3591.93,\"accountNo\":\"600021022437\",\"overnightLiquidation\":897.98,\"currency\":\"USD\",\"netLiquidation\":897.98,\"maintainMarginReq\":0,\"lockedValues\":[{\"rowName\":\"已锁定的现金\",\"amounts\":{\"TOTAL\":544.22,\"HKD\":4242.36},\"rowDesc\":\"LockedTotalCash= ALC+LP+LUS + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定的剩余资产\",\"amounts\":{\"TOTAL\":544.22,\"HKD\":4242.36},\"rowDesc\":\"LockedTotalEE= ALM+LIM+LECM+LPD + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定购买\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金减免值\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定收费金额\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":\"佣金 + 消费税 + 申购费用\"},{\"rowName\":\"已锁定提现\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO\",\"amounts\":{\"TOTAL\":544.2237259869792,\"HKD\":4242.36},\"rowDesc\":null},{\"rowName\":\"已锁定IPO保证金\",\"amounts\":{\"TOTAL\":544.2237259869792,\"HKD\":4242.36},\"rowDesc\":null},{\"rowName\":\"已锁定供股\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅融资公式使用)\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅现金公式使用)\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(融资、现金公式均使用)\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定基金未结算卖出/LUS\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定总计未结算卖出/LAUS\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"锁定卖出/LockedSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"未结算卖/UnsettledSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null}],\"availableEE\":353.76,\"totalTodayPnlPercent\":0,\"overnightRiskRatio\":0,\"accountType\":\"MARGIN\",\"instantDeposit\":0,\"excessEquity\":897.98,\"totalPositionPnl\":0,\"tradeCurrencyMarginReq\":0,\"excessLiquidation\":897.98,\"postAEE\":353.76,\"postEE\":897.98,\"totalTodayPnl\":0,\"totalPositionPnlIncludeZero\":0,\"initMarginReq\":0,\"intradayRiskRatio\":0,\"segType\":\"SEC\",\"canMargin\":true,\"overnightRiskLevel\":\"LOW\",\"cashValues\":[{\"rowName\":\"各币种NLV\",\"amounts\":{\"TOTAL\":897.98,\"HKD\":7000},\"rowDesc\":null},{\"rowName\":\"现金余额\",\"amounts\":{\"TOTAL\":379.67,\"HKD\":2959.66},\"rowDesc\":\"现金余额=已结算现金+未结算现金\"},{\"rowName\":\"在途资金\",\"amounts\":{\"TOTAL\":518.3079439402201,\"HKD\":4040.34},\"rowDesc\":\"在途资金 = （IPO申购金额+IPO中签竞价费）*IPO IM% + 基金申购订单金额 + 基金申购订单费用\"},{\"rowName\":\"可用现金\",\"amounts\":{\"TOTAL\":353.76,\"HKD\":2757.64},\"rowDesc\":\"可用现金=现金余额-冻结现金\"},{\"rowName\":\"可用现金与闲钱/AvailableCashWithVault\",\"amounts\":{\"TOTAL\":353.76,\"HKD\":2757.64},\"rowDesc\":\"可用现金与闲钱=现金余额-冻结现金+Vault市值-Vault保证金 (CashBalance-LockedCash+Vault.MV-Vault.IM)\"},{\"rowName\":\"可用资金\",\"amounts\":{\"TOTAL\":353.76,\"HKD\":2757.64},\"rowDesc\":\"可用资金=现金余额+老虎钱袋子基金持仓市值-冻结现金-老虎钱袋子基金保证金\"},{\"rowName\":\"可用已结算现金/AvailableT0SettledCash\",\"amounts\":{\"TOTAL\":353.76,\"HKD\":2757.64},\"rowDesc\":\"可用T0已结算现金=可用现金-已锁定总计未结算卖出+已锁定基金未结算卖出 (AvailableCash-LAUS+LUS)\"},{\"rowName\":\"现金可买金额/TradeCashAmount\",\"amounts\":{\"TOTAL\":353.7590199159745,\"HKD\":2757.64},\"rowDesc\":\"可买金额= min( 单币种Available Cash - 单币种ShortPositionCollateral + 单币种Tiger Vault 市值 - 单币种Tiger Vault IM + 单币种Tiger Vault Locked Cash - 单币种Tiger Vault Locked IM + 聚合Credit Line，聚合Available Cash - 聚合ShortPositionCollateral + 聚合Tiger Vault 市值 - 聚合Tiger Vault IM + 聚合Tiger Vault Locked Cash - 聚合Tiger Vault Locked IM + 聚合Credit Line，聚合AEE/开仓品种的初始保证金率)\"},{\"rowName\":\"可用已结算现金/AvailableT1SettledCash (20260112) 结算\",\"amounts\":{\"HKD\":2757.64},\"rowDesc\":\"可用T1已结算现金=可用T0已结算现金 + 已锁定总计未结算卖出(结算日<=T1)\"},{\"rowName\":\"外汇保证金\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":\"外汇保证金 = ∑(|币种NLV[i]| * FX_MarginRate[j])币种i的NLV为负数，币种j的NLV为正数，FX_MarginRate[j]表示币种j的保证金比率\"},{\"rowName\":\"应计利息\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"应计分红\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"未对账金额\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已对账金额\",\"amounts\":{\"TOTAL\":379.6748019627337,\"HKD\":2959.66},\"rowDesc\":null},{\"rowName\":\"已结算金额\",\"amounts\":{\"TOTAL\":379.6748019627337,\"HKD\":2959.66},\"rowDesc\":null},{\"rowName\":\"Instant Funding\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"信贷额度/CreditLimit\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null}],\"lockedEE\":544.22},\"CONSOLIDATED\":{\"leverage\":0,\"equalization\":0,\"overnightMarginReq\":0,\"equityWithLoan\":897.98,\"availableBuyingPower\":1415.04,\"availableSettledCash\":353.76,\"intradayRiskLevel\":\"LOW\",\"positionValues\":[{\"rowName\":\"股票持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"期权持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"总持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"positionInitMarginReq\":0,\"positionMaintainMarginReq\":0,\"buyingPower\":3591.93,\"accountNo\":\"600021022437\",\"overnightLiquidation\":897.98,\"currency\":\"USD\",\"netLiquidation\":897.98,\"maintainMarginReq\":0,\"lockedValues\":[{\"rowName\":\"已锁定的现金\",\"amounts\":{\"TOTAL\":544.22,\"HKD\":4242.36},\"rowDesc\":\"LockedTotalCash= ALC+LP+LUS + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定的剩余资产\",\"amounts\":{\"TOTAL\":544.22,\"HKD\":4242.36},\"rowDesc\":\"LockedTotalEE= ALM+LIM+LECM+LPD + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定购买\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金减免值\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定收费金额\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":\"佣金 + 消费税 + 申购费用\"},{\"rowName\":\"已锁定提现\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO\",\"amounts\":{\"TOTAL\":544.2237259869792,\"HKD\":4242.36},\"rowDesc\":null},{\"rowName\":\"已锁定IPO保证金\",\"amounts\":{\"TOTAL\":544.2237259869792,\"HKD\":4242.36},\"rowDesc\":null},{\"rowName\":\"已锁定供股\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅融资公式使用)\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅现金公式使用)\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(融资、现金公式均使用)\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定基金未结算卖出/LUS\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已锁定总计未结算卖出/LAUS\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"锁定卖出/LockedSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"未结算卖/UnsettledSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null}],\"availableEE\":353.76,\"totalTodayPnlPercent\":0,\"overnightRiskRatio\":0,\"accountType\":\"MARGIN\",\"instantDeposit\":0,\"excessEquity\":897.98,\"totalPositionPnl\":0,\"tradeCurrencyMarginReq\":0,\"excessLiquidation\":897.98,\"postAEE\":353.76,\"postEE\":897.98,\"totalTodayPnl\":0,\"totalPositionPnlIncludeZero\":0,\"initMarginReq\":0,\"intradayRiskRatio\":0,\"segType\":\"CONSOLIDATED\",\"canMargin\":true,\"overnightRiskLevel\":\"LOW\",\"cashValues\":[{\"rowName\":\"各币种NLV\",\"amounts\":{\"TOTAL\":897.98,\"HKD\":7000},\"rowDesc\":null},{\"rowName\":\"现金余额\",\"amounts\":{\"TOTAL\":379.67,\"HKD\":2959.66},\"rowDesc\":\"现金余额=已结算现金+未结算现金\"},{\"rowName\":\"在途资金\",\"amounts\":{\"TOTAL\":518.3079439402201,\"HKD\":4040.34},\"rowDesc\":\"在途资金 = （IPO申购金额+IPO中签竞价费）*IPO IM% + 基金申购订单金额 + 基金申购订单费用\"},{\"rowName\":\"可用现金\",\"amounts\":{\"TOTAL\":353.76,\"HKD\":2757.64},\"rowDesc\":\"可用现金=现金余额-冻结现金\"},{\"rowName\":\"可用现金与闲钱/AvailableCashWithVault\",\"amounts\":{\"TOTAL\":353.76,\"HKD\":2757.64},\"rowDesc\":\"可用现金与闲钱=现金余额-冻结现金+Vault市值-Vault保证金 (CashBalance-LockedCash+Vault.MV-Vault.IM)\"},{\"rowName\":\"可用资金\",\"amounts\":{\"TOTAL\":353.76,\"HKD\":2757.64},\"rowDesc\":\"可用资金=现金余额+老虎钱袋子基金持仓市值-冻结现金-老虎钱袋子基金保证金\"},{\"rowName\":\"可用已结算现金/AvailableT0SettledCash\",\"amounts\":{\"TOTAL\":353.76,\"HKD\":2757.64},\"rowDesc\":\"可用T0已结算现金=可用现金-已锁定总计未结算卖出+已锁定基金未结算卖出 (AvailableCash-LAUS+LUS)\"},{\"rowName\":\"现金可买金额/TradeCashAmount\",\"amounts\":{\"TOTAL\":353.7590199159745,\"HKD\":2757.64},\"rowDesc\":\"可买金额= min( 单币种Available Cash - 单币种ShortPositionCollateral + 单币种Tiger Vault 市值 - 单币种Tiger Vault IM + 单币种Tiger Vault Locked Cash - 单币种Tiger Vault Locked IM + 聚合Credit Line，聚合Available Cash - 聚合ShortPositionCollateral + 聚合Tiger Vault 市值 - 聚合Tiger Vault IM + 聚合Tiger Vault Locked Cash - 聚合Tiger Vault Locked IM + 聚合Credit Line，聚合AEE/开仓品种的初始保证金率)\"},{\"rowName\":\"可用已结算现金/AvailableT1SettledCash (20260112) 结算\",\"amounts\":{\"HKD\":2757.64},\"rowDesc\":\"可用T1已结算现金=可用T0已结算现金 + 已锁定总计未结算卖出(结算日<=T1)\"},{\"rowName\":\"外汇保证金\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":\"外汇保证金 = ∑(|币种NLV[i]| * FX_MarginRate[j])币种i的NLV为负数，币种j的NLV为正数，FX_MarginRate[j]表示币种j的保证金比率\"},{\"rowName\":\"应计利息\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"应计分红\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"未对账金额\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"已对账金额\",\"amounts\":{\"TOTAL\":379.6748019627337,\"HKD\":2959.66},\"rowDesc\":null},{\"rowName\":\"已结算金额\",\"amounts\":{\"TOTAL\":379.6748019627337,\"HKD\":2959.66},\"rowDesc\":null},{\"rowName\":\"Instant Funding\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null},{\"rowName\":\"信贷额度/CreditLimit\",\"amounts\":{\"TOTAL\":0,\"HKD\":0},\"rowDesc\":null}],\"lockedEE\":544.22}}}', '2026-01-11 02:04:15');
INSERT INTO `test_asset_record` VALUES (13, 'bos-qa31.qa.tigerbrokers.net', '600021022437', 'entityId=TBHK', '{\"segmentAssetResp\":{\"FUND\":{\"leverage\":-1,\"equalization\":0,\"overnightMarginReq\":0,\"equityWithLoan\":0,\"availableBuyingPower\":0,\"availableSettledCash\":0,\"intradayRiskLevel\":\"LOW\",\"positionValues\":[{\"rowName\":\"基金持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"总持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"positionInitMarginReq\":0,\"positionMaintainMarginReq\":0,\"buyingPower\":0,\"accountNo\":\"600021022437\",\"overnightLiquidation\":0,\"currency\":\"USD\",\"netLiquidation\":0,\"maintainMarginReq\":0,\"lockedValues\":[{\"rowName\":\"已锁定的现金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"LockedTotalCash= ALC+LP+LUS + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定的剩余资产\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"LockedTotalEE= ALM+LIM+LECM+LPD + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定购买\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金减免值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定收费金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"佣金 + 消费税 + 申购费用\"},{\"rowName\":\"已锁定提现\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定供股\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅融资公式使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅现金公式使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(融资、现金公式均使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定基金未结算卖出/LUS\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定总计未结算卖出/LAUS\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"锁定卖出/LockedSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"未结算卖/UnsettledSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"availableEE\":0,\"totalTodayPnlPercent\":0,\"overnightRiskRatio\":0,\"accountType\":\"MARGIN\",\"instantDeposit\":0,\"excessEquity\":0,\"totalPositionPnl\":0,\"tradeCurrencyMarginReq\":0,\"excessLiquidation\":0,\"postAEE\":null,\"postEE\":null,\"totalTodayPnl\":0,\"totalPositionPnlIncludeZero\":0,\"initMarginReq\":0,\"intradayRiskRatio\":0,\"segType\":\"FUND\",\"canMargin\":true,\"overnightRiskLevel\":\"LOW\",\"cashValues\":[{\"rowName\":\"各币种NLV\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"现金余额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"现金余额=已结算现金+未结算现金\"},{\"rowName\":\"在途资金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"在途资金 = （IPO申购金额+IPO中签竞价费）*IPO IM% + 基金申购订单金额 + 基金申购订单费用\"},{\"rowName\":\"可用现金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用现金=现金余额-冻结现金\"},{\"rowName\":\"可用现金与闲钱/AvailableCashWithVault\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用现金与闲钱=现金余额-冻结现金+Vault市值-Vault保证金 (CashBalance-LockedCash+Vault.MV-Vault.IM)\"},{\"rowName\":\"可用资金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用资金=现金余额+老虎钱袋子基金持仓市值-冻结现金-老虎钱袋子基金保证金\"},{\"rowName\":\"可用已结算现金/AvailableT0SettledCash\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用T0已结算现金=可用现金-已锁定总计未结算卖出+已锁定基金未结算卖出 (AvailableCash-LAUS+LUS)\"},{\"rowName\":\"现金可买金额/TradeCashAmount\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可买金额= min( 单币种Available Cash - 单币种ShortPositionCollateral + 单币种Tiger Vault 市值 - 单币种Tiger Vault IM + 单币种Tiger Vault Locked Cash - 单币种Tiger Vault Locked IM + 聚合Credit Line，聚合Available Cash - 聚合ShortPositionCollateral + 聚合Tiger Vault 市值 - 聚合Tiger Vault IM + 聚合Tiger Vault Locked Cash - 聚合Tiger Vault Locked IM + 聚合Credit Line，聚合AEE/开仓品种的初始保证金率)\"},{\"rowName\":\"可用已结算现金/AvailableT1SettledCash (20260112) 结算\",\"amounts\":{},\"rowDesc\":\"可用T1已结算现金=可用T0已结算现金 + 已锁定总计未结算卖出(结算日<=T1)\"},{\"rowName\":\"外汇保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"外汇保证金 = ∑(|币种NLV[i]| * FX_MarginRate[j])币种i的NLV为负数，币种j的NLV为正数，FX_MarginRate[j]表示币种j的保证金比率\"},{\"rowName\":\"应计利息\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"应计分红\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"未对账金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已对账金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已结算金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"Instant Funding\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"信贷额度/CreditLimit\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"lockedEE\":0},\"FUT\":{\"leverage\":0,\"equalization\":0,\"overnightMarginReq\":0,\"equityWithLoan\":0,\"availableBuyingPower\":0,\"availableSettledCash\":0,\"intradayRiskLevel\":\"LOW\",\"positionValues\":[{\"rowName\":\"期货持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"总持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"positionInitMarginReq\":0,\"positionMaintainMarginReq\":0,\"buyingPower\":0,\"accountNo\":\"600021022437\",\"overnightLiquidation\":0,\"currency\":\"USD\",\"netLiquidation\":0,\"maintainMarginReq\":0,\"lockedValues\":[{\"rowName\":\"已锁定的现金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"LockedTotalCash= ALC+LP+LUS + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定的剩余资产\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"LockedTotalEE= ALM+LIM+LECM+LPD + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定购买\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金减免值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定收费金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"佣金 + 消费税 + 申购费用\"},{\"rowName\":\"已锁定提现\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定供股\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅融资公式使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅现金公式使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(融资、现金公式均使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定基金未结算卖出/LUS\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定总计未结算卖出/LAUS\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"锁定卖出/LockedSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"未结算卖/UnsettledSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"availableEE\":0,\"totalTodayPnlPercent\":0,\"overnightRiskRatio\":0,\"accountType\":\"MARGIN\",\"instantDeposit\":0,\"excessEquity\":0,\"totalPositionPnl\":0,\"tradeCurrencyMarginReq\":0,\"excessLiquidation\":0,\"postAEE\":null,\"postEE\":null,\"totalTodayPnl\":0,\"totalPositionPnlIncludeZero\":0,\"initMarginReq\":0,\"intradayRiskRatio\":0,\"segType\":\"FUT\",\"canMargin\":true,\"overnightRiskLevel\":\"LOW\",\"cashValues\":[{\"rowName\":\"各币种NLV\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"现金余额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"现金余额=已结算现金+未结算现金\"},{\"rowName\":\"在途资金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"在途资金 = （IPO申购金额+IPO中签竞价费）*IPO IM% + 基金申购订单金额 + 基金申购订单费用\"},{\"rowName\":\"可用现金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用现金=现金余额-冻结现金\"},{\"rowName\":\"可用现金与闲钱/AvailableCashWithVault\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用现金与闲钱=现金余额-冻结现金+Vault市值-Vault保证金 (CashBalance-LockedCash+Vault.MV-Vault.IM)\"},{\"rowName\":\"可用资金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用资金=现金余额+老虎钱袋子基金持仓市值-冻结现金-老虎钱袋子基金保证金\"},{\"rowName\":\"可用已结算现金/AvailableT0SettledCash\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用T0已结算现金=可用现金-已锁定总计未结算卖出+已锁定基金未结算卖出 (AvailableCash-LAUS+LUS)\"},{\"rowName\":\"现金可买金额/TradeCashAmount\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可买金额= min( 单币种Available Cash - 单币种ShortPositionCollateral + 单币种Tiger Vault 市值 - 单币种Tiger Vault IM + 单币种Tiger Vault Locked Cash - 单币种Tiger Vault Locked IM + 聚合Credit Line，聚合Available Cash - 聚合ShortPositionCollateral + 聚合Tiger Vault 市值 - 聚合Tiger Vault IM + 聚合Tiger Vault Locked Cash - 聚合Tiger Vault Locked IM + 聚合Credit Line，聚合AEE/开仓品种的初始保证金率)\"},{\"rowName\":\"可用已结算现金/AvailableT1SettledCash (20260112) 结算\",\"amounts\":{},\"rowDesc\":\"可用T1已结算现金=可用T0已结算现金 + 已锁定总计未结算卖出(结算日<=T1)\"},{\"rowName\":\"外汇保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"外汇保证金 = ∑(|币种NLV[i]| * FX_MarginRate[j])币种i的NLV为负数，币种j的NLV为正数，FX_MarginRate[j]表示币种j的保证金比率\"},{\"rowName\":\"应计利息\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"应计分红\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"未对账金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已对账金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已结算金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"Instant Funding\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"信贷额度/CreditLimit\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"lockedEE\":0},\"SEC\":{\"leverage\":-1,\"equalization\":0,\"overnightMarginReq\":0,\"equityWithLoan\":0,\"availableBuyingPower\":0,\"availableSettledCash\":0,\"intradayRiskLevel\":\"LOW\",\"positionValues\":[{\"rowName\":\"股票持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"期权持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"总持仓市值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"positionInitMarginReq\":0,\"positionMaintainMarginReq\":0,\"buyingPower\":0,\"accountNo\":\"600021022437\",\"overnightLiquidation\":0,\"currency\":\"USD\",\"netLiquidation\":0,\"maintainMarginReq\":0,\"lockedValues\":[{\"rowName\":\"已锁定的现金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"LockedTotalCash= ALC+LP+LUS + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定的剩余资产\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"LockedTotalEE= ALM+LIM+LECM+LPD + ALF+LC+LW+LS+LII+LM+Others\"},{\"rowName\":\"已锁定购买\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定初始保证金减免值\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定收费金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"佣金 + 消费税 + 申购费用\"},{\"rowName\":\"已锁定提现\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定IPO保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定供股\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅融资公式使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(仅现金公式使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"聚合锁定金额(融资、现金公式均使用)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定基金未结算卖出/LUS\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已锁定总计未结算卖出/LAUS\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"锁定卖出/LockedSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"未结算卖/UnsettledSell(CDP/DVP)\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"availableEE\":0,\"totalTodayPnlPercent\":0,\"overnightRiskRatio\":0,\"accountType\":\"MARGIN\",\"instantDeposit\":0,\"excessEquity\":0,\"totalPositionPnl\":0,\"tradeCurrencyMarginReq\":0,\"excessLiquidation\":0,\"postAEE\":0,\"postEE\":0,\"totalTodayPnl\":0,\"totalPositionPnlIncludeZero\":0,\"initMarginReq\":0,\"intradayRiskRatio\":0,\"segType\":\"SEC\",\"canMargin\":true,\"overnightRiskLevel\":\"LOW\",\"cashValues\":[{\"rowName\":\"各币种NLV\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"现金余额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"现金余额=已结算现金+未结算现金\"},{\"rowName\":\"在途资金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"在途资金 = （IPO申购金额+IPO中签竞价费）*IPO IM% + 基金申购订单金额 + 基金申购订单费用\"},{\"rowName\":\"可用现金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用现金=现金余额-冻结现金\"},{\"rowName\":\"可用现金与闲钱/AvailableCashWithVault\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用现金与闲钱=现金余额-冻结现金+Vault市值-Vault保证金 (CashBalance-LockedCash+Vault.MV-Vault.IM)\"},{\"rowName\":\"可用资金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用资金=现金余额+老虎钱袋子基金持仓市值-冻结现金-老虎钱袋子基金保证金\"},{\"rowName\":\"可用已结算现金/AvailableT0SettledCash\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可用T0已结算现金=可用现金-已锁定总计未结算卖出+已锁定基金未结算卖出 (AvailableCash-LAUS+LUS)\"},{\"rowName\":\"现金可买金额/TradeCashAmount\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"可买金额= min( 单币种Available Cash - 单币种ShortPositionCollateral + 单币种Tiger Vault 市值 - 单币种Tiger Vault IM + 单币种Tiger Vault Locked Cash - 单币种Tiger Vault Locked IM + 聚合Credit Line，聚合Available Cash - 聚合ShortPositionCollateral + 聚合Tiger Vault 市值 - 聚合Tiger Vault IM + 聚合Tiger Vault Locked Cash - 聚合Tiger Vault Locked IM + 聚合Credit Line，聚合AEE/开仓品种的初始保证金率)\"},{\"rowName\":\"可用已结算现金/AvailableT1SettledCash (20260112) 结算\",\"amounts\":{},\"rowDesc\":\"可用T1已结算现金=可用T0已结算现金 + 已锁定总计未结算卖出(结算日<=T1)\"},{\"rowName\":\"外汇保证金\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":\"外汇保证金 = ∑(|币种NLV[i]| * FX_MarginRate[j])币种i的NLV为负数，币种j的NLV为正数，FX_MarginRate[j]表示币种j的保证金比率\"},{\"rowName\":\"应计利息\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"应计分红\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"未对账金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已对账金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"已结算金额\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"Instant Funding\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null},{\"rowName\":\"信贷额度/CreditLimit\",\"amounts\":{\"TOTAL\":0},\"rowDesc\":null}],\"lockedEE\":0}}}', '2026-01-11 02:04:37');

SET FOREIGN_KEY_CHECKS = 1;
