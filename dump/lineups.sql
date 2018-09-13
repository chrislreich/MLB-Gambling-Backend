-- MySQL dump 10.13  Distrib 5.7.16, for osx10.11 (x86_64)
--
-- Host: localhost    Database: mlb_lineups
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
-- Table structure for table `historic_lineups`
--

DROP TABLE IF EXISTS `historic_lineups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historic_lineups` (
  `dateOf` date NOT NULL,
  `away` varchar(40) NOT NULL DEFAULT '',
  `away_pitcher` varchar(40) NOT NULL DEFAULT '',
  `away_lineup` text,
  `home` varchar(40) NOT NULL DEFAULT '',
  `home_pitcher` varchar(40) NOT NULL DEFAULT '',
  `home_lineup` text,
  `active_line_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historic_lineups`
--

LOCK TABLES `historic_lineups` WRITE;
/*!40000 ALTER TABLE `historic_lineups` DISABLE KEYS */;
INSERT INTO `historic_lineups` VALUES ('2017-04-10','Rays','Alex Cobb (R)','1. Corey Dickerson (L) DH,2. Kevin Kiermaier (L) CF,3. Evan Longoria (R) 3B,4. Brad Miller (L) 2B,5. Steven Souza Jr. (R) RF,6. Logan Morrison (L) 1B,7. Derek Norris (R) C,8. Mallex Smith (L) LF,9. Tim Beckham (R) SS','Yankees','Michael Pineda (R)','1. Brett Gardner (L) LF,2. Jacoby Ellsbury (L) CF,3. Matt Holliday (R) DH,4. Chris Carter (R) 1B,5. Starlin Castro (R) 2B,6. Chase Headley (S) 3B,7. Aaron Judge (R) RF,8. Austin Romine (R) C,9. Ronald Torreyes (R) SS',353388578),('2017-04-10','Red Sox','Chris Sale (L)','1. Dustin Pedroia (R) 2B,2. Andrew Benintendi (L) CF,3. Mookie Betts (R) RF,4. Mitch Moreland (L) 1B,5. Pablo Sandoval (S) DH,6. Chris Young (R) LF,7. Brock Holt (L) 3B,8. Sandy Leon (S) C,9. Marco Hernandez (L) SS','Tigers','Justin Verlander (R)','1. Ian Kinsler (R) 2B,2. Nicholas Castellanos (R) 3B,3. Miguel Cabrera (R) 1B,4. Victor Martinez (S) DH,5. Mikie Mahtook (R) RF,6. James McCann (R) C,7. Jose Iglesias (R) SS,8. JaCoby Jones (R) CF,9. Andrew Romine (S) LF',353388575),('2017-04-10','Athletics','Jharel Cotton (R)','1. Marcus Semien (R) SS,2. Matt Joyce (L) RF,3. Ryon Healy (R) DH,4. Khris Davis (R) LF,5. Stephen Vogt (L) C,6. Jed Lowrie (S) 2B,7. Yonder Alonso (L) 1B,8. Trevor Plouffe (R) 3B,9. Rajai Davis (R) CF','Royals','Ian Kennedy (R)','1. Alex Gordon (L) LF,2. Mike Moustakas (L) 3B,3. Lorenzo Cain (R) CF,4. Eric Hosmer (L) 1B,5. Salvador Perez (R) C,6. Brandon Moss (L) DH,7. Paulo Orlando (R) RF,8. Alcides Escobar (R) SS,9. Raul Mondesi (S) 2B',353388576),('2017-04-10','Diamondbacks','Taijuan Walker (R)','1. A.J. Pollock (R) CF,2. Chris Owings (R) SS,3. Paul Goldschmidt (R) 1B,4. Jake Lamb (L) 3B,5. Yasmany Tomas (R) LF,6. Brandon Drury (R) 2B,7. David Peralta (L) RF,8. Jeff Mathis (R) C,9. Taijuan Walker (R) P','Giants','Matt Moore (L)','1. Denard Span (L) CF,2. Brandon Belt (L) 1B,3. Hunter Pence (R) RF,4. Buster Posey (R) C,5. Brandon Crawford (L) SS,6. Eduardo Nunez (R) 3B,7. Joe Panik (L) 2B,8. Jarrett Parker (L) LF,9. Matt Moore (L) P',353388569),('2017-04-10','Astros','Charlie Morton (R)','','Mariners','James Paxton (L)','1. Jean Segura (R) SS,2. Mitch Haniger (R) RF,3. Robinson Cano (L) 2B,4. Nelson Cruz (R) DH,5. Kyle Seager (L) 3B,6. Danny Valencia (R) 1B,7. Leonys Martin (L) CF,8. Mike Zunino (R) C,9. Jarrod Dyson (L) LF',353388577),('2017-04-10','Reds','Brandon Finnegan (L)','','Pirates','Tyler Glasnow (R)','',353388572),('2017-04-10','Mets','Jacob deGrom (R)','','Phillies','Jerad Eickhoff (R)','',353388570),('2017-04-10','Cardinals','Adam Wainwright (R)','','Nationals','Tanner Roark (R)','',353388571),('2017-04-10','Dodgers','Alex Wood (L)','','Cubs','Jon Lester (L)','',353388573),('2017-04-10','Padres','Jarred Cosart (R)','','Rockies','Tyler Chatwood (R)','',353388574),('2017-04-11','Twins','Hector Santiago (L)','1. Brian Dozier (R) 2B^2. Robbie Grossman (S) DH^3. Jorge Polanco (S) SS^4. Miguel Sano (R) 3B^5. Jason Castro (L) C^6. Chris Gimenez (R) 1B^7. Eddie Rosario (L) LF^8. Byron Buxton (R) CF^9. Danny Santana (S) RF','Tigers','Matthew Boyd (L)','1. Ian Kinsler (R) 2B^2. Nicholas Castellanos (R) 3B^3. Miguel Cabrera (R) 1B^4. Victor Martinez (S) DH^5. Justin Upton (R) LF^6. Mikie Mahtook (R) RF^7. James McCann (R) C^8. JaCoby Jones (R) CF^9. Dixon Machado (R) SS',353480686),('2017-04-11','White Sox','James Shields (R)','1. Tyler Saladino (R) 2B^2. Tim Anderson (R) SS^3. Melky Cabrera (S) LF^4. Jose Abreu (R) 1B^5. Todd Frazier (R) 3B^6. Cody Asche (L) DH^7. Avisail Garcia (R) RF^8. Geovany Soto (R) C^9. Jacob May (S) CF','Indians','Carlos Carrasco (R)','1. Carlos Santana (S) DH^2. Francisco Lindor (S) SS^3. Michael Brantley (L) LF^4. Edwin Encarnacion (R) 1B^5. Jose Ramirez (S) 2B^6. Yandy Diaz (R) 3B^7. Tyler Naquin (L) CF^8. Yan Gomes (R) C^9. Abraham Almonte (S) RF',353480687),('2017-04-11','Reds','Rookie Davis (R)','1. Billy Hamilton (S) CF^2. Jose Peraza (R) SS^3. Joey Votto (L) 1B^4. Adam Duvall (R) LF^5. Eugenio Suarez (R) 3B^6. Scott Schebler (L) RF^7. Scooter Gennett (L) 2B^8. Tucker Barnhart (S) C^9. Rookie Davis (R) P','Pirates','Jameson Taillon (R)','1. Starling Marte (R) CF^2. Josh Bell (S) 1B^3. Andrew McCutchen (R) RF^4. Gregory Polanco (L) LF^5. David Freese (R) 3B^6. Francisco Cervelli (R) C^7. Josh Harrison (R) 2B^8. Jordy Mercer (R) SS^9. Jameson Taillon (R) P',353480683),('2017-04-11','Mets','Matt Harvey (R)','1. Curtis Granderson (L) CF^2. Asdrubal Cabrera (S) SS^3. Yoenis Cespedes (R) LF^4. Jay Bruce (L) RF^5. Neil Walker (S) 2B^6. Lucas Duda (L) 1B^7. Jose Reyes (S) 3B^8. Travis d\'Arnaud (R) C^9. Matt Harvey (R) P','Phillies','Clay Buchholz (R)','1. Cesar Hernandez (S) 2B^2. Howie Kendrick (R) LF^3. Odubel Herrera (L) CF^4. Maikel Franco (R) 3B^5. Michael Saunders (L) RF^6. Tommy Joseph (R) 1B^7. Cameron Rupp (R) C^8. Freddy Galvis (S) SS^9. Clay Buchholz (L) P',353480682),('2017-04-11','Cardinals','Lance Lynn (R)','1. Dexter Fowler (S) CF^2. Aledmys Diaz (R) SS^3. Yadier Molina (R) C^4. Stephen Piscotty (R) RF^5. Jedd Gyorko (R) 2B^6. Jhonny Peralta (R) 3B^7. Randal Grichuk (R) LF^8. Jose Martinez (R) 1B^9. Lance Lynn (R) P','Nationals','Gio Gonzalez (L)','1. Adam Eaton (L) CF^2. Wilmer Difo (S) SS^3. Bryce Harper (L) RF^4. Daniel Murphy (L) 2B^5. Ryan Zimmerman (R) 1B^6. Jayson Werth (R) LF^7. Stephen Drew (L) 3B^8. Matt Wieters (S) C^9. Gio Gonzalez (R) P',353480681),('2017-04-11','Brewers','Wily Peralta (R)','1. Jonathan Villar (S) 2B^2. Keon Broxton (R) CF^3. Ryan Braun (R) LF^4. Travis Shaw (L) DH^5. Domingo Santana (R) RF^6. Jesus Aguilar (R) 1B^7. Hernan Perez (R) 3B^8. Manny Pina (R) C^9. Orlando Arcia (R) SS','Blue Jays','J.A. Happ (L)','1. Devon Travis (R) 2B^2. Jose Bautista (R) RF^3. Kendrys Morales (S) DH^4. Troy Tulowitzki (R) SS^5. Russell Martin (R) C^6. Justin Smoak (S) 1B^7. Steve Pearce (R) LF^8. Kevin Pillar (R) CF^9. Ryan Goins (L) 3B',353480691),('2017-04-11','Braves','Bartolo Colon (R)','1. Ender Inciarte (L) CF^2. Dansby Swanson (R) SS^3. Freddie Freeman (L) 1B^4. Nick Markakis (L) RF^5. Adonis Garcia (R) 3B^6. Brandon Phillips (R) 2B^7. Tyler Flowers (R) C^8. Emilio Bonifacio (S) LF^9. Bartolo Colon (R) P','Marlins','Dan Straily (R)','1. Dee Gordon (L) 2B^2. J.T. Realmuto (R) C^3. Christian Yelich (L) CF^4. Giancarlo Stanton (R) RF^5. Justin Bour (L) 1B^6. Marcell Ozuna (R) LF^7. Derek Dietrich (L) 3B^8. J.T. Riddle (L) SS^9. Dan Straily (R) P',353480680),('2017-04-11','Orioles','Dylan Bundy (R)','1. Craig Gentry (R) RF^2. Adam Jones (R) CF^3. Manny Machado (R) 3B^4. Mark Trumbo (R) DH^5. Chris Davis (L) 1B^6. Welington Castillo (R) C^7. Trey Mancini (R) LF^8. Jonathan Schoop (R) 2B^9. J.J. Hardy (R) SS','Red Sox','Drew Pomeranz (L)','1. Dustin Pedroia (R) 2B^2. Andrew Benintendi (L) CF^3. Mookie Betts (R) RF^4. Hanley Ramirez (R) DH^5. Mitch Moreland (L) 1B^6. Xander Bogaerts (R) SS^7. Pablo Sandoval (S) 3B^8. Chris Young (R) LF^9. Christian Vazquez (R) C',353480688),('2017-04-11','Padres','Jered Weaver (R)','','Rockies','Antonio Senzatela (R)','',353480684),('2017-04-11','Rangers','Cole Hamels (L)','','Angels','Tyler Skaggs (L)','',353480689),('2017-04-11','Astros','Joe Musgrove (R)','','Mariners','Ariel Miranda (L)','',353480690),('2017-04-11','Diamondbacks','Robbie Ray (L)','','Giants','Jeff Samardzija (R)','',353480685);
/*!40000 ALTER TABLE `historic_lineups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineups_today`
--

DROP TABLE IF EXISTS `lineups_today`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineups_today` (
  `dateOf` date NOT NULL,
  `away` varchar(40) NOT NULL DEFAULT '',
  `away_pitcher` varchar(40) NOT NULL DEFAULT '',
  `away_lineup` text,
  `home` varchar(40) NOT NULL DEFAULT '',
  `home_pitcher` varchar(40) NOT NULL DEFAULT '',
  `home_lineup` text,
  `active_line_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineups_today`
--

LOCK TABLES `lineups_today` WRITE;
/*!40000 ALTER TABLE `lineups_today` DISABLE KEYS */;
INSERT INTO `lineups_today` VALUES ('2017-04-13','Twins','Phil Hughes (R)','1. Brian Dozier (R) 2B^2. Robbie Grossman (S) DH^3. Joe Mauer (L) 1B^4. Miguel Sano (R) 3B^5. Max Kepler (L) RF^6. Jorge Polanco (S) SS^7. Chris Gimenez (R) C^8. Eddie Rosario (L) LF^9. Byron Buxton (R) CF','Tigers','Jordan Zimmermann (R)','1. Andrew Romine (S) 2B^2. Nicholas Castellanos (R) 3B^3. Miguel Cabrera (R) 1B^4. Victor Martinez (S) DH^5. Justin Upton (R) LF^6. Tyler Collins (L) RF^7. James McCann (R) C^8. JaCoby Jones (R) CF^9. Jose Iglesias (R) SS',353641535),('2017-04-13','Pirates','Chad Kuhl (R)','1. Jordy Mercer (R) SS^2. Starling Marte (R) CF^3. Andrew McCutchen (R) RF^4. Gregory Polanco (L) LF^5. David Freese (R) DH^6. Josh Harrison (R) 3B^7. Josh Bell (S) 1B^8. Phil Gosselin (R) 2B^9. Chris Stewart (R) C','Red Sox','Eduardo Rodriguez (L)','1. Dustin Pedroia (R) 2B^2. Andrew Benintendi (L) CF^3. Mookie Betts (R) RF^4. Hanley Ramirez (R) DH^5. Mitch Moreland (L) 1B^6. Xander Bogaerts (R) SS^7. Marco Hernandez (L) 3B^8. Christian Vazquez (R) C^9. Brock Holt (L) LF',353641540),('2017-04-13','Dodgers','Hyun-Jin Ryu (L)','1. Logan Forsythe (R) 2B^2. Corey Seager (L) SS^3. Justin Turner (R) 3B^4. Yasiel Puig (R) RF^5. Scott Van Slyke (R) 1B^6. Yasmani Grandal (S) C^7. Trayce Thompson (R) CF^8. Enrique Hernandez (R) LF^9. Hyun-Jin Ryu (R) P','Cubs','Brett Anderson (L)','1. Kyle Schwarber (L) LF^2. Kris Bryant (R) 3B^3. Anthony Rizzo (L) 1B^4. Addison Russell (R) SS^5. Willson Contreras (R) C^6. Albert Almora Jr. (R) CF^7. Jason Heyward (L) RF^8. Javier Baez (R) 2B^9. Brett Anderson (L) P',353641531),('2017-04-13','Rangers','Yu Darvish (R)','','Angels','Ricky Nolasco (R)','',353641536),('2017-04-13','White Sox','Miguel Gonzalez (R)','','Indians','Josh Tomlin (R)','',353641534),('2017-04-13','Rays','Matt Andriese (R)','','Yankees','Luis Severino (R)','',353641537),('2017-04-13','Orioles','Kevin Gausman (R)','','Blue Jays','Francisco Liriano (L)','',353641538),('2017-04-13','Brewers','Jimmy Nelson (R)','','Reds','Bronson Arroyo (R)','',353641532),('2017-04-13','Mets','Robert Gsellman (R)','','Marlins','Wei-Yin Chen (L)','',353641530),('2017-04-13','Athletics','Jesse Hahn (R)','','Royals','Jason Vargas (L)','',353641539),('2017-04-13','Rockies','Jon Gray (R)','','Giants','Madison Bumgarner (L)','',353641533);
/*!40000 ALTER TABLE `lineups_today` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineups_today_load`
--

DROP TABLE IF EXISTS `lineups_today_load`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lineups_today_load` (
  `dateOf` date NOT NULL,
  `away` varchar(40) NOT NULL DEFAULT '',
  `away_pitcher` varchar(40) NOT NULL DEFAULT '',
  `away_lineup` text,
  `home` varchar(40) NOT NULL DEFAULT '',
  `home_pitcher` varchar(40) NOT NULL DEFAULT '',
  `home_lineup` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineups_today_load`
--

LOCK TABLES `lineups_today_load` WRITE;
/*!40000 ALTER TABLE `lineups_today_load` DISABLE KEYS */;
INSERT INTO `lineups_today_load` VALUES ('2017-04-13','Twins','Phil Hughes (R)','1. Brian Dozier (R) 2B^2. Robbie Grossman (S) DH^3. Joe Mauer (L) 1B^4. Miguel Sano (R) 3B^5. Max Kepler (L) RF^6. Jorge Polanco (S) SS^7. Chris Gimenez (R) C^8. Eddie Rosario (L) LF^9. Byron Buxton (R) CF','Tigers','Jordan Zimmermann (R)','1. Andrew Romine (S) 2B^2. Nicholas Castellanos (R) 3B^3. Miguel Cabrera (R) 1B^4. Victor Martinez (S) DH^5. Justin Upton (R) LF^6. Tyler Collins (L) RF^7. James McCann (R) C^8. JaCoby Jones (R) CF^9. Jose Iglesias (R) SS'),('2017-04-13','Pirates','Chad Kuhl (R)','1. Jordy Mercer (R) SS^2. Starling Marte (R) CF^3. Andrew McCutchen (R) RF^4. Gregory Polanco (L) LF^5. David Freese (R) DH^6. Josh Harrison (R) 3B^7. Josh Bell (S) 1B^8. Phil Gosselin (R) 2B^9. Chris Stewart (R) C','Red Sox','Eduardo Rodriguez (L)','1. Dustin Pedroia (R) 2B^2. Andrew Benintendi (L) CF^3. Mookie Betts (R) RF^4. Hanley Ramirez (R) DH^5. Mitch Moreland (L) 1B^6. Xander Bogaerts (R) SS^7. Marco Hernandez (L) 3B^8. Christian Vazquez (R) C^9. Brock Holt (L) LF'),('2017-04-13','Dodgers','Hyun-Jin Ryu (L)','1. Logan Forsythe (R) 2B^2. Corey Seager (L) SS^3. Justin Turner (R) 3B^4. Yasiel Puig (R) RF^5. Scott Van Slyke (R) 1B^6. Yasmani Grandal (S) C^7. Trayce Thompson (R) CF^8. Enrique Hernandez (R) LF^9. Hyun-Jin Ryu (R) P','Cubs','Brett Anderson (L)','1. Kyle Schwarber (L) LF^2. Kris Bryant (R) 3B^3. Anthony Rizzo (L) 1B^4. Addison Russell (R) SS^5. Willson Contreras (R) C^6. Albert Almora Jr. (R) CF^7. Jason Heyward (L) RF^8. Javier Baez (R) 2B^9. Brett Anderson (L) P'),('2017-04-13','Rangers','Yu Darvish (R)','','Angels','Ricky Nolasco (R)',''),('2017-04-13','White Sox','Miguel Gonzalez (R)','','Indians','Josh Tomlin (R)',''),('2017-04-13','Rays','Matt Andriese (R)','','Yankees','Luis Severino (R)',''),('2017-04-13','Orioles','Kevin Gausman (R)','','Blue Jays','Francisco Liriano (L)',''),('2017-04-13','Brewers','Jimmy Nelson (R)','','Reds','Bronson Arroyo (R)',''),('2017-04-13','Mets','Robert Gsellman (R)','','Marlins','Wei-Yin Chen (L)',''),('2017-04-13','Athletics','Jesse Hahn (R)','','Royals','Jason Vargas (L)',''),('2017-04-13','Rockies','Jon Gray (R)','','Giants','Madison Bumgarner (L)','');
/*!40000 ALTER TABLE `lineups_today_load` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-14  8:00:36
