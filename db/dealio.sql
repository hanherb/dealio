-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dealio
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_login` date DEFAULT NULL,
  `date_logout` date DEFAULT NULL,
  `time_login` time DEFAULT NULL,
  `time_logout` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'dyo','123','2020-03-31','2020-02-23','17:30:37','04:02:57'),(2,'ronald','123',NULL,NULL,NULL,NULL),(5,'james','123',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_log`
--

DROP TABLE IF EXISTS `admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `admin_log_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_log`
--

LOCK TABLES `admin_log` WRITE;
/*!40000 ALTER TABLE `admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audience`
--

DROP TABLE IF EXISTS `audience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age_start` int(11) NOT NULL,
  `age_end` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience`
--

LOCK TABLES `audience` WRITE;
/*!40000 ALTER TABLE `audience` DISABLE KEYS */;
INSERT INTO `audience` VALUES (1,'Jakarta Male Audience','Jakarta Selatan','male',21,30,NULL,NULL);
/*!40000 ALTER TABLE `audience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'F&B');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deals`
--

DROP TABLE IF EXISTS `deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `audience_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `hot_deals` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `deals_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`),
  CONSTRAINT `deals_ibfk_2` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `deals_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deals`
--

LOCK TABLES `deals` WRITE;
/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
/*!40000 ALTER TABLE `deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `earn`
--

DROP TABLE IF EXISTS `earn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `earn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `audience_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `earn_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`),
  CONSTRAINT `earn_ibfk_2` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `earn_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earn`
--

LOCK TABLES `earn` WRITE;
/*!40000 ALTER TABLE `earn` DISABLE KEYS */;
/*!40000 ALTER TABLE `earn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `description` text DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `action_link` varchar(255) NOT NULL,
  `audience_id` int(11) NOT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audience_id` (`audience_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horoscope`
--

DROP TABLE IF EXISTS `horoscope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horoscope` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zodiac_sign` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `description` text DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horoscope`
--

LOCK TABLES `horoscope` WRITE;
/*!40000 ALTER TABLE `horoscope` DISABLE KEYS */;
/*!40000 ALTER TABLE `horoscope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_user`
--

DROP TABLE IF EXISTS `login_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_user`
--

LOCK TABLES `login_user` WRITE;
/*!40000 ALTER TABLE `login_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` VALUES (3,'A & W',NULL),(4,'Ace Hardware',NULL),(5,'Alfamart',NULL),(6,'Alfamidi',NULL),(7,'Bakmi GM',NULL),(8,'Blibli',NULL),(9,'Burger King',NULL),(10,'CGV',NULL),(11,'Cinema XXI',NULL),(12,'Dunkin Donuts',NULL),(13,'Hypermart',NULL),(15,'Starbucks',NULL),(16,'Pizza Hut',NULL);
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant_location`
--

DROP TABLE IF EXISTS `merchant_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `coordinate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `merchant_location_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant_location`
--

LOCK TABLES `merchant_location` WRITE;
/*!40000 ALTER TABLE `merchant_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `source_link` varchar(255) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_forgot_password`
--

DROP TABLE IF EXISTS `otp_forgot_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_forgot_password` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_manual_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `otp_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_forgot_password`
--

LOCK TABLES `otp_forgot_password` WRITE;
/*!40000 ALTER TABLE `otp_forgot_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_forgot_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `otp_regis`
--

DROP TABLE IF EXISTS `otp_regis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `otp_regis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `regis_phone_number_id` int(11) NOT NULL,
  `otp_code` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `regis_phone_number_id` (`regis_phone_number_id`),
  CONSTRAINT `otp_regis_ibfk_1` FOREIGN KEY (`regis_phone_number_id`) REFERENCES `regis_phone_number` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_regis`
--

LOCK TABLES `otp_regis` WRITE;
/*!40000 ALTER TABLE `otp_regis` DISABLE KEYS */;
INSERT INTO `otp_regis` VALUES (7,7,'8913','2020-04-02','12:00:25');
/*!40000 ALTER TABLE `otp_regis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_number_list`
--

DROP TABLE IF EXISTS `phone_number_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_number_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_number_list`
--

LOCK TABLES `phone_number_list` WRITE;
/*!40000 ALTER TABLE `phone_number_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_number_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_deals`
--

DROP TABLE IF EXISTS `product_deals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_deals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `audience_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `hot_deals` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_deals_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`),
  CONSTRAINT `product_deals_ibfk_2` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `product_deals_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_deals`
--

LOCK TABLES `product_deals` WRITE;
/*!40000 ALTER TABLE `product_deals` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_deals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refcode_input`
--

DROP TABLE IF EXISTS `refcode_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refcode_input` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refcode_list_id` int(11) NOT NULL,
  `phone_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refcode_list_id` (`refcode_list_id`),
  KEY `phone_id` (`phone_id`),
  CONSTRAINT `refcode_input_ibfk_1` FOREIGN KEY (`refcode_list_id`) REFERENCES `refcode_list` (`id`),
  CONSTRAINT `refcode_input_ibfk_2` FOREIGN KEY (`phone_id`) REFERENCES `regis_phone_number` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refcode_input`
--

LOCK TABLES `refcode_input` WRITE;
/*!40000 ALTER TABLE `refcode_input` DISABLE KEYS */;
/*!40000 ALTER TABLE `refcode_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refcode_list`
--

DROP TABLE IF EXISTS `refcode_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refcode_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_refcode` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `refcode_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refcode_list`
--

LOCK TABLES `refcode_list` WRITE;
/*!40000 ALTER TABLE `refcode_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `refcode_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regis_phone_number`
--

DROP TABLE IF EXISTS `regis_phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regis_phone_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `status_regis` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regis_phone_number`
--

LOCK TABLES `regis_phone_number` WRITE;
/*!40000 ALTER TABLE `regis_phone_number` DISABLE KEYS */;
INSERT INTO `regis_phone_number` VALUES (6,'082299392596','2020-04-02','11:58:50',2),(7,'082299392596','2020-04-02','12:00:25',1),(8,'008111804','2020-04-02','12:07:01',0);
/*!40000 ALTER TABLE `regis_phone_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream`
--

DROP TABLE IF EXISTS `stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `video_url` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream`
--

LOCK TABLES `stream` WRITE;
/*!40000 ALTER TABLE `stream` DISABLE KEYS */;
/*!40000 ALTER TABLE `stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_detail`
--

DROP TABLE IF EXISTS `user_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_detail`
--

LOCK TABLES `user_detail` WRITE;
/*!40000 ALTER TABLE `user_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_facebook`
--

DROP TABLE IF EXISTS `user_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_facebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_facebook`
--

LOCK TABLES `user_facebook` WRITE;
/*!40000 ALTER TABLE `user_facebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_facebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_google`
--

DROP TABLE IF EXISTS `user_google`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_google` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `google_id` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `given_name` varchar(255) DEFAULT NULL,
  `family_name` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_google`
--

LOCK TABLES `user_google` WRITE;
/*!40000 ALTER TABLE `user_google` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_google` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_manual`
--

DROP TABLE IF EXISTS `user_manual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_manual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_manual`
--

LOCK TABLES `user_manual` WRITE;
/*!40000 ALTER TABLE `user_manual` DISABLE KEYS */;
INSERT INTO `user_manual` VALUES (2,'082299392596','123','2020-04-02','12:04:56','dyo@gmail.com');
/*!40000 ALTER TABLE `user_manual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `login_method` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Hanindyo Herbowo','dyo@gmail.com','082299392596','2020-04-02','12:04:56','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `win`
--

DROP TABLE IF EXISTS `win`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `win` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `audience_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `point_redeem` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audience_id` (`audience_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `win_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`id`),
  CONSTRAINT `win_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `win`
--

LOCK TABLES `win` WRITE;
/*!40000 ALTER TABLE `win` DISABLE KEYS */;
/*!40000 ALTER TABLE `win` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-02 13:27:35
