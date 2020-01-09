use mysql;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
-- 创建数据库
DROP database IF EXISTS `member`;
create database `member` default character set utf8 collate utf8_general_ci;
-- 切换到member数据库
use member;
-- 建表
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_name` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(11) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `union_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信unionId',
  `open_id` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openId',
  `head_portrait` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像地址',
  `gender` int(8) DEFAULT NULL COMMENT '性别(0.男性  1.女性)',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `address` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
  `area` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '区域',
  `city` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '城市',
  `province` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '省份',
  `user_type` int(8) DEFAULT NULL COMMENT '身份类别(1.会员，2教师)',
  `status` int(8) DEFAULT NULL COMMENT '身份状态(1.正常，2注销)',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='会员表';

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (3, '苗师傅', '18267216678', '123456', 'akdjkas', 'asdjasdl', 'http://jjssk.ksks.com', 0, '2012-10-10 00:00:00', '1', '1', '1', '1', 1, 1, 1, '2012-10-10 00:00:00', '2012-10-10 00:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

