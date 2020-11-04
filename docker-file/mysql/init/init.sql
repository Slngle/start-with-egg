use mysql;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
-- 创建数据库 member，items
DROP database IF EXISTS `member`;
create database `member` default character set utf8 collate utf8_general_ci;
DROP database IF EXISTS `items`;
create database `items` default character set utf8 collate utf8_general_ci;
-- 切换到member数据库
use member;
-- 建表
SET NAMES utf8mb4;

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='会员表';

-- ----------------------------
-- Records of user
-- ----------------------------
-- 如果需要初始化数据 需要整体包裹 create Table也包裹进来
-- SET FOREIGN_KEY_CHECKS=0;
-- BEGIN;
-- INSERT INTO `user` VALUES (3, '苗师傅', '18267216678', '123456', 'akdjkas', 'asdjasdl', 'http://jjssk.ksks.com', 0, '2012-10-10 00:00:00', '1', '1', '1', '1', 1, 1, 1, '2012-10-10 00:00:00', '2012-10-10 00:00:00');
-- COMMIT;
-- SET FOREIGN_KEY_CHECKS=1;

-- 切换到items数据库
use items;
SET NAMES utf8mb4;
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `item_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `item_sub_name` varchar(128) DEFAULT NULL COMMENT '副名称',
  `price` bigint(20) NOT NULL DEFAULT '0' COMMENT '市场价（划线价）（商家设置）（数据库精确到后两位，价格都是x100保存，前台显示需要除以100，避免经度运算损失）',
  `quantity` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品库存（真实库存）（商家设置）',
  `sold_quantity` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品销量（总销量）',
  `property` varchar(1024) DEFAULT NULL COMMENT '商品规格  分组选项',
  `is_deleted` int(11) NOT NULL DEFAULT '0' COMMENT '是否已删除(0：未删除 1：已删除)',
  `company_id` bigint(20) DEFAULT NULL COMMENT '所属公司ID',
  `icons_id` bigint(20) DEFAULT NULL COMMENT '商品角标ID',
  `cat_id` bigint(20) DEFAULT NULL COMMENT '所属后台类目ID',
  `f_cat_id` bigint(20) DEFAULT NULL COMMENT '所属前台类目ID',
  `big_pic_url` varchar(512) DEFAULT NULL COMMENT '商品主图（一张图片）',
  `pic_urls` varchar(1024) DEFAULT '' COMMENT '商品所有图片(多张逗号分隔)',
  `rich_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '图文详情',
  `publish_state` int(11) NOT NULL DEFAULT '0' COMMENT '上架状态(0 未上架, 1已上架, 2, 已下架)',
  `weight` bigint(20) NOT NULL DEFAULT '0' COMMENT '重量 单位克',
  `brand` varchar(30) DEFAULT '' COMMENT '品牌',
  `express` bigint(30) NOT NULL DEFAULT '0' COMMENT '是否支持配送方式_快递',
  `self_fetch` bigint(30) NOT NULL DEFAULT '0' COMMENT '是否支持配送方式_自提',
  `local_delivery` bigint(30) NOT NULL DEFAULT '0' COMMENT '是否支持配送方式_到家',
  `keyword` varchar(200) DEFAULT NULL COMMENT '搜索关键词',
  `note` varchar(2048) DEFAULT NULL COMMENT '备注',
  `item_property` varchar(4096) DEFAULT NULL COMMENT '商品属性 属性展示',
  `item_coding` bigint(20) DEFAULT NULL COMMENT '商品编码',
  `item_sort` int(11) NOT NULL DEFAULT '0' COMMENT '商品排序。数值越大排序靠前',
  `making_time` int(20) DEFAULT NULL COMMENT '商品制作时间，s为单位',
  `item_type` int(20) DEFAULT '0' COMMENT '商品类型;默认为0',
  `is_self_camp` int(11) NOT NULL DEFAULT '0' COMMENT '是否非自营商品：0.非自营，1.自营',
  `label_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标签名称(用逗号分隔)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='基础商品表';
