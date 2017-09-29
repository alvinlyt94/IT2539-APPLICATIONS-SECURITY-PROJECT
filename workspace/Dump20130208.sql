CREATE DATABASE  IF NOT EXISTS `mwn` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mwn`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: mwn
-- ------------------------------------------------------
-- Server version	5.5.25

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `accountID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `passWord` varchar(45) NOT NULL,
  `emailAddress` varchar(45) NOT NULL,
  `phoneNumber` varchar(45) NOT NULL,
  `accountType` varchar(45) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `securityQns` varchar(80) NOT NULL,
  `securityAns` varchar(45) NOT NULL,
  `verified` varchar(45) NOT NULL,
  `pinNumber` varchar(45) DEFAULT NULL,
  `saltStringP` varchar(100) DEFAULT NULL,
  `saltStringA` varchar(100) DEFAULT NULL,
  `saltStringPN` varchar(100) DEFAULT NULL,
  `AdsVisible` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`accountID`),
  UNIQUE KEY `userName_UNIQUE` (`userName`),
  UNIQUE KEY `emailAddress_UNIQUE` (`emailAddress`),
  UNIQUE KEY `phoneNumber_UNIQUE` (`phoneNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'terence','8d37be409c5d4025312c64314bb948bde33c25ad','alvinlyt942@hotmail.com','83664411','Free Account User','fegr','ggrgr','This is my question?','fd269d4eeb6ebe79727c17a028149e9c563addba','Verified',NULL,'236a017f35f7de8c003614f443839295963618e9','42afb18f76b97d34a43578fd9d5b2d99f05f25aa',NULL,'Enabled'),(2,'siewmai','768ac85537401a45a91697d0a313d0bda5cbd75f','alvinlyt94432@hotmail.com','83664412','Free Account User','firstname','lastname','Qestion?','2311d8281d256231bea007719e2d3446cdfc7fa2','Verified',NULL,'81251d11f1cdbfea518dc40af7b688ea699ebcd8','54914e4fb117923a11ba8edb16f3228342301852',NULL,'Enabled'),(3,'username','86015a33169e0692f2e1268961a7d543283f2d0d','username@hotmail.com','83664410','Premium User','I am','Username','What is my question?','03df96cbed86c89bc4879192dd4c2b6cbf4ec510','Verified','7aa9c2f2d6d22a67c7a8edf2c464f5ae619696c9','439cb18ca7c55188f8de07260fb450240a62a396','4bb916eb89846a2afaf59b01c25d1cfb86cc6997','6c4014564803e3338fb09329c30063dc02202c0e','Enabled'),(99,'admin','e6f017c6f62732d9ae0acfde6f4897765dfd2190','mwn_nanyang@hotmail.com','93294294','Admin User','MWN','Admin','What is my role?','353ecfa025fccc1f5a3b45ebdbd1cc05104fde89','Verified',NULL,'4a78e1d8f562c90015f2b15f678fb0bf8a19f068','d4c6b8df0dd755d39edbe6bf22c747d11f03cc04',NULL,'Enabled'),(100,'mrlawrence','53bbf73d13262b3f5f7022e3345c4a02a6c1bfbf','alvinlyt94@hotmail.com','83664422','Free Account User','first2','last2','Who am I?','2aa590290147eb3095da670e10cec675a2c63443','Verified','f9db7a96605337a3840bba77e74efc8c3c89e54d','c5574a7792e8fb1f81a4378418f0c53b8bb2393e','19da1bbd69c0c439648d4d5f0722f19433bcf1b1','1881d38b5de81f04fde234fe50912a2c3b08bc9a','Enabled');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement` (
  `idadvertisement` int(11) NOT NULL AUTO_INCREMENT,
  `miloCounter` int(11) DEFAULT NULL,
  `nikeCounter` int(11) DEFAULT NULL,
  `adidasCounter` int(11) DEFAULT NULL,
  `gatoradeCounter` int(11) DEFAULT NULL,
  `nbCounter` int(11) DEFAULT NULL,
  PRIMARY KEY (`idadvertisement`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
INSERT INTO `advertisement` VALUES (1,53,52,4,6,2);
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bmi`
--

DROP TABLE IF EXISTS `bmi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bmi` (
  `bmiID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `bmi` double NOT NULL,
  `healthStatus` varchar(45) NOT NULL,
  `height` double NOT NULL,
  `weight` double NOT NULL,
  `timeStamp` datetime NOT NULL,
  `optimalWeight` varchar(50) NOT NULL,
  PRIMARY KEY (`bmiID`),
  KEY `username_idx` (`username`),
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `account` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bmi`
--

LOCK TABLES `bmi` WRITE;
/*!40000 ALTER TABLE `bmi` DISABLE KEYS */;
INSERT INTO `bmi` VALUES (48,'admin',30.959,'Severely Overweight',170.5,90,'2013-02-04 10:21:30','53.78 - 72.676'),(51,'admin',25.8,'Overweight',170.5,75,'2013-02-04 10:21:58','53.78 - 72.676'),(52,'admin',25.972,'Overweight',170.5,75.5,'2013-02-04 10:22:08','53.78 - 72.676'),(53,'admin',27.76,'Overweight',170.5,80.7,'2013-02-04 10:22:21','53.78 - 72.676'),(54,'admin',22.36,'Normal',170.5,65,'2013-02-04 10:22:30','53.78 - 72.676'),(55,'admin',24.08,'Normal',170.5,70,'2013-02-04 10:22:37','53.78 - 72.676'),(56,'admin',21.672,'Normal',170.5,63,'2013-02-04 10:22:45','53.78 - 72.676'),(57,'admin',25.456,'Overweight',170.5,74,'2013-02-04 10:23:06','53.78 - 72.676'),(58,'admin',26.298,'Overweight',170,76,'2013-02-04 10:27:22','53.465 - 72.25'),(59,'admin',23.183,'Normal',170,67,'2013-02-04 10:41:35','53.465 - 72.25'),(60,'admin',23.529,'Normal',170,68,'2013-02-04 10:41:40','53.465 - 72.25'),(61,'admin',23.529,'Normal',170,68,'2013-02-04 10:41:55','53.465 - 72.25'),(62,'admin',17.5,'Underweight',200,70,'2013-02-04 11:04:55','74 - 100');
/*!40000 ALTER TABLE `bmi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fromto`
--

DROP TABLE IF EXISTS `fromto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fromto` (
  `idFromTo` int(11) NOT NULL,
  `fromToList` varchar(45) NOT NULL,
  `fromWhere` varchar(45) NOT NULL,
  `LoginFailedCounter` int(11) DEFAULT NULL,
  `NeedToWait` varchar(45) DEFAULT NULL,
  `feedbackID` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFromTo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fromto`
--

LOCK TABLES `fromto` WRITE;
/*!40000 ALTER TABLE `fromto` DISABLE KEYS */;
INSERT INTO `fromto` VALUES (1,'NotShow','EditProfile',0,'false',17);
/*!40000 ALTER TABLE `fromto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `mailID` int(11) NOT NULL AUTO_INCREMENT,
  `MessageTo` varchar(45) NOT NULL,
  `MessageFrom` varchar(45) NOT NULL,
  `MessageSubject` varchar(50) NOT NULL,
  `Message` varchar(255) NOT NULL,
  `TimeStamp` datetime NOT NULL,
  PRIMARY KEY (`mailID`),
  KEY `to_idx` (`MessageTo`),
  KEY `from_idx` (`MessageFrom`),
  CONSTRAINT `from` FOREIGN KEY (`MessageFrom`) REFERENCES `account` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `to` FOREIGN KEY (`MessageTo`) REFERENCES `account` (`userName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (6,'admin','username','afasdasd','asdasfsafassd','2013-02-04 10:45:52'),(7,'admin','username','sfasf','asdasf','2013-02-04 10:46:14'),(8,'admin','username','asdsadsadsa','sdasadsadasddsa','2013-02-04 10:46:20'),(9,'admin','username','adssda','sadsadsadsad','2013-02-04 10:46:27'),(10,'admin','username','asdsdasda','ssadsadsdasda','2013-02-04 10:46:33'),(11,'admin','username','asdsdasda','sadsadsadsdasadsdasad','2013-02-04 10:46:49'),(12,'admin','username','asdsdsda','sadsdaadsadsad','2013-02-04 10:46:55'),(13,'admin','username','asdsda','asdsdadsadsasad','2013-02-04 10:47:06'),(14,'admin','username','asddsa','asdsadadsad','2013-02-04 10:47:12'),(15,'admin','username','asdsadasdsad','sadsadssad','2013-02-04 10:47:25'),(16,'admin','username','asfagsd','dsadsad','2013-02-04 10:47:31'),(19,'admin','username','asdasd','asdasd','2013-02-04 11:57:38'),(20,'admin','username','i have found a bug','found a bug','2013-02-04 16:34:19'),(21,'username','admin','known','sdasd','2013-02-04 16:35:40');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-02-08  0:37:25
