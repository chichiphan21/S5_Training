-- MySQL dump 10.13  Distrib 9.3.0, for macos15.2 (arm64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'12 Nguyễn Huệ','70000','TP Hồ Chí Minh',1),(2,'1 Hàng Đào','10000','Hà Nội',1),(3,'5 Lê Lợi','55000','Đà Nẵng',1),(4,'10 Trần Phú','65000','Nha Trang',1),(5,'3 Hùng Vương','90000','Cần Thơ',1),(6,'8 Quang Trung','81000','Biên Hòa',1),(7,'15 Nguyễn Văn Cừ','18000','Hải Phòng',1),(8,'2 Lý Thường Kiệt','53000','Huế',1),(9,'7 Phạm Văn Đồng','78000','Vũng Tàu',1),(10,'4 Lê Đại Hành','67000','Đà Lạt',1),(11,'123 Tokyo Street','100-0001','Tokyo',2),(12,'456 Seoul Road','04524','Seoul',3),(13,'789 Shanghai Ave','200000','Thượng Hải',4),(14,'10 Rama I Road','10330','Bangkok',5),(15,'18 MG Road','560001','Bangalore',6),(16,'22 Orchard Rd','238885','Singapore',7),(17,'3 Jalan Ampang','50450','Kuala Lumpur',8),(18,'5 Ayala Ave','1226','Manila',9),(19,'99 Jalan Sudirman','10270','Jakarta',10),(20,'6 Nguyễn Thị Minh Khai','70000','TP Hồ Chí Minh',1),(21,'11 Pasteur','70000','TP Hồ Chí Minh',1);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04 14:54:22
