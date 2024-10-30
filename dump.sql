-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: practice_project_530
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `practice_project_530`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `practice_project_530` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `practice_project_530`;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_no` int NOT NULL,
  `course_name` varchar(100) DEFAULT NULL,
  `dept` char(4) DEFAULT NULL,
  PRIMARY KEY (`course_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (364,'database systems','INFO'),(530,'systems development','INFO'),(610,'analysis and design of database systems','INFO'),(630,'big data analytics with cloud technologies','INFO');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_section`
--

DROP TABLE IF EXISTS `course_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_section` (
  `section_no` int NOT NULL,
  `course_no` int NOT NULL,
  `time_of_day` time DEFAULT NULL,
  `m` tinyint(1) DEFAULT NULL,
  `t` tinyint(1) DEFAULT NULL,
  `w` tinyint(1) DEFAULT NULL,
  `tr` tinyint(1) DEFAULT NULL,
  `f` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`section_no`,`course_no`),
  KEY `course_no` (`course_no`),
  CONSTRAINT `course_section_ibfk_1` FOREIGN KEY (`course_no`) REFERENCES `course` (`course_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_section`
--

LOCK TABLES `course_section` WRITE;
/*!40000 ALTER TABLE `course_section` DISABLE KEYS */;
INSERT INTO `course_section` VALUES (1,530,'17:30:00',1,0,1,0,0),(1,610,'19:00:00',0,1,0,0,0),(2,630,'11:00:00',0,1,0,1,0),(9,364,'16:00:00',1,0,1,0,0),(9,530,'19:00:00',0,0,0,1,0);
/*!40000 ALTER TABLE `course_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `vnum` int NOT NULL,
  `section_no` int NOT NULL,
  `course_no` int NOT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `enroll_year` int DEFAULT NULL,
  PRIMARY KEY (`vnum`,`section_no`,`course_no`),
  KEY `section_no` (`section_no`),
  KEY `course_no` (`course_no`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`vnum`) REFERENCES `student_user` (`vnum`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`section_no`) REFERENCES `course_section` (`section_no`),
  CONSTRAINT `enrollment_ibfk_3` FOREIGN KEY (`course_no`) REFERENCES `course_section` (`course_no`),
  CONSTRAINT `enrollment_chk_1` CHECK ((`semester` in (_utf8mb4'fall',_utf8mb4'spring',_utf8mb4'summer')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (120,1,530,'fall',2024),(120,1,610,'fall',2024),(120,2,630,'fall',2024);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_user`
--

DROP TABLE IF EXISTS `student_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_user` (
  `vnum` int NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`vnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_user`
--

LOCK TABLES `student_user` WRITE;
/*!40000 ALTER TABLE `student_user` DISABLE KEYS */;
INSERT INTO `student_user` VALUES (120,'ugo','etudo','etudouo@vcu.edu','2024-09-19 20:19:05');
/*!40000 ALTER TABLE `student_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30 17:50:44
