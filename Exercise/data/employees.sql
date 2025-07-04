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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `job_id` int DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `commission_pct` decimal(5,2) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`),
  KEY `department_id` (`department_id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `employees_ibfk_3` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Nguyen','Van Hoang','nguyen.a@company.com','0901234567','1994-01-01',1,20000000.00,0.05,NULL,3),(2,'Tran','normal','tran.b@company.com','0912345678','2022-06-10',2,300000.00,0.10,NULL,4),(3,'Le','Van Huy','le.c@company.com','0923456789','1998-04-15',3,1500000.00,0.00,NULL,2),(4,'Pham','Thi Huy Hoang','pham.d@company.com','0934567890','2020-09-05',4,450000.00,0.15,NULL,1),(5,'Ho','Van Quy','ho.e@company.com','0945678901','1994-07-31',5,180000.00,0.00,2,2),(6,'Do','Quang Trung','do.f@company.com','0956789012','2022-08-25',6,1003500.00,0.10,4,4),(7,'Vu','Van Hai','vu.g@company.com','0967890123','1998-03-11',7,1004000.00,0.12,NULL,7),(8,'Dang','Thi Ha','dang.h@company.com','0978901234','1994-12-25',8,1002900.00,0.00,2,8),(9,'Bui','Xuan Trang','bui.i@company.com','0989012345','2023-02-10',9,1005000.00,0.15,4,4),(10,'Ngo','Thi Quynh','ngo.k@company.com','0990123456','1994-11-20',10,1006000.00,0.20,NULL,10),(11,'Trinh','Thi Nhan','trinh.l@company.com','0901234789','1998-02-21',1,11000.00,0.05,2,11),(12,'Huynh','Thi Thanh Thuy','huynh.m@company.com','0912345890','2020-10-22',2,1003888.00,0.10,NULL,12),(13,'Phan','Van Nguyen','phan.n@company.com','0923456901','1998-02-25',3,1001400.00,0.00,4,13),(14,'Vo','Thanh Phong','vo.o@company.com','0934567012','2022-09-15',4,1004200.00,0.15,NULL,14),(15,'Lam','Van Dong','lam.p@company.com','0945678123','2010-03-18',5,200000.00,0.00,6,15),(16,'Tran','Thi Nhu Quynh','tran.q@company.com','0956789234','2023-12-10',9,1000000.00,0.10,4,4),(17,'Nguyen','Van Rua','nguyen.r@company.com','0967890345','1998-03-10',7,1003800.00,0.12,NULL,17),(18,'Le','Thi Suong','le.s@company.com','0978901456','2022-07-25',8,1002000.00,0.00,2,18),(19,'Pham','Van Thao','pham.t@company.com','0989012567','1994-08-20',9,1004800.00,0.15,10,19),(20,'Ho','Thi Uyen','ho.u@company.com','0990123678','1998-03-05',10,1006500.00,0.20,NULL,20),(21,'Do','Van Vy','do.v@company.com','0901234890','1994-02-26',1,13000000.00,0.05,6,21);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04 14:40:43
