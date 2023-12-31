CREATE DATABASE  IF NOT EXISTS `qltieccuoidb` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `qltieccuoidb`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: qltieccuoidb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `bookingID` int NOT NULL AUTO_INCREMENT,
  `eventID` int DEFAULT NULL,
  `hallID` int DEFAULT NULL,
  `menuID` int DEFAULT NULL,
  `serviceID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  PRIMARY KEY (`bookingID`),
  KEY `eventID` (`eventID`),
  KEY `hallID` (`hallID`),
  KEY `menuID` (`menuID`),
  KEY `serviceID` (`serviceID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `event` (`eventID`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`hallID`) REFERENCES `halls` (`hallID`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`),
  CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`serviceID`) REFERENCES `service` (`serviceID`),
  CONSTRAINT `booking_ibfk_5` FOREIGN KEY (`UserID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branchID` int NOT NULL AUTO_INCREMENT,
  `branchName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phoneNumber` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`branchID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (2,'THE ADORA CENTER','431 Hoàng Văn Thụ, Phường 4, Quận Tân Bình','18001001','https://res.cloudinary.com/da7tpv6qw/image/upload/v1692969358/mv2zk3uqb2lnc8pacdzn.jpg'),(8,'GRAND PALACE','142/18 Cộng Hòa, P.4, Q.Tân Bình, TP.HCM','18001002','https://res.cloudinary.com/da7tpv6qw/image/upload/v1693322240/lvvnta5xikzegg2gpjgy.jpg'),(9,'THE ADORA ATHENA','371 Nguyễn Kiệm, Phường 3, Quận Gò Vấp','18001003','https://res.cloudinary.com/da7tpv6qw/image/upload/v1693581444/dols5dvjcwfxeaqojs3u.jpg'),(10,'THE ADORA LUXURY','198 Hoàng Văn Thụ, Phường 9, Quận Phú Nhuận','18001004','https://res.cloudinary.com/da7tpv6qw/image/upload/v1693971238/a3wepp5ccf1c8g2qddbl.jpg'),(11,'THE ADORA DYNASTY','1A Tôn Thất Tùng, Phường Phạm Ngũ Lão, Quận 1','18001005','https://res.cloudinary.com/da7tpv6qw/image/upload/v1693971263/ay1fr8thzkeelaxhtlfn.jpg'),(12,'THE ADORA GRANDVIEW','421 Ngô Gia Tự, Phường 9, Quận 5','18001006','https://res.cloudinary.com/da7tpv6qw/image/upload/v1693971283/dszgdgvayjkyprr5pk2j.jpg'),(13,'THE ADORA PREMIUM','803 Nguyễn Văn Linh, Phường Tân Phú, Quận 7','18001007','https://res.cloudinary.com/da7tpv6qw/image/upload/v1693971306/b9rz4oqnqmmwcyhamsad.jpg');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `eventID` int NOT NULL AUTO_INCREMENT,
  `branchID` int DEFAULT NULL,
  `hallID` int DEFAULT NULL,
  `menuID` int DEFAULT NULL,
  `serviceID` int DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `totalPrice` decimal(10,2) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `eventName` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`eventID`),
  KEY `branchID` (`branchID`),
  KEY `hallID` (`hallID`),
  KEY `menuID` (`menuID`),
  KEY `serviceID` (`serviceID`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`),
  CONSTRAINT `event_ibfk_2` FOREIGN KEY (`hallID`) REFERENCES `halls` (`hallID`),
  CONSTRAINT `event_ibfk_3` FOREIGN KEY (`menuID`) REFERENCES `menu` (`menuID`),
  CONSTRAINT `event_ibfk_4` FOREIGN KEY (`serviceID`) REFERENCES `service` (`serviceID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,13,6,19,7,'2023-09-07',100.00,'co san','ghn'),(2,2,1,2,7,'2023-09-07',200.00,'co san 1000','dcs ');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedbackID` int NOT NULL AUTO_INCREMENT,
  `eventID` int DEFAULT NULL,
  `userID` int DEFAULT NULL,
  `feedbackDate` date DEFAULT NULL,
  `feedbackContent` text COLLATE utf8mb3_unicode_ci,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`feedbackID`),
  KEY `eventID` (`eventID`),
  KEY `userID` (`userID`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `event` (`eventID`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,1,'2023-09-07','nhà hàng phục vụ tốt, trang trí đẹp, đồ ăn ngon tưới sốt',5),(2,1,7,'2023-09-07','đồ ăn dở, phục vụ chưa được ứng ý ',2),(3,2,1,'2023-09-06','tạm ổn, so với mặt bằng chung, dịch vụ tốt..',4),(4,2,1,'2023-09-05','đồ ăn không được tươi ngon, sảnh cưới trang trí nhất bắt mắt.',4);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `halls`
--

DROP TABLE IF EXISTS `halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `halls` (
  `hallID` int NOT NULL AUTO_INCREMENT,
  `branchID` int DEFAULT NULL,
  `hallName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `priceMorning` decimal(10,2) DEFAULT NULL,
  `priceAfternoon` decimal(10,2) DEFAULT NULL,
  `priceEvening` decimal(10,2) DEFAULT NULL,
  `priceWeekend` decimal(10,2) DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`hallID`),
  KEY `branchID` (`branchID`),
  CONSTRAINT `halls_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `halls`
--

LOCK TABLES `halls` WRITE;
/*!40000 ALTER TABLE `halls` DISABLE KEYS */;
INSERT INTO `halls` VALUES (1,8,'SẢNH PLATIN',10.00,20.00,30.00,100.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693319463/fu0uhuymej4adfdo4dvs.jpg','Sảnh Platin với kích thước 386 m2 được bày trí theo phong cách Châu Âu sang trọng sẽ thật sự phù hợp cho một hôn lễ ấm cúng với số lượng khách mời trong khoảng 20 đến 26 bàn tiệc. Diện tích sảnh có thể mở rộng linh hoạt với sức chứa lên đến 1500 khách (150 bàn) nhằm đáp ứng cho nhiều hình thức và nhu cầu đặt tiệc khác nhau.'),(3,2,'SẢNH VENUS',20.00,40.00,60.00,80.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693392255/rfkql5z5qunxrtep0tgk.jpg','Sảnh Venus với kích thước sảnh 544 m2 được bày trí theo phong cách Châu Âu sang trọng có sức chứa từ 30 đến 40 bàn tiệc trên nền vàng ấn tượng. Diện tích sảnh có thể mở rộng linh hoạt với sức chứa lên đến 1500 khách (150 bàn) nhằm đáp ứng cho nhiều hình thức và nhu cầu đặt tiệc khác nhau.'),(5,2,'SẢNH ELITE',40.00,80.00,100.00,120.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693392508/oyvqbex14fza9tikfi9f.jpg','Sảnh Elite với kích thước sảnh 544 m2 được bày trí theo phong cách Châu Âu sang trọng có sức chứa từ 30 đến 40 bàn tiệc trên nền vàng ấn tượng. Diện tích sảnh có thể mở rộng linh hoạt với sức chứa lên đến 1500 khách (150 bàn) nhằm đáp ứng cho nhiều hình thức và nhu cầu đặt tiệc khác nhau.'),(6,2,'SẢNH MERCURY',10.00,20.00,30.00,40.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693398780/hya5vdvommaqdvyrwgzx.jpg','Sảnh Mercury với kích thước sảnh 544 m2 được bày trí theo phong cách Châu Âu sang trọng có sức chứa từ 30 đến 40 bàn tiệc trên nền vàng ấn tượng. Diện tích sảnh có thể mở rộng linh hoạt với sức chứa lên đến 1500 khách (150 bàn) nhằm đáp ứng cho nhiều hình thức và nhu cầu đặt tiệc khác nhau.'),(7,8,'SẢNH PAVILON',100.00,200.00,300.00,400.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693398815/sm1fezantfhzlg73xz9t.jpg','Sảnh Pavilon với kích thước sảnh 544 m2 được bày trí theo phong cách Châu Âu sang trọng có sức chứa từ 30 đến 40 bàn tiệc trên nền xanh độc đáo. Diện tích sảnh có thể mở rộng linh hoạt với sức chứa lên đến 850 khách (85 bàn) nhằm đáp ứng cho nhiều hình thức và nhu cầu đặt tiệc khác nhau.'),(8,8,'SẢNH FONTANA',500.00,1000.00,2000.00,3000.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693847656/xeq0dliwsvuyvyjb2n9y.jpg','Sảnh Fontana với kích thước sảnh 544 m2 được bày trí theo phong cách Châu Âu sang trọng có sức chứa từ 30 đến 40 bàn tiệc trên nền xanh độc đáo. Diện tích sảnh có thể mở rộng linh hoạt với sức chứa lên đến 850 khách (85 bàn) nhằm đáp ứng cho nhiều hình thức và nhu cầu đặt tiệc khác nhau.');
/*!40000 ALTER TABLE `halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menuID` int NOT NULL AUTO_INCREMENT,
  `branchID` int DEFAULT NULL,
  `menuName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  PRIMARY KEY (`menuID`),
  KEY `branchID` (`branchID`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (2,8,'SWEET LOVE','Đặc biệt ngon của nhà hàng món new.',10.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970363/zrjk1nymvhe4uqhvzbu7.jpg','2023-09-06 00:00:00'),(3,2,'GỎI TÔM THÁI TÂY THI','Ăn ngoan như ăn tôm vậy á mng',100.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970409/dwk9rmcesur1n9wkpzfs.jpg','2023-09-06 00:00:00'),(4,2,'CÁ CUỘN BACON ĐÚT LÒ SỐT BBQ MẬT ONG','CÁ CUỘN BACON ĐÚT LÒ SỐT BBQ MẬT ONG',500.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970533/fjootiwzbdawex9thzr9.jpg','2023-09-06 00:00:00'),(10,8,'CÁ HỒI HẤP TAM SẮC SỐT THƯỢNG HẠNG','CÁ HỒI HẤP TAM SẮC SỐT THƯỢNG HẠNG',200.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970582/sghuchikdanunfz9eqxd.jpg','2023-09-06 00:00:00'),(11,2,'CÁC BỚP ĐÚT LÒ SỐT TERIYAKI','CÁC BỚP ĐÚT LÒ SỐT TERIYAKI',300.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970617/eg589qfekoquhyspwt81.jpg','2023-09-06 00:00:00'),(15,8,'CUA LỘT SỐT CHANH DÂY','món ăn đặt sản của nhà hàng',500.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970478/cdpwkisk2ejgg9uipyk5.jpg','2023-09-06 00:00:00'),(16,2,'CÁ BỐNG MÚ HẤP HỒNG KÔNG','CÁC BỚP ĐÚT LÒ SỐT TERIYAKI',100.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970692/uvc2d8rn9zfzfv4m9vx4.jpg','2023-09-06 00:00:00'),(17,2,'BÒ HẦM RƯỢU VANG','BÒ HẦM RƯỢU VANG',200.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970723/hrmjv0xauejuq8lglq98.jpg','2023-09-06 00:00:00'),(18,8,'BỒ CÂU QUAY','BỒ CÂU QUAY',50.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970745/svlh707fbrkkiqiu3gl3.jpg','2023-09-06 00:00:00'),(19,9,'CHẢ GIÒ GRAND PALACE','CHẢ GIÒ GRAND PALACE',70.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970770/ryqr9st3cg1suexrgvmg.jpg','2023-09-06 00:00:00'),(20,8,'MÌ XÀO SA TẾ TÔM','MÌ XÀO SA TẾ TÔM',40.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970795/wsyksyvomhqv5qf60vur.jpg','2023-09-06 00:00:00'),(21,8,'CƠM CHIÊN GÀ QUAY LÁ É ','CƠM CHIÊN GÀ QUAY LÁ É ',150.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693970815/z5ra2liwas9sm4vevxfu.jpg','2023-09-06 00:00:00');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `eventID` int DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `paymentMethod` enum('Trực tiếp','Momo','ZaloPay') COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invoiceNumber` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`paymentID`),
  KEY `eventID` (`eventID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `event` (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `serviceID` int NOT NULL AUTO_INCREMENT,
  `branchID` int DEFAULT NULL,
  `serviceName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`serviceID`),
  KEY `branchID` (`branchID`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (7,9,'Fresh flowers for the party table','Fresh flowers for the party table',1000.00,NULL),(8,12,'trang tri tie','set up san khau, ban an..v.v',200.00,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1694105380/gchfx1uzzvgmxvz6ddjp.jpg');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistic`
--

DROP TABLE IF EXISTS `statistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistic` (
  `statisticID` int NOT NULL AUTO_INCREMENT,
  `branchID` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `quarter` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `eventCount` int DEFAULT NULL,
  `revenue` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`statisticID`),
  KEY `branchID` (`branchID`),
  CONSTRAINT `statistic_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistic`
--

LOCK TABLES `statistic` WRITE;
/*!40000 ALTER TABLE `statistic` DISABLE KEYS */;
/*!40000 ALTER TABLE `statistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastName` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phoneNumber` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `profileImage` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `userRole` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Son','DC','son111@gmail.com',NULL,NULL,'dcs111','$2a$10$5pQ1TFjM5M4sW6zjvpOTn.pcmf02/.Ev4RT1P5/zkW8YiUIQ5Z4iy','ROLE_USER'),(2,'son','dc','dcson123@gmail.com',NULL,NULL,'dcsAdmin','$2a$10$cPjXr7uQbaAb571rx4T09O75zBycYhj18HgPYFVS5d3sxy.qkVFye','ROLE_ADMIN'),(3,'Há»','Ngá»c Giang','giangho123@gmail.com',NULL,NULL,'giangAdmin','$2a$10$vJvc3Q2V24AbeDcikW3DsO9f/TCykNNjqm63QFBk9n4ZP2FYhA3AO','ROLE_ADMIN'),(6,'dc','s','dcs2@gmail.com',NULL,'','dcs2','$2a$10$rFN0aHCd.atjdfKPL3FL/eT4okJnOTqzuDy.TgUPPzoAM4T5sj4Xu','ROLE_ADMIN'),(7,'n','dcs','sonn@gmail.com',NULL,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693301719/k4uhazrc13twebo1i5k3.png','sonn','$2a$10$MiRv6Lqlm/ofj7UsEjafAuqnJSv6ZiO7U01jywzg.rpVPtjWK9CM2','ROLE_USER'),(8,'Hồ Ngọc','Giang','ghn123@gmail.com',NULL,'https://res.cloudinary.com/da7tpv6qw/image/upload/v1693499987/pdwhpf8nz7te0njxq5ld.jpg','ghn123','$2a$10$VTnxFivVf7Ck2Qu4OnZU2e0TFtu2RQqHDopBf3T.JSo7ewKrsJ/hq','ROLE_USER'),(9,'John','Doe',' john.doe@example.com','123456789','https://res.cloudinary.com/da7tpv6qw/image/upload/v1693973143/hxtkjre65jmcnsjzmjdl.png','johndoe','$2a$10$bDpmulfRFK35Kj4nx1Sgi.dp2OwoQpK9n7CNDH7/GBiN72Sfg8iIe','ROLE_USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-08 21:42:11
