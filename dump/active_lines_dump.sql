-- MySQL dump 10.13  Distrib 5.7.16, for osx10.11 (x86_64)
--
-- Host: localhost    Database: MLBLines
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
-- Table structure for table `active_lines`
--

DROP TABLE IF EXISTS `active_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_lines` (
  `id` int(11) unsigned NOT NULL,
  `dateOfGame` date NOT NULL,
  `timeOfGame` time NOT NULL,
  `created` datetime NOT NULL,
  `h1_name` text NOT NULL,
  `h2_name` text NOT NULL,
  `h1_id` int(11) NOT NULL,
  `h2_id` int(11) NOT NULL,
  `last_updated` datetime NOT NULL,
  `h1_starter` text,
  `h2_starter` text,
  `h1_line` int(11) DEFAULT NULL,
  `h2_line` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_lines`
--

LOCK TABLES `active_lines` WRITE;
/*!40000 ALTER TABLE `active_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historic_lines`
--

DROP TABLE IF EXISTS `historic_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historic_lines` (
  `id` int(11) unsigned NOT NULL,
  `dateOfGame` date NOT NULL,
  `timeOfGame` time NOT NULL,
  `created` datetime NOT NULL,
  `h1_name` text NOT NULL,
  `h2_name` text NOT NULL,
  `h1_id` int(11) NOT NULL,
  `h2_id` int(11) NOT NULL,
  `last_updated` datetime NOT NULL,
  `h1_starter` text,
  `h2_starter` text,
  `h1_final_line` int(11) DEFAULT NULL,
  `h2_final_line` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historic_lines`
--

LOCK TABLES `historic_lines` WRITE;
/*!40000 ALTER TABLE `historic_lines` DISABLE KEYS */;
INSERT INTO `historic_lines` VALUES (353388569,'2017-04-10','16:35:00','2017-04-10 12:52:29','Arizona Diamondbacks','San Francisco Giants',901,902,'2017-04-10 12:52:29','T. Walker -R','M. Moore -L',121,-131),(353388570,'2017-04-10','19:05:00','2017-04-10 12:52:29','New York Mets','Philadelphia Phillies',903,904,'2017-04-10 12:52:29','J. deGrom -R','J. Eickhoff -R',-138,128),(353388571,'2017-04-10','19:05:00','2017-04-10 12:52:29','St. Louis Cardinals','Washington Nationals',905,906,'2017-04-10 12:52:29','A. Wainwright -R','T. Roark -R',110,-120),(353388572,'2017-04-10','19:05:00','2017-04-10 12:52:29','Cincinnati Reds','Pittsburgh Pirates',907,908,'2017-04-10 12:52:29','B. Finnegan -L','T. Glasnow -R',120,-130),(353388573,'2017-04-10','20:05:00','2017-04-10 12:52:29','Los Angeles Dodgers','Chicago Cubs',909,910,'2017-04-10 12:52:29','A. Wood -L','J. Lester -L',132,-142),(353388574,'2017-04-10','20:40:00','2017-04-10 12:52:29','San Diego Padres','Colorado Rockies',911,912,'2017-04-10 12:52:29','J. Cosart -R','T. Chatwood -R',167,-177),(353388575,'2017-04-10','13:10:00','2017-04-10 12:52:29','Boston Red Sox','Detroit Tigers',913,914,'2017-04-10 12:52:29','C. Sale -L','J. Verlander -R',-107,-103),(353388576,'2017-04-10','16:15:00','2017-04-10 12:52:29','Oakland Athletics','Kansas City Royals',915,916,'2017-04-10 12:52:29','J. Cotton -R','I. Kennedy -R',100,-110),(353388577,'2017-04-10','17:10:00','2017-04-10 12:52:29','Houston Astros','Seattle Mariners',917,918,'2017-04-10 12:52:29','C. Morton -R','J. Paxton -L',116,-126),(353388578,'2017-04-10','13:05:00','2017-04-10 12:52:29','Tampa Bay Rays','New York Yankees',919,920,'2017-04-10 12:52:29','A. Cobb -R','M. Pineda -R',117,-127),(353480680,'2017-04-11','19:10:00','2017-04-10 12:52:29','Atlanta Braves','Miami Marlins',951,952,'2017-04-11 16:52:08','B. Colon -R','D. Straily -R',126,-136),(353480681,'2017-04-11','19:05:00','2017-04-10 12:52:29','St. Louis Cardinals','Washington Nationals',953,954,'2017-04-11 16:52:08','L. Lynn -R','G. Gonzalez -L',123,-133),(353480682,'2017-04-11','19:05:00','2017-04-10 12:52:29','New York Mets','Philadelphia Phillies',955,956,'2017-04-11 16:52:08','M. Harvey -R','C. Buchholz -R',-140,130),(353480683,'2017-04-11','19:05:00','2017-04-10 12:52:29','Cincinnati Reds','Pittsburgh Pirates',957,958,'2017-04-11 16:52:08','R. Davis -R','J. Taillon -R',170,-180),(353480684,'2017-04-11','20:40:00','2017-04-10 12:52:29','San Diego Padres','Colorado Rockies',959,960,'2017-04-11 16:52:08','J. Weaver -R','A. Senzatela -R',164,-174),(353480685,'2017-04-11','22:15:00','2017-04-10 12:52:29','Arizona Diamondbacks','San Francisco Giants',961,962,'2017-04-11 16:52:08','R. Ray -L','J. Samardzija -R',114,-124),(353480686,'2017-04-11','13:10:00','2017-04-10 12:52:29','Minnesota Twins','Detroit Tigers',963,964,'2017-04-11 10:39:21','H. Santiago -L','M. Boyd -L',125,-135),(353480687,'2017-04-11','16:10:00','2017-04-10 12:52:29','Chicago White Sox','Cleveland Indians',965,966,'2017-04-11 10:39:21','J. Shields -R','C. Carrasco -R',244,-267),(353480688,'2017-04-11','19:10:00','2017-04-10 12:52:29','Baltimore Orioles','Boston Red Sox',967,968,'2017-04-11 16:52:08','D. Bundy -R','D. Pomeranz -L',104,-114),(353480689,'2017-04-11','22:05:00','2017-04-10 12:52:29','Texas Rangers','Los Angeles Angels',969,970,'2017-04-11 16:52:08','C. Hamels -L','T. Skaggs -L',102,-112),(353480690,'2017-04-11','22:10:00','2017-04-10 12:52:29','Houston Astros','Seattle Mariners',971,972,'2017-04-11 16:52:08','J. Musgrove -R','A. Miranda -L',-118,108),(353480691,'2017-04-11','19:05:00','2017-04-10 12:52:29','Milwaukee Brewers','Toronto Blue Jays',973,974,'2017-04-11 16:52:08','W. Peralta -R','J.A. Happ -L',160,-170),(353577009,'2017-04-12','15:10:00','2017-04-11 16:52:08','San Diego Padres','Colorado Rockies',901,902,'2017-04-11 16:52:08','L. Perdomo -R','K. Freeland -L',132,-142),(353577010,'2017-04-12','19:05:00','2017-04-11 16:52:08','Cincinnati Reds','Pittsburgh Pirates',903,904,'2017-04-11 16:52:08','A. Garrett -L','I. Nova -R',142,-152),(353577011,'2017-04-12','19:05:00','2017-04-11 16:52:08','New York Mets','Philadelphia Phillies',905,906,'2017-04-11 16:52:08','Z. Wheeler -R','V. Velasquez -R',104,-114),(353577012,'2017-04-12','16:05:00','2017-04-11 16:52:08','St. Louis Cardinals','Washington Nationals',907,908,'2017-04-11 16:52:08','M. Leake -R','M. Scherzer -R',185,-200),(353577013,'2017-04-12','19:10:00','2017-04-11 16:52:08','Atlanta Braves','Miami Marlins',909,910,'2017-04-11 16:52:08','J. Garcia -L','T. Koehler -R',112,-122),(353577014,'2017-04-12','20:05:00','2017-04-11 16:52:08','Los Angeles Dodgers','Chicago Cubs',911,912,'2017-04-11 16:52:08','M. McCarthy -R','J. Lackey -R',118,-128),(353577015,'2017-04-12','22:15:00','2017-04-11 16:52:08','Arizona Diamondbacks','San Francisco Giants',913,914,'2017-04-11 16:52:08','S. Miller -R','M. Cain -R',111,-121),(353577016,'2017-04-12','13:10:00','2017-04-11 16:52:08','Minnesota Twins','Detroit Tigers',915,916,'2017-04-11 16:52:08','K. Gibson -R','M. Fulmer -R',130,-140),(353577017,'2017-04-12','18:10:00','2017-04-11 16:52:08','Chicago White Sox','Cleveland Indians',917,918,'2017-04-11 16:52:08','D. Holland -L','D. Salazar -R',212,-230),(353577018,'2017-04-12','13:05:00','2017-04-11 16:52:08','Tampa Bay Rays','New York Yankees',919,920,'2017-04-11 16:52:08','B. Snell -L','J. Montgomery -L',-102,-108),(353577019,'2017-04-12','19:10:00','2017-04-11 16:52:08','Baltimore Orioles','Boston Red Sox',921,922,'2017-04-11 16:52:08','U. Jimenez -R','S. Wright -R',134,-144),(353577020,'2017-04-12','20:15:00','2017-04-11 16:52:08','Oakland Athletics','Kansas City Royals',923,924,'2017-04-11 16:52:08','A. Triggs -R','J. Hammel -R',101,-111),(353577021,'2017-04-12','22:05:00','2017-04-11 16:52:08','Texas Rangers','Los Angeles Angels',925,926,'2017-04-11 16:52:08','A.J. Griffin -R','J. Chavez -R',121,-131),(353577022,'2017-04-12','22:10:00','2017-04-11 16:52:08','Houston Astros','Seattle Mariners',927,928,'2017-04-11 16:52:08','M. Fiers -R','Y. Gallardo -R',-115,105),(353577023,'2017-04-12','19:05:00','2017-04-11 16:52:08','Milwaukee Brewers','Toronto Blue Jays',929,930,'2017-04-11 16:52:08','Ch. Anderson -R','M. Stroman -R',162,-172);
/*!40000 ALTER TABLE `historic_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_id_pairs`
--

DROP TABLE IF EXISTS `team_id_pairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_id_pairs` (
  `game_id` int(11) unsigned NOT NULL,
  `team_name` text NOT NULL,
  `home` int(11) DEFAULT NULL,
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_id_pairs`
--

LOCK TABLES `team_id_pairs` WRITE;
/*!40000 ALTER TABLE `team_id_pairs` DISABLE KEYS */;
INSERT INTO `team_id_pairs` VALUES (951,'New York Mets',1),(952,'Miami Marlins',2),(953,'Los Angeles Dodgers',1),(954,'Chicago Cubs',2),(955,'Milwaukee Brewers',1),(956,'Cincinnati Reds',2),(957,'Colorado Rockies',1),(958,'San Francisco Giants',2),(959,'Chicago White Sox',1),(960,'Cleveland Indians',2),(961,'Minnesota Twins',1),(962,'Detroit Tigers',2),(963,'Texas Rangers',1),(964,'Los Angeles Angels',2),(965,'Tampa Bay Rays',1),(966,'New York Yankees',2),(967,'Baltimore Orioles',1),(968,'Toronto Blue Jays',2),(969,'Oakland Athletics',1),(970,'Kansas City Royals',2),(971,'Pittsburgh Pirates',1),(972,'Boston Red Sox',2);
/*!40000 ALTER TABLE `team_id_pairs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-14  8:00:20
