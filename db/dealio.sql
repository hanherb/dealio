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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'dyo','123','2020-02-17','2020-02-17','16:28:38','16:23:39'),(2,'ronald','123',NULL,NULL,NULL,NULL),(5,'james','123',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
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
  `audience` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `deals_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deals`
--

LOCK TABLES `deals` WRITE;
/*!40000 ALTER TABLE `deals` DISABLE KEYS */;
INSERT INTO `deals` VALUES (1,'Agoda Liburan Hemat Anti Ribet!','Full Audience Group','2020-03-05','2020-03-10','Pesan sekarang paket hemat liburanmu di Agoda melalui Dealio, pesawat + hotel termurah ga pakai ribet. Yuk pesan sekarang!\n\nSyarat dan Ketentuan :\n1. Upload struk pembayaran yang sudah kamu lakukan dari Agoda di menu \"Upload Pembelian Deals\".\n2. Berlaku hanya di Agoda untuk pemesanan paket tiket pesawat plus hotel.\n3. Dapatkan 5 Dealio poin setelah struk terverifikasi.\n4. Periode promo 5 - 15 Maret 2020.\n5. Poin akan masuk secara otomatis setelah struk kamu terverifikasi oleh Dealio. ','','Install','https://invol.co/clli13',8),(2,'Beli 1 gratis 1 minuman dI Dunkin Donut','Full Audience Group','2020-03-05','2020-03-07','Dapatkan Beli 1 gratis 1 minuman dI Dunkin Donut. Upload bukti pembelian nya di campaign \"Upload Pembelian Deals\" dan dapatkan 5 Dealio poin.\n\nSyarat dan ketentuan :\n1. Upload struk pembelian.\n2. Gratis minuman dengan harga sama atau lebih rendah dari harga minuman utama\n3. Berlaku tanpa minimum pembayaran\n4. Berlaku setiap hari Jumat, Sabtu & Minggu, termasuk hari libur nasional\n5. Berlaku untuk pembelian semua jenis minuman\n6. Berlaku untuk transaksi dengan Sakuku, Flazz, Debit BCA & Kartu Kredit BCA\n7. Poin akan masuk secara otomatis setelah struk kamu terverifikasi oleh Dealio.\n      ','','null','null',12),(6,'Banyak diskon untuk produk kecantikan dan kesehatan','Full Audience Group','2020-03-03','2020-03-06','Banyak diskon produk kecantikan dan kesehatan di Farmaku.com. Upload bukti pembelian nya di campaign \"Upload Pembelian Deals\" dan dapatkan 5 Dealio poin.\nDaftar di farmaku.com terlebih dahulu sebelum melakukan pembelian.\n\nSyarat dan ketentuan :\n1. Upload bukti pembelian dari Farmaku.com\n2. Tidak berlaku pembayaran di tempat (COD).\n3. Poin akan masuk secara otomatis setelah struk kamu terverifikasi oleh Dealio.      ','','Install','https://invol.co/clknrw',6);
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
  `audience` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `earn_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `earn`
--

LOCK TABLES `earn` WRITE;
/*!40000 ALTER TABLE `earn` DISABLE KEYS */;
INSERT INTO `earn` VALUES (1,'Via.com Online Travel Fair','Full Audience Group','2020-03-01','2020-03-09','Pesan tiket pesawat mu hanya di Via.com Travel Fair dan dapatkan 20 Dealio poin!\n\n1. Pesan tiket dengan tujuan kemana saja melalui Via.com.\n2. Upload struk invoice pembayaran tiket pesawat dari Via.com.\n3. Poin akan terkirim setelah terverifikasi oleh Dealio.','','Click Through URL','https://www.via.id/?utm_source=2657542&utm_medium=dealio&utm_campaign=dealio_x_via',8),(4,'Download Indogold untuk investasi emas mudah & terpercaya.','Full Audience Group','2020-03-02','2020-03-10',' Download INDOGOLD dan Dapatkan 20 Dealio Poin!\n\nUntuk mendapatkan 20 poin, cara nya gampang :\n1. Klik Interested.\n2. Klik Download Google Play.\n3. Download / Install Indogold di Smartphone kamu.\n4. Pilih Sign up atau Daftar.\n5. Screenshot Menu Profile kamu dan upload di \"Upload bukti disini\" yang ada di menu Earn.\n6. Poin akan terkirim paling lambat 1x24 jam setelah terverifikasi oleh Dealio.   \n       ','','Install','https://indogold.app.link/kD5ziXXLX3',6);
/*!40000 ALTER TABLE `earn` ENABLE KEYS */;
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
  `search_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` VALUES (3,'A & W','A & W'),(4,'Ace Hardware','Ace Hardware'),(5,'Alfamart','Alfamart'),(6,'Alfamidi','Alfamidi'),(7,'Bakmi GM','Bakmi GM'),(8,'Blibli','Blibli'),(9,'Burger King','Burger King'),(10,'CGV','CGV'),(11,'Cinema XXI','Cinema XXI'),(12,'Dunkin Donuts','Dunkin Donuts'),(13,'Hypermart','Hypermart');
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `otp_regis`
--

LOCK TABLES `otp_regis` WRITE;
/*!40000 ALTER TABLE `otp_regis` DISABLE KEYS */;
/*!40000 ALTER TABLE `otp_regis` ENABLE KEYS */;
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
  `audience` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `product_deals_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regis_phone_number`
--

LOCK TABLES `regis_phone_number` WRITE;
/*!40000 ALTER TABLE `regis_phone_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `regis_phone_number` ENABLE KEYS */;
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
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_manual`
--

LOCK TABLES `user_manual` WRITE;
/*!40000 ALTER TABLE `user_manual` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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
  `audience` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_link` varchar(255) DEFAULT NULL,
  `merchant_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchant_id` (`merchant_id`),
  CONSTRAINT `win_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `win`
--

LOCK TABLES `win` WRITE;
/*!40000 ALTER TABLE `win` DISABLE KEYS */;
INSERT INTO `win` VALUES (1,'Monthly Deals March','Full Audience Group','2020-03-01','2020-03-31','Menangkan 1 juta rupiah untuk 2 orang pemenang hanya dengan cara undang teman kamu sebanyak - banyaknya ke Dealio dan beri 5 bintang di Google play store.\n\nSyarat & Ketentuan:\n1. Pemenang akan di undi paling lambat tanggal 5 April 2020.\n2. Hadiah akan dikirimkan dalam bentuk poin Dealio sejumlah 20.000 poin untuk 2 orang yang bisa kamu tukarkan dengan voucher-voucher menarik.\n3. Undang teman sebanyak-banyaknya agar kesempatan menang lebih besar.  ','','Refer Friend','null',3);
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

-- Dump completed on 2020-03-23 16:55:53
