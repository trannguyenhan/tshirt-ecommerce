-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce_tshirt
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `date_time` timestamp NULL DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (2,1,'2022-03-17 09:04:26',800000,'2022-03-17 09:04:26','2022-03-17 09:04:26','pending'),(3,1,'2022-03-22 09:58:28',501233,'2022-03-22 09:58:28','2022-03-22 09:58:28','pending'),(4,1,'2022-03-22 09:59:25',501233,'2022-03-22 09:59:25','2022-03-22 09:59:25','pending'),(5,1,'2022-03-22 09:59:46',123,'2022-03-22 09:59:46','2022-03-22 09:59:46','pending'),(6,2,'2022-03-24 07:26:00',373726,'2022-03-24 07:26:00','2022-10-28 11:58:56','delivering'),(7,2,'2022-03-24 07:28:06',120000,'2022-03-24 07:28:06','2022-03-24 07:28:06','pending'),(8,2,'2022-03-24 08:54:22',4400000,'2022-03-24 08:54:22','2022-03-24 08:54:22','pending'),(9,1,'2022-03-25 06:51:51',120000,'2022-03-25 06:51:51','2022-03-25 06:51:51','pending'),(10,2,'2022-03-25 06:54:42',123,'2022-03-25 06:54:42','2022-03-25 06:54:42','pending'),(11,1,'2022-03-26 09:32:39',240000,'2022-03-26 09:32:39','2022-03-26 09:32:39','pending');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'Coolmate','brands/October2022/gsuT8PwQrRiTwsdf2u1K.png','2022-10-28 01:02:00','2022-10-28 03:50:27'),(2,'YODY','brands/October2022/yaZqsAvT01HvnvwPvfgx.jpg','2022-10-28 01:07:00','2022-10-28 03:47:24'),(3,'UNIQLO','brands/October2022/LQGmKcyfRRxLvOWIEqV1.gif','2022-10-28 01:07:00','2022-10-28 03:47:56'),(4,'LV','brands/October2022/kBawrJYc5zK4tiGy2bsC.jpg','2022-10-28 10:52:31','2022-10-28 10:52:31'),(5,'Versace','brands/October2022/i4qxceyRudwrsB5ZDwVg.png','2022-10-28 10:52:48','2022-10-28 10:52:48');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,1,'Áo mùa đông','ao-mua-dong','2022-10-26 22:31:14','2022-10-28 01:08:34'),(2,NULL,2,'Áo Polo','ao-polo','2022-10-26 22:31:14','2022-10-28 01:08:47'),(3,NULL,3,'Áo Sơ-mi','ao-so-mi','2022-10-28 01:08:59','2022-10-28 01:08:59'),(4,NULL,5,'Quần thể thao','quan-the-thao','2022-10-28 01:09:09','2022-10-28 08:45:20'),(5,NULL,1,'Quần bò','quan-bo','2022-10-28 01:09:17','2022-10-28 01:09:17');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,4,'id','number','ID',1,0,0,0,0,0,'{}',1),(23,4,'parent_id','select_dropdown','Parent',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(24,4,'order','text','Order',1,1,1,1,1,1,'{\"default\":1}',3),(25,4,'name','text','Name',1,1,1,1,1,1,'{}',4),(26,4,'slug','text','Slug',1,1,1,1,1,1,'{\"slugify\":{\"origin\":\"name\"}}',5),(27,4,'created_at','timestamp','Created At',0,0,1,0,0,0,'{}',6),(28,4,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',7),(29,5,'id','number','ID',1,0,0,0,0,0,NULL,1),(30,5,'author_id','text','Author',1,0,1,1,0,1,NULL,2),(31,5,'category_id','text','Category',1,0,1,1,1,0,NULL,3),(32,5,'title','text','Title',1,1,1,1,1,1,NULL,4),(33,5,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,5),(34,5,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,6),(35,5,'image','image','Post Image',0,1,1,1,1,1,'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',7),(36,5,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',8),(37,5,'meta_description','text_area','Meta Description',1,0,1,1,1,1,NULL,9),(38,5,'meta_keywords','text_area','Meta Keywords',1,0,1,1,1,1,NULL,10),(39,5,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',11),(40,5,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,12),(41,5,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,13),(42,5,'seo_title','text','SEO Title',0,1,1,1,1,1,NULL,14),(43,5,'featured','checkbox','Featured',1,1,1,1,1,1,NULL,15),(44,6,'id','number','ID',1,0,0,0,0,0,NULL,1),(45,6,'author_id','text','Author',1,0,0,0,0,0,NULL,2),(46,6,'title','text','Title',1,1,1,1,1,1,NULL,3),(47,6,'excerpt','text_area','Excerpt',1,0,1,1,1,1,NULL,4),(48,6,'body','rich_text_box','Body',1,0,1,1,1,1,NULL,5),(49,6,'slug','text','Slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}',6),(50,6,'meta_description','text','Meta Description',1,0,1,1,1,1,NULL,7),(51,6,'meta_keywords','text','Meta Keywords',1,0,1,1,1,1,NULL,8),(52,6,'status','select_dropdown','Status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(53,6,'created_at','timestamp','Created At',1,1,1,0,0,0,NULL,10),(54,6,'updated_at','timestamp','Updated At',1,0,0,0,0,0,NULL,11),(55,6,'image','image','Page Image',0,1,1,1,1,1,NULL,12),(56,8,'id','text','Id',1,0,0,0,0,0,'{}',1),(57,8,'url_image','image','Url Image',0,1,1,1,1,1,'{}',2),(58,8,'description','text_area','Description',0,1,1,1,1,1,'{}',3),(59,8,'title','text','Title',0,1,1,1,1,1,'{}',4),(60,8,'size','text','Size',0,1,1,1,1,1,'{}',5),(61,8,'material','text','Material',0,1,1,1,1,1,'{}',6),(62,8,'price','text','Price',0,1,1,1,1,1,'{}',7),(63,8,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',8),(64,8,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',9),(65,8,'warehouse','text','Warehouse',0,1,1,1,1,1,'{}',10),(66,8,'brand_id','text','Brand Id',0,0,1,1,1,1,'{}',11),(67,8,'category_id','text','Category Id',0,0,1,1,1,1,'{}',12),(68,8,'product_belongsto_brand_relationship','relationship','brands',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Brand\",\"table\":\"brands\",\"type\":\"belongsTo\",\"column\":\"brand_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"bills\",\"pivot\":\"0\",\"taggable\":\"0\"}',13),(69,8,'product_belongsto_category_relationship','relationship','categories',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"bills\",\"pivot\":\"0\",\"taggable\":\"0\"}',14),(70,9,'id','text','Id',1,0,0,0,0,0,'{}',1),(71,9,'name','text','Name',1,1,1,1,1,1,'{}',2),(72,9,'image','image','Image',0,1,1,1,1,1,'{}',3),(73,9,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',4),(74,9,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',5),(75,10,'id','text','Id',1,0,0,0,0,0,'{}',1),(76,10,'user_id','text','User Id',0,1,1,1,1,1,'{}',2),(77,10,'date_time','timestamp','Date Time',0,1,1,1,1,1,'{}',3),(78,10,'total_price','text','Total Price',0,1,1,1,1,1,'{}',4),(79,10,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',5),(80,10,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(81,10,'status','select_dropdown','Status',0,1,1,1,1,1,'{\"default\":\"pending\",\"options\":{\"pending\":\"Ch\\u1edd x\\u00e1c nh\\u1eadn\",\"delivering\":\"\\u0110ang v\\u1eadn chuy\\u1ec3n\",\"done\":\"\\u0110a giao h\\u00e0ng\"}}',7),(82,10,'bill_hasmany_detail_bill_relationship','relationship','detail_bills',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\DetailBill\",\"table\":\"detail_bills\",\"type\":\"hasMany\",\"column\":\"bill_id\",\"key\":\"id\",\"label\":\"product_id\",\"pivot_table\":\"bills\",\"pivot\":\"0\",\"taggable\":\"0\"}',8),(83,11,'id','text','Id',1,0,0,0,0,0,'{}',1),(84,11,'bill_id','text','Bill Id',0,1,1,1,1,1,'{}',2),(85,11,'product_id','text','Product Id',0,1,1,1,1,1,'{}',3),(86,11,'quantity','text','Quantity',0,1,1,1,1,1,'{}',4),(87,11,'price','text','Price',0,1,1,1,1,1,'{}',5),(88,11,'updated_at','timestamp','Updated At',0,0,0,0,0,0,'{}',6),(89,11,'created_at','timestamp','Created At',0,1,1,1,0,1,'{}',7),(90,11,'detail_bill_belongsto_product_relationship','relationship','products',0,1,1,1,1,1,'{\"model\":\"App\\\\Models\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"bill_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"bills\",\"pivot\":\"0\",\"taggable\":null}',8);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2022-10-26 22:31:12','2022-10-26 22:31:12'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2022-10-26 22:31:12','2022-10-26 22:31:12'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2022-10-26 22:31:12','2022-10-26 22:31:12'),(4,'categories','categories','Category','Categories','voyager-categories','App\\Models\\Category',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}','2022-10-26 22:31:14','2022-10-28 10:19:18'),(5,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','TCG\\Voyager\\Policies\\PostPolicy','','',1,0,NULL,'2022-10-26 22:31:14','2022-10-26 22:31:14'),(6,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page',NULL,'','',1,0,NULL,'2022-10-26 22:31:14','2022-10-26 22:31:14'),(8,'products','products','Product','Products','voyager-basket','App\\Models\\Product',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2022-10-28 00:49:05','2022-10-28 10:19:39'),(9,'brands','brands','Brand','Brands',NULL,'App\\Models\\Brand',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2022-10-28 00:57:23','2022-10-28 00:57:23'),(10,'bills','bills','Bill','Bills',NULL,'App\\Models\\Bill',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2022-10-28 11:45:59','2022-10-28 11:58:15'),(11,'detail_bills','detail-bills','Detail Bill','Detail Bills',NULL,'App\\Models\\DetailBill',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}','2022-10-28 11:50:52','2022-10-28 11:50:52');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_bills`
--

DROP TABLE IF EXISTS `detail_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_bills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bill_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_bills`
--

LOCK TABLES `detail_bills` WRITE;
/*!40000 ALTER TABLE `detail_bills` DISABLE KEYS */;
INSERT INTO `detail_bills` VALUES (1,2,1,2,200000,'2022-03-17 09:04:26','2022-03-17 09:04:26'),(2,2,2,3,600000,'2022-03-17 09:04:26','2022-03-17 09:04:26'),(3,3,1,5,500000,'2022-03-22 09:58:28','2022-03-22 09:58:28'),(4,3,5,1,1233,'2022-03-22 09:58:28','2022-03-22 09:58:28'),(5,4,1,5,500000,'2022-03-22 09:59:25','2022-03-22 09:59:25'),(6,4,5,1,1233,'2022-03-22 09:59:25','2022-03-22 09:59:25'),(7,5,6,1,123,'2022-03-22 09:59:46','2022-03-22 09:59:46'),(8,6,1,1,100000,'2022-03-24 07:26:07','2022-03-24 07:26:07'),(9,6,5,222,273726,'2022-03-24 07:26:07','2022-03-24 07:26:07'),(10,7,3,1,120000,'2022-03-24 07:28:06','2022-03-24 07:28:06'),(11,8,2,22,4400000,'2022-03-24 08:54:22','2022-03-24 08:54:22'),(12,9,3,1,120000,'2022-03-25 06:51:51','2022-03-25 06:51:51'),(13,10,6,1,123,'2022-03-25 06:54:42','2022-03-25 06:54:42'),(14,11,3,2,240000,'2022-03-26 09:32:39','2022-03-26 09:32:39');
/*!40000 ALTER TABLE `detail_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned DEFAULT NULL,
  `name` text,
  `url` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (2,NULL,'http://localhost:8000/uploads/change the number of sensor _ change K experiment (1).png'),(4,NULL,'http://localhost:8000/uploads/deparis.jpg'),(5,NULL,'http://localhost:8000/uploads/demenejar-white-bg.png');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','','_self','voyager-boat',NULL,NULL,1,'2022-10-26 22:31:13','2022-10-26 22:31:13','voyager.dashboard',NULL),(2,1,'Media','','_self','voyager-images',NULL,NULL,5,'2022-10-26 22:31:13','2022-10-26 22:31:13','voyager.media.index',NULL),(3,1,'Users','','_self','voyager-person',NULL,NULL,3,'2022-10-26 22:31:13','2022-10-26 22:31:13','voyager.users.index',NULL),(4,1,'Roles','','_self','voyager-lock',NULL,NULL,2,'2022-10-26 22:31:13','2022-10-26 22:31:13','voyager.roles.index',NULL),(5,1,'Tools','','_self','voyager-tools',NULL,NULL,15,'2022-10-26 22:31:13','2022-10-26 22:31:13',NULL,NULL),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,10,'2022-10-26 22:31:13','2022-10-26 22:31:13','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,11,'2022-10-26 22:31:13','2022-10-26 22:31:13','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,12,'2022-10-26 22:31:13','2022-10-26 22:31:13','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,13,'2022-10-26 22:31:13','2022-10-26 22:31:13','voyager.bread.index',NULL),(10,1,'Settings','','_self','voyager-settings',NULL,NULL,14,'2022-10-26 22:31:13','2022-10-26 22:31:13','voyager.settings.index',NULL),(11,1,'Categories','','_self','voyager-categories',NULL,NULL,8,'2022-10-26 22:31:14','2022-10-26 22:31:14','voyager.categories.index',NULL),(12,1,'Posts','','_self','voyager-news',NULL,NULL,6,'2022-10-26 22:31:14','2022-10-26 22:31:14','voyager.posts.index',NULL),(13,1,'Pages','','_self','voyager-file-text',NULL,NULL,7,'2022-10-26 22:31:15','2022-10-26 22:31:15','voyager.pages.index',NULL),(14,1,'Products','','_self','voyager-shop',NULL,NULL,9,'2022-10-28 00:49:05','2022-10-28 00:49:05','voyager.products.index',NULL),(15,1,'Brands','','_self','voyager-basket',NULL,NULL,9,'2022-10-28 00:57:23','2022-10-28 00:57:23','voyager.brands.index',NULL),(16,1,'Bills','','_self','voyager-receipt',NULL,NULL,9,'2022-10-28 11:45:59','2022-10-28 11:45:59','voyager.bills.index',NULL),(17,1,'Detail Bills','','_self','voyager-buy',NULL,NULL,9,'2022-10-28 11:50:52','2022-10-28 11:50:52','voyager.detail-bills.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2022-10-26 22:31:12','2022-10-26 22:31:12');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_01_01_000000_add_voyager_user_fields',1),(4,'2016_01_01_000000_create_data_types_table',1),(5,'2016_05_19_173453_create_menu_table',1),(6,'2016_10_21_190000_create_roles_table',1),(7,'2016_10_21_190000_create_settings_table',1),(8,'2016_11_30_135954_create_permission_table',1),(9,'2016_11_30_141208_create_permission_role_table',1),(10,'2016_12_26_201236_data_types__add__server_side',1),(11,'2017_01_13_000000_add_route_to_menu_items_table',1),(12,'2017_01_14_005015_create_translations_table',1),(13,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(14,'2017_03_06_000000_add_controller_to_data_types_table',1),(15,'2017_04_21_000000_add_order_to_data_rows_table',1),(16,'2017_07_05_210000_add_policyname_to_data_types_table',1),(17,'2017_08_05_000000_add_group_to_settings_table',1),(18,'2017_11_26_013050_add_user_role_relationship',1),(19,'2017_11_26_015000_create_user_roles_table',1),(20,'2018_03_11_000000_add_user_settings',1),(21,'2018_03_14_000000_add_details_to_data_types_table',1),(22,'2018_03_16_000000_make_settings_value_nullable',1),(23,'2019_08_19_000000_create_failed_jobs_table',1),(24,'2019_12_14_000001_create_personal_access_tokens_table',1),(25,'2016_01_01_000000_create_pages_table',2),(26,'2016_01_01_000000_create_posts_table',2),(27,'2016_02_15_204651_create_categories_table',2),(28,'2017_04_11_000000_alter_post_nullable_fields_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,0,'Hello World','Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.','<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','pages/page1.jpg','hello-world','Yar Meta Description','Keyword1, Keyword2','ACTIVE','2022-10-26 22:31:15','2022-10-26 22:31:15');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2022-10-26 22:31:13','2022-10-26 22:31:13'),(2,'browse_bread',NULL,'2022-10-26 22:31:13','2022-10-26 22:31:13'),(3,'browse_database',NULL,'2022-10-26 22:31:13','2022-10-26 22:31:13'),(4,'browse_media',NULL,'2022-10-26 22:31:13','2022-10-26 22:31:13'),(5,'browse_compass',NULL,'2022-10-26 22:31:13','2022-10-26 22:31:13'),(6,'browse_menus','menus','2022-10-26 22:31:13','2022-10-26 22:31:13'),(7,'read_menus','menus','2022-10-26 22:31:13','2022-10-26 22:31:13'),(8,'edit_menus','menus','2022-10-26 22:31:13','2022-10-26 22:31:13'),(9,'add_menus','menus','2022-10-26 22:31:13','2022-10-26 22:31:13'),(10,'delete_menus','menus','2022-10-26 22:31:13','2022-10-26 22:31:13'),(11,'browse_roles','roles','2022-10-26 22:31:13','2022-10-26 22:31:13'),(12,'read_roles','roles','2022-10-26 22:31:13','2022-10-26 22:31:13'),(13,'edit_roles','roles','2022-10-26 22:31:13','2022-10-26 22:31:13'),(14,'add_roles','roles','2022-10-26 22:31:13','2022-10-26 22:31:13'),(15,'delete_roles','roles','2022-10-26 22:31:13','2022-10-26 22:31:13'),(16,'browse_users','users','2022-10-26 22:31:13','2022-10-26 22:31:13'),(17,'read_users','users','2022-10-26 22:31:13','2022-10-26 22:31:13'),(18,'edit_users','users','2022-10-26 22:31:13','2022-10-26 22:31:13'),(19,'add_users','users','2022-10-26 22:31:13','2022-10-26 22:31:13'),(20,'delete_users','users','2022-10-26 22:31:13','2022-10-26 22:31:13'),(21,'browse_settings','settings','2022-10-26 22:31:13','2022-10-26 22:31:13'),(22,'read_settings','settings','2022-10-26 22:31:13','2022-10-26 22:31:13'),(23,'edit_settings','settings','2022-10-26 22:31:13','2022-10-26 22:31:13'),(24,'add_settings','settings','2022-10-26 22:31:13','2022-10-26 22:31:13'),(25,'delete_settings','settings','2022-10-26 22:31:13','2022-10-26 22:31:13'),(26,'browse_categories','categories','2022-10-26 22:31:14','2022-10-26 22:31:14'),(27,'read_categories','categories','2022-10-26 22:31:14','2022-10-26 22:31:14'),(28,'edit_categories','categories','2022-10-26 22:31:14','2022-10-26 22:31:14'),(29,'add_categories','categories','2022-10-26 22:31:14','2022-10-26 22:31:14'),(30,'delete_categories','categories','2022-10-26 22:31:14','2022-10-26 22:31:14'),(31,'browse_posts','posts','2022-10-26 22:31:14','2022-10-26 22:31:14'),(32,'read_posts','posts','2022-10-26 22:31:14','2022-10-26 22:31:14'),(33,'edit_posts','posts','2022-10-26 22:31:14','2022-10-26 22:31:14'),(34,'add_posts','posts','2022-10-26 22:31:14','2022-10-26 22:31:14'),(35,'delete_posts','posts','2022-10-26 22:31:14','2022-10-26 22:31:14'),(36,'browse_pages','pages','2022-10-26 22:31:15','2022-10-26 22:31:15'),(37,'read_pages','pages','2022-10-26 22:31:15','2022-10-26 22:31:15'),(38,'edit_pages','pages','2022-10-26 22:31:15','2022-10-26 22:31:15'),(39,'add_pages','pages','2022-10-26 22:31:15','2022-10-26 22:31:15'),(40,'delete_pages','pages','2022-10-26 22:31:15','2022-10-26 22:31:15'),(41,'browse_products','products','2022-10-28 00:49:05','2022-10-28 00:49:05'),(42,'read_products','products','2022-10-28 00:49:05','2022-10-28 00:49:05'),(43,'edit_products','products','2022-10-28 00:49:05','2022-10-28 00:49:05'),(44,'add_products','products','2022-10-28 00:49:05','2022-10-28 00:49:05'),(45,'delete_products','products','2022-10-28 00:49:05','2022-10-28 00:49:05'),(46,'browse_brands','brands','2022-10-28 00:57:23','2022-10-28 00:57:23'),(47,'read_brands','brands','2022-10-28 00:57:23','2022-10-28 00:57:23'),(48,'edit_brands','brands','2022-10-28 00:57:23','2022-10-28 00:57:23'),(49,'add_brands','brands','2022-10-28 00:57:23','2022-10-28 00:57:23'),(50,'delete_brands','brands','2022-10-28 00:57:23','2022-10-28 00:57:23'),(51,'browse_bills','bills','2022-10-28 11:45:59','2022-10-28 11:45:59'),(52,'read_bills','bills','2022-10-28 11:45:59','2022-10-28 11:45:59'),(53,'edit_bills','bills','2022-10-28 11:45:59','2022-10-28 11:45:59'),(54,'add_bills','bills','2022-10-28 11:45:59','2022-10-28 11:45:59'),(55,'delete_bills','bills','2022-10-28 11:45:59','2022-10-28 11:45:59'),(56,'browse_detail_bills','detail_bills','2022-10-28 11:50:52','2022-10-28 11:50:52'),(57,'read_detail_bills','detail_bills','2022-10-28 11:50:52','2022-10-28 11:50:52'),(58,'edit_detail_bills','detail_bills','2022-10-28 11:50:52','2022-10-28 11:50:52'),(59,'add_detail_bills','detail_bills','2022-10-28 11:50:52','2022-10-28 11:50:52'),(60,'delete_detail_bills','detail_bills','2022-10-28 11:50:52','2022-10-28 11:50:52');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,0,NULL,'Lorem Ipsum Post',NULL,'This is the excerpt for the Lorem Ipsum Post','<p>This is the body of the lorem ipsum post</p>','posts/post1.jpg','lorem-ipsum-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2022-10-26 22:31:14','2022-10-26 22:31:14'),(2,0,NULL,'My Sample Post',NULL,'This is the excerpt for the sample Post','<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>','posts/post2.jpg','my-sample-post','Meta Description for sample post','keyword1, keyword2, keyword3','PUBLISHED',0,'2022-10-26 22:31:14','2022-10-26 22:31:14'),(3,0,NULL,'Latest Post',NULL,'This is the excerpt for the latest post','<p>This is the body for the latest post</p>','posts/post3.jpg','latest-post','This is the meta description','keyword1, keyword2, keyword3','PUBLISHED',0,'2022-10-26 22:31:14','2022-10-26 22:31:14'),(4,0,NULL,'Yarr Post',NULL,'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.','<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>','posts/post4.jpg','yarr-post','this be a meta descript','keyword1, keyword2, keyword3','PUBLISHED',0,'2022-10-26 22:31:14','2022-10-26 22:31:14');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url_image` varchar(1000) DEFAULT NULL,
  `description` text,
  `title` varchar(100) DEFAULT NULL,
  `size` varchar(500) DEFAULT NULL,
  `material` varchar(500) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `warehouse` int DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'products/October2022/vRIRkgDqX4eUvgAHLPrx.jpg','- Chất liệu: 60% Cotton + 35% Polyester + 5% Spandex\r\n- Mềm mại và không gây khó chịu khi mặc\r\n- Chất liệu co giãn 4 chiều đem lại sự thoải mái suốt ngày dài','Áo Hoodie nam Daily Wear (mũ trùm có dây rút)','\"XL,M,L\"','60% Cotton + 35% Polyester + 5% Spandex',394000,'2022-03-16 08:26:00','2022-10-28 08:51:41',100,1,1),(2,'products/October2022/te2fNHUL0FUVl7hPoMEK.jpg','- Chất liệu: 50% Modal (gỗ sồi), 42% Cotton, 8% Spandex\r\n- Ưu điểm của Cotton Modal: kháng khuẩn, giữ nhiệt, mềm mại và co giãn\r\n- Thoáng khí và hút ẩm tốt đem đến cảm giác thoải mái khi mặc\r\n- Tay dài và cổ cao 3 cm phù hợp với mùa đông','Áo giữ nhiệt nam Modal Ultra Warm - mặc là ấm, thoáng khí','\"XL,M,L\"','50% Modal (gỗ sồi), 42% Cotton, 8% Spandex',289000,'2022-03-16 08:27:00','2022-10-28 11:23:55',98,1,1),(3,'products/October2022/zotWjQLqkWJ88DWxyKhr.jpg','- Chất liệu: 100% Polyester kết hợp tính năng: Wicking (Thấm hút nhanh), 4-way Mechanical stretch (Co giãn 4 chiều) và Quick-Dry (Nhanh khô)\r\n- Vải siêu nhẹ chỉ 106 gsm, mang lại cảm giác mặc như không mặc','Quần short nam thể thao Movement 7\" co giãn','\"M,L\"','Polyester',239000,'2022-03-19 09:48:00','2022-10-28 11:37:11',97,1,4),(4,'products/October2022/mykau9PvLDQM0NBduq2V.jpg','- Chất liệu 100% Polyester có thêm công nghệ HeiQ Viro Block\r\n- Áo được thiết kế với kiểu tay Raglan, cổ tay có chun ôm gọn gàng\r\n- Có 4 túi ở thân trước, 2 túi ngoài và 2 túi trong có khóa kéo an toàn\r\n- Người mẫu: 1m75, 69kg * Mặc áo XL, quần L\r\n- Tự hào sản xuất tại Việt Nam','Áo khoác nam có mũ Daily Wear - trượt nước, chống UV 99%','\"M,L,XL\"','Polyester',449000,'2022-03-19 09:48:00','2022-10-28 08:42:46',11,1,1),(5,'products/October2022/RA6oMLC8okngorCpwkrZ.png','- Chất liệu: 97% Cotton USA + 3% Spandex\r\n- Với chất liệu Cotton USA chất lượng cao, mang lại sự mềm mại và thấm hút mồ hôi tốt\r\n- Co giãn 4 chiều mang lại sự thoải mái khi mặc','Áo Polo nam Pique Cotton USA thấm hút tối đa (kẻ sọc)','\"M,L,XL\"','Cotton',299000,'2022-03-22 08:43:00','2022-10-28 08:40:51',123,1,2),(6,'products/October2022/TV5LgLDoliffRuDXzYfx.jpg','Áo sơ mi vải dạ mềm mại và thoải mái. Mẫu caro đặc trưng theo phong cách JW Anderson.','Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay','\"L,M,XL\"','100% Bông',784000,'2022-03-22 08:45:00','2022-10-28 11:33:29',999,3,3),(7,'products/October2022/vHoLNHkiM5jvDGFptqMZ.jpg','Áo sơ mi vải dạ mềm mại và thoải mái. Họa tiết caro kết hợp với phong cách JW Anderson đặc trưng.','Áo Sơ Mi Vải Dạ Kẻ Caro Dài Tay','\"XL,M,L\"','100% Bông',700000,'2022-03-25 06:53:00','2022-10-28 08:35:17',100,3,3),(8,'products/October2022/D3q0Osvy8g67pzvdr7tu.jpg','- Áo nỉ thu đông với hình thêu coffee với thiết kế đôi ấn tượng\r\n- Form dáng suông rộng giúp tạo sự cử động thoải mái cho người mặc','Áo Đôi - Áo Nỉ Thu Đông Thêu COFFEE','\"XL,L,M\"','nỉ',180000,'2022-03-25 09:42:00','2022-10-28 03:50:51',111,2,1),(9,'products/October2022/ez9PPKGnO1i0f4wz3kv3.jpg','- Công nghệ làm mát Freezing giúp tạo lá chắn bảo vệ cơ thể khỏi môi trường bên ngoài\r\n- Sợi Polyamide chiếm 85% giúp tạo cảm giác thoải mái, dễ chịu khi mặc.','Áo Polo Nữ Airycool Thoáng Mát Phối Bo','\"M,L\"','Sợi Polyamide',180000,'2022-03-26 09:24:00','2022-10-28 03:17:36',12,2,2),(10,'products/October2022/4mEKGwajbiLnAvac10Px.jpg','- Áo phao Nam SIÊU ẤM, cấu trúc 3 lớp chắc chắn\r\n- Khả năng giữ ấm tốt giúp bảo vệ cơ thể trước mùa đông lạnh giá','Áo Phao Nam VIP 3 Lớp Siêu Ấm, Phom Dáng Trẻ Trung','\"M,XL,L\"','Vải xịn',200000,'2022-03-26 09:38:00','2022-10-28 03:50:44',NULL,2,1),(11,'products/October2022/zk9KbNMQxoojZOEZZd3c.jpg','- Áo thu đông kẻ ngang làm từ chất liệu nỉ co giãn, bề mặt vải mịn\r\n- Áo có khả năng giữ ấm cùng màu mắc thanh lịch\r\n- Thiết kế kẻ ngang tạo điểm nhấn trẻ trung. Phom dáng rộng tạo sự thoải mái khi cử động cho người mặc\r\n- Chiếc áo có thể kết hợp cùng quần nỉ hoặc quần jeans, thích hợp để mặc ở nhà, đi làm và đi chơi','Áo Thun Thu Đông Nam Họa Tiết Kẻ Ngang Hiện Đại','\"L,M,XL\"','In phản quang',120000,'2022-10-27 09:54:00','2022-10-28 03:50:38',10,2,3);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2022-10-26 22:31:13','2022-10-26 22:31:13'),(2,'member','Normal User','2022-10-26 22:31:13','2022-10-26 22:31:13');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','VH4H','','text',1,'Site'),(2,'site.description','Site Description','Đặt sự hài lòng của khách hàng là ưu tiên số 1 trong mọi suy nghĩ hành động của mình','','text',2,'Site'),(3,'site.logo','Site Logo','settings/October2022/5IRJeF6ZjtFTIKrC0jxj.png','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','VH4H','','text',1,'Admin'),(7,'admin.description','Admin Description','Đặt sự hài lòng của khách hàng là ưu tiên số 1 trong mọi suy nghĩ hành động của mình','','text',2,'Admin'),(8,'admin.loader','Admin Loader','settings/October2022/LPHS31wc9BpsA2lBUxcY.png','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','settings/October2022/iQEWstECTV3e6pNhAMZ0.png','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',5,'pt','Post','2022-10-26 22:31:15','2022-10-26 22:31:15'),(2,'data_types','display_name_singular',6,'pt','Página','2022-10-26 22:31:15','2022-10-26 22:31:15'),(3,'data_types','display_name_singular',1,'pt','Utilizador','2022-10-26 22:31:15','2022-10-26 22:31:15'),(4,'data_types','display_name_singular',4,'pt','Categoria','2022-10-26 22:31:15','2022-10-26 22:31:15'),(5,'data_types','display_name_singular',2,'pt','Menu','2022-10-26 22:31:15','2022-10-26 22:31:15'),(6,'data_types','display_name_singular',3,'pt','Função','2022-10-26 22:31:15','2022-10-26 22:31:15'),(7,'data_types','display_name_plural',5,'pt','Posts','2022-10-26 22:31:15','2022-10-26 22:31:15'),(8,'data_types','display_name_plural',6,'pt','Páginas','2022-10-26 22:31:15','2022-10-26 22:31:15'),(9,'data_types','display_name_plural',1,'pt','Utilizadores','2022-10-26 22:31:15','2022-10-26 22:31:15'),(10,'data_types','display_name_plural',4,'pt','Categorias','2022-10-26 22:31:15','2022-10-26 22:31:15'),(11,'data_types','display_name_plural',2,'pt','Menus','2022-10-26 22:31:15','2022-10-26 22:31:15'),(12,'data_types','display_name_plural',3,'pt','Funções','2022-10-26 22:31:15','2022-10-26 22:31:15'),(13,'categories','slug',1,'pt','categoria-1','2022-10-26 22:31:15','2022-10-26 22:31:15'),(14,'categories','name',1,'pt','Categoria 1','2022-10-26 22:31:15','2022-10-26 22:31:15'),(15,'categories','slug',2,'pt','categoria-2','2022-10-26 22:31:15','2022-10-26 22:31:15'),(16,'categories','name',2,'pt','Categoria 2','2022-10-26 22:31:15','2022-10-26 22:31:15'),(17,'pages','title',1,'pt','Olá Mundo','2022-10-26 22:31:15','2022-10-26 22:31:15'),(18,'pages','slug',1,'pt','ola-mundo','2022-10-26 22:31:15','2022-10-26 22:31:15'),(19,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2022-10-26 22:31:15','2022-10-26 22:31:15'),(20,'menu_items','title',1,'pt','Painel de Controle','2022-10-26 22:31:15','2022-10-26 22:31:15'),(21,'menu_items','title',2,'pt','Media','2022-10-26 22:31:15','2022-10-26 22:31:15'),(22,'menu_items','title',12,'pt','Publicações','2022-10-26 22:31:15','2022-10-26 22:31:15'),(23,'menu_items','title',3,'pt','Utilizadores','2022-10-26 22:31:15','2022-10-26 22:31:15'),(24,'menu_items','title',11,'pt','Categorias','2022-10-26 22:31:15','2022-10-26 22:31:15'),(25,'menu_items','title',13,'pt','Páginas','2022-10-26 22:31:15','2022-10-26 22:31:15'),(26,'menu_items','title',4,'pt','Funções','2022-10-26 22:31:15','2022-10-26 22:31:15'),(27,'menu_items','title',5,'pt','Ferramentas','2022-10-26 22:31:15','2022-10-26 22:31:15'),(28,'menu_items','title',6,'pt','Menus','2022-10-26 22:31:15','2022-10-26 22:31:15'),(29,'menu_items','title',7,'pt','Base de dados','2022-10-26 22:31:15','2022-10-26 22:31:15'),(30,'menu_items','title',10,'pt','Configurações','2022-10-26 22:31:15','2022-10-26 22:31:15');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_product`
--

DROP TABLE IF EXISTS `user_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_product` (
  `user_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_product`
--

LOCK TABLES `user_product` WRITE;
/*!40000 ALTER TABLE `user_product` DISABLE KEYS */;
INSERT INTO `user_product` VALUES (1,4,122);
/*!40000 ALTER TABLE `user_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Admin','admin@admin.com','users/default.png',NULL,'$2y$10$Tg.xuxaFhX5mWA4nWEv5f.eibETJhAhPlcTmnJK01XDHNRrjzo0om','eqD9M1SZi44F83zK2Mt1j3C3aQVnBCju44dXFRvSjRKXP4Ot03c5mioH0Wb5',NULL,'2022-10-26 22:31:14','2022-10-26 22:31:14','admin'),(2,2,'shopeevn','shopee@shopee.vn','users/default.png',NULL,'$2y$10$4sqNuwBBREeWlws3QwaWmuupx7PcHOSjAa4kUKjSzURqfF0Io5Rg.',NULL,NULL,'2022-10-26 23:46:13','2022-10-26 23:46:13','shopeevn');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-29 10:09:06
