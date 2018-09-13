-- MySQL dump 10.13  Distrib 5.7.16, for osx10.11 (x86_64)
--
-- Host: localhost    Database: wagers
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Table structure for table `graded_wagers`
--

DROP TABLE IF EXISTS `graded_wagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graded_wagers` (
  `ticket` varchar(30) NOT NULL DEFAULT '',
  `outcome` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graded_wagers`
--

LOCK TABLES `graded_wagers` WRITE;
/*!40000 ALTER TABLE `graded_wagers` DISABLE KEYS */;
INSERT INTO `graded_wagers` VALUES ('336992095 - 1','Win'),('336992128 - 1','Win'),('336992192 - 1','Win'),('336992222 - 1','Win'),('336992235 - 1','Loss'),('352816480 - 1','Loss'),('352906540 - 1','Win'),('352906540 - 2','Win'),('352915229 - 1','Loss'),('352915269 - 1','Win'),('352915269 - 2','Win'),('352915269 - 3','Win'),('352915269 - 4','Win'),('352915269 - 5','Win'),('353415976 - 1','Win'),('353415976 - 2','Loss'),('353416400 - 1','Win'),('353416486 - 1','Win'),('353489102 - 1','Loss'),('353489122 - 1','Loss'),('353489298 - 1','Loss'),('353526227 - 1','Loss'),('353527047 - 1','Win'),('353616193 - 2','Loss'),('353616193 - 3','Loss'),('353616193 - 4','Loss'),('353678135 - 1','Loss');
/*!40000 ALTER TABLE `graded_wagers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graded_wagers_load`
--

DROP TABLE IF EXISTS `graded_wagers_load`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graded_wagers_load` (
  `ticket` varchar(30) NOT NULL DEFAULT '',
  `outcome` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graded_wagers_load`
--

LOCK TABLES `graded_wagers_load` WRITE;
/*!40000 ALTER TABLE `graded_wagers_load` DISABLE KEYS */;
INSERT INTO `graded_wagers_load` VALUES ('336992095 - 1','Win'),('336992128 - 1','Win'),('336992192 - 1','Win'),('336992222 - 1','Win'),('336992235 - 1','Loss'),('353616193 - 2','Loss'),('353616193 - 3','Loss'),('353616193 - 4','Loss'),('353678135 - 1','Loss');
/*!40000 ALTER TABLE `graded_wagers_load` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historic_wagers`
--

DROP TABLE IF EXISTS `historic_wagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historic_wagers` (
  `ticket` varchar(30) NOT NULL DEFAULT '',
  `accepted` datetime NOT NULL,
  `type` text NOT NULL,
  `risk` decimal(9,2) NOT NULL,
  `reward` decimal(9,2) NOT NULL,
  `sport` varchar(30) NOT NULL DEFAULT '',
  `game_number` int(11) DEFAULT NULL,
  `team` varchar(50) NOT NULL DEFAULT '',
  `wager` decimal(5,1) NOT NULL,
  `odds` int(11) NOT NULL,
  `over_under` varchar(10) DEFAULT NULL,
  `competition` varchar(40) DEFAULT NULL,
  `closing_line` int(11) NOT NULL,
  `clv` decimal(7,3) NOT NULL,
  `net` decimal(9,2) NOT NULL,
  `active_line_id` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT NULL,
  `outcome` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historic_wagers`
--

LOCK TABLES `historic_wagers` WRITE;
/*!40000 ALTER TABLE `historic_wagers` DISABLE KEYS */;
/*!40000 ALTER TABLE `historic_wagers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historic_wagers_load`
--

DROP TABLE IF EXISTS `historic_wagers_load`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historic_wagers_load` (
  `ticket` varchar(30) NOT NULL DEFAULT '',
  `accepted` datetime NOT NULL,
  `type` text NOT NULL,
  `risk` decimal(9,2) NOT NULL,
  `reward` decimal(9,2) NOT NULL,
  `sport` varchar(30) NOT NULL DEFAULT '',
  `game_number` int(11) DEFAULT NULL,
  `team` varchar(50) NOT NULL DEFAULT '',
  `wager` decimal(5,1) NOT NULL,
  `odds` int(11) NOT NULL,
  `over_under` varchar(10) DEFAULT NULL,
  `competition` varchar(40) DEFAULT NULL,
  `closing_line` int(11) DEFAULT NULL,
  `clv` decimal(7,3) DEFAULT NULL,
  `net` decimal(9,2) DEFAULT NULL,
  `active_line_id` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT NULL,
  `outcome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historic_wagers_load`
--

LOCK TABLES `historic_wagers_load` WRITE;
/*!40000 ALTER TABLE `historic_wagers_load` DISABLE KEYS */;
/*!40000 ALTER TABLE `historic_wagers_load` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historic_wagers_middle`
--

DROP TABLE IF EXISTS `historic_wagers_middle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historic_wagers_middle` (
  `ticket` varchar(30) NOT NULL DEFAULT '',
  `accepted` datetime NOT NULL,
  `type` text NOT NULL,
  `risk` decimal(9,2) NOT NULL,
  `reward` decimal(9,2) NOT NULL,
  `sport` varchar(30) NOT NULL DEFAULT '',
  `game_number` int(11) DEFAULT NULL,
  `team` varchar(50) NOT NULL DEFAULT '',
  `wager` decimal(5,1) NOT NULL,
  `odds` int(11) NOT NULL,
  `over_under` varchar(10) DEFAULT NULL,
  `competition` varchar(40) DEFAULT NULL,
  `closing_line` int(11) DEFAULT NULL,
  `clv` decimal(7,3) DEFAULT NULL,
  `net` decimal(9,2) DEFAULT NULL,
  `active_line_id` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT NULL,
  `outcome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historic_wagers_middle`
--

LOCK TABLES `historic_wagers_middle` WRITE;
/*!40000 ALTER TABLE `historic_wagers_middle` DISABLE KEYS */;
/*!40000 ALTER TABLE `historic_wagers_middle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_wagers`
--

DROP TABLE IF EXISTS `pending_wagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_wagers` (
  `ticket` varchar(30) NOT NULL DEFAULT '',
  `accepted` datetime NOT NULL,
  `type` text NOT NULL,
  `risk` decimal(9,2) NOT NULL,
  `reward` decimal(9,2) NOT NULL,
  `sport` varchar(30) NOT NULL DEFAULT '',
  `game_number` int(11) DEFAULT NULL,
  `team` varchar(50) DEFAULT NULL,
  `wager` decimal(5,1) NOT NULL,
  `odds` int(11) NOT NULL,
  `over_under` varchar(10) DEFAULT NULL,
  `competition` varchar(40) DEFAULT NULL,
  `active_line_id` int(11) DEFAULT NULL,
  `home` int(11) DEFAULT NULL,
  PRIMARY KEY (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_wagers`
--

LOCK TABLES `pending_wagers` WRITE;
/*!40000 ALTER TABLE `pending_wagers` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_wagers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_wagers_load`
--

DROP TABLE IF EXISTS `pending_wagers_load`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_wagers_load` (
  `ticket` varchar(30) NOT NULL DEFAULT '',
  `accepted` datetime NOT NULL,
  `type` text NOT NULL,
  `risk` decimal(9,2) NOT NULL,
  `reward` decimal(9,2) NOT NULL,
  `sport` varchar(30) NOT NULL DEFAULT '',
  `game_number` int(11) DEFAULT NULL,
  `team` varchar(50) DEFAULT NULL,
  `wager` decimal(5,1) NOT NULL,
  `odds` int(11) NOT NULL,
  `over_under` varchar(10) DEFAULT NULL,
  `competition` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_wagers_load`
--

LOCK TABLES `pending_wagers_load` WRITE;
/*!40000 ALTER TABLE `pending_wagers_load` DISABLE KEYS */;
/*!40000 ALTER TABLE `pending_wagers_load` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-14  8:01:01
