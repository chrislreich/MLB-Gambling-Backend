-- MySQL dump 10.13  Distrib 5.7.16, for osx10.11 (x86_64)
--
-- Host: localhost    Database: mlb_bullpens
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
-- Table structure for table `date_info`
--

DROP TABLE IF EXISTS `date_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_info` (
  `date` date NOT NULL,
  `day0` varchar(11) NOT NULL DEFAULT '',
  `day1` varchar(11) NOT NULL DEFAULT '',
  `day2` varchar(11) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_info`
--

LOCK TABLES `date_info` WRITE;
/*!40000 ALTER TABLE `date_info` DISABLE KEYS */;
INSERT INTO `date_info` VALUES ('2017-04-12','Wed','Tue','Mon');
/*!40000 ALTER TABLE `date_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage`
--

DROP TABLE IF EXISTS `usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage` (
  `team` varchar(50) NOT NULL DEFAULT '',
  `player` text NOT NULL,
  `count0` varchar(11) NOT NULL DEFAULT '',
  `count1` varchar(11) NOT NULL DEFAULT '',
  `count2` varchar(11) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage`
--

LOCK TABLES `usage` WRITE;
/*!40000 ALTER TABLE `usage` DISABLE KEYS */;
INSERT INTO `usage` VALUES ('Los Angeles Angels','Jose Alvarez (L)','15','0','N/G'),('Los Angeles Angels','Cam Bedrosian (R)','0','17','N/G'),('Los Angeles Angels','Mike Morin (R)','23','0','N/G'),('Los Angeles Angels','Bud Norris (R)','0','41','N/G'),('Los Angeles Angels','Blake Parker (R)','15','0','N/G'),('Los Angeles Angels','Yusmeiro Petit (R)','34','18','N/G'),('Los Angeles Angels','JC Ramirez (R)','0','0','N/G'),('Los Angeles Angels','Daniel Wright (R)','0','0','N/G'),('Houston Astros','Chris Devenski (R)','0','0','0'),('Houston Astros','Michael Feliz (R)','0','0','34'),('Houston Astros','Ken Giles (R)','0','31','0'),('Houston Astros','Luke Gregerson (R)','12','18','0'),('Houston Astros','Jandel Gustave (R)','11','0','14'),('Houston Astros','Will Harris (R)','0','31','0'),('Houston Astros','Brad Peacock (R)','27','0','0'),('Houston Astros','Tony Sipp (L)','8','0','20'),('Oakland Athletics','Santiago Casilla (R)','0','N/G','16'),('Oakland Athletics','Daniel Coulombe (L)','0','N/G','0'),('Oakland Athletics','Sean Doolittle (L)','0','N/G','24'),('Oakland Athletics','Ryan Dull (R)','13','N/G','0'),('Oakland Athletics','Jesse Hahn (R)','0','N/G','0'),('Oakland Athletics','Liam Hendriks (R)','27','N/G','0'),('Oakland Athletics','Ryan Madson (R)','0','N/G','0'),('Oakland Athletics','Frankie Montas (R)','22','N/G','0'),('Toronto Blue Jays','Joe Biagini (R)','0','23','N/G'),('Toronto Blue Jays','Jason Grilli (R)','0','23','N/G'),('Toronto Blue Jays','Dominic Leone (R)','0','2','N/G'),('Toronto Blue Jays','Aaron Loup (L)','0','0','N/G'),('Toronto Blue Jays','Roberto Osuna (R)','0','14','N/G'),('Toronto Blue Jays','Joe Smith (R)','0','12','N/G'),('Toronto Blue Jays','Ryan Tepera (R)','0','0','N/G'),('Cleveland Indians','Cody Allen (R)','0','15','N/G'),('Cleveland Indians','Shawn Armstrong (R)','0','0','N/G'),('Cleveland Indians','Boone Logan (L)','5','4','N/G'),('Cleveland Indians','Zach McAllister (R)','11','0','N/G'),('Cleveland Indians','Andrew Miller (L)','0','21','N/G'),('Cleveland Indians','Dan Otero (R)','16','0','N/G'),('Cleveland Indians','Bryan Shaw (R)','0','6','N/G'),('Seattle Mariners','Dan Altavilla (R)','23','0','18'),('Seattle Mariners','Edwin Diaz (R)','0','0','0'),('Seattle Mariners','Evan Marshall (R)','17','0','0'),('Seattle Mariners','Dillon Overton (L)','13','0','0'),('Seattle Mariners','James Pazos (L)','0','16','0'),('Seattle Mariners','Marc Rzepczynski (L)','6','0','0'),('Seattle Mariners','Evan Scribner (R)','0','0','9'),('Seattle Mariners','Nick Vincent (R)','0','18','0'),('Baltimore Orioles','Brad Brach (R)','0','0','N/G'),('Baltimore Orioles','Zach Britton (L)','0','0','N/G'),('Baltimore Orioles','Oliver Drake (R)','0','36','N/G'),('Baltimore Orioles','Mychal Givens (R)','30','0','N/G'),('Baltimore Orioles','Donnie Hart (L)','31','0','N/G'),('Baltimore Orioles','Vidal Nuno (L)','25','0','N/G'),('Baltimore Orioles','Darren O\'Day (R)','0','20','N/G'),('Baltimore Orioles','Tyler Wilson (R)','0','0','N/G'),('Texas Rangers','Dario Alvarez (L)','0','0','N/G'),('Texas Rangers','Tony Barnette (R)','0','13','N/G'),('Texas Rangers','Matt Bush (R)','0','0','N/G'),('Texas Rangers','Alex Claudio (L)','2','0','N/G'),('Texas Rangers','Sam Dyson (R)','0','24','N/G'),('Texas Rangers','Mike Hauschild (R)','0','0','N/G'),('Texas Rangers','Jeremy Jeffress (R)','15','15','N/G'),('Texas Rangers','Jose Leclerc (R)','16','0','N/G'),('Tampa Bay Rays','Xavier Cedeno (L)','10','N/G','0'),('Tampa Bay Rays','Alex Colome (R)','0','N/G','0'),('Tampa Bay Rays','Jumbo Diaz (R)','21','N/G','0'),('Tampa Bay Rays','Danny Farquhar (R)','14','N/G','0'),('Tampa Bay Rays','Tommy Hunter (R)','0','N/G','0'),('Tampa Bay Rays','Austin Pruitt (R)','0','N/G','15'),('Tampa Bay Rays','Erasmo Ramirez (R)','26','N/G','0'),('Boston Red Sox','Fernando Abad (L)','17','0','0'),('Boston Red Sox','Matt Barnes (R)','0','13','0'),('Boston Red Sox','Heath Hembree (R)','0','12','1'),('Boston Red Sox','Joe Kelly (R)','44','14','0'),('Boston Red Sox','Craig Kimbrel (R)','0','0','0'),('Boston Red Sox','Robby Scott (L)','14','0','0'),('Boston Red Sox','Ben Taylor (R)','66','0','0'),('Kansas City Royals','Scott Alexander (L)','18','N/G','0'),('Kansas City Royals','Kelvin Herrera (R)','0','N/G','0'),('Kansas City Royals','Jake Junis (R)','16','N/G','0'),('Kansas City Royals','Mike Minor (L)','0','N/G','16'),('Kansas City Royals','Peter Moylan (R)','0','N/G','17'),('Kansas City Royals','Joakim Soria (R)','0','N/G','0'),('Kansas City Royals','Travis Wood (L)','16','N/G','0'),('Kansas City Royals','Chris Young (R)','16','N/G','0'),('Detroit Tigers','Shane Greene (R)','0','9','0'),('Detroit Tigers','Joe Jimenez (R)','0','0','0'),('Detroit Tigers','Francisco Rodriguez (R)','0','19','14'),('Detroit Tigers','Kyle Ryan (L)','11','7','0'),('Detroit Tigers','Anibal Sanchez (R)','0','0','0'),('Detroit Tigers','Alex Wilson (R)','35','0','0'),('Detroit Tigers','Justin Wilson (L)','0','16','24'),('Minnesota Twins','Matt Belisle (R)','0','0','N/G'),('Minnesota Twins','Craig Breslow (L)','12','0','N/G'),('Minnesota Twins','Tyler Duffey (R)','29','0','N/G'),('Minnesota Twins','Justin Haley (R)','0','0','N/G'),('Minnesota Twins','Brandon Kintzler (R)','0','0','N/G'),('Minnesota Twins','Ryan Pressly (R)','0','0','N/G'),('Minnesota Twins','Taylor Rogers (L)','0','0','N/G'),('Minnesota Twins','Michael Tonkin (R)','0','27','N/G'),('Chicago White Sox','Dan Jennings (L)','0','6','N/G'),('Chicago White Sox','Nate Jones (R)','26','19','N/G'),('Chicago White Sox','Tommy Kahnle (R)','0','19','N/G'),('Chicago White Sox','Zach Putnam (R)','0','22','N/G'),('Chicago White Sox','David Robertson (R)','12','20','N/G'),('Chicago White Sox','Anthony Swarzak (R)','16','0','N/G'),('Chicago White Sox','Michael Ynoa (R)','0','0','N/G'),('New York Yankees','Dellin Betances (R)','0','N/G','0'),('New York Yankees','Aroldis Chapman (L)','9','N/G','0'),('New York Yankees','Tyler Clippard (R)','15','N/G','1'),('New York Yankees','Jonathan Holder (R)','11','N/G','0'),('New York Yankees','Tommy Layne (L)','21','N/G','0'),('New York Yankees','Bryan Mitchell (R)','14','N/G','0'),('New York Yankees','Adam Warren (R)','0','N/G','0'),('Atlanta  Braves','Josh Collmenter (R)','0','0','N/G'),('Atlanta  Braves','Mike Foltynewicz (R)','0','34','N/G'),('Atlanta  Braves','Jason Hursh (R)','0','0','N/G'),('Atlanta  Braves','Jim Johnson (R)','11','0','N/G'),('Atlanta  Braves','Ian Krol (L)','0','9','N/G'),('Atlanta  Braves','Eric O\'Flaherty (L)','11','12','N/G'),('Atlanta  Braves','Jose Ramirez (R)','11','0','N/G'),('Atlanta  Braves','Arodys Vizcaino (R)','17','0','N/G'),('Milwaukee Brewers','Jacob Barnes (R)','0','14','N/G'),('Milwaukee Brewers','Neftali Feliz (R)','12','15','N/G'),('Milwaukee Brewers','David Goforth (R)','0','0','N/G'),('Milwaukee Brewers','Jared Hughes (R)','0','0','N/G'),('Milwaukee Brewers','Corey Knebel (R)','10','17','N/G'),('Milwaukee Brewers','Jhan Marinez (R)','0','0','N/G'),('Milwaukee Brewers','Carlos Torres (R)','0','0','N/G'),('St. Louis Cardinals','Matt Bowman (R)','5','0','16'),('St. Louis Cardinals','Jonathan Broxton (R)','0','0','25'),('St. Louis Cardinals','Brett Cecil (L)','7','0','20'),('St. Louis Cardinals','Seung Hwan Oh (R)','12','16','0'),('St. Louis Cardinals','Trevor Rosenthal (R)','13','0','14'),('St. Louis Cardinals','Kevin Siegrist (L)','0','0','19'),('St. Louis Cardinals','Miguel Socolovich (R)','0','36','0'),('Chicago Cubs','Wade Davis (R)','0','N/G','12'),('Chicago Cubs','Carl Edwards Jr. (R)','0','N/G','11'),('Chicago Cubs','Justin Grimm (R)','8','N/G','9'),('Chicago Cubs','Mike Montgomery (L)','34','N/G','0'),('Chicago Cubs','Hector Rondon (R)','23','N/G','0'),('Chicago Cubs','Pedro Strop (R)','0','N/G','16'),('Chicago Cubs','Koji Uehara (R)','0','N/G','10'),('Arizona Diamondbacks','Archie Bradley (R)','20','0','0'),('Arizona Diamondbacks','Andrew Chafin (L)','6','0','12'),('Arizona Diamondbacks','Jorge De La Rosa (L)','0','22','0'),('Arizona Diamondbacks','Randall Delgado (R)','0','0','29'),('Arizona Diamondbacks','J.J. Hoover (R)','0','9','0'),('Arizona Diamondbacks','Fernando Rodney (R)','0','21','0'),('Arizona Diamondbacks','Tom Wilhelmsen (R)','31','0','0'),('Los Angeles Dodgers','Luis Avilan (L)','4','N/G','0'),('Los Angeles Dodgers','Grant Dayton (L)','0','N/G','17'),('Los Angeles Dodgers','Josh Fields (R)','0','N/G','15'),('Los Angeles Dodgers','Chris Hatcher (R)','0','N/G','0'),('Los Angeles Dodgers','Kenley Jansen (R)','10','N/G','7'),('Los Angeles Dodgers','Sergio Romo (R)','0','N/G','29'),('Los Angeles Dodgers','Ross Stripling (R)','34','N/G','13'),('San Francisco Giants','Ty Blach (L)','0','2','0'),('San Francisco Giants','Cory Gearrin (R)','13','0','0'),('San Francisco Giants','George Kontos (R)','19','0','0'),('San Francisco Giants','Derek Law (R)','16','0','0'),('San Francisco Giants','Mark Melancon (R)','0','0','15'),('San Francisco Giants','Neil Ramirez (R)','0','34','0'),('San Francisco Giants','Hunter Strickland (R)','8','12','0'),('Miami Marlins','Kyle Barraclough (R)','0','27','N/G'),('Miami Marlins','Dustin McGowan (R)','0','0','N/G'),('Miami Marlins','David Phelps (R)','0','22','N/G'),('Miami Marlins','A.J. Ramos (R)','13','12','N/G'),('Miami Marlins','Junichi Tazawa (R)','20','0','N/G'),('Miami Marlins','Jose Urena (R)','0','0','N/G'),('Miami Marlins','Nick Wittgren (R)','0','0','N/G'),('Miami Marlins','Brad Ziegler (R)','15','17','N/G'),('New York Mets','Jerry Blevins (L)','8','0','17'),('New York Mets','Josh Edgin (L)','0','19','0'),('New York Mets','Rafael Montero (R)','0','0','0'),('New York Mets','Addison Reed (R)','17','0','25'),('New York Mets','Hansel Robles (R)','16','17','3'),('New York Mets','Fernando Salas (R)','10','0','0'),('New York Mets','Paul Sewald (R)','0','21','0'),('New York Mets','Josh Smoker (L)','0','0','14'),('Washington Nationals','Matt Albers (R)','0','0','25'),('Washington Nationals','Joe Blanton (R)','6','14','0'),('Washington Nationals','Koda Glover (R)','10','0','11'),('Washington Nationals','Shawn Kelley (R)','18','0','17'),('Washington Nationals','Oliver Perez (L)','0','0','0'),('Washington Nationals','Enny Romero (L)','8','0','0'),('Washington Nationals','Sammy Solis (L)','10','0','0'),('Washington Nationals','Blake Treinen (R)','0','9','0'),('San Diego Padres','Ryan Buchter (L)','17','0','17'),('San Diego Padres','Miguel Diaz (R)','0','20','11'),('San Diego Padres','Jake Esch (R)','9','0','0'),('San Diego Padres','Brad Hand (L)','0','0','15'),('San Diego Padres','Brandon Maurer (R)','9','0','19'),('San Diego Padres','Craig Stammen (R)','0','17','0'),('San Diego Padres','Jose Torres (L)','21','0','11'),('Philadelphia Phillies','Joaquin Benoit (R)','22','0','0'),('Philadelphia Phillies','Luis Garcia (R)','8','0','0'),('Philadelphia Phillies','Jeanmar Gomez (R)','0','15','0'),('Philadelphia Phillies','Hector Neris (R)','16','0','0'),('Philadelphia Phillies','Pat Neshek (R)','11','0','0'),('Philadelphia Phillies','Edubray Ramos (R)','0','0','12'),('Philadelphia Phillies','Joely Rodriguez (L)','0','48','15'),('Pittsburgh Pirates','Antonio Bastardo (L)','29','0','39'),('Pittsburgh Pirates','Daniel Hudson (R)','31','0','0'),('Pittsburgh Pirates','Wade LeBlanc (L)','0','0','64'),('Pittsburgh Pirates','Juan Nicasio (R)','0','21','0'),('Pittsburgh Pirates','Felipe Rivero (L)','7','0','0'),('Pittsburgh Pirates','Tony Watson (L)','10','0','0'),('Pittsburgh Pirates','Trevor Williams (R)','0','37','0'),('Cincinnati Reds','Barrett Astin (R)','0','0','0'),('Cincinnati Reds','Tony Cingrani (L)','0','16','0'),('Cincinnati Reds','Raisel Iglesias (R)','0','19','0'),('Cincinnati Reds','Michael Lorenzen (R)','0','0','32'),('Cincinnati Reds','Wandy Peralta (L)','0','10','13'),('Cincinnati Reds','Cody Reed (L)','0','0','35'),('Cincinnati Reds','Robert Stephenson (R)','29','0','0'),('Cincinnati Reds','Drew Storen (R)','0','16','0'),('Cincinnati Reds','Blake Wood (R)','5','8','0'),('Colorado Rockies','Mike Dunn (L)','0','0','9'),('Colorado Rockies','Carlos Estevez (R)','0','0','24'),('Colorado Rockies','Greg Holland (R)','0','19','0'),('Colorado Rockies','Jordan Lyles (R)','21','0','0'),('Colorado Rockies','Jake McGee (L)','17','0','0'),('Colorado Rockies','Scott Oberg (R)','10','0','8'),('Colorado Rockies','Adam Ottavino (R)','0','14','0'),('Colorado Rockies','Chris Rusin (L)','0','0','0');
/*!40000 ALTER TABLE `usage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-14  8:00:50
