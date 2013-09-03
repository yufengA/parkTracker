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
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `startPoint` varchar(45) DEFAULT NULL,
  `destination` varchar(45) DEFAULT NULL,
  `visitedTime` int(11) DEFAULT NULL,
  `overdueTime` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
INSERT INTO `track` VALUES (1,'Organ Pipe','Cape Cod Trail',3,0,3),(2,'Cape Cod Trail','Pine Tree Trail',0,0,2),(3,'Pine Tree Trail','Bowen Trail',13,1,2),(4,'Bowen Trail','Waterfall Bay Trail',0,0,2),(5,'Waterfall Bay Trail','Organ Pipe',0,0,1),(6,'Cape Cod Trail','Louise Trail',0,0,2),(7,'Louise Trail','Trek Trail',0,0,3),(8,'Trek Trail','Tall Tree Trail',0,0,2),(9,'Tall Tree Trail','Red Barron Trail',0,0,4),(10,'Tall Tree Trail','Lila Walk',0,0,2),(11,'Clacton Trail','Lighthouse Lookout',0,0,3),(12,'Lighthouse Lookout','Organ Pipe',0,0,2),(13,'Clacton Trail','Cradle Peak Lookout',0,0,1),(14,'Cradle Peak Lookout','Organ Pipe',0,0,1),(15,'Red Barron Trail','Clacton Trail',0,0,2),(16,'Lila Walk','Clacton Trail',0,0,2);
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-03 12:41:56
