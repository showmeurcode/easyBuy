/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.18-log : Database - easybuy
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`easybuy` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `easybuy`;

/*Table structure for table `buycar` */

DROP TABLE IF EXISTS `buycar`;

CREATE TABLE `buycar` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `productId` int(10) NOT NULL COMMENT '商品ID',
  `userId` int(10) DEFAULT NULL COMMENT '用户ID',
  `quantity` int(11) NOT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `buycar` */

insert  into `buycar`(`id`,`productId`,`userId`,`quantity`) values 
(75,9,8,1),
(77,4,8,1),
(92,1,8,8),
(93,8,15,2),
(94,6,15,1),
(95,8,7,2);

/*Table structure for table `electronic_info` */

DROP TABLE IF EXISTS `electronic_info`;

CREATE TABLE `electronic_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `no` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '型号',
  `price` decimal(20,2) DEFAULT NULL COMMENT '出厂价格',
  `date` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `electronic_info` */

insert  into `electronic_info`(`id`,`no`,`price`,`date`) values 
(1,'CDMA-1',650.78,'2017-10-10'),
(2,'CDMA-2',2356.23,'2011-10-10'),
(3,'CDMA-3',2200.76,'2013-10-10');

/*Table structure for table `favourite` */

DROP TABLE IF EXISTS `favourite`;

CREATE TABLE `favourite` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `productId` int(10) NOT NULL COMMENT '商品ID',
  `userId` int(10) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='收藏表';

/*Data for the table `favourite` */

insert  into `favourite`(`id`,`productId`,`userId`) values 
(25,9,7),
(27,4,7),
(28,5,7),
(30,12,16);

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '新闻编号',
  `title` varchar(255) NOT NULL COMMENT '新闻标题',
  `content` varchar(1024) NOT NULL COMMENT '内容',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='资讯表';

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`content`,`createtime`) values 
(1,'【特惠】中秋特惠，大牌卖场！','中秋特惠，大牌卖场！','2017-09-26 15:09:33'),
(2,'【特惠】掬一轮明月 表无尽惦念','掬一轮明月 表无尽惦念','2017-09-25 15:10:57'),
(3,'【公告】GXG新品上市','GXG新品上市','2017-09-26 15:11:42'),
(4,'【公告】马克华菲新品上市','马克华菲新品上市','2017-09-26 15:12:24'),
(5,'【特惠】亚瑟士秋季新品','亚瑟士秋季新品','2017-09-26 15:13:06'),
(6,'【特惠】NIKE科比A.D特惠','NIKE科比A.D特惠','2017-09-25 15:14:15'),
(7,'【特惠】国庆出游必备爆款背包','国庆出游必备爆款背包','2017-09-27 15:16:34'),
(8,'【特惠】图书诺贝尔文学奖合集','图书诺贝尔文学奖合集','2017-09-26 15:19:43'),
(9,'【公告】再不疯狂我们就老了，假期出游攻略！','再不疯狂我们就老了，假期出游攻略！','2017-09-26 15:21:07'),
(10,'【特惠】春风十里不如你！威海海鲜！','春风十里不如你！威海海鲜！','2017-09-26 15:23:30'),
(11,'','','2017-09-26 19:55:55');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `userId` varchar(10) NOT NULL COMMENT '用户ID',
  `loginName` varchar(20) NOT NULL COMMENT '登录用户名',
  `userAddress` varchar(200) NOT NULL COMMENT '用户地址',
  `createTime` varchar(50) NOT NULL COMMENT '创建时间',
  `cost` float(10,3) NOT NULL COMMENT '金额',
  `status` int(1) NOT NULL COMMENT '状态：1 为待审核，2 为审核通过，3 为配货，4 为卖家已发货，5 为已收货',
  `type` int(1) NOT NULL COMMENT '类型',
  `serialNumber` varchar(64) NOT NULL COMMENT '订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='订单表';

/*Data for the table `order` */

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `orderId` int(10) NOT NULL COMMENT '订单ID',
  `productId` int(10) NOT NULL COMMENT '商品ID',
  `quantity` int(10) NOT NULL COMMENT '数量',
  `cost` float(10,3) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单详情表';

/*Data for the table `order_detail` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `name` varchar(20) NOT NULL COMMENT '商品名称',
  `description` varchar(100) DEFAULT NULL COMMENT '商品描述',
  `price` float(10,3) NOT NULL COMMENT '商品价格',
  `stock` int(10) NOT NULL COMMENT '商品库存',
  `categorylevel1` int(10) NOT NULL COMMENT '一级分类id',
  `categorylevel2` int(10) DEFAULT NULL COMMENT '二级分类id',
  `categorylevel3` int(10) DEFAULT NULL COMMENT '三级分类id',
  `fileName` varchar(200) NOT NULL COMMENT '上传的文件名',
  `isDelete` int(1) DEFAULT NULL COMMENT '是否删除（1为删除，0为未删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

/*Data for the table `product` */

/*Table structure for table `product_category` */

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) NOT NULL COMMENT '名字',
  `parentId` int(10) DEFAULT NULL COMMENT '父分类',
  `type` int(1) DEFAULT NULL COMMENT '类型：1 为一级分类，2 为二级分类，3 为三级分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

/*Data for the table `product_category` */

insert  into `product_category`(`id`,`name`,`parentId`,`type`) values 
(1,' 母婴 / 玩具 / 童装',NULL,1),
(2,'乳品生鲜',1,2),
(3,'饼干糕点',1,2),
(4,'酒水饮料',1,2),
(5,'成人奶粉',2,3),
(6,'酸奶粉',2,3),
(7,'豆奶',2,3),
(8,'奶酪',3,3),
(9,'黄油',3,3),
(10,'奶油',3,3),
(11,'低温鲜奶',4,3),
(12,'酸奶',4,3),
(13,'水果肉',4,3),
(14,'食品 / 酒饮 / 生鲜',NULL,1),
(15,'婴幼食品',14,2),
(16,'坚果炒货',14,2),
(17,'维生素',15,3),
(18,'蔬果净',15,3),
(19,'居家拖鞋',16,3),
(20,'卫生巾',16,3),
(21,' 鞋靴 / 箱包 / 运动户外',NULL,1),
(22,'男士钱包',21,2),
(23,'睡裙',21,2),
(24,'男士内裤',22,3),
(25,'睡衣/睡裤',22,3),
(26,'平板电脑',23,3),
(27,'心理学',23,3),
(28,'纸巾 / 清洁用品',NULL,1),
(29,' 家居 / 家纺 / 家装 / 宠物',NULL,1),
(30,' 美妆个人清洁 / 洗护',NULL,1),
(31,' 女装 / 男装 / 内衣 / 珠宝',NULL,1),
(32,' 手机 / 数码 / 电脑办公',NULL,1),
(33,'家用电器 / 汽车用品',NULL,1),
(34,' 医药 / 保健滋补 / 成人',NULL,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户名',
  `userName` varchar(20) NOT NULL COMMENT '用户真实姓名',
  `loginName` varchar(20) NOT NULL COMMENT '用户登录用户名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `sex` int(1) NOT NULL COMMENT '性别：1为男，0为女',
  `identityCode` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `email` varchar(80) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `type` int(1) NOT NULL COMMENT '用户类型：1为后台，0为前台',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`id`,`userName`,`loginName`,`password`,`sex`,`identityCode`,`email`,`mobile`,`type`) values 
(7,'尹晓晨','yinxiaochen','123456',1,'370685199108123012','842946343@qq.com','13855555555',0),
(8,'丁丁','丁丁','123456',0,'111111111111111111','adfk@kf.afs','13456789101',0),
(9,'阿斯蒂芬','阿斯蒂芬','12345asdfg',1,NULL,'eee@qq.com','13111111111',0),
(11,'花花','花花','1234567890',0,'371081199001144027','1126839112@qq.com','13252526363',0),
(12,'福尔摩斯','福尔摩斯','fuermosi1995',1,'612429199508127311','1172089973@qq.com','18792567388',0),
(13,'管理员','admin','admin',1,NULL,NULL,NULL,1),
(16,'天下霸唱','庄周','bdqn1234bdqn',0,NULL,NULL,NULL,1),
(17,'天下霸唱','庄周','bdqn1234bdqn',0,NULL,NULL,NULL,1);

/*Table structure for table `user_address` */

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `address` varchar(20) NOT NULL COMMENT '地址',
  `createTime` varchar(20) NOT NULL,
  `userId` int(10) NOT NULL COMMENT '用户主键',
  `isDefault` int(1) NOT NULL COMMENT '是否是默认地址：1为是，0为否',
  `remark` varchar(18) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用户地址表';

/*Data for the table `user_address` */

insert  into `user_address`(`id`,`address`,`createTime`,`userId`,`isDefault`,`remark`) values 
(2,'威海市古寨中学61-6','2017-10-05 00:00:00',7,1,'我家'),
(4,'烟台市招远市69-98号','0000-00-00 00:00:00',7,0,'老家'),
(11,'阿里京东客服','2017年10月06日17时30分40秒',8,0,'卡老地方');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
