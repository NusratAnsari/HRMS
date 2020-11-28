-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mini
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EmployeeID` varchar(20) NOT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `Fname` varchar(20) DEFAULT NULL,
  `PositionID` varchar(20) DEFAULT NULL,
  `QualID` varchar(20) DEFAULT NULL,
  `DeptID` varchar(20) DEFAULT NULL,
  `Salary` varchar(20) DEFAULT NULL,
  `Commission` varchar(20) DEFAULT NULL,
  `HireDate` varchar(20) DEFAULT NULL,
  `BirthDate` varchar(20) DEFAULT NULL,
  `DependentID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `PositionID` (`PositionID`),
  KEY `QualID` (`QualID`),
  KEY `DeptID` (`DeptID`),
  KEY `DependentID` (`DependentID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`PositionID`) REFERENCES `position1` (`PositionID`) ON DELETE SET NULL,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`QualID`) REFERENCES `qualification` (`QualID`) ON DELETE SET NULL,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`DeptID`) REFERENCES `department` (`DeptID`) ON DELETE SET NULL,
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`DependentID`) REFERENCES `dependent` (`DependentID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('1234','Seinfeld','Jerry','101','201','401','15000','3000','23/01/2012','15/02/1975','501'),('1235','Scott','Ridley','102','202','402','20000','3000','15/05/2012','11/11/1980','502'),('1236','Spielberg','Steven','103','203','403','22000','2000','10/10/2013','05/05/1995','503'),('1237','Hidleston','Tom','104','204','404','30000','4500','04/12/2012','19/11/1974','504'),('1238','Sheen','Charlie','105','205','405','40000','3500','14/08/2014','14/05/1985','505');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-29 18:16:30
