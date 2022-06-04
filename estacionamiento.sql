-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: estacionamiento
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `carbrand`
--

DROP TABLE IF EXISTS `carbrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carbrand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carbrand`
--

LOCK TABLES `carbrand` WRITE;
/*!40000 ALTER TABLE `carbrand` DISABLE KEYS */;
INSERT INTO `carbrand` VALUES (1,'CHEVROLET'),(2,'NISSAN'),(3,'BMW'),(4,'MAZDA'),(5,'VW');
/*!40000 ALTER TABLE `carbrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carlog`
--

DROP TABLE IF EXISTS `carlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carlog` (
  `entry_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `car_id` int DEFAULT NULL,
  `check_time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `car_id` (`car_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `carlog_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `registeredcars` (`car_id`),
  CONSTRAINT `carlog_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carlog`
--

LOCK TABLES `carlog` WRITE;
/*!40000 ALTER TABLE `carlog` DISABLE KEYS */;
INSERT INTO `carlog` VALUES (1,2,1,'13:51:18','2022-06-04');
/*!40000 ALTER TABLE `carlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carmodel`
--

DROP TABLE IF EXISTS `carmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carmodel` (
  `model_id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int DEFAULT NULL,
  `car_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`model_id`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `carmodel_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `carbrand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carmodel`
--

LOCK TABLES `carmodel` WRITE;
/*!40000 ALTER TABLE `carmodel` DISABLE KEYS */;
INSERT INTO `carmodel` VALUES (1,1,'Camaro'),(2,1,'Chevy'),(3,2,'Sentra'),(4,3,'X3'),(5,4,'3'),(6,5,'Jetta'),(7,5,'Vocho');
/*!40000 ALTER TABLE `carmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carsusers`
--

DROP TABLE IF EXISTS `carsusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carsusers` (
  `carReg_id` int NOT NULL AUTO_INCREMENT,
  `car_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`carReg_id`),
  KEY `car_id` (`car_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `carsusers_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `registeredcars` (`car_id`),
  CONSTRAINT `carsusers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carsusers`
--

LOCK TABLES `carsusers` WRITE;
/*!40000 ALTER TABLE `carsusers` DISABLE KEYS */;
INSERT INTO `carsusers` VALUES (1,1,2),(2,2,2);
/*!40000 ALTER TABLE `carsusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registeredcars`
--

DROP TABLE IF EXISTS `registeredcars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registeredcars` (
  `car_id` int NOT NULL AUTO_INCREMENT,
  `model_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `plate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  KEY `model_id` (`model_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `registeredcars_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `carmodel` (`model_id`),
  CONSTRAINT `registeredcars_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `states` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registeredcars`
--

LOCK TABLES `registeredcars` WRITE;
/*!40000 ALTER TABLE `registeredcars` DISABLE KEYS */;
INSERT INTO `registeredcars` VALUES (1,7,1,2005,'SN-14-492'),(2,2,2,2007,'AW-78-512');
/*!40000 ALTER TABLE `registeredcars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `state_id` int NOT NULL AUTO_INCREMENT,
  `state_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Puebla'),(2,'Tlaxcala'),(3,'Veracruz'),(4,'CDMX');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_surname` varchar(60) DEFAULT NULL,
  `user_forename` varchar(80) DEFAULT NULL,
  `user_phoneNumber` varchar(10) DEFAULT NULL,
  `user_street` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juan','Diaz','2214429876','Margaritas #6'),(2,'Jose','Hernandez','2481792438','Revolucion 213');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-04 14:22:16
