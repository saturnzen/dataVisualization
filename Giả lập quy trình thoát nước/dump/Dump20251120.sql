CREATE DATABASE  IF NOT EXISTS `waterfall` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `waterfall`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: waterfall
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `rainfall_runoff`
--

DROP TABLE IF EXISTS `rainfall_runoff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rainfall_runoff` (
  `rainfall_id` int NOT NULL AUTO_INCREMENT,
  `river_id` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rainfall_amount` float DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `estimated_inflow` float DEFAULT NULL,
  PRIMARY KEY (`rainfall_id`),
  KEY `river_id` (`river_id`),
  CONSTRAINT `rainfall_runoff_ibfk_1` FOREIGN KEY (`river_id`) REFERENCES `river` (`river_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainfall_runoff`
--

LOCK TABLES `rainfall_runoff` WRITE;
/*!40000 ALTER TABLE `rainfall_runoff` DISABLE KEYS */;
INSERT INTO `rainfall_runoff` VALUES (4,2,'2023-12-31 17:00:00',12,4,210),(5,2,'2024-01-01 17:00:00',8,2,190),(6,2,'2024-01-02 17:00:00',15,5,220),(7,3,'2023-12-31 17:00:00',20,5,420),(8,3,'2024-01-01 17:00:00',18,4,400),(9,3,'2024-01-02 17:00:00',22,6,450),(10,4,'2023-12-31 17:00:00',23,5,500),(11,4,'2024-01-01 17:00:00',17,4,470),(12,4,'2024-01-02 17:00:00',28,7,530);
/*!40000 ALTER TABLE `rainfall_runoff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rainfall_runoff_sample`
--

DROP TABLE IF EXISTS `rainfall_runoff_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rainfall_runoff_sample` (
  `rainfall_id` int NOT NULL AUTO_INCREMENT,
  `river_id` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rainfall_amount` float DEFAULT NULL,
  `duration` float DEFAULT NULL,
  `estimated_inflow` float DEFAULT NULL,
  PRIMARY KEY (`rainfall_id`),
  KEY `river_id` (`river_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rainfall_runoff_sample`
--

LOCK TABLES `rainfall_runoff_sample` WRITE;
/*!40000 ALTER TABLE `rainfall_runoff_sample` DISABLE KEYS */;
INSERT INTO `rainfall_runoff_sample` VALUES (2,1,'2025-11-15 17:00:00',10,2,500),(3,1,'2025-11-16 17:00:00',5,1,520),(4,1,'2025-11-16 19:00:00',6,1,530),(5,1,'2025-11-16 21:00:00',4,1,510),(6,1,'2025-11-16 23:00:00',3,1,500),(7,1,'2025-11-17 01:00:00',3,1,480),(8,1,'2025-11-17 03:00:00',2,1,470),(9,1,'2025-11-17 05:00:00',2,1,460),(10,1,'2025-11-17 07:00:00',1,1,450),(11,1,'2025-11-17 09:00:00',1,1,440),(12,1,'2025-11-17 11:00:00',1,1,430),(13,1,'2025-11-17 13:00:00',0,1,420),(14,1,'2025-11-17 15:00:00',0,1,410),(15,1,'2025-11-17 17:00:00',0,1,400),(16,1,'2025-11-17 19:00:00',1,1,410),(17,1,'2025-11-17 21:00:00',2,1,420),(18,1,'2025-11-17 23:00:00',2,1,430),(19,1,'2025-11-18 01:00:00',3,1,440),(20,1,'2025-11-18 03:00:00',3,1,450),(21,1,'2025-11-18 05:00:00',4,1,460),(22,1,'2025-11-18 07:00:00',4,1,470),(23,1,'2025-11-18 09:00:00',5,1,480),(24,1,'2025-11-18 11:00:00',5,1,490),(25,1,'2025-11-18 13:00:00',6,1,500),(26,1,'2025-11-18 15:00:00',6,1,510),(27,1,'2025-11-18 17:00:00',120,6,16000),(28,1,'2025-11-18 19:00:00',130,6,16000),(29,1,'2025-11-18 21:00:00',125,6,16000),(30,1,'2025-11-18 23:00:00',140,6,16000),(31,1,'2025-11-19 01:00:00',150,6,16000),(32,1,'2025-11-19 03:00:00',145,6,16000),(33,1,'2025-11-19 05:00:00',150,6,16000),(34,1,'2025-11-19 07:00:00',155,6,16000),(35,1,'2025-11-19 09:00:00',160,6,16000),(36,1,'2025-11-19 11:00:00',165,6,16000),(37,1,'2025-11-19 13:00:00',170,6,16000),(38,1,'2025-11-19 15:00:00',175,6,16000),(39,1,'2025-11-19 17:00:00',160,6,16000),(40,1,'2025-11-19 19:00:00',165,6,16000),(41,1,'2025-11-19 21:00:00',170,6,16000),(42,1,'2025-11-19 23:00:00',175,6,16000),(43,1,'2025-11-20 01:00:00',180,6,16000),(44,1,'2025-11-20 03:00:00',185,6,16000),(45,1,'2025-11-20 05:00:00',180,6,16000),(46,1,'2025-11-20 07:00:00',185,6,16000),(47,1,'2025-11-20 09:00:00',190,6,16000),(48,1,'2025-11-20 11:00:00',195,6,16000),(49,1,'2025-11-20 13:00:00',200,6,16000),(50,1,'2025-11-20 15:00:00',205,6,16000),(51,1,'2025-11-20 17:00:00',180,6,16000),(52,1,'2025-11-20 19:00:00',185,6,16000),(53,1,'2025-11-20 21:00:00',190,6,16000),(54,1,'2025-11-20 23:00:00',195,6,16000),(55,1,'2025-11-21 01:00:00',200,6,16000),(56,1,'2025-11-21 03:00:00',205,6,16000),(57,1,'2025-11-21 05:00:00',210,6,16000),(58,1,'2025-11-21 07:00:00',215,6,16000),(59,1,'2025-11-21 09:00:00',220,6,16000),(60,1,'2025-11-21 11:00:00',225,6,16000),(61,1,'2025-11-21 13:00:00',230,6,16000),(62,1,'2025-11-21 15:00:00',235,6,16000),(63,1,'2025-11-21 17:00:00',50,3,10000),(64,1,'2025-11-21 19:00:00',50,3,10000),(65,1,'2025-11-21 21:00:00',50,3,10000),(66,1,'2025-11-21 23:00:00',50,3,10000),(67,1,'2025-11-22 01:00:00',50,3,10000),(68,1,'2025-11-22 03:00:00',50,3,10000),(69,1,'2025-11-22 05:00:00',50,3,10000),(70,1,'2025-11-22 07:00:00',50,3,10000),(71,1,'2025-11-22 09:00:00',50,3,10000),(72,1,'2025-11-22 11:00:00',50,3,10000),(73,1,'2025-11-22 13:00:00',50,3,10000),(74,1,'2025-11-22 15:00:00',50,3,10000);
/*!40000 ALTER TABLE `rainfall_runoff_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservoir`
--

DROP TABLE IF EXISTS `reservoir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservoir` (
  `reservoir_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_capacity` float DEFAULT NULL,
  `dead_storage` float DEFAULT NULL,
  `useful_storage` float DEFAULT NULL,
  `normal_water_level` float DEFAULT NULL,
  `max_operating_level` float DEFAULT NULL,
  `sedimentation_rate` float DEFAULT NULL,
  PRIMARY KEY (`reservoir_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservoir`
--

LOCK TABLES `reservoir` WRITE;
/*!40000 ALTER TABLE `reservoir` DISABLE KEYS */;
INSERT INTO `reservoir` VALUES (1,'Hồ Ba Hạ',350000000,50000000,300000000,40,45,1000000),(2,'Hồ Sông Hương',80000000,10000000,70000000,15,18,200000),(3,'Hồ Vu Gia',120000000,20000000,100000000,30,35,500000),(4,'Hồ Thu Bồn',150000000,25000000,125000000,32,37,600000);
/*!40000 ALTER TABLE `reservoir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservoir_discharge`
--

DROP TABLE IF EXISTS `reservoir_discharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservoir_discharge` (
  `discharge_id` int NOT NULL AUTO_INCREMENT,
  `reservoir_id` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inflow` float DEFAULT NULL,
  `release_flow` float DEFAULT NULL,
  `spillway_flow` float DEFAULT NULL,
  `hydro_use_flow` float DEFAULT NULL,
  `current_volume` double DEFAULT NULL,
  PRIMARY KEY (`discharge_id`),
  KEY `reservoir_id` (`reservoir_id`),
  CONSTRAINT `reservoir_discharge_ibfk_1` FOREIGN KEY (`reservoir_id`) REFERENCES `reservoir` (`reservoir_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservoir_discharge`
--

LOCK TABLES `reservoir_discharge` WRITE;
/*!40000 ALTER TABLE `reservoir_discharge` DISABLE KEYS */;
INSERT INTO `reservoir_discharge` VALUES (4,2,'2023-12-31 17:00:00',200,120,20,100,NULL),(5,2,'2024-01-01 17:00:00',180,110,15,95,NULL),(6,2,'2024-01-02 17:00:00',210,130,25,105,NULL),(7,3,'2023-12-31 17:00:00',400,250,50,200,NULL),(8,3,'2024-01-01 17:00:00',420,260,40,220,NULL),(9,3,'2024-01-02 17:00:00',390,240,45,195,NULL),(10,4,'2023-12-31 17:00:00',480,300,55,245,NULL),(11,4,'2024-01-01 17:00:00',460,290,50,240,NULL),(12,4,'2024-01-02 17:00:00',500,310,60,250,NULL),(28,2,'2023-12-31 17:00:00',200,120,20,100,NULL),(29,2,'2024-01-01 17:00:00',180,110,15,95,NULL),(30,2,'2024-01-02 17:00:00',210,130,25,105,NULL),(31,3,'2023-12-31 17:00:00',400,250,50,200,NULL),(32,3,'2024-01-01 17:00:00',420,260,40,220,NULL),(33,3,'2024-01-02 17:00:00',390,240,45,195,NULL),(34,4,'2023-12-31 17:00:00',480,300,55,245,NULL),(35,4,'2024-01-01 17:00:00',460,290,50,240,NULL),(36,4,'2024-01-02 17:00:00',500,310,60,250,NULL);
/*!40000 ALTER TABLE `reservoir_discharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservoir_discharge_sample`
--

DROP TABLE IF EXISTS `reservoir_discharge_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservoir_discharge_sample` (
  `discharge_id` int NOT NULL AUTO_INCREMENT,
  `reservoir_id` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inflow` float DEFAULT NULL,
  `release_flow` float DEFAULT NULL,
  `spillway_flow` float DEFAULT NULL,
  `hydro_use_flow` float DEFAULT NULL,
  `current_volume` double DEFAULT NULL,
  PRIMARY KEY (`discharge_id`),
  KEY `reservoir_id` (`reservoir_id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservoir_discharge_sample`
--

LOCK TABLES `reservoir_discharge_sample` WRITE;
/*!40000 ALTER TABLE `reservoir_discharge_sample` DISABLE KEYS */;
INSERT INTO `reservoir_discharge_sample` VALUES (99,1,'2025-11-15 17:00:00',500,300,50,150,350000000),(100,1,'2025-11-16 17:00:00',520,300,150,150,NULL),(101,1,'2025-11-16 19:00:00',530,300,150,150,NULL),(102,1,'2025-11-16 21:00:00',510,300,150,150,NULL),(103,1,'2025-11-16 23:00:00',500,300,150,150,NULL),(104,1,'2025-11-17 01:00:00',480,300,150,150,NULL),(105,1,'2025-11-17 03:00:00',470,300,150,150,NULL),(106,1,'2025-11-17 05:00:00',460,300,150,150,NULL),(107,1,'2025-11-17 07:00:00',450,300,150,150,NULL),(108,1,'2025-11-17 09:00:00',440,300,150,150,NULL),(109,1,'2025-11-17 11:00:00',430,300,150,150,NULL),(110,1,'2025-11-17 13:00:00',420,300,150,150,NULL),(111,1,'2025-11-17 15:00:00',410,300,150,150,NULL),(112,1,'2025-11-17 17:00:00',400,300,200,150,NULL),(113,1,'2025-11-17 19:00:00',410,300,200,150,NULL),(114,1,'2025-11-17 21:00:00',420,300,200,150,NULL),(115,1,'2025-11-17 23:00:00',430,300,200,150,NULL),(116,1,'2025-11-18 01:00:00',440,300,200,150,NULL),(117,1,'2025-11-18 03:00:00',450,300,200,150,NULL),(118,1,'2025-11-18 05:00:00',460,300,200,150,NULL),(119,1,'2025-11-18 07:00:00',470,300,200,150,NULL),(120,1,'2025-11-18 09:00:00',480,300,200,150,NULL),(121,1,'2025-11-18 11:00:00',490,300,200,150,NULL),(122,1,'2025-11-18 13:00:00',500,300,200,150,NULL),(123,1,'2025-11-18 15:00:00',510,300,200,150,NULL),(124,1,'2025-11-18 17:00:00',16000,300,15700,150,NULL),(125,1,'2025-11-18 19:00:00',16000,300,15700,150,NULL),(126,1,'2025-11-18 21:00:00',16000,300,15700,150,NULL),(127,1,'2025-11-18 23:00:00',16000,300,15700,150,NULL),(128,1,'2025-11-19 01:00:00',16000,300,15700,150,NULL),(129,1,'2025-11-19 03:00:00',16000,300,15700,150,NULL),(130,1,'2025-11-19 05:00:00',16000,300,15700,150,NULL),(131,1,'2025-11-19 07:00:00',16000,300,15700,150,NULL),(132,1,'2025-11-19 09:00:00',16000,300,15700,150,NULL),(133,1,'2025-11-19 11:00:00',16000,300,15700,150,NULL),(134,1,'2025-11-19 13:00:00',15600,300,15600,150,NULL),(135,1,'2025-11-19 15:00:00',15600,300,15600,150,NULL),(136,1,'2025-11-19 17:00:00',15600,300,15600,150,NULL),(137,1,'2025-11-19 19:00:00',13800,300,13800,150,NULL),(138,1,'2025-11-19 21:00:00',13400,300,13400,150,NULL),(139,1,'2025-11-19 23:00:00',13400,300,13400,150,NULL),(140,1,'2025-11-20 01:00:00',13400,300,13400,150,NULL),(141,1,'2025-11-20 03:00:00',10650,300,9700,150,NULL),(142,1,'2025-11-20 05:00:00',10650,300,9700,150,NULL),(143,1,'2025-11-20 07:00:00',10650,300,9700,150,NULL),(144,1,'2025-11-20 09:00:00',10650,300,9700,150,NULL),(145,1,'2025-11-20 11:00:00',10650,300,9700,150,NULL),(146,1,'2025-11-20 13:00:00',10650,300,9700,150,NULL),(147,1,'2025-11-20 15:00:00',10650,300,9700,150,NULL),(148,1,'2025-11-20 17:00:00',10650,300,9700,150,NULL),(149,1,'2025-11-20 19:00:00',10650,300,9700,150,NULL),(150,1,'2025-11-20 21:00:00',10650,300,9700,150,NULL),(151,1,'2025-11-20 23:00:00',10650,300,9700,150,NULL),(152,1,'2025-11-21 01:00:00',10650,300,9700,150,NULL),(153,1,'2025-11-21 03:00:00',10650,300,9700,150,NULL),(154,1,'2025-11-21 05:00:00',10650,300,9700,150,NULL),(155,1,'2025-11-21 07:00:00',10650,300,9700,150,NULL),(156,1,'2025-11-21 09:00:00',10650,300,9700,150,NULL),(157,1,'2025-11-21 11:00:00',10650,300,9700,150,NULL),(158,1,'2025-11-21 13:00:00',10650,300,9700,150,NULL),(159,1,'2025-11-21 15:00:00',10650,300,9700,150,NULL),(160,1,'2025-11-21 17:00:00',10650,300,9700,150,NULL),(161,1,'2025-11-21 19:00:00',10650,300,9700,150,NULL),(162,1,'2025-11-21 21:00:00',10650,300,9700,150,NULL),(163,1,'2025-11-21 23:00:00',10650,300,9700,150,NULL),(164,1,'2025-11-22 01:00:00',10650,300,9700,150,NULL),(165,1,'2025-11-22 03:00:00',10650,300,9700,150,NULL),(166,1,'2025-11-22 05:00:00',10650,300,9700,150,NULL),(167,1,'2025-11-22 07:00:00',10650,300,9700,150,NULL),(168,1,'2025-11-22 09:00:00',10650,300,9700,150,NULL),(169,1,'2025-11-22 11:00:00',10650,300,9700,150,NULL),(170,1,'2025-11-22 13:00:00',10650,300,9700,150,NULL),(171,1,'2025-11-22 15:00:00',10650,300,9700,150,NULL);
/*!40000 ALTER TABLE `reservoir_discharge_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservoir_discharge_sample2`
--

DROP TABLE IF EXISTS `reservoir_discharge_sample2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservoir_discharge_sample2` (
  `discharge_id` int NOT NULL AUTO_INCREMENT,
  `reservoir_id` int NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inflow` float DEFAULT NULL,
  `release_flow` float DEFAULT NULL,
  `spillway_flow` float DEFAULT NULL,
  `hydro_use_flow` float DEFAULT NULL,
  `current_volume` double DEFAULT NULL,
  PRIMARY KEY (`discharge_id`),
  KEY `reservoir_id` (`reservoir_id`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservoir_discharge_sample2`
--

LOCK TABLES `reservoir_discharge_sample2` WRITE;
/*!40000 ALTER TABLE `reservoir_discharge_sample2` DISABLE KEYS */;
INSERT INTO `reservoir_discharge_sample2` VALUES (221,1,'2025-11-15 17:00:00',500,300,50,150,350000000),(222,1,'2025-11-16 17:00:00',520,300,800,150,NULL),(223,1,'2025-11-16 19:00:00',530,300,820,150,NULL),(224,1,'2025-11-16 21:00:00',510,300,850,150,NULL),(225,1,'2025-11-16 23:00:00',500,300,880,150,NULL),(226,1,'2025-11-17 01:00:00',480,300,900,150,NULL),(227,1,'2025-11-17 03:00:00',470,300,920,150,NULL),(228,1,'2025-11-17 05:00:00',460,300,950,150,NULL),(229,1,'2025-11-17 07:00:00',450,300,970,150,NULL),(230,1,'2025-11-17 09:00:00',440,300,1000,150,NULL),(231,1,'2025-11-17 11:00:00',430,300,1020,150,NULL),(232,1,'2025-11-17 13:00:00',420,300,1050,150,NULL),(233,1,'2025-11-17 15:00:00',410,300,1080,150,NULL),(234,1,'2025-11-17 17:00:00',400,300,1100,150,NULL),(235,1,'2025-11-17 19:00:00',410,300,1120,150,NULL),(236,1,'2025-11-17 21:00:00',420,300,1150,150,NULL),(237,1,'2025-11-17 23:00:00',430,300,1170,150,NULL),(238,1,'2025-11-18 01:00:00',440,300,1200,150,NULL),(239,1,'2025-11-18 03:00:00',450,300,1220,150,NULL),(240,1,'2025-11-18 05:00:00',460,300,1250,150,NULL),(241,1,'2025-11-18 07:00:00',470,300,1270,150,NULL),(242,1,'2025-11-18 09:00:00',480,300,1300,150,NULL),(243,1,'2025-11-18 11:00:00',490,300,1320,150,NULL),(244,1,'2025-11-18 13:00:00',500,300,1350,150,NULL),(245,1,'2025-11-18 15:00:00',510,300,1370,150,NULL),(246,1,'2025-11-18 17:00:00',16000,300,16000,150,NULL),(247,1,'2025-11-18 19:00:00',16000,300,16000,150,NULL),(248,1,'2025-11-18 21:00:00',16000,300,16000,150,NULL),(249,1,'2025-11-18 23:00:00',16000,300,16000,150,NULL),(250,1,'2025-11-19 01:00:00',16000,300,16000,150,NULL),(251,1,'2025-11-19 03:00:00',16000,300,16000,150,NULL),(252,1,'2025-11-19 05:00:00',16000,300,16000,150,NULL),(253,1,'2025-11-19 07:00:00',16000,300,16000,150,NULL),(254,1,'2025-11-19 09:00:00',16000,300,16000,150,NULL),(255,1,'2025-11-19 11:00:00',16000,300,16000,150,NULL),(256,1,'2025-11-19 13:00:00',15600,300,15600,150,NULL),(257,1,'2025-11-19 15:00:00',15600,300,15600,150,NULL),(258,1,'2025-11-19 17:00:00',15600,300,15600,150,NULL),(259,1,'2025-11-19 19:00:00',13800,300,13800,150,NULL),(260,1,'2025-11-19 21:00:00',13400,300,13400,150,NULL),(261,1,'2025-11-19 23:00:00',13400,300,13400,150,NULL),(262,1,'2025-11-20 01:00:00',13400,300,13400,150,NULL),(263,1,'2025-11-20 03:00:00',10650,300,9700,150,NULL),(264,1,'2025-11-20 05:00:00',10650,300,9700,150,NULL),(265,1,'2025-11-20 07:00:00',10650,300,9700,150,NULL),(266,1,'2025-11-20 09:00:00',10650,300,9700,150,NULL),(267,1,'2025-11-20 11:00:00',10650,300,9700,150,NULL),(268,1,'2025-11-20 13:00:00',10650,300,9700,150,NULL),(269,1,'2025-11-20 15:00:00',10650,300,9700,150,NULL),(270,1,'2025-11-20 17:00:00',500,300,500,150,NULL),(271,1,'2025-11-20 19:00:00',500,300,500,150,NULL),(272,1,'2025-11-20 21:00:00',500,300,500,150,NULL),(273,1,'2025-11-20 23:00:00',500,300,500,150,NULL),(274,1,'2025-11-21 01:00:00',500,300,500,150,NULL),(275,1,'2025-11-21 03:00:00',500,300,500,150,NULL),(276,1,'2025-11-21 05:00:00',500,300,500,150,NULL),(277,1,'2025-11-21 07:00:00',500,300,500,150,NULL),(278,1,'2025-11-21 09:00:00',500,300,500,150,NULL),(279,1,'2025-11-21 11:00:00',500,300,500,150,NULL),(280,1,'2025-11-21 13:00:00',500,300,500,150,NULL),(281,1,'2025-11-21 15:00:00',500,300,500,150,NULL),(282,1,'2025-11-21 17:00:00',500,300,500,150,NULL),(283,1,'2025-11-21 19:00:00',500,300,500,150,NULL),(284,1,'2025-11-21 21:00:00',500,300,500,150,NULL),(285,1,'2025-11-21 23:00:00',500,300,500,150,NULL),(286,1,'2025-11-22 01:00:00',500,300,500,150,NULL),(287,1,'2025-11-22 03:00:00',500,300,500,150,NULL),(288,1,'2025-11-22 05:00:00',500,300,500,150,NULL),(289,1,'2025-11-22 07:00:00',500,300,500,150,NULL),(290,1,'2025-11-22 09:00:00',500,300,500,150,NULL),(291,1,'2025-11-22 11:00:00',500,300,500,150,NULL),(292,1,'2025-11-22 13:00:00',500,300,500,150,NULL),(293,1,'2025-11-22 15:00:00',500,300,500,150,NULL);
/*!40000 ALTER TABLE `reservoir_discharge_sample2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `river`
--

DROP TABLE IF EXISTS `river`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `river` (
  `river_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_flow` float DEFAULT NULL,
  `flood_flow` float DEFAULT NULL,
  `outflow` float DEFAULT NULL,
  `reservoir_id` int DEFAULT NULL,
  PRIMARY KEY (`river_id`),
  KEY `reservoir_id` (`reservoir_id`),
  CONSTRAINT `river_ibfk_1` FOREIGN KEY (`reservoir_id`) REFERENCES `reservoir` (`reservoir_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `river`
--

LOCK TABLES `river` WRITE;
/*!40000 ALTER TABLE `river` DISABLE KEYS */;
INSERT INTO `river` VALUES (1,'Sông Ba Hạ',20,800,50,1),(2,'Sông Hương',10,400,25,2),(3,'Sông Vu Gia',30,1000,60,3),(4,'Sông Thu Bồn',25,900,55,4);
/*!40000 ALTER TABLE `river` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sample`
--

DROP TABLE IF EXISTS `sample`;
/*!50001 DROP VIEW IF EXISTS `sample`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sample` AS SELECT 
 1 AS `discharge_id`,
 1 AS `reservoir_id`,
 1 AS `date`,
 1 AS `inflow`,
 1 AS `release_flow`,
 1 AS `spillway_flow`,
 1 AS `hydro_use_flow`,
 1 AS `current_volume`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'waterfall'
--
/*!50003 DROP PROCEDURE IF EXISTS `update_current_volume` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_current_volume`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_reservoir_id INT;
    DECLARE v_last_date TIMESTAMP;
    DECLARE v_date TIMESTAMP;
    DECLARE v_inflow DOUBLE;
    DECLARE v_release DOUBLE;
    DECLARE v_spillway DOUBLE;
    DECLARE v_hydro DOUBLE;
    DECLARE v_last_volume DOUBLE DEFAULT NULL;
    DECLARE v_last_reservoir_id INT DEFAULT NULL;

    DECLARE cur CURSOR FOR 
        SELECT reservoir_id, date, inflow, release_flow, spillway_flow, hydro_use_flow
        FROM reservoir_discharge_sample
        ORDER BY reservoir_id, date;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO v_reservoir_id, v_date, v_inflow, v_release, v_spillway, v_hydro;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Reset v_last_volume nếu chuyển reservoir mới
        IF v_last_reservoir_id IS NULL OR v_last_reservoir_id <> v_reservoir_id THEN
            SET v_last_volume = NULL;
        END IF;

        -- Nếu v_last_volume NULL thì lấy giá trị mốc của bản ghi đầu tiên
        IF v_last_volume IS NULL THEN
            SELECT current_volume INTO v_last_volume
            FROM reservoir_discharge_sample
            WHERE reservoir_id = v_reservoir_id AND date = v_date;
        ELSE
            UPDATE reservoir_discharge_sample
            SET current_volume = v_last_volume + (v_inflow - (v_release + v_spillway + v_hydro)) * TIMESTAMPDIFF(SECOND, v_last_date, v_date)
            WHERE reservoir_id = v_reservoir_id AND date = v_date;

            SET v_last_volume = v_last_volume + (v_inflow - (v_release + v_spillway + v_hydro)) * TIMESTAMPDIFF(SECOND, v_last_date, v_date);
        END IF;

        SET v_last_date = v_date;
        SET v_last_reservoir_id = v_reservoir_id;

    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `sample`
--

/*!50001 DROP VIEW IF EXISTS `sample`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sample` AS select `reservoir_discharge`.`discharge_id` AS `discharge_id`,`reservoir_discharge`.`reservoir_id` AS `reservoir_id`,`reservoir_discharge`.`date` AS `date`,`reservoir_discharge`.`inflow` AS `inflow`,`reservoir_discharge`.`release_flow` AS `release_flow`,`reservoir_discharge`.`spillway_flow` AS `spillway_flow`,`reservoir_discharge`.`hydro_use_flow` AS `hydro_use_flow`,`reservoir_discharge`.`current_volume` AS `current_volume` from `reservoir_discharge` where (`reservoir_discharge`.`reservoir_id` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20 14:25:10
