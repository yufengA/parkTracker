CREATE DATABASE  IF NOT EXISTS `sep` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sep`;
-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: sep
-- ------------------------------------------------------
-- Server version	5.5.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor` (
  `ID` varchar(50) NOT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `contactNumber` varchar(10) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `signedOut` tinyint(1) DEFAULT NULL,
  `isoverdue` tinyint(1) DEFAULT NULL,
  `medicalDetails` varchar(1000) DEFAULT NULL,
  `group_id` varchar(50) DEFAULT NULL,
  `mailSent` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ddd` (`group_id`),
  CONSTRAINT `ddd` FOREIGN KEY (`group_id`) REFERENCES `group_visitor` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES ('732eeb1c-c386-4765-b87f-360046f2f276','sada','sdasd','wayf128@hotmail.com','sadasd','123','2013-09-10 00:00:00',0,0,'sda','9f460aa5-2c8b-4ed7-81ab-ba30cbbbaa75',0),('897d3b98-b0d5-4794-ad82-75b33c9298e9','asdasd','asdasd','wayf1283@hotmail.com','asd','123','2013-09-18 00:00:00',0,0,'asd','9f460aa5-2c8b-4ed7-81ab-ba30cbbbaa75',0),('e31f0f6a-c9e0-4657-8d6c-4261b9113bd6','asd','asdasd','wayf128@hotmail.com','asdasd','12','2013-09-26 00:00:00',0,0,'asdasd','9f460aa5-2c8b-4ed7-81ab-ba30cbbbaa75',0);
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-03  0:25:04
