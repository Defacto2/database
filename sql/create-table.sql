-- Adminer 4.8.1 MySQL 8.0.29 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;

DROP DATABASE IF EXISTS `defacto2-inno`;
CREATE DATABASE `defacto2-inno` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `defacto2-inno`;

CREATE TABLE `files` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `uuid` char(36) DEFAULT 'UUID()' COMMENT 'Global identifier',
  `list_relations` varchar(255) DEFAULT NULL COMMENT 'List of associated records',
  `web_id_16colors` varchar(1024) DEFAULT NULL COMMENT 'URI for a 16colo.rs page',
  `web_id_github` varchar(1024) DEFAULT NULL COMMENT 'Id for a GitHub repository',
  `web_id_youtube` char(11) DEFAULT NULL COMMENT 'Id for a related YouTube video',
  `web_id_pouet` int DEFAULT NULL COMMENT 'Id for a Pouët record',
  `web_id_demozoo` int DEFAULT NULL COMMENT 'Id for a Demozoo record',
  `group_brand_for` varchar(100) DEFAULT NULL COMMENT 'Group or brand used to credit the file',
  `group_brand_by` varchar(100) DEFAULT NULL COMMENT 'Optional alternative Group or brand used to credit the file',
  `record_title` varchar(100) DEFAULT NULL COMMENT 'Display title or magazine edition',
  `date_issued_year` smallint DEFAULT NULL COMMENT 'Published date year',
  `date_issued_month` tinyint DEFAULT NULL COMMENT 'Published date month',
  `date_issued_day` tinyint DEFAULT NULL COMMENT 'Published date day',
  `credit_text` varchar(1024) DEFAULT NULL COMMENT 'Writing credits',
  `credit_program` varchar(100) DEFAULT NULL COMMENT 'Programming credits',
  `credit_illustration` varchar(1024) DEFAULT NULL COMMENT 'Artist credits',
  `credit_audio` varchar(100) DEFAULT NULL COMMENT 'Composer credits',
  `filename` varchar(255) DEFAULT NULL COMMENT 'File name',
  `filesize` int DEFAULT NULL COMMENT 'Size of the file in bytes',
  `list_links` varchar(2048) DEFAULT NULL COMMENT 'List of URLs related to this file',
  `file_security_alert_url` varchar(256) DEFAULT NULL COMMENT 'URL showing results of a virus scan',
  `file_zip_content` longtext COMMENT 'Content of archive',
  `file_magic_type` varchar(255) DEFAULT NULL COMMENT 'File type meta data',
  `preview_image` varchar(1024) DEFAULT NULL COMMENT 'Internal file to use as a screenshot',
  `file_integrity_strong` char(96) DEFAULT NULL COMMENT 'SHA384 hash of file',
  `file_integrity_weak` char(32) DEFAULT NULL COMMENT 'MD5 hash of file',
  `file_last_modified` datetime DEFAULT NULL COMMENT 'Date last modified attribute saved to file',
  `platform` char(25) DEFAULT NULL COMMENT 'Computer platform',
  `section` char(25) DEFAULT NULL COMMENT 'Category',
  `comment` text COMMENT 'Description',
  `createdat` datetime DEFAULT NULL COMMENT 'Timestamp when record was created',
  `updatedat` datetime DEFAULT NULL COMMENT 'Timestamp when record was revised',
  `deletedat` datetime DEFAULT NULL COMMENT 'Timestamp used to ignore record',
  `updatedby` char(36) DEFAULT NULL COMMENT 'UUID of the user who last updated this record',
  `deletedby` char(36) DEFAULT NULL COMMENT 'UUID of the user who removed this record',
  `retrotxt_readme` varchar(255) DEFAULT NULL COMMENT 'Text file contained in archive to display',
  `retrotxt_no_readme` tinyint DEFAULT NULL COMMENT 'Disable the use of RetroTxt',
  `dosee_run_program` varchar(255) DEFAULT NULL COMMENT 'Program contained in archive to run in DOSBox',
  `dosee_hardware_cpu` varchar(6) DEFAULT NULL COMMENT 'DOSee turn off expanded memory (EMS)',
  `dosee_hardware_graphic` varchar(8) DEFAULT NULL COMMENT 'DOSee graphics/machine override',
  `dosee_hardware_audio` varchar(9) DEFAULT NULL COMMENT 'DOSee audio override',
  `dosee_no_aspect_ratio_fix` tinyint DEFAULT NULL COMMENT 'DOSee disable aspect ratio corrections',
  `dosee_incompatible` tinyint DEFAULT NULL COMMENT 'Flag DOS program as incompatible for DOSBox',
  `dosee_no_ems` tinyint DEFAULT NULL COMMENT 'DOSBox turn off EMS',
  `dosee_no_xms` tinyint DEFAULT NULL COMMENT 'DOSee turn off extended memory (XMS)',
  `dosee_no_umb` tinyint DEFAULT NULL COMMENT 'DOSee turn off upper memory block access (UMB)',
  `dosee_load_utilities` tinyint DEFAULT NULL COMMENT 'DOSee load utilities',
  PRIMARY KEY (`id`),
  KEY `Browsing` (`date_issued_year`,`date_issued_month`,`date_issued_day`,`section`,`platform`,`filename`(191),`createdat`),
  FULLTEXT KEY `pubfor_pubby_pubedition_filename_comment` (`group_brand_for`,`group_brand_by`,`record_title`,`filename`,`comment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='This database is the complete collection of files for download';


-- 2022-12-18 22:32:00
