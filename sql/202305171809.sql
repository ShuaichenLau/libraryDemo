drop table if exists t_book;
CREATE TABLE `t_book` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图书名称',
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图书作者',
  `number` int DEFAULT NULL COMMENT '图书数量',
  `publish` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '出版社',
  `pub_time` datetime DEFAULT NULL COMMENT '出版时间',
  `introduction` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图书简介',
  `isbn` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标准书号',
  `language_id` int DEFAULT NULL COMMENT '图书语言id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `book_type_id` int DEFAULT NULL COMMENT '图书分类id',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标识',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` int DEFAULT NULL COMMENT '创建人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` int DEFAULT NULL COMMENT '更新人ID',
  `ts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


drop table if exists t_book_type;
CREATE TABLE `t_book_type` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '图书分类ID',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图书分类名称',
  `type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图书分类编码',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标识',
  `create_user` int DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `ts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


drop table if exists t_reader_info;
CREATE TABLE `t_reader_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '读者id',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '读者名称',
  `sex` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '读者性别',
  `birth` datetime DEFAULT NULL COMMENT '读者生日',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '读者地址',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '读者电话',
  `delFlag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标识',
  `createUser` int DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` int DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `ts` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;