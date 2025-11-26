-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: pojo
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `dept_id` int NOT NULL AUTO_INCREMENT COMMENT '部门ID（主键）',
  `dept_name` varchar(50) NOT NULL COMMENT '部门名称',
  `dept_location` varchar(100) DEFAULT NULL COMMENT '部门地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'研发部','北京市海淀区','2025-11-26 19:25:45','2025-11-26 19:25:45'),(2,'产品部','上海市浦东新区','2025-11-26 19:25:45','2025-11-26 19:25:45'),(3,'销售部','广州市天河区','2025-11-26 19:25:45','2025-11-26 19:25:45'),(4,'人事部','深圳市南山区','2025-11-26 19:25:45','2025-11-26 19:25:45'),(5,'财务部','杭州市西湖区','2025-11-26 19:25:45','2025-11-26 19:25:45');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `emp_id` int NOT NULL AUTO_INCREMENT COMMENT '员工ID（主键）',
  `emp_name` varchar(50) NOT NULL COMMENT '员工姓名',
  `gender` enum('男','女','未知') DEFAULT '未知' COMMENT '性别',
  `age` tinyint unsigned DEFAULT NULL COMMENT '年龄',
  `job` varchar(50) DEFAULT NULL COMMENT '职位',
  `salary` decimal(10,2) DEFAULT NULL COMMENT '月薪',
  `dept_id` int DEFAULT NULL COMMENT '所属部门ID（外键）',
  `hire_date` date DEFAULT NULL COMMENT '入职日期',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`dept_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (13,'张三','男',28,'Java开发工程师',15000.00,1,'2022-03-15','2025-11-26 19:25:45','2025-11-26 19:25:45'),(14,'李四','女',26,'前端开发工程师',13500.00,1,'2022-05-20','2025-11-26 19:25:45','2025-11-26 19:25:45'),(15,'王五','男',32,'架构师',25000.00,1,'2020-01-10','2025-11-26 19:25:45','2025-11-26 19:25:45'),(16,'赵六','女',29,'产品经理',18000.00,2,'2021-09-01','2025-11-26 19:25:45','2025-11-26 19:25:45'),(17,'孙七','男',27,'产品助理',9500.00,2,'2023-02-18','2025-11-26 19:25:45','2025-11-26 19:25:45'),(18,'周八','男',35,'销售总监',22000.00,3,'2019-06-30','2025-11-26 19:25:45','2025-11-26 19:25:45'),(19,'吴九','女',24,'销售代表',8000.00,3,'2023-07-05','2025-11-26 19:25:45','2025-11-26 19:25:45'),(20,'郑十','男',26,'销售代表',8500.00,3,'2023-08-12','2025-11-26 19:25:45','2025-11-26 19:25:45'),(21,'王芳','女',30,'人事经理',16000.00,4,'2021-03-22','2025-11-26 19:25:45','2025-11-26 19:25:45'),(22,'李强','男',33,'财务总监',20000.00,5,'2020-08-15','2025-11-26 19:25:45','2025-11-26 19:25:45'),(23,'张丽','女',28,'会计',12000.00,5,'2022-01-28','2025-11-26 19:25:45','2025-11-26 19:25:45'),(24,'陈明','男',27,'实习生',4500.00,NULL,'2024-01-10','2025-11-26 19:25:45','2025-11-26 19:25:45');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-26 20:07:27
