/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Type    : MySQL
Source Server Version : 50553
Source Host           : localhost:3306
Source Schema         : fos

Target Server Type    : MySQL
Target Server Version : 50553
File Encoding         : 65001

Date: 29/05/2019 17:03:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
`admin_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
`password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
`login_time` datetime NULL DEFAULT NULL,
`create_time` datetime NULL DEFAULT NULL,
PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `comment_id` int(15) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
`movie_id` int(15) NOT NULL COMMENT '电影ID参看Movie表',
`user_id` int(15) NOT NULL COMMENT '用户ID参考User表',
`content` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '内容',
`create_time` datetime NOT NULL COMMENT '时间',
`start` smallint(6) NULL DEFAULT 3 COMMENT '评分(从低到高 1-5)',
`state` bit(2) NOT NULL DEFAULT b'0' COMMENT '删除与否(0-没删除,1-删除)',
`flag` int(1) NULL DEFAULT NULL COMMENT '0：评论本身，1：回复',
`pre_id` int(15) NULL DEFAULT NULL COMMENT '指向前一个评论（仅用做回复）',
PRIMARY KEY (`comment_id`) USING BTREE,
INDEX `UID`(`user_id`) USING BTREE,
INDEX `MID`(`movie_id`) USING BTREE,
CONSTRAINT `MID` FOREIGN KEY (`movie_id`) REFERENCES `tb_movie` (`movie_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT `UID` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_info`;
CREATE TABLE `tb_info`  (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
`create_time` datetime NULL DEFAULT NULL,
`title` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
`info_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
`admin_id` int(11) NOT NULL,
`info_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
PRIMARY KEY (`info_id`) USING BTREE,
INDEX `AdminID`(`admin_id`) USING BTREE,
CONSTRAINT `AdminID` FOREIGN KEY (`admin_id`) REFERENCES `tb_admin` (`admin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log`  (
  `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
`user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
`createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
`content` varchar(8000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志内容',
`operation` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户所做的操作',
PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_movie
-- ----------------------------
DROP TABLE IF EXISTS `tb_movie`;
CREATE TABLE `tb_movie`  (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '电影ID',
`movie_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电影名',
`type_id` int(10) NOT NULL COMMENT '类型id',
`on_time` date NULL DEFAULT NULL COMMENT '上映时间',
`language` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '语言类型',
`country` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家/地区',
PRIMARY KEY (`movie_id`) USING BTREE,
INDEX `TypeID`(`type_id`) USING BTREE,
CONSTRAINT `TypeID` FOREIGN KEY (`type_id`) REFERENCES `tb_movie_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '电影表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_movie
-- ----------------------------
INSERT INTO `tb_movie` VALUES (1, '复仇者联盟4', 1101, '2019-05-03', '英语', '美国');
INSERT INTO `tb_movie` VALUES (2, '小黄人', 1102, '2019-05-12', '英语', '美国');

-- ----------------------------
-- Table structure for tb_movie_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_movie_type`;
CREATE TABLE `tb_movie_type`  (
  `type_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
`type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名字',
PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1106 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '电影类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_movie_type
-- ----------------------------
INSERT INTO `tb_movie_type` VALUES (1101, '动作');
INSERT INTO `tb_movie_type` VALUES (1102, '科幻');
INSERT INTO `tb_movie_type` VALUES (1103, '爱情');
INSERT INTO `tb_movie_type` VALUES (1104, '冒险');
INSERT INTO `tb_movie_type` VALUES (1105, '历史');

-- ----------------------------
-- Table structure for tb_rank
-- ----------------------------
DROP TABLE IF EXISTS `tb_rank`;
CREATE TABLE `tb_rank`  (
  `rank_id` int(15) NOT NULL AUTO_INCREMENT COMMENT '排名标识符',
`movie_id` int(15) NOT NULL COMMENT '电影ID参考Comment表',
`avg_star` smallint(5) NULL DEFAULT 0 COMMENT '平均分',
PRIMARY KEY (`rank_id`) USING BTREE,
INDEX `CommentID`(`movie_id`) USING BTREE,
CONSTRAINT `CommentID` FOREIGN KEY (`movie_id`) REFERENCES `tb_comment` (`movie_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '排名表,MID是确保评分是同一个电影的评分且评分不是同一个用户反复多次打分' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
`user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
`password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
`sex` int(1) NULL DEFAULT NULL COMMENT '性别0男 1女 未添加是-1',
`age` smallint(100) UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
`user_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
`email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
`phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
`create_time` datetime NOT NULL COMMENT '用户创建时间',
`state` int(1) NOT NULL COMMENT '登陆状态（‘0’未登陆 ，‘1’登陆状态）',
`user_type` int(1) NULL DEFAULT NULL COMMENT '用户类型（‘0’普通用户 ‘1’超级管理员）',
PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'lomofu', 'lomofu', 0, 20, NULL, NULL, NULL, '2019-05-10 12:55:43', 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
