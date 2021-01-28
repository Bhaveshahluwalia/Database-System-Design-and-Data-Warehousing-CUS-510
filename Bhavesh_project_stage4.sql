-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `amount` decimal(10,2) NOT NULL,
  `donation_date` date NOT NULL,
  `project_id` char(5) DEFAULT NULL,
  `donor_id` char(6) DEFAULT NULL,
  KEY `project_id` (`project_id`),
  KEY `donor_id` (`donor_id`),
  CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`donor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES (15000.00,'2020-01-02','11111','123456'),(2000.00,'2020-02-02','22222','234567'),(5257.00,'2020-03-03','33333','345678'),(10000.00,'2020-03-04','44444','456789'),(20000.00,'2020-01-05','55555','567891'),(20000.00,'2020-05-06','66666','678901');
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `donor_id` char(6) NOT NULL,
  `company` varchar(45) NOT NULL,
  `donor_phone` char(12) NOT NULL,
  `donor_fname` varchar(45) NOT NULL,
  `donor_lname` varchar(45) NOT NULL,
  PRIMARY KEY (`donor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES ('123456','apple','987-123-1234','Tommy','Heller'),('234567','microsoft','987-987-9876','Aniie','Mathew'),('345678','johnsons','123-234-5555','Peter','Helter'),('456789','keyfood','718-351-3344','Hielle','Arifi'),('567891','google','516-888-3377','Milli','Mark'),('678901','samsung','516-666-7777','Marry','Messi');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location` varchar(45) NOT NULL,
  `project_id` char(5) NOT NULL,
  PRIMARY KEY (`location`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('MANHATTAN,NY','11111'),('QUEENS,NY','11111'),('UNION,NJ ','22222'),('HILLSIDE,OH','33333'),('WOODSIDE,KY','44444'),('SPRING,TX','55555'),('BELL,NC','66666');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` char(5) NOT NULL,
  `project_name` varchar(25) NOT NULL,
  `description` varchar(128) NOT NULL,
  `project_supervisor_ssn` char(11) DEFAULT NULL,
  `project_volunteer_id` char(7) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `project_supervisor_ssn` (`project_supervisor_ssn`),
  KEY `project_volunteer_id` (`project_volunteer_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`project_supervisor_ssn`) REFERENCES `volunteer` (`ssn`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`project_volunteer_id`) REFERENCES `volunteer` (`volunteer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('11111','smile event','this is the event for all who want to be happy in this world.','111-11-1111','777-777'),('22222','childcare event','join us for saving child, we want you to help us. ','222-22-2222','888-888'),('33333','adultcare event','join us to help people who are older and help them with love','333-33-3333','999-999'),('44444','wellness event','join this event for the wellness of life ','444-44-4444','101-010'),('55555','fundraising event','join this even if you really have good idea to raise money','555-55-5555','121-121'),('66666','special event','join this event for the festival, religious and other event.','666-66-6666','131-131');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `slot_id` char(3) NOT NULL,
  `ssn` char(11) NOT NULL,
  PRIMARY KEY (`slot_id`,`ssn`),
  KEY `ssn` (`ssn`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`slot_id`) REFERENCES `timeslot` (`slot_id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`ssn`) REFERENCES `volunteer` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES ('104','101-01-0101'),('104','121-21-2121'),('105','131-31-3131'),('105','141-41-4141'),('101','777-77-7777'),('102','888-88-8888'),('103','999-99-9999');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup`
--

DROP TABLE IF EXISTS `signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signup` (
  `ssn` char(11) NOT NULL,
  `project_id` char(5) NOT NULL,
  PRIMARY KEY (`ssn`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `signup_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `volunteer` (`ssn`),
  CONSTRAINT `signup_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup`
--

LOCK TABLES `signup` WRITE;
/*!40000 ALTER TABLE `signup` DISABLE KEYS */;
INSERT INTO `signup` VALUES ('777-77-7777','11111'),('888-88-8888','22222'),('999-99-9999','33333'),('101-01-0101','44444'),('121-21-2121','44444'),('131-31-3131','55555'),('141-41-4141','55555'),('151-51-5151','66666'),('161-61-6161','66666');
/*!40000 ALTER TABLE `signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeslot`
--

DROP TABLE IF EXISTS `timeslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeslot` (
  `slot_id` char(3) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `finish_time` time NOT NULL,
  `project_id` char(5) DEFAULT NULL,
  PRIMARY KEY (`slot_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `timeslot_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeslot`
--

LOCK TABLES `timeslot` WRITE;
/*!40000 ALTER TABLE `timeslot` DISABLE KEYS */;
INSERT INTO `timeslot` VALUES ('101','2021-01-02','05:00:00','07:00:00','11111'),('102','2021-02-03','01:00:00','03:00:00','22222'),('103','2021-03-04','02:00:00','07:00:00','33333'),('104','2021-04-05','03:00:00','04:00:00','44444'),('105','2021-05-06','07:00:00','10:00:00','55555');
/*!40000 ALTER TABLE `timeslot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `ssn` char(11) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `street` varchar(75) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` char(2) NOT NULL,
  `phone` char(12) NOT NULL,
  `project_preference` varchar(25) NOT NULL,
  `volunteer_id` char(7) NOT NULL,
  `date_accepted` date NOT NULL,
  `worked_hours` float NOT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `volunteer_id` (`volunteer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES ('101-01-0101','Ravi','Hoo','Punjab avenue','Plaza','PH','101-234-5678','wellness event','101-010','2016-09-05',25.2),('111-11-1111','Smith','Tom','111 drive','Albert','AH','123-456-7890','childcare event','111-111','2016-01-02',5.4),('121-21-2121','Monta','Kri','Liberty ave','Fresh','NY','111-234-5678','smile event','121-121','2013-01-05',35.1),('131-31-3131','Pinta','Star','Freedom ave','Maddow','NY','121-234-5678','adultcare event','131-131','2014-01-05',25.2),('141-41-4141','Jerry','Kosh','Respect street','Spring','NY','131-245-6789','adultcare event','141-141','2015-03-06',15.3),('151-51-5151','Tony','Janny','Health ave','Fills','NJ','141-234-5678','smile event','151-151','2016-03-06',15.5),('161-61-6161','Berry','Jane','Citi bazaar','Zibra','NJ','151-234-5678','adultcare event','161-161','2016-01-07',11.4),('222-22-2222','Chin','Ann','2 king street','Holland','OH','234-567-8901','fundraising event','222-222','2018-02-02',15.4),('333-33-3333','Lee','Perry','History blvd','king','NY','345-678-9012','wellness event','333-333','2019-03-03',10.3),('444-44-4444','Burns','Edward','Art ave','Queen','NJ','456-789-0123','adultcare event','444-444','2011-04-02',13.2),('555-55-5555','McCarthy','Owen','Matthew ave','Fin','CT','567-890-1234','wellness event','555-555','2011-04-02',12.1),('666-66-6666','Jones','Mary','Marthan ave','Oculus','TX','678-901-2345','special event','666-666','2011-05-04',25.4),('777-77-7777','Rivera','Jane','wish street','Ginny','GO','789-012-3456','wellness event','777-777','2011-06-04',35.4),('888-88-8888','Dave','Rostava','Luck street','Holland','NC','890-123-4567','wellness event','888-888','2012-07-04',25.4),('999-99-9999','Krish','Goldberg','Pine street','Picnic','SC','901-234-5678','wellness event','999-999','2012-08-05',25.1);
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer_position`
--

DROP TABLE IF EXISTS `volunteer_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer_position` (
  `volunteer_position` varchar(45) NOT NULL,
  `ssn` char(11) NOT NULL,
  PRIMARY KEY (`volunteer_position`,`ssn`),
  KEY `ssn` (`ssn`),
  CONSTRAINT `volunteer_position_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `volunteer` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer_position`
--

LOCK TABLES `volunteer_position` WRITE;
/*!40000 ALTER TABLE `volunteer_position` DISABLE KEYS */;
INSERT INTO `volunteer_position` VALUES ('dog keeper','101-01-0101'),('pantry supervisor','111-11-1111'),('car valet keeper','121-21-2121'),('organiser planner','131-31-3131'),('advertisement maker','141-41-4141'),('yoga guider','151-51-5151'),('webmaster helper','161-61-6161'),('webmaster','222-22-2222'),('chair of the annual fundraiser','333-33-3333'),('supervisor helper','444-44-4444'),('fundraiser cleanup','555-55-5555'),('phone bank','666-66-6666'),('fundraiser helper','777-77-7777'),('helper','888-88-8888'),('chef','999-99-9999');
/*!40000 ALTER TABLE `volunteer_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project'
--

--
-- Dumping routines for database 'project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-01 11:41:41
