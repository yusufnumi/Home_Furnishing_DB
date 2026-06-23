CREATE DATABASE  IF NOT EXISTS `home_furnishing_store_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `home_furnishing_store_db`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: home_furnishing_store_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Temporary view structure for view `adana_stores_and_products`
--

DROP TABLE IF EXISTS `adana_stores_and_products`;
/*!50001 DROP VIEW IF EXISTS `adana_stores_and_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `adana_stores_and_products` AS SELECT 
 1 AS `store_name`,
 1 AS `city`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `color_name`,
 1 AS `quantity_on_hand`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `all_orders`
--

DROP TABLE IF EXISTS `all_orders`;
/*!50001 DROP VIEW IF EXISTS `all_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_orders` AS SELECT 
 1 AS `order_id`,
 1 AS `order_date`,
 1 AS `order_status`,
 1 AS `store_name`,
 1 AS `store_city`,
 1 AS `full_name`,
 1 AS `planned_delivery_date`,
 1 AS `delivery_status`,
 1 AS `product_and_color`,
 1 AS `quantity`,
 1 AS `unit_price`,
 1 AS `product_amount`,
 1 AS `order_total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ankara_stores_and_products`
--

DROP TABLE IF EXISTS `ankara_stores_and_products`;
/*!50001 DROP VIEW IF EXISTS `ankara_stores_and_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ankara_stores_and_products` AS SELECT 
 1 AS `store_name`,
 1 AS `city`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `color_name`,
 1 AS `quantity_on_hand`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `antalya_stores_and_products`
--

DROP TABLE IF EXISTS `antalya_stores_and_products`;
/*!50001 DROP VIEW IF EXISTS `antalya_stores_and_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `antalya_stores_and_products` AS SELECT 
 1 AS `store_name`,
 1 AS `city`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `color_name`,
 1 AS `quantity_on_hand`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `bursa_stores_and_products`
--

DROP TABLE IF EXISTS `bursa_stores_and_products`;
/*!50001 DROP VIEW IF EXISTS `bursa_stores_and_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bursa_stores_and_products` AS SELECT 
 1 AS `store_name`,
 1 AS `city`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `color_name`,
 1 AS `quantity_on_hand`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  `parent_category_id` int DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `fk_c_parent_category_id` (`parent_category_id`),
  CONSTRAINT `fk_c_parent_category_id` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Furniture',NULL),(2,'Lighting',NULL),(3,'Home Textile',NULL),(4,'Decoration',NULL),(5,'Kitchen & Dining',NULL),(6,'Outdoor & Garden',NULL),(7,'Living Room',1),(8,'Bedroom',1),(9,'Study Room',1),(10,'Dining Room',1),(11,'Hallway & Entryway',1),(12,'Office Desks',1),(13,'Chandeliers',2),(14,'Floor Lamps',2),(15,'Table Lamps',2),(16,'Wall Sconces',2),(17,'Spotlights',2),(18,'Outdoor Lighting',2),(19,'Rugs & Carpets',3),(20,'Curtains',3),(21,'Bedding Sets',3),(22,'Cushions & Pillows',3),(23,'Blankets & Throws',3),(24,'Wall Art & Paintings',4),(25,'Vases & Figurines',4),(26,'Mirrors',4),(27,'Candles & Holders',4),(28,'Clocks',4),(29,'Wall Decals',4),(30,'Dinnerware Sets',5),(31,'Drinkware',5),(32,'Cutlery & Flatware',5),(33,'Cookware',5),(34,'Tableware',5),(35,'Garden Furniture',6);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `color_id` int NOT NULL AUTO_INCREMENT,
  `color_name` varchar(45) NOT NULL,
  PRIMARY KEY (`color_id`),
  UNIQUE KEY `color_name` (`color_name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (1,'Anthracite'),(20,'Beige'),(34,'Champagne'),(32,'Charcoal Grey'),(15,'Claret Red'),(14,'Copper'),(9,'Cream'),(26,'Dark Brown'),(5,'Emerald Green'),(11,'Glossy White'),(13,'Gold'),(22,'Ivory'),(19,'Khaki'),(16,'Lavender'),(25,'Light Grey'),(10,'Matte Black'),(23,'Midnight Blue'),(36,'Mocha'),(7,'Mustard'),(30,'Mustard Yellow'),(3,'Oak'),(33,'Olive Green'),(29,'Petrol Blue'),(28,'Plum'),(17,'Powder Pink'),(31,'Salmon'),(21,'Sand Beige'),(4,'Sapphire Blue'),(12,'Silver'),(24,'Smoke Grey'),(35,'Steel Blue'),(6,'Terracotta'),(27,'Tobacco'),(18,'Turquoise'),(8,'Vison'),(2,'Walnut');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `registiration_date` date NOT NULL DEFAULT (curdate()),
  `e_mail` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `e_mail` (`e_mail`),
  CONSTRAINT `chk_phone` CHECK ((((`phone` like _utf8mb4'05%') or (`phone` like _utf8mb4'02%')) and (char_length(`phone`) = 11)))
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Ahmet','Yılmaz','05321112233','2020-05-15','ahmet.yilmaz@mail.com','Istanbul'),(2,'Ayşe','Demir','05332223344','2021-02-10',NULL,'Ankara'),(3,'Mehmet','Kaya','05423334455','2026-01-05','mehmet.kaya@mail.com','Izmir'),(4,'Fatma','Çelik','05554445566','2022-11-20','fatma.celik@mail.com','Bursa'),(5,'Can','Öztürk','05055556677','2026-01-05','can.ozturk@mail.com','Antalya'),(6,'Zeynep','Arslan','05306667788','2020-08-12','zeynep.arslan@mail.com','Adana'),(7,'Mustafa','Yıldız','05417778899','2023-01-05','mustafa.yildiz@mail.com','Konya'),(8,'Elif','Şahin','05318889900','2026-01-05','elif.sahin@mail.com','Eskisehir'),(9,'Emre','Aydın','05359990011','2021-06-30','emre.aydin@mail.com','Samsun'),(10,'Burcu','Özkan','05441112222','2022-03-14','burcu.ozkan@mail.com','Gaziantep'),(11,'Hüseyin','Kılıç','05362223333','2026-01-05',NULL,'Mersin'),(12,'Merve','Polat','05523334444','2020-12-25','merve.polat@mail.com','Zonguldak'),(13,'Oğuz','Çetin','05064445555','2026-01-05','oguz.cetin@mail.com','Diyarbakir'),(14,'Selin','Koç','05435556666','2021-09-18','selin.koc@mail.com','Denizli'),(15,'Hakan','Kurt','05376667777','2023-04-22','hakan.kurt@mail.com','Sakarya'),(16,'Aslı','Güler','05387778888','2026-01-05','asli.guler@mail.com','Mugla'),(17,'Murat','Aksoy','05458889999','2020-01-10','murat.aksoy@mail.com','Tekirdag'),(18,'Gizem','Deniz','05399990000','2022-07-07','gizem.deniz@mail.com','Trabzon'),(19,'Serkan','Yavuz','05531110022','2026-01-05',NULL,'Kocaeli'),(20,'Büşra','Erdoğan','05072221133','2021-12-01','busra.erdogan@mail.com','Malatya'),(21,'Eren','Güneş','05463332244','2023-02-14','eren.gunes@mail.com','Erzurum'),(22,'Derya','Bulut','05344443355','2026-01-05','derya.bulut@mail.com','Zonguldak'),(23,'Kaan','Işık','05545554466','2020-10-30','kaan.isik@mail.com','Balikesir'),(24,'Pelin','Sönmez','02126665577','2026-01-05','pelin.sonmez@mail.com','Istanbul'),(25,'Umut','Turan','02167776688','2021-05-05','umut.turan@mail.com','Istanbul'),(26,'Gamze','Yücel','02328887799','2022-08-20','gamze.yucel@mail.com','Izmir'),(27,'Oktay','Aslan','05321234567','2026-01-05','oktay.aslan@mail.com','Aydin'),(28,'Sibel','Yıldırım','05429876543','2020-04-12','sibel.yildirim@mail.com','Manisa'),(29,'Gökhan','Fırat','05334567890','2023-05-01','gokhan.firat@mail.com','Hatay'),(30,'Esra','Akkaya','05550009988','2026-01-05','esra.akkaya@mail.com','Canakkale'),(31,'Kerem Can','Özdemir','05351234567','2024-01-15','kerem.ozdemir@mail.com','Bolu'),(32,'Deniz','Yurt','05431238899','2020-03-20',NULL,'Antalya'),(33,'Yavuz','Selim','05324445566','2026-01-05','yavuz.selim@mail.com','Istanbul'),(34,'Nihal','Güneş','05335556677','2021-07-15','nihal.gunes@mail.com','Ankara'),(35,'Bora','Tekin','05426667788','2022-09-10','bora.tekin@mail.com','Izmir'),(36,'Sude','Yılmaz','05557778899','2026-01-05','sude.yilmaz@mail.com','Bursa'),(37,'Mert','Korkmaz','05058889900','2023-11-25','mert.korkmaz@mail.com','Eskisehir'),(38,'Gözde','Umut','05301119922','2020-02-28','gozde.umut@mail.com','Adana'),(39,'Cihan','Eren','05412220033','2026-01-05',NULL,'Konya'),(40,'Hande','Sarı','05313331144','2021-04-12','hande.sari@mail.com','Samsun'),(41,'Levent','Akça','05354442255','2022-06-18','levent.akca@mail.com','Mersin'),(42,'Demet','Öz','05445553366','2026-01-05','demet.oz@mail.com','Gaziantep'),(43,'Tuna','Dal','05366664477','2023-08-05','tuna.dal@mail.com','Kayseri'),(44,'Pınar','Ege','05527775588','2020-10-10',NULL,'Mugla'),(45,'Sarp','Can','05068886699','2026-01-05','sarp.can@mail.com','Denizli'),(46,'Ece','Bulut','05439997700','2021-01-22','ece.bulut@mail.com','Sakarya'),(47,'Onur','Gök','05371118811','2022-05-30','onur.gok@mail.com','Tekirdag'),(48,'Ilgaz','Yıldız','05382229922','2026-01-05','ilgaz.yildiz@mail.com','Trabzon'),(49,'Fırat','Aslan','05453330033','2023-12-12','firat.aslan@mail.com','Kocaeli'),(50,'Melis','Ünal','05394441144','2026-01-05','melis.unal@mail.com','Malatya'),(51,'Emre','Deliaci','05385620436','2024-06-27','220408008@st.biruni.edu.tr','İstanbul'),(52,'Arda','Eray','05322082379','2024-10-12','230408051@st.biruni.edu.tr','İstanbul'),(53,'Yusuf','Soylu','05518861046','2026-01-05','230408945@st.biruni.edu.tr','Konya');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL DEFAULT (curdate()),
  `order_status` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fkc_customer_id` (`customer_id`),
  KEY `fkc_store_id` (`store_id`),
  CONSTRAINT `fkc_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fkc_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_order`
--

LOCK TABLES `customer_order` WRITE;
/*!40000 ALTER TABLE `customer_order` DISABLE KEYS */;
INSERT INTO `customer_order` VALUES (1,'2023-03-15',1,1,1),(2,'2023-05-20',1,5,2),(3,'2023-08-12',1,10,5),(4,'2023-11-05',1,15,10),(5,'2024-01-10',1,2,4),(6,'2024-02-22',1,20,15),(7,'2024-04-14',1,25,20),(8,'2024-06-30',1,3,1),(9,'2024-08-15',1,30,25),(10,'2024-10-05',1,35,30),(11,'2024-12-12',1,8,3),(12,'2025-01-15',1,40,35),(13,'2025-02-10',1,45,8),(14,'2025-03-05',1,50,12),(15,'2025-04-20',1,12,18),(16,'2025-05-12',1,6,22),(17,'2025-06-01',1,18,28),(18,'2025-07-10',1,24,33),(19,'2025-07-25',1,33,5),(20,'2025-08-05',1,42,11),(21,'2025-08-18',1,7,16),(22,'2025-09-02',1,13,21),(23,'2025-09-15',1,29,26),(24,'2025-10-01',1,48,31),(25,'2025-10-10',1,4,1),(26,'2025-10-22',1,9,2),(27,'2025-11-05',1,14,6),(28,'2025-11-12',1,19,12),(29,'2025-11-18',1,26,17),(30,'2025-11-25',1,31,23),(31,'2025-11-30',1,37,29),(32,'2025-12-01',1,43,34),(33,'2025-12-02',1,49,3),(34,'2025-12-03',1,11,7),(35,'2025-12-04',0,16,13),(36,'2025-12-05',0,21,19),(37,'2025-12-06',0,27,24),(38,'2025-12-07',0,32,27),(39,'2025-12-08',1,38,32),(40,'2025-12-09',0,44,36),(41,'2025-12-10',0,50,4),(42,'2025-12-11',1,1,9),(43,'2025-12-12',0,2,14),(44,'2025-12-13',1,3,15),(45,'2025-12-14',0,5,20),(46,'2025-12-15',0,10,25),(47,'2025-12-16',0,15,30),(48,'2025-12-17',0,20,35),(49,'2025-12-18',0,25,2),(50,'2025-12-19',0,30,8),(51,'2025-12-19',0,35,12),(52,'2025-12-20',0,40,18),(53,'2025-12-20',0,45,22),(54,'2025-12-21',0,48,28),(55,'2025-12-21',0,12,33),(56,'2025-12-21',0,22,5),(57,'2025-12-22',0,33,10),(58,'2025-12-22',0,44,15),(59,'2025-12-22',0,17,20),(60,'2025-12-22',0,39,25);
/*!40000 ALTER TABLE `customer_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(150) NOT NULL,
  `delivery_status` tinyint(1) NOT NULL,
  `delivery_type` varchar(45) NOT NULL DEFAULT 'LAND',
  `planned_delivery_date` date NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `fkd_order_id` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `chk_delivery_type` CHECK ((`delivery_type` in (_utf8mb4'LAND',_utf8mb4'SEA',_utf8mb4'AIR')))
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Kadikoy, Istanbul',1,'LAND','2023-03-20',1),(2,'Sisli, Istanbul',1,'LAND','2023-05-25',2),(3,'Cankaya, Ankara',1,'LAND','2023-08-18',3),(4,'Mezitli, Mersin',1,'LAND','2023-11-10',4),(5,'Kartal, Istanbul',1,'LAND','2024-01-15',5),(6,'Besiktas, Istanbul',1,'LAND','2024-02-28',6),(7,'Nilufer, Bursa',1,'LAND','2024-04-20',7),(8,'Kepez, Antalya',1,'SEA','2024-07-05',8),(9,'Seyhan, Adana',1,'LAND','2024-08-20',9),(10,'Karsiyaka, Izmir',1,'LAND','2024-10-12',10),(11,'Bodrum, Mugla',1,'SEA','2024-12-20',11),(12,'Tepebasi, Eskisehir',1,'LAND','2025-01-20',12),(13,'Bakirkoy, Istanbul',1,'LAND','2025-02-15',13),(14,'Atasehir, Istanbul',1,'LAND','2025-03-12',14),(15,'Osmangazi, Bursa',1,'LAND','2025-04-25',15),(16,'Sariyer, Istanbul',1,'LAND','2025-05-18',16),(17,'Alsancak, Izmir',1,'SEA','2025-06-10',17),(18,'Konyaalti, Antalya',1,'SEA','2025-07-15',18),(19,'Mudanya, Bursa',1,'SEA','2025-07-30',19),(20,'Bornova, Izmir',1,'LAND','2025-08-10',20),(21,'Beyoglu, Istanbul',1,'LAND','2025-08-25',21),(22,'Eregli, Zonguldak',1,'SEA','2025-09-08',22),(23,'Uskudar, Istanbul',1,'LAND','2025-09-20',23),(24,'Kizilay, Ankara',1,'LAND','2025-10-05',24),(25,'Bilkent, Ankara',1,'LAND','2025-10-15',25),(26,'Fatih, Istanbul',1,'LAND','2025-10-28',26),(27,'Marmaris, Mugla',1,'SEA','2025-11-10',27),(28,'Cankaya, Ankara',1,'LAND','2025-11-20',28),(29,'Sisli, Istanbul',1,'LAND','2025-12-01',29),(30,'Bornova, Izmir',1,'LAND','2025-12-10',30),(31,'Besiktas, Istanbul',1,'LAND','2025-12-15',31),(32,'Cukurova, Adana',1,'LAND','2025-12-18',32),(33,'Cankaya, Ankara',1,'LAND','2025-12-21',33),(34,'Konyaalti, Antalya',1,'SEA','2025-12-22',34),(35,'Kartal, Istanbul',0,'LAND','2025-12-23',35),(36,'Nilufer, Bursa',0,'LAND','2025-12-24',36),(37,'Kepez, Antalya',0,'SEA','2025-12-25',37),(38,'Bakirkoy, Istanbul',0,'LAND','2025-12-26',38),(39,'Karsiyaka, Izmir',1,'LAND','2025-12-21',39),(40,'Eregli, Zonguldak',0,'SEA','2025-12-27',40),(41,'Beyoglu, Istanbul',0,'LAND','2025-12-28',41),(42,'Alsancak, Izmir',1,'SEA','2025-12-22',42),(43,'Tepebasi, Eskisehir',0,'LAND','2025-12-29',43),(44,'Sariyer, Istanbul',1,'LAND','2025-12-22',44),(45,'Seyhan, Adana',0,'LAND','2025-12-30',45),(46,'Konyaalti, Antalya',0,'SEA','2025-12-31',46),(47,'Uskudar, Istanbul',0,'LAND','2026-01-02',47),(48,'Bilkent, Ankara',0,'LAND','2026-01-03',48),(49,'Cukurova, Adana',0,'LAND','2026-01-04',49),(50,'Fatih, Istanbul',0,'LAND','2026-01-05',50),(51,'Bornova, Izmir',0,'LAND','2026-01-06',51),(52,'Cankaya, Ankara',0,'LAND','2026-01-07',52),(53,'Nilufer, Bursa',0,'LAND','2026-01-08',53),(54,'Bodrum, Mugla',0,'SEA','2026-01-09',54),(55,'Besiktas, Istanbul',0,'LAND','2026-01-10',55),(56,'Kartal, Istanbul',0,'LAND','2026-01-11',56),(57,'Alsancak, Izmir',0,'SEA','2026-01-12',57),(58,'Kepez, Antalya',0,'SEA','2026-01-13',58),(59,'Atasehir, Istanbul',0,'LAND','2026-01-14',59),(60,'Bakirkoy, Istanbul',0,'LAND','2026-01-15',60);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `employment_date` date NOT NULL DEFAULT (curdate()),
  `store_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fke_store_id` (`store_id`),
  CONSTRAINT `fke_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (2,'Kerem','Aras','Store Manager',1,'2020-01-15',1),(3,'Caner','Solak','Sales Consultant',1,'2023-01-15',1),(4,'Tarkan','Öz','Technician',1,'2026-01-05',1),(5,'Deniz','Yılmaz','Store Manager',1,'2020-03-20',2),(6,'Ayşe','Sarı','Sales Consultant',1,'2026-01-05',2),(7,'Metin','Işık','Cashier',1,'2021-04-12',2),(8,'Selin','Kaya','Store Manager',1,'2021-05-10',3),(9,'Cenk','Tosun','Sales Consultant',1,'2023-05-15',3),(10,'Demet','Ak','Cashier',1,'2026-01-05',3),(11,'Murat','Demir','Store Manager',1,'2020-08-12',4),(12,'Ahmet','Mert','Interior Designer',1,'2022-06-20',4),(13,'Ali','Rıza','Sales Consultant',1,'2026-01-05',4),(14,'Aslı','Güler','Store Manager',1,'2022-02-01',5),(15,'Mehmet','Bakır','Cashier',1,'2023-02-10',5),(16,'Halit','Ergenç','Interior Designer',1,'2020-11-30',5),(17,'Hakan','Çetin','Store Manager',1,'2026-01-05',6),(18,'Bergüzar','Korel','Sales Consultant',1,'2026-01-05',6),(19,'Kıvanç','Tatlıtuğ','Technician',1,'2021-08-15',6),(20,'Merve','Sönmez','Store Manager',1,'2021-11-20',7),(21,'Ezgi','Mola','Sales Consultant',1,'2022-03-12',7),(22,'Bülent','Aksoy','Store Manager',1,'2020-06-15',8),(23,'Gupse','Özay','Interior Designer',1,'2026-01-05',8),(24,'Gizem','Deniz','Store Manager',1,'2026-01-05',9),(25,'Eser','Yenenler','Cashier',1,'2026-01-05',9),(26,'Serkan','Yavuz','Store Manager',1,'2021-09-30',10),(27,'Zeynep','Bastık','Sales Consultant',1,'2026-01-05',10),(28,'Ece','Erdogan','Store Manager',1,'2020-04-18',11),(29,'Engin','Akyürek','Cashier',1,'2026-01-05',11),(30,'Eren','Güneş','Store Manager',1,'2026-01-05',12),(31,'Dilan','Deniz','Interior Designer',1,'2026-01-05',12),(32,'Derya','Bulut','Store Manager',1,'2022-01-10',13),(33,'Ali','Atay','Cashier',1,'2026-01-05',13),(34,'Kaan','Işık','Store Manager',1,'2020-07-25',14),(35,'Çağatay','Ulusoy','Technician',1,'2026-01-05',14),(36,'Pelin','Sönmez','Store Manager',1,'2026-01-05',15),(37,'Fahriye','Evcen','Cashier',1,'2026-01-05',15),(38,'Umut','Turan','Store Manager',1,'2021-03-14',16),(39,'Kadir','Doğulu','Interior Designer',1,'2026-01-05',16),(40,'Gamze','Yücel','Store Manager',1,'2020-10-05',17),(41,'Anıl','Altan','Cashier',1,'2026-01-05',17),(42,'Oktay','Aslan','Store Manager',1,'2026-01-05',18),(43,'Barış','Arduç','Technician',1,'2026-01-05',18),(44,'Sibel','Yıldırım','Store Manager',1,'2022-04-12',19),(45,'Salih','Bademci','Cashier',1,'2026-01-05',19),(46,'Gökhan','Fırat','Store Manager',1,'2020-12-20',20),(47,'İbrahim','Çelikkol','Interior Designer',1,'2026-01-05',20),(48,'Esra','Akkaya','Store Manager',1,'2026-01-05',21),(49,'Bora','Tekin','Store Manager',1,'2021-06-01',22),(50,'Zeynep','Kuru','Cashier',1,'2026-01-05',22),(51,'Nihal','Güneş','Store Manager',1,'2020-02-14',23),(52,'Mert','Korkmaz','Store Manager',1,'2026-01-05',24),(53,'Gözde','Umut','Store Manager',1,'2022-05-20',25),(54,'Cihan','Eren','Store Manager',1,'2020-09-09',26),(55,'Hande','Sarı','Store Manager',1,'2026-01-05',27),(56,'Levent','Akça','Store Manager',1,'2021-08-15',28),(57,'Demet','Öz','Store Manager',1,'2020-05-30',29),(58,'Esra','Vatan','Interior Designer',1,'2026-01-05',29),(59,'Tuna','Dal','Store Manager',1,'2026-01-05',30),(60,'Pınar','Ege','Store Manager',1,'2022-03-22',31),(61,'Onur','Gök','Store Manager',1,'2020-11-11',32),(62,'Oğuz','Kaya','Technician',1,'2023-04-12',32),(63,'Ilgaz','Yıldız','Store Manager',1,'2026-01-05',33),(64,'Fırat','Aslan','Store Manager',1,'2021-02-14',34),(65,'Melis','Ünal','Store Manager',1,'2020-01-05',35),(66,'Cem','Tekin','Store Manager',1,'2026-01-05',36),(67,'Burak','Can','Sales Consultant',0,'2019-11-01',1),(68,'Sude','Yılmaz','Cashier',0,'2018-05-20',10),(69,'Cansu','Dere','Sales Consultant',0,'2019-01-10',5),(70,'Haluk','Bilginer','Store Manager',0,'2017-05-15',15),(71,'Kadir','Gül','Sales Consultant',1,'2026-01-05',9),(72,'Kader','Güzel','Interior Designer',1,'2024-04-17',6),(73,'Mohammad','Aknaz','Sales Consultant',0,'2021-09-07',27);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `eskisehir_stores_and_products`
--

DROP TABLE IF EXISTS `eskisehir_stores_and_products`;
/*!50001 DROP VIEW IF EXISTS `eskisehir_stores_and_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `eskisehir_stores_and_products` AS SELECT 
 1 AS `store_name`,
 1 AS `city`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `color_name`,
 1 AS `quantity_on_hand`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `istanbul_stores_and_products`
--

DROP TABLE IF EXISTS `istanbul_stores_and_products`;
/*!50001 DROP VIEW IF EXISTS `istanbul_stores_and_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `istanbul_stores_and_products` AS SELECT 
 1 AS `store_name`,
 1 AS `city`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `color_name`,
 1 AS `quantity_on_hand`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `izmir_stores_and_products`
--

DROP TABLE IF EXISTS `izmir_stores_and_products`;
/*!50001 DROP VIEW IF EXISTS `izmir_stores_and_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `izmir_stores_and_products` AS SELECT 
 1 AS `store_name`,
 1 AS `city`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `color_name`,
 1 AS `quantity_on_hand`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `material_name` varchar(45) NOT NULL,
  PRIMARY KEY (`material_id`),
  UNIQUE KEY `material_name` (`material_name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (38,'Acrylic'),(22,'Aluminum'),(44,'Ash Wood'),(13,'Bamboo'),(15,'Brass'),(23,'Bronze'),(11,'Cast Iron'),(12,'Ceramic'),(33,'Chenille Fabric'),(16,'Chrome'),(36,'Copper Plated'),(19,'Cotton'),(4,'Genuine Leather'),(40,'Goose Down'),(27,'Jacquard Fabric'),(18,'Jute'),(42,'Latex'),(6,'Linen Blend'),(9,'Marble'),(3,'MDF'),(30,'Melamine'),(41,'Memory Foam'),(17,'Microfiber'),(32,'Nubuck Leather'),(25,'Particle Board'),(28,'Pine Wood'),(10,'Polyester'),(39,'Polyurethane'),(31,'Porcelain'),(35,'Quartz'),(14,'Rattan'),(43,'Recycled Plastic'),(45,'Rosewood'),(24,'Satin'),(21,'Silk'),(1,'Solid Oak Wood'),(8,'Stainless Steel'),(26,'Suede'),(29,'Teak Wood'),(7,'Tempered Glass'),(34,'Travertine'),(5,'Velvet Fabric'),(2,'Walnut Veneer'),(20,'Wool'),(37,'Wrought Iron');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mugla_stores_and_products`
--

DROP TABLE IF EXISTS `mugla_stores_and_products`;
/*!50001 DROP VIEW IF EXISTS `mugla_stores_and_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `mugla_stores_and_products` AS SELECT 
 1 AS `store_name`,
 1 AS `city`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `color_name`,
 1 AS `quantity_on_hand`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `color_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`,`product_id`,`color_id`),
  KEY `fko_product_id` (`product_id`),
  KEY `fko_color_id` (`color_id`),
  CONSTRAINT `fko_color_id` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fko_order_id` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fko_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_quantity` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,1,1,1),(1,1,4,1),(1,2,9,1),(2,1,8,1),(2,5,1,1),(2,12,3,1),(3,1,1,1),(3,8,9,1),(3,11,3,1),(4,4,11,1),(4,7,2,1),(4,30,18,1),(5,1,25,1),(5,4,5,1),(5,24,13,1),(6,1,23,1),(6,2,9,1),(6,18,10,1),(7,12,11,1),(7,25,3,1),(7,45,1,1),(8,10,5,1),(8,19,24,1),(8,22,16,1),(9,1,6,1),(9,35,3,1),(9,48,10,1),(10,18,12,1),(10,29,13,1),(10,31,7,1),(11,8,1,1),(11,9,8,1),(11,22,11,1),(12,1,9,1),(12,2,4,1),(12,35,9,1),(13,2,9,1),(13,9,1,1),(13,15,12,1),(14,10,3,1),(14,15,10,1),(14,24,1,1),(15,14,25,1),(15,38,1,1),(15,60,3,1),(16,30,11,1),(16,31,7,1),(16,32,12,1),(17,5,21,1),(17,11,2,1),(17,20,20,1),(18,1,1,1),(18,5,21,1),(18,13,7,1),(19,1,1,1),(19,11,3,1),(19,29,10,1),(20,13,12,1),(20,14,10,1),(20,27,16,1),(21,7,2,1),(21,18,13,1),(21,33,14,1),(22,2,9,1),(22,30,20,1),(22,59,10,1),(23,2,21,1),(23,48,24,1),(23,50,1,1),(24,1,4,1),(24,14,14,1),(24,19,19,1),(25,1,1,1),(25,1,4,1),(25,2,9,1),(26,1,8,1),(26,5,1,1),(26,12,3,1),(27,2,20,1),(27,3,2,1),(27,10,4,1),(28,15,10,1),(28,19,21,1),(28,24,1,1),(29,35,29,1),(29,39,5,1),(29,47,18,1),(30,10,2,1),(30,22,11,1),(30,47,12,1),(31,12,10,1),(31,36,14,1),(31,48,3,1),(32,15,10,1),(32,40,8,1),(32,45,12,1),(33,8,1,1),(33,9,8,1),(33,22,11,1),(34,3,2,1),(34,5,21,1),(34,12,10,1),(35,11,3,1),(35,18,12,1),(35,35,3,1),(36,4,2,1),(36,12,10,1),(36,30,20,1),(37,3,2,1),(37,7,1,1),(37,29,10,1),(38,3,2,1),(38,38,11,1),(38,50,1,1),(39,13,10,1),(39,30,20,1),(39,60,3,1),(40,1,20,1),(40,10,5,1),(40,33,10,1),(41,1,25,1),(41,4,5,1),(41,24,13,1),(42,1,1,1),(42,20,20,1),(42,27,15,1),(43,16,13,1),(43,20,11,1),(43,33,10,1),(44,1,23,1),(44,2,9,1),(44,18,10,1),(45,12,11,1),(45,25,3,1),(45,45,1,1),(46,1,6,1),(46,35,3,1),(46,54,13,1),(47,18,12,1),(47,29,13,1),(47,55,1,1),(48,2,4,1),(48,12,11,1),(48,35,9,1),(49,1,8,1),(49,5,1,1),(49,12,3,1),(50,2,9,1),(50,9,1,1),(50,15,12,1),(51,10,3,1),(51,15,10,1),(51,24,1,1),(52,14,25,1),(52,35,14,1),(52,38,1,1),(53,30,11,1),(53,31,7,1),(53,32,12,1),(54,5,21,1),(54,20,20,1),(54,60,4,1),(55,1,1,1),(55,5,21,1),(55,13,7,1),(56,1,1,1),(56,8,9,1),(56,11,3,1),(57,7,2,1),(57,25,2,1),(57,30,18,1),(58,1,23,1),(58,2,9,1),(58,18,10,1),(59,12,11,1),(59,25,3,1),(59,45,1,1),(60,1,6,1),(60,35,3,1),(60,54,13,1);
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(45) NOT NULL DEFAULT 'CASH',
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `fkp_order_id` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `chk_amount` CHECK ((`amount` > 0.00)),
  CONSTRAINT `chk_payment_method` CHECK ((`payment_method` in (_utf8mb4'CASH',_utf8mb4'CARD')))
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'CARD',32799.79,'2023-03-15',1),(2,'CASH',20399.80,'2023-05-20',2),(3,'CARD',33699.88,'2023-08-12',3),(4,'CARD',8369.88,'2023-11-05',4),(5,'CARD',30699.89,'2024-01-10',5),(6,'CARD',20399.79,'2024-02-22',6),(7,'CASH',16399.89,'2024-04-14',7),(8,'CASH',17849.88,'2024-06-30',8),(9,'CARD',19839.79,'2024-08-15',9),(10,'CARD',4449.80,'2024-10-05',10),(11,'CASH',28499.98,'2024-12-12',11),(12,'CARD',23499.88,'2025-01-15',12),(13,'CARD',15199.98,'2025-02-10',13),(14,'CARD',24499.89,'2025-03-05',14),(15,'CARD',5449.98,'2025-04-20',15),(16,'CASH',2049.89,'2025-05-12',16),(17,'CARD',8899.89,'2025-06-01',17),(18,'CARD',18449.89,'2025-07-10',18),(19,'CARD',19799.79,'2025-07-25',19),(20,'CARD',15749.99,'2025-08-05',20),(21,'CARD',3669.79,'2025-08-18',21),(22,'CASH',5969.88,'2025-09-02',22),(23,'CARD',5089.79,'2025-09-15',23),(24,'CARD',17749.89,'2025-10-01',24),(25,'CARD',32799.79,'2025-10-10',25),(26,'CARD',20399.80,'2025-10-22',26),(27,'CASH',13499.79,'2025-11-05',27),(28,'CARD',18849.98,'2025-11-12',28),(29,'CARD',7599.88,'2025-11-18',29),(30,'CARD',16549.88,'2025-11-25',30),(31,'CARD',5739.70,'2025-11-30',31),(32,'CASH',9779.98,'2025-12-01',32),(33,'CARD',28499.98,'2025-12-02',33),(34,'CARD',8099.80,'2025-12-03',34),(35,'CARD',10699.88,'2025-12-04',35),(36,'CARD',9919.88,'2025-12-05',36),(37,'CARD',5349.70,'2025-12-06',37),(38,'CASH',4799.79,'2025-12-07',38),(39,'CARD',4169.97,'2025-12-08',39),(40,'CARD',22319.79,'2025-12-09',40),(41,'CARD',30699.89,'2025-12-10',41),(42,'CARD',30399.80,'2025-12-11',42),(43,'CARD',3869.79,'2025-12-12',43),(44,'CASH',20399.79,'2025-12-13',44),(45,'CARD',16399.89,'2025-12-14',45),(46,'CARD',20079.88,'2025-12-15',46),(47,'CARD',22499.79,'2025-12-16',47),(48,'CARD',11799.88,'2025-12-17',48),(49,'CARD',20399.80,'2025-12-18',49),(50,'CASH',15199.98,'2025-12-19',50),(51,'CARD',24499.89,'2025-12-19',51),(52,'CARD',8049.98,'2025-12-20',52),(53,'CARD',2049.89,'2025-12-20',53),(54,'CARD',8099.89,'2025-12-21',54),(55,'CARD',18449.89,'2025-12-21',55),(56,'CASH',33699.88,'2025-12-21',56),(57,'CARD',13169.88,'2025-12-22',57),(58,'CARD',20399.79,'2025-12-22',58),(59,'CARD',16399.89,'2025-12-22',59),(60,'CARD',20079.88,'2025-12-22',60);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fkp_category_id` (`category_id`),
  CONSTRAINT `fkp_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `chk_unit_price` CHECK ((`unit_price` > 0.00))
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Pavia Fabric Sofa 3-Seater',14499.90,7),(2,'Sona Velvet Armchair',3799.99,7),(3,'Netha Coffee Table',2199.90,7),(4,'Orlando TV Unit Set',6399.99,7),(5,'Raum Bookshelf Walnut',3100.00,7),(6,'Giorno King Size Bed',9199.99,8),(7,'Elegante Nightstand',1249.90,8),(8,'Giorno Wardrobe 4-Door',15799.99,8),(9,'Vienna Dressing Table',4200.00,8),(10,'Ortho-Luxury Mattress',7499.90,8),(11,'Vision Ergonomic Chair',3399.99,9),(12,'Borna Desk with Drawer',2799.90,9),(13,'Legno Wall Shelf Unit',849.99,9),(14,'Smart Rolling Cabinet',1400.00,9),(15,'Praga Dining Table',7199.99,10),(16,'Praga Chair with Fabric',1149.90,10),(17,'Vienna Sideboard',6799.99,10),(18,'Mabel Console Mirror',2099.90,10),(19,'Simena Shoe Cabinet',1849.99,11),(20,'Sona Hallway Bench',2399.90,11),(21,'Mabel Coat Hanger',950.00,11),(22,'Executive L-Shape Desk',8499.99,12),(23,'Compact Home Office Desk',1949.90,12),(24,'Electric Standing Desk',9800.00,12),(25,'Crystal Waterfall Chandelier',12499.99,13),(26,'Modern Sputnik Pendant',4499.90,13),(27,'Gold Leaf Luxury Chandelier',13500.00,13),(28,'Industrial Floor Lamp Black',1649.99,14),(29,'Tripod Wood Floor Lamp',1899.90,14),(30,'Ceramic Table Lamp Navy',719.99,15),(31,'LED Reading Lamp USB',450.00,15),(32,'Globe Wall Sconce Gold',879.90,16),(33,'Magnetic Track Spotlight',319.99,17),(34,'Solar Garden Path Light Set',1099.90,18),(35,'Hand-Woven Bamboo Rug',5199.99,19),(36,'Geometric Modern Carpet',2799.90,19),(37,'Vintage Area Rug 200x300',4400.00,19),(38,'Linen Blackout Curtains',1449.99,20),(39,'Satin Bedding Set Queen',1849.90,21),(40,'Velvet Cushion Cover Blue',179.99,22),(41,'Cotton Knitted Blanket',750.00,23),(42,'Abstract Canvas Art Large',2099.99,24),(43,'Set of 3 Framed Prints',649.90,24),(44,'Silver Decorative Vase',419.99,25),(45,'Large Round Wall Mirror',2400.00,26),(46,'Scented Soy Candle Set',279.90,27),(47,'Minimalist Mantle Clock',549.99,28),(48,'Floral Vinyl Wall Decal',139.90,29),(49,'Fine Porcelain Dinner Set 24pc',3199.99,30),(50,'Crystal Wine Glass Set of 6',1149.90,31),(51,'Titanium Cutlery Set 30pc',2599.99,32),(52,'Ceramic Non-Stick Pan Set',3400.00,33),(53,'Cotton Table Runner Grey',209.90,34),(54,'Bamboo Serving Tray',379.99,34),(55,'Rattan Outdoor Lounge Set',18499.99,35),(56,'Teak Wood Garden Table',7799.90,35),(57,'Patio Swing Chair',9400.00,35),(58,'Garden Storage Bench',3199.99,35),(59,'Folding Deck Chair',1449.90,35),(60,'Waterproof Parasol Umbrella',2599.99,35);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_color`
--

DROP TABLE IF EXISTS `product_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_color` (
  `product_id` int NOT NULL,
  `color_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`color_id`),
  KEY `fkpc_color_id` (`color_id`),
  CONSTRAINT `fkpc_color_id` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fkpc_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_color`
--

LOCK TABLES `product_color` WRITE;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;
INSERT INTO `product_color` VALUES (1,1),(2,1),(3,1),(5,1),(8,1),(16,1),(33,1),(45,1),(50,1),(55,1),(3,2),(6,2),(7,2),(9,2),(21,2),(25,2),(59,2),(8,3),(11,3),(12,3),(13,3),(32,3),(35,3),(44,3),(48,3),(50,3),(60,3),(1,4),(2,4),(10,4),(49,4),(56,4),(4,5),(10,5),(28,5),(39,5),(52,5),(57,5),(1,8),(9,8),(14,8),(27,8),(40,8),(2,9),(5,9),(8,9),(16,9),(40,9),(1,10),(3,10),(4,10),(7,10),(11,10),(12,10),(15,10),(33,10),(43,10),(46,10),(53,10),(57,10),(59,10),(22,11),(13,12),(15,12),(17,12),(24,12),(31,12),(34,12),(41,12),(47,12),(7,13),(18,13),(25,13),(42,13),(55,13),(26,14),(36,14),(38,14),(60,15),(6,16),(14,18),(54,18),(19,19),(2,20),(20,20),(23,20),(30,20),(51,20),(5,21),(12,21),(41,21),(58,21),(2,22),(29,22),(48,24),(1,25),(37,30);
/*!40000 ALTER TABLE `product_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_copy`
--

DROP TABLE IF EXISTS `product_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_copy` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fkp_category_id` (`category_id`),
  CONSTRAINT `product_copy_chk_1` CHECK ((`unit_price` > 0.00))
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_copy`
--

LOCK TABLES `product_copy` WRITE;
/*!40000 ALTER TABLE `product_copy` DISABLE KEYS */;
INSERT INTO `product_copy` VALUES (1,'Pavia Fabric Sofa 3-Seater',14499.90,7),(2,'Sona Velvet Armchair',3799.99,7),(3,'Netha Coffee Table',2199.90,7),(4,'Orlando TV Unit Set',6399.99,7),(5,'Raum Bookshelf Walnut',3100.00,7),(6,'Giorno King Size Bed',9199.99,8),(7,'Elegante Nightstand',1249.90,8),(8,'Giorno Wardrobe 4-Door',15799.99,8),(9,'Vienna Dressing Table',4200.00,8),(10,'Ortho-Luxury Mattress',7499.90,8),(11,'Vision Ergonomic Chair',3399.99,9),(12,'Borna Desk with Drawer',2799.90,9),(13,'Legno Wall Shelf Unit',849.99,9),(14,'Smart Rolling Cabinet',1400.00,9),(15,'Praga Dining Table',7199.99,10),(16,'Praga Chair with Fabric',1149.90,10),(17,'Vienna Sideboard',6799.99,10),(18,'Mabel Console Mirror',2099.90,10),(19,'Simena Shoe Cabinet',1849.99,11),(20,'Sona Hallway Bench',2399.90,11),(21,'Mabel Coat Hanger',950.00,11),(22,'Executive L-Shape Desk',8499.99,12),(23,'Compact Home Office Desk',1949.90,12),(24,'Electric Standing Desk',9800.00,12),(25,'Crystal Waterfall Chandelier',12499.99,13),(26,'Modern Sputnik Pendant',4499.90,13),(27,'Gold Leaf Luxury Chandelier',13500.00,13),(28,'Industrial Floor Lamp Black',1649.99,14),(29,'Tripod Wood Floor Lamp',1899.90,14),(30,'Ceramic Table Lamp Navy',719.99,15),(31,'LED Reading Lamp USB',450.00,15),(32,'Globe Wall Sconce Gold',879.90,16),(33,'Magnetic Track Spotlight',319.99,17),(34,'Solar Garden Path Light Set',1099.90,18),(35,'Hand-Woven Bamboo Rug',5199.99,19),(36,'Geometric Modern Carpet',2799.90,19),(37,'Vintage Area Rug 200x300',4400.00,19),(38,'Linen Blackout Curtains',1449.99,20),(39,'Satin Bedding Set Queen',1849.90,21),(40,'Velvet Cushion Cover Blue',179.99,22),(41,'Cotton Knitted Blanket',750.00,23),(42,'Abstract Canvas Art Large',2099.99,24),(43,'Set of 3 Framed Prints',649.90,24),(44,'Silver Decorative Vase',419.99,25),(45,'Large Round Wall Mirror',2400.00,26),(46,'Scented Soy Candle Set',279.90,27),(47,'Minimalist Mantle Clock',549.99,28),(48,'Floral Vinyl Wall Decal',139.90,29),(49,'Fine Porcelain Dinner Set 24pc',3199.99,30),(50,'Crystal Wine Glass Set of 6',1149.90,31),(51,'Titanium Cutlery Set 30pc',2599.99,32),(52,'Ceramic Non-Stick Pan Set',3400.00,33),(53,'Cotton Table Runner Grey',209.90,34),(54,'Bamboo Serving Tray',379.99,34),(55,'Rattan Outdoor Lounge Set',18499.99,35),(56,'Teak Wood Garden Table',7799.90,35),(57,'Patio Swing Chair',9400.00,35),(58,'Garden Storage Bench',3199.99,35),(59,'Folding Deck Chair',1449.90,35),(60,'Waterproof Parasol Umbrella',2599.99,35);
/*!40000 ALTER TABLE `product_copy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_material`
--

DROP TABLE IF EXISTS `product_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_material` (
  `product_id` int NOT NULL,
  `material_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`material_id`),
  KEY `fkpm_material_id` (`material_id`),
  CONSTRAINT `fkpm_material_id` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fkpm_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_material`
--

LOCK TABLES `product_material` WRITE;
/*!40000 ALTER TABLE `product_material` DISABLE KEYS */;
INSERT INTO `product_material` VALUES (1,1),(9,1),(10,1),(11,1),(12,1),(22,1),(24,1),(44,1),(57,1),(5,2),(6,2),(18,2),(21,2),(44,2),(3,3),(5,3),(9,3),(17,3),(20,3),(22,3),(10,4),(23,4),(1,5),(8,5),(20,5),(7,7),(11,7),(14,7),(15,7),(24,7),(33,7),(39,7),(53,7),(6,8),(15,8),(19,8),(31,8),(43,8),(47,8),(55,8),(58,8),(4,9),(13,9),(38,9),(1,10),(8,10),(5,11),(17,11),(29,11),(28,12),(30,12),(33,12),(36,12),(45,12),(54,12),(25,13),(48,13),(49,14),(4,15),(11,15),(18,15),(40,15),(55,15),(60,15),(13,16),(23,16),(34,16),(56,16),(16,18),(25,18),(2,19),(12,19),(37,19),(51,19),(2,20),(16,20),(3,22),(22,22),(32,22),(33,22),(14,23),(60,23),(7,25),(19,25),(21,25),(3,26),(50,29),(26,31),(27,31),(35,31),(46,31),(52,31),(59,31),(4,36),(42,40),(2,41),(41,41);
/*!40000 ALTER TABLE `product_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `store_id` int NOT NULL,
  `product_id` int NOT NULL,
  `color_id` int NOT NULL,
  `aisle` varchar(45) NOT NULL,
  `shelf` varchar(45) NOT NULL,
  `quantity_on_hand` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`store_id`,`product_id`,`color_id`),
  KEY `fks_color_id` (`color_id`),
  KEY `fks_product_id` (`product_id`),
  CONSTRAINT `fks_color_id` FOREIGN KEY (`color_id`) REFERENCES `color` (`color_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fks_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fks_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `chk_quantity_on_hand` CHECK ((`quantity_on_hand` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,1,'A-01','Shelf-01',28),(1,1,4,'A-01','Shelf-02',1),(1,2,9,'A-02','Shelf-05',6),(1,4,2,'B-03','S-01',4),(1,7,2,'B-12','Shelf-10',12),(1,10,5,'C-01','Shelf-01',9),(1,19,24,'H-01','S-01',14),(1,22,16,'H-02','S-03',24),(1,50,13,'G-05','S-01',10),(2,1,8,'A-01','Shelf-01',1),(2,3,2,'A-05','Shelf-03',10),(2,5,1,'D-02','Shelf-05',12),(2,12,3,'B-04','Shelf-01',3),(2,13,12,'L-01','S-01',8),(2,14,10,'L-02','S-02',12),(2,23,10,'O-01','S-01',20),(2,45,1,'K-05','S-01',30),(3,8,1,'B-01','Shelf-02',5),(3,9,8,'C-01','Shelf-02',12),(3,13,10,'L-01','S-01',5),(3,20,21,'T-01','S-05',60),(3,22,11,'T-04','Shelf-04',48),(3,30,22,'K-01','S-01',40),(3,33,10,'K-03','S-02',25),(4,1,25,'A-01','Shelf-05',1),(4,4,5,'B-02','Shelf-01',5),(4,6,2,'A-03','Shelf-02',5),(4,24,13,'D-01','S-01',3),(4,26,13,'D-02','S-02',8),(4,30,22,'K-01','S-01',25),(4,41,9,'Y-01','S-01',10),(5,1,1,'A-01','Shelf-01',1),(5,8,9,'B-05','Shelf-03',9),(5,11,3,'E-01','Shelf-01',6),(5,20,25,'T-01','S-01',40),(5,29,10,'D-05','S-01',29),(5,48,1,'K-01','S-01',15),(6,2,20,'A-02','Shelf-01',9),(6,3,2,'S-01','S-01',11),(6,10,4,'B-02','S-01',9),(6,19,15,'H-01','S-01',20),(6,31,7,'K-02','S-02',50),(7,3,2,'S-01','S-05',7),(7,5,21,'B-10','S-04',19),(7,12,10,'C-04','S-12',4),(7,23,27,'O-01','S-01',15),(7,40,16,'D-01','S-01',18),(8,2,9,'A-04','S-08',5),(8,5,11,'O-05','S-01',10),(8,9,1,'O-03','S-02',33),(8,15,12,'L-01','S-05',28),(8,22,11,'O-02','S-01',40),(9,1,1,'A-01','S-02',9),(9,16,12,'L-05','S-01',20),(9,20,20,'T-02','S-02',44),(9,27,15,'D-02','S-01',49),(9,35,13,'G-01','S-01',32),(10,4,11,'Y-02','S-01',5),(10,7,2,'B-12','S-12',12),(10,25,2,'D-01','S-08',11),(10,30,18,'K-01','S-01',23),(10,39,19,'G-01','S-01',8),(11,2,8,'Y-01','S-01',5),(11,13,12,'L-01','S-01',14),(11,14,10,'L-02','S-02',19),(11,27,16,'D-03','S-01',49),(12,10,3,'Y-02','S-01',4),(12,15,10,'L-03','S-03',22),(12,19,21,'H-01','S-01',11),(12,24,1,'D-01','S-01',5),(13,11,3,'E-03','S-01',14),(13,18,12,'L-01','S-01',19),(13,35,3,'G-01','S-01',4),(13,39,5,'G-05','S-01',20),(13,60,20,'G-06','S-01',15),(14,16,13,'L-04','S-04',11),(14,20,11,'T-01','S-01',29),(14,33,10,'K-01','S-01',14),(14,40,8,'K-09','S-11',25),(15,1,23,'S-01','S-01',1),(15,2,9,'A-02','S-02',3),(15,6,6,'S-01','S-01',4),(15,18,10,'L-01','S-01',22),(15,55,13,'G-05','S-03',6),(16,7,2,'B-11','S-02',8),(16,7,7,'O-01','S-01',8),(16,18,13,'L-01','S-05',21),(16,22,1,'O-01','S-01',8),(16,33,14,'K-01','S-01',17),(17,34,13,'K-05','S-01',30),(17,35,29,'G-01','S-01',9),(17,36,29,'G-02','S-02',15),(17,39,5,'G-03','S-03',19),(17,47,18,'T-05','S-01',24),(17,60,22,'G-05','S-01',12),(18,14,25,'C-02','S-04',16),(18,35,14,'G-01','S-01',3),(18,38,1,'G-05','S-01',10),(18,60,3,'G-10','S-10',7),(19,4,2,'Y-05','S-01',6),(19,12,10,'C-03','S-04',6),(19,21,2,'T-01','S-01',20),(19,30,20,'K-03','S-10',49),(20,11,23,'Z-01','Shelf-02',20),(20,12,11,'O-01','S-01',7),(20,25,3,'D-01','S-01',7),(20,45,1,'D-04','S-01',9),(20,53,10,'T-02','S-03',14),(21,2,9,'A-01','S-10',14),(21,15,9,'L-01','S-01',20),(21,30,20,'K-01','S-01',21),(21,59,9,'S-05','Shelf-07',35),(21,59,10,'G-08','S-05',6),(22,13,12,'L-04','S-03',14),(22,19,23,'H-01','S-01',14),(22,28,12,'D-01','S-01',10),(22,30,11,'K-01','S-01',58),(22,31,7,'K-02','S-02',38),(22,32,12,'K-03','S-01',48),(23,10,2,'B-01','S-01',4),(23,14,13,'L-01','S-01',9),(23,17,2,'D-03','Shelf-04',15),(23,17,17,'L-01','S-01',9),(23,22,11,'T-05','S-01',29),(23,47,12,'L-01','S-03',13),(24,3,2,'A-04','S-09',19),(24,7,1,'S-01','S-01',5),(24,8,8,'S-01','S-01',6),(24,29,10,'D-02','S-01',39),(24,43,10,'T-01','S-01',8),(25,1,6,'A-01','S-01',1),(25,35,3,'G-12','S-15',2),(25,48,10,'D-01','S-01',24),(25,54,13,'L-01','S-01',6),(26,2,21,'Y-01','S-01',4),(26,9,9,'Y-01','S-01',5),(26,31,7,'K-01','S-01',30),(26,48,24,'K-05','S-02',21),(26,50,1,'G-02','S-12',14),(27,3,2,'A-01','S-01',7),(27,10,10,'G-01','S-01',8),(27,36,3,'G-01','S-01',8),(27,38,11,'G-03','S-01',5),(27,50,1,'D-02','S-11',14),(28,5,21,'B-09','S-03',8),(28,11,2,'H-01','S-01',11),(28,20,20,'T-01','S-01',43),(28,60,4,'G-01','S-01',19),(29,11,11,'T-01','S-01',35),(29,12,10,'C-08','S-04',5),(29,20,24,'T-01','S-01',35),(29,36,14,'G-01','S-01',3),(29,48,3,'G-02','S-01',4),(30,18,12,'L-01','S-01',13),(30,29,13,'T-01','S-01',38),(30,31,7,'K-01','S-01',39),(30,55,1,'A-03','S-01',4),(31,1,4,'A-01','S-04',8),(31,7,11,'B-01','S-01',5),(31,10,1,'Y-01','S-01',7),(31,14,14,'L-01','S-01',9),(31,19,19,'T-10','S-05',17),(32,5,2,'O-01','S-01',15),(32,13,10,'L-01','S-01',6),(32,23,10,'O-01','S-01',15),(32,30,20,'K-05','S-02',29),(32,60,3,'G-15','S-10',4),(33,1,1,'A-02','S-01',5),(33,2,27,'Y-01','S-01',5),(33,5,21,'B-02','S-03',12),(33,13,7,'L-01','S-01',4),(33,25,18,'D-01','S-01',20),(34,6,2,'S-01','S-01',4),(34,15,10,'L-03','S-02',14),(34,27,20,'D-01','S-01',40),(34,40,8,'K-01','S-11',11),(34,45,12,'K-01','S-01',19),(35,1,9,'S-01','S-01',4),(35,2,4,'A-01','S-04',10),(35,12,11,'C-01','S-01',7),(35,35,9,'G-01','S-01',1),(35,49,4,'A-05','S-04',22),(36,1,20,'A-01','S-01',5),(36,10,5,'B-05','S-03',8),(36,15,13,'L-01','S-01',18),(36,22,2,'O-01','S-01',10),(36,33,10,'K-01','S-01',19),(36,44,3,'L-01','S-01',15);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `store_name` varchar(45) NOT NULL,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `phone` (`phone`),
  CONSTRAINT `chk_store_phone` CHECK ((((`phone` like _utf8mb4'05%') or (`phone` like _utf8mb4'02%')) and (char_length(`phone`) = 11)))
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Istanbul','02123740908','IKEA - Kartal Franchise'),(2,'Istanbul','02122345678','IKEA - Maslak Center'),(3,'Istanbul','02123456789','IKEA - Avcılar Branch'),(4,'Istanbul','02164567890','IKEA - Bagdat Street'),(5,'Istanbul','02125678901','IKEA - Besiktas'),(6,'Ankara','05383112233','IKEA - Ankara Mamak'),(7,'Ankara','05384115566','IKEA - Cankaya'),(8,'Ankara','05385114477','IKEA - Bilkent Franchise'),(9,'Izmir','02326118899','IKEA - Izmir Bornova'),(10,'Izmir','02327110011','IKEA - Karsiyaka'),(11,'Bursa','02248112233','IKEA - Bursa Osmangazi'),(12,'Bursa','02249113344','IKEA - Nilufer'),(13,'Antalya','02421112233','IKEA - Antalya Kepez'),(14,'Antalya','02422223344','IKEA - Muratpasa'),(15,'Adana','05063334455','IKEA - Seyhan'),(16,'Adana','05064445566','IKEA - Cukurova'),(17,'Mugla','02525556677','IKEA - Bodrum'),(18,'Mugla','02526667788','IKEA - Marmaris'),(19,'Eskisehir','02227778899','IKEA - Tepebasi'),(20,'Zonguldak','05318889900','IKEA - Eregli'),(21,'Zonguldak','05318889967','IKEA - Devrek Franchise'),(22,'Istanbul','02129990011','IKEA - Istinye'),(23,'Istanbul','02161112244','IKEA - Atasehir'),(24,'Istanbul','02122223355','IKEA - Beyoglu'),(25,'Ankara','05383334466','IKEA - Kizilay'),(26,'Izmir','02324445577','IKEA - Alsancak'),(27,'Bursa','02245556688','IKEA - Mudanya'),(28,'Antalya','02426667799','IKEA - Konyaalti'),(29,'Istanbul','02127778800','IKEA - Sariyer'),(30,'Istanbul','02168889911','IKEA - Kadikoy'),(31,'Istanbul','02120001122','IKEA - Bakirkoy'),(32,'Istanbul','02165551122','IKEA - Maltepe Piazza'),(33,'Istanbul','02126663344','IKEA - Vadi Istanbul'),(34,'Ankara','02312777889','IKEA - Gordion Mall'),(35,'Izmir','02328880011','IKEA - Agora AVM'),(36,'Bursa','02249995566','IKEA - Korupark');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `stores_and_employees`
--

DROP TABLE IF EXISTS `stores_and_employees`;
/*!50001 DROP VIEW IF EXISTS `stores_and_employees`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `stores_and_employees` AS SELECT 
 1 AS `store_name`,
 1 AS `city`,
 1 AS `phone`,
 1 AS `CONCAT(e.first_name, ' ', e.last_name)`,
 1 AS `role`,
 1 AS `is_active`,
 1 AS `DATEDIFF(CURRENT_DATE, e.employment_date)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `zonguldak_stores_and_products`
--

DROP TABLE IF EXISTS `zonguldak_stores_and_products`;
/*!50001 DROP VIEW IF EXISTS `zonguldak_stores_and_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `zonguldak_stores_and_products` AS SELECT 
 1 AS `store_name`,
 1 AS `city`,
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `color_name`,
 1 AS `quantity_on_hand`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `adana_stores_and_products`
--

/*!50001 DROP VIEW IF EXISTS `adana_stores_and_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `adana_stores_and_products` AS select `st`.`store_name` AS `store_name`,`st`.`city` AS `city`,`p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`color_name` AS `color_name`,`s`.`quantity_on_hand` AS `quantity_on_hand` from ((((`product` `p` join `product_color` `pc` on((`p`.`product_id` = `pc`.`product_id`))) join `color` `c` on((`pc`.`color_id` = `c`.`color_id`))) join `stock` `s` on(((`s`.`product_id` = `p`.`product_id`) and (`s`.`color_id` = `c`.`color_id`)))) join `store` `st` on((`st`.`store_id` = `s`.`store_id`))) where (`st`.`city` = 'Adana') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `all_orders`
--

/*!50001 DROP VIEW IF EXISTS `all_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_orders` AS select `co`.`order_id` AS `order_id`,`co`.`order_date` AS `order_date`,`co`.`order_status` AS `order_status`,`s`.`store_name` AS `store_name`,`s`.`city` AS `store_city`,concat(`c`.`first_name`,' ',`c`.`last_name`) AS `full_name`,`d`.`planned_delivery_date` AS `planned_delivery_date`,`d`.`delivery_status` AS `delivery_status`,concat(`p`.`product_name`,'/',`cl`.`color_name`) AS `product_and_color`,`op`.`quantity` AS `quantity`,`p`.`unit_price` AS `unit_price`,(`op`.`quantity` * `p`.`unit_price`) AS `product_amount`,`pa`.`amount` AS `order_total` from (((((((`customer_order` `co` join `order_product` `op` on((`co`.`order_id` = `op`.`order_id`))) join `product` `p` on((`p`.`product_id` = `op`.`product_id`))) join `color` `cl` on((`cl`.`color_id` = `op`.`color_id`))) join `payment` `pa` on((`pa`.`order_id` = `co`.`order_id`))) join `delivery` `d` on((`d`.`order_id` = `co`.`order_id`))) join `customer` `c` on((`c`.`customer_id` = `co`.`customer_id`))) join `store` `s` on((`s`.`store_id` = `co`.`store_id`))) order by `co`.`order_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ankara_stores_and_products`
--

/*!50001 DROP VIEW IF EXISTS `ankara_stores_and_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ankara_stores_and_products` AS select `st`.`store_name` AS `store_name`,`st`.`city` AS `city`,`p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`color_name` AS `color_name`,`s`.`quantity_on_hand` AS `quantity_on_hand` from ((((`product` `p` join `product_color` `pc` on((`p`.`product_id` = `pc`.`product_id`))) join `color` `c` on((`pc`.`color_id` = `c`.`color_id`))) join `stock` `s` on(((`s`.`product_id` = `p`.`product_id`) and (`s`.`color_id` = `c`.`color_id`)))) join `store` `st` on((`st`.`store_id` = `s`.`store_id`))) where (`st`.`city` = 'Ankara') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `antalya_stores_and_products`
--

/*!50001 DROP VIEW IF EXISTS `antalya_stores_and_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `antalya_stores_and_products` AS select `st`.`store_name` AS `store_name`,`st`.`city` AS `city`,`p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`color_name` AS `color_name`,`s`.`quantity_on_hand` AS `quantity_on_hand` from ((((`product` `p` join `product_color` `pc` on((`p`.`product_id` = `pc`.`product_id`))) join `color` `c` on((`pc`.`color_id` = `c`.`color_id`))) join `stock` `s` on(((`s`.`product_id` = `p`.`product_id`) and (`s`.`color_id` = `c`.`color_id`)))) join `store` `st` on((`st`.`store_id` = `s`.`store_id`))) where (`st`.`city` = 'Antalya') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bursa_stores_and_products`
--

/*!50001 DROP VIEW IF EXISTS `bursa_stores_and_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bursa_stores_and_products` AS select `st`.`store_name` AS `store_name`,`st`.`city` AS `city`,`p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`color_name` AS `color_name`,`s`.`quantity_on_hand` AS `quantity_on_hand` from ((((`product` `p` join `product_color` `pc` on((`p`.`product_id` = `pc`.`product_id`))) join `color` `c` on((`pc`.`color_id` = `c`.`color_id`))) join `stock` `s` on(((`s`.`product_id` = `p`.`product_id`) and (`s`.`color_id` = `c`.`color_id`)))) join `store` `st` on((`st`.`store_id` = `s`.`store_id`))) where (`st`.`city` = 'Bursa') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `eskisehir_stores_and_products`
--

/*!50001 DROP VIEW IF EXISTS `eskisehir_stores_and_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `eskisehir_stores_and_products` AS select `st`.`store_name` AS `store_name`,`st`.`city` AS `city`,`p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`color_name` AS `color_name`,`s`.`quantity_on_hand` AS `quantity_on_hand` from ((((`product` `p` join `product_color` `pc` on((`p`.`product_id` = `pc`.`product_id`))) join `color` `c` on((`pc`.`color_id` = `c`.`color_id`))) join `stock` `s` on(((`s`.`product_id` = `p`.`product_id`) and (`s`.`color_id` = `c`.`color_id`)))) join `store` `st` on((`st`.`store_id` = `s`.`store_id`))) where (`st`.`city` = 'Eskişehir') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `istanbul_stores_and_products`
--

/*!50001 DROP VIEW IF EXISTS `istanbul_stores_and_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `istanbul_stores_and_products` AS select `st`.`store_name` AS `store_name`,`st`.`city` AS `city`,`p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`color_name` AS `color_name`,`s`.`quantity_on_hand` AS `quantity_on_hand` from ((((`product` `p` join `product_color` `pc` on((`p`.`product_id` = `pc`.`product_id`))) join `color` `c` on((`pc`.`color_id` = `c`.`color_id`))) join `stock` `s` on(((`s`.`product_id` = `p`.`product_id`) and (`s`.`color_id` = `c`.`color_id`)))) join `store` `st` on((`st`.`store_id` = `s`.`store_id`))) where (`st`.`city` = 'İstanbul') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `izmir_stores_and_products`
--

/*!50001 DROP VIEW IF EXISTS `izmir_stores_and_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `izmir_stores_and_products` AS select `st`.`store_name` AS `store_name`,`st`.`city` AS `city`,`p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`color_name` AS `color_name`,`s`.`quantity_on_hand` AS `quantity_on_hand` from ((((`product` `p` join `product_color` `pc` on((`p`.`product_id` = `pc`.`product_id`))) join `color` `c` on((`pc`.`color_id` = `c`.`color_id`))) join `stock` `s` on(((`s`.`product_id` = `p`.`product_id`) and (`s`.`color_id` = `c`.`color_id`)))) join `store` `st` on((`st`.`store_id` = `s`.`store_id`))) where (`st`.`city` = 'İzmir') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mugla_stores_and_products`
--

/*!50001 DROP VIEW IF EXISTS `mugla_stores_and_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mugla_stores_and_products` AS select `st`.`store_name` AS `store_name`,`st`.`city` AS `city`,`p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`color_name` AS `color_name`,`s`.`quantity_on_hand` AS `quantity_on_hand` from ((((`product` `p` join `product_color` `pc` on((`p`.`product_id` = `pc`.`product_id`))) join `color` `c` on((`pc`.`color_id` = `c`.`color_id`))) join `stock` `s` on(((`s`.`product_id` = `p`.`product_id`) and (`s`.`color_id` = `c`.`color_id`)))) join `store` `st` on((`st`.`store_id` = `s`.`store_id`))) where (`st`.`city` = 'Muğla') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stores_and_employees`
--

/*!50001 DROP VIEW IF EXISTS `stores_and_employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stores_and_employees` AS select `s`.`store_name` AS `store_name`,`s`.`city` AS `city`,`s`.`phone` AS `phone`,concat(`e`.`first_name`,' ',`e`.`last_name`) AS `CONCAT(e.first_name, ' ', e.last_name)`,`e`.`role` AS `role`,`e`.`is_active` AS `is_active`,(to_days(curdate()) - to_days(`e`.`employment_date`)) AS `DATEDIFF(CURRENT_DATE, e.employment_date)` from (`store` `s` join `employee` `e` on((`e`.`store_id` = `s`.`store_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `zonguldak_stores_and_products`
--

/*!50001 DROP VIEW IF EXISTS `zonguldak_stores_and_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `zonguldak_stores_and_products` AS select `st`.`store_name` AS `store_name`,`st`.`city` AS `city`,`p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`c`.`color_name` AS `color_name`,`s`.`quantity_on_hand` AS `quantity_on_hand` from ((((`product` `p` join `product_color` `pc` on((`p`.`product_id` = `pc`.`product_id`))) join `color` `c` on((`pc`.`color_id` = `c`.`color_id`))) join `stock` `s` on(((`s`.`product_id` = `p`.`product_id`) and (`s`.`color_id` = `c`.`color_id`)))) join `store` `st` on((`st`.`store_id` = `s`.`store_id`))) where (`st`.`city` = 'Zonguldak') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-11 22:25:40
