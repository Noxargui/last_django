-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: quizzdb
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add theme',1,'add_theme'),(2,'Can change theme',1,'change_theme'),(3,'Can delete theme',1,'delete_theme'),(4,'Can view theme',1,'view_theme'),(5,'Can add question',2,'add_question'),(6,'Can change question',2,'change_question'),(7,'Can delete question',2,'delete_question'),(8,'Can view question',2,'view_question'),(9,'Can add log entry',3,'add_logentry'),(10,'Can change log entry',3,'change_logentry'),(11,'Can delete log entry',3,'delete_logentry'),(12,'Can view log entry',3,'view_logentry'),(13,'Can add permission',4,'add_permission'),(14,'Can change permission',4,'change_permission'),(15,'Can delete permission',4,'delete_permission'),(16,'Can view permission',4,'view_permission'),(17,'Can add group',5,'add_group'),(18,'Can change group',5,'change_group'),(19,'Can delete group',5,'delete_group'),(20,'Can view group',5,'view_group'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add content type',7,'add_contenttype'),(26,'Can change content type',7,'change_contenttype'),(27,'Can delete content type',7,'delete_contenttype'),(28,'Can view content type',7,'view_contenttype'),(29,'Can add session',8,'add_session'),(30,'Can change session',8,'change_session'),(31,'Can delete session',8,'delete_session'),(32,'Can view session',8,'view_session'),(33,'Can add choice',9,'add_choice'),(34,'Can change choice',9,'change_choice'),(35,'Can delete choice',9,'delete_choice'),(36,'Can view choice',9,'view_choice');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$XIbKzws687l6ITaUPSrc6W$7hMDgSlxWatPVw361BUvPRTqATzrxCTr6zBcZ6qJazI=','2022-01-25 21:26:19.401598',1,'admin','','','',1,1,'2022-01-24 11:27:50.949654'),(2,'pbkdf2_sha256$320000$38233uwgDlY9RiR6B67w4O$M9isEXXP8nkhOLrpWH5LX1cHrjx0fcRSgMEyjlInKQQ=',NULL,0,'theo','','','',0,1,'2022-01-25 20:53:58.033202'),(3,'pbkdf2_sha256$320000$TRTl3e3A9M6ufBSDfyIMVS$38ZS4mFb1VomwCRWO5tlGRDV5g10aXQ6xMvou3Pouvk=',NULL,0,'nico','','','',0,1,'2022-01-25 21:23:34.780097');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-01-24 11:28:19.047779','1','Kubernetes',1,'[{\"added\": {}}]',1,1),(2,'2022-01-24 11:28:27.551665','2','Django',1,'[{\"added\": {}}]',1,1),(3,'2022-01-24 11:35:32.730752','1','Comment ça se passe Gregoire ?',1,'[{\"added\": {}}]',2,1),(4,'2022-01-24 11:46:36.099086','2','Django',2,'[{\"added\": {\"name\": \"question\", \"object\": \"C\'est comment django ?\"}}]',1,1),(5,'2022-01-24 11:48:53.869356','2','Django',2,'[{\"added\": {\"name\": \"question\", \"object\": \"Nico va s\'en sortir ?\"}}]',1,1),(6,'2022-01-24 12:54:23.870885','1','Kubernetes',2,'[{\"changed\": {\"name\": \"question\", \"object\": \"Comment \\u00e7a se passe Gregoire ?\", \"fields\": [\"Choice text 1\", \"Choice text 2\", \"Choice text 3\", \"Choice text 4\"]}}]',1,1),(7,'2022-01-24 13:01:19.094287','3','Kubernetes',1,'[{\"added\": {}}]',1,1),(8,'2022-01-25 09:29:29.833424','3','Kubernetes',3,'',1,1),(9,'2022-01-25 20:53:58.618721','2','theo',1,'[{\"added\": {}}]',6,1),(10,'2022-01-25 21:27:46.905485','4','admin2',3,'',6,1),(11,'2022-01-25 23:20:35.236333','3','Nico va s\'en sortir ?',2,'[{\"added\": {\"name\": \"choice\", \"object\": \"C\'est en bonne voie\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"C\'est s\\u00fbr\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"Tant qu\'il y a de l\'espoir\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"C\'est cuit\"}}]',2,1),(12,'2022-01-25 23:21:09.754425','2','C\'est comment django ?',2,'[{\"added\": {\"name\": \"choice\", \"object\": \"Top\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"Abominable\"}}]',2,1),(13,'2022-01-25 23:22:03.275030','1','Comment ça se passe Gregoire ?',2,'[{\"added\": {\"name\": \"choice\", \"object\": \"Tendu\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"J\'en vois pas le bout\"}}]',2,1),(14,'2022-01-26 10:25:03.118006','3','Nico va s\'en sortir ?',2,'[{\"changed\": {\"name\": \"choice\", \"object\": \"C\'est cuit\", \"fields\": [\"Votes\"]}}]',2,1),(15,'2022-01-26 10:25:42.615373','3','Nico va s\'en sortir ?',2,'[{\"changed\": {\"name\": \"choice\", \"object\": \"C\'est cuit\", \"fields\": [\"Votes\"]}}]',2,1),(16,'2022-01-26 10:28:16.702295','3','Nico va s\'en sortir ?',2,'[]',2,1),(17,'2022-01-26 10:55:47.477203','2','C\'est comment django ?',2,'[{\"changed\": {\"name\": \"choice\", \"object\": \"Abominable\", \"fields\": [\"Votes\"]}}]',2,1),(18,'2022-01-26 14:19:15.809311','4','Le rolling avance ?',1,'[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"Oui\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"Non\"}}]',2,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (3,'admin','logentry'),(5,'auth','group'),(4,'auth','permission'),(6,'auth','user'),(7,'contenttypes','contenttype'),(9,'quizz','choice'),(2,'quizz','question'),(1,'quizz','theme'),(8,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-01-24 11:27:29.477691'),(2,'auth','0001_initial','2022-01-24 11:27:30.235395'),(3,'admin','0001_initial','2022-01-24 11:27:30.385634'),(4,'admin','0002_logentry_remove_auto_add','2022-01-24 11:27:30.405457'),(5,'admin','0003_logentry_add_action_flag_choices','2022-01-24 11:27:30.425698'),(6,'contenttypes','0002_remove_content_type_name','2022-01-24 11:27:30.527751'),(7,'auth','0002_alter_permission_name_max_length','2022-01-24 11:27:30.576724'),(8,'auth','0003_alter_user_email_max_length','2022-01-24 11:27:30.627679'),(9,'auth','0004_alter_user_username_opts','2022-01-24 11:27:30.645552'),(10,'auth','0005_alter_user_last_login_null','2022-01-24 11:27:30.710056'),(11,'auth','0006_require_contenttypes_0002','2022-01-24 11:27:30.717961'),(12,'auth','0007_alter_validators_add_error_messages','2022-01-24 11:27:30.738603'),(13,'auth','0008_alter_user_username_max_length','2022-01-24 11:27:30.778578'),(14,'auth','0009_alter_user_last_name_max_length','2022-01-24 11:27:30.827783'),(15,'auth','0010_alter_group_name_max_length','2022-01-24 11:27:30.926611'),(16,'auth','0011_update_proxy_permissions','2022-01-24 11:27:30.947647'),(17,'auth','0012_alter_user_first_name_max_length','2022-01-24 11:27:30.993253'),(18,'quizz','0001_initial','2022-01-24 11:27:31.194471'),(19,'quizz','0002_remove_choice_question_remove_question_theme','2022-01-24 11:27:31.510085'),(20,'quizz','0003_delete_choice_delete_question','2022-01-24 11:27:31.545370'),(21,'quizz','0004_question','2022-01-24 11:27:31.628712'),(22,'quizz','0005_choice','2022-01-24 11:27:31.773248'),(23,'quizz','0006_question_question_delete_choice','2022-01-24 11:27:31.844276'),(24,'sessions','0001_initial','2022-01-24 11:27:31.976970'),(25,'quizz','0007_rename_question_question_choice_text','2022-01-24 11:34:46.058860'),(26,'quizz','0008_rename_choice_text_question_choice_text_1_and_more','2022-01-24 11:45:53.674459'),(27,'quizz','0009_remove_question_choice_text_1_and_more','2022-01-25 23:13:49.328839'),(28,'quizz','0010_alter_choice_votes','2022-01-26 10:27:51.805595'),(29,'quizz','0011_choice_selected','2022-01-26 11:09:30.722341');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4cs9sd1fvr5nxxzjackyu48ybt3qi6qg','.eJxVjEEOwiAQRe_C2hBoYZi6dN8zkJkyStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1JnZdXpd2OaHlJ2kO5UblVPtazLzHpX9EGbHmuS5-Vw_w4ytfytQ-qMOADwg0NEH4IVexUk5gHcEAzS5HvrQm9DD8wE0mHyTAhewBr1_gC1fzbN:1nCTKV:9Vdo4N6aDtk_mw68N2oLdc2LktVTXaqysnbCDIuLxtg','2022-02-08 21:26:19.401598'),('qn1w6hork9d1lqu93nngwqeqqwyqfbdm','.eJxVjEEOwiAQRe_C2hBoYZi6dN8zkJkyStVAUtqV8e7apAvd_vfef6lI25rj1mSJc1JnZdXpd2OaHlJ2kO5UblVPtazLzHpX9EGbHmuS5-Vw_w4ytfytQ-qMOADwg0NEH4IVexUk5gHcEAzS5HvrQm9DD8wE0mHyTAhewBr1_gC1fzbN:1nBxW1:Ym8d2GwImb6CDHY2LZqQHFBh9Nn9ZZUIubf9EGXn_HE','2022-02-07 11:28:05.894231');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizz_choice`
--

DROP TABLE IF EXISTS `quizz_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizz_choice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` tinyint(1) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `theme_id` bigint(20) NOT NULL,
  `selected` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quizz_choice_question_id_9f66b91a_fk_quizz_question_id` (`question_id`),
  KEY `quizz_choice_theme_id_ba538630_fk_quizz_theme_id` (`theme_id`),
  CONSTRAINT `quizz_choice_question_id_9f66b91a_fk_quizz_question_id` FOREIGN KEY (`question_id`) REFERENCES `quizz_question` (`id`),
  CONSTRAINT `quizz_choice_theme_id_ba538630_fk_quizz_theme_id` FOREIGN KEY (`theme_id`) REFERENCES `quizz_theme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizz_choice`
--

LOCK TABLES `quizz_choice` WRITE;
/*!40000 ALTER TABLE `quizz_choice` DISABLE KEYS */;
INSERT INTO `quizz_choice` VALUES (1,'C\'est en bonne voie',0,3,2,1),(2,'C\'est sûr',0,3,2,0),(3,'Tant qu\'il y a de l\'espoir',0,3,2,0),(4,'C\'est cuit',1,3,2,0),(5,'Top',0,2,2,0),(6,'Abominable',1,2,2,0),(7,'Tendu',0,1,1,1),(8,'J\'en vois pas le bout',1,1,1,0),(9,'Oui',1,4,1,0),(10,'Non',0,4,1,1);
/*!40000 ALTER TABLE `quizz_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizz_question`
--

DROP TABLE IF EXISTS `quizz_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizz_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `theme_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quizz_question_theme_id_7b9f6425_fk_quizz_theme_id` (`theme_id`),
  CONSTRAINT `quizz_question_theme_id_7b9f6425_fk_quizz_theme_id` FOREIGN KEY (`theme_id`) REFERENCES `quizz_theme` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizz_question`
--

LOCK TABLES `quizz_question` WRITE;
/*!40000 ALTER TABLE `quizz_question` DISABLE KEYS */;
INSERT INTO `quizz_question` VALUES (1,'Comment ça se passe Gregoire ?',1),(2,'C\'est comment django ?',2),(3,'Nico va s\'en sortir ?',2),(4,'Le rolling avance ?',1);
/*!40000 ALTER TABLE `quizz_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizz_theme`
--

DROP TABLE IF EXISTS `quizz_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizz_theme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `theme_text` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizz_theme`
--

LOCK TABLES `quizz_theme` WRITE;
/*!40000 ALTER TABLE `quizz_theme` DISABLE KEYS */;
INSERT INTO `quizz_theme` VALUES (1,'Kubernetes'),(2,'Django');
/*!40000 ALTER TABLE `quizz_theme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-26 16:55:31
