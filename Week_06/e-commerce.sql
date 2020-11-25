/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.20 : Database - java-train
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`java-train` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `java-train`;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `cust_id` bigint NOT NULL AUTO_INCREMENT,
  `cust_no` varchar(256) DEFAULT NULL,
  `cust_name` varchar(16) DEFAULT NULL,
  `cust_address` varchar(256) DEFAULT NULL,
  `cust_account` varchar(16) DEFAULT NULL,
  `cust_password` varchar(16) DEFAULT NULL,
  `create_time` time DEFAULT NULL,
  `update_time` time DEFAULT NULL,
  `cust_sex` char(1) DEFAULT NULL,
  `cust_phone` int DEFAULT NULL,
  `cust_profile` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customer` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `cust_id` bigint DEFAULT NULL,
  `pro_id` bigint DEFAULT NULL,
  `order_count` varchar(256) DEFAULT NULL,
  `order_price` float DEFAULT NULL,
  `order_time` time DEFAULT NULL,
  `order_carriage` float DEFAULT NULL COMMENT '运费',
  `payment_time` float DEFAULT NULL,
  `deliver_time` time DEFAULT NULL,
  `deal_time` time DEFAULT NULL,
  `create_time` time DEFAULT NULL,
  `update_time` time DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `fk_order_cust` FOREIGN KEY (`order_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `fk_order_product` FOREIGN KEY (`order_id`) REFERENCES `product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orders` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pro_id` bigint NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(256) DEFAULT NULL,
  `pro_price` float DEFAULT NULL,
  `pro_count` int DEFAULT NULL,
  `pro_description` text,
  `pro_color` varchar(8) DEFAULT NULL,
  `pro_size` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
