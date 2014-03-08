/*
MySQL Data Transfer
Source Host: localhost
Source Database: riley2
Target Host: localhost
Target Database: riley2
Date: 23/03/2008 01:39:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for admin_file_categories
-- ----------------------------
CREATE TABLE `admin_file_categories` (
  `FILE_CATEGORY_ID` int(11) NOT NULL auto_increment,
  `FILE_CATEGORY` varchar(100) default NULL,
  PRIMARY KEY  (`FILE_CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for admin_status_lookup
-- ----------------------------
CREATE TABLE `admin_status_lookup` (
  `STATUS_LOOKUP_ID` int(11) NOT NULL auto_increment,
  `STATUS_ID` int(8) default NULL,
  `USER_TYPE_ID` int(8) default NULL,
  `MODULE_ID` int(8) default NULL,
  PRIMARY KEY  (`STATUS_LOOKUP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3223 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for admin_user_types
-- ----------------------------
CREATE TABLE `admin_user_types` (
  `USER_TYPE_ID` int(8) NOT NULL auto_increment,
  `USER_TYPE` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`USER_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
CREATE TABLE `admin_users` (
  `USER_ID` int(8) NOT NULL auto_increment,
  `USER_TYPE_ID` int(8) NOT NULL default '0',
  `FIRST_NAME` varchar(100) NOT NULL default '',
  `FAMILY_NAME` varchar(100) NOT NULL default '',
  `EMAIL` varchar(100) default NULL,
  `JOB_TITLE` varchar(100) default NULL,
  `USERNAME` varchar(100) NOT NULL default '',
  `PASSWORD` varchar(100) default NULL,
  `DATE_CREATED` date default NULL,
  PRIMARY KEY  (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for article_category_lookup
-- ----------------------------
CREATE TABLE `article_category_lookup` (
  `ARTICLE_ID` int(10) default '0',
  `CATEGORY_ID` int(10) default '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for article_document_lookup
-- ----------------------------
CREATE TABLE `article_document_lookup` (
  `ARTICLE_ID` int(10) default NULL,
  `DOCUMENT_ID` tinyint(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for article_image_lookup
-- ----------------------------
CREATE TABLE `article_image_lookup` (
  `ARTICLE_ID` int(10) default NULL,
  `IMAGE_ID` int(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for article_webtech_lookup
-- ----------------------------
CREATE TABLE `article_webtech_lookup` (
  `ARTICLE_ID` int(8) default NULL,
  `TECH_ID` int(8) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
CREATE TABLE `articles` (
  `ARTICLE_ID` int(11) NOT NULL auto_increment,
  `MODULE_ID` tinyint(4) default NULL,
  `META` text,
  `TITLE` varchar(255) default NULL,
  `SUMMARY` text,
  `CONTENT` text,
  `WHO` varchar(100) default NULL,
  `PHONE` varchar(50) default NULL,
  `EMAIL` varchar(100) default NULL,
  `WEB` varchar(100) default NULL,
  `WEB_DESC` varchar(255) default NULL,
  `FRONT_PAGE` tinyint(4) default '0',
  `ON_THIS_DAY` tinyint(4) default '0',
  `VENUE` varchar(255) default NULL,
  `LOCATION` varchar(255) default NULL,
  `ENTRANTS` int(11) default '0',
  `RESULT` varchar(50) default NULL,
  `PRIZE` varchar(50) default NULL,
  `HIGH_RUN` varchar(50) default NULL,
  `COUNTRY_ID` int(8) default '158',
  `THUMB_ID` int(8) default '0',
  `SECTION_ID` tinyint(4) default '0',
  `EMPLOYER_ID` tinyint(4) default '0',
  `BREAK_TYPE_ID` int(8) default '0',
  `DATE_DISPLAY` date default NULL,
  `DATE_END` datetime default NULL,
  `DATE_EDITED` datetime default NULL,
  `DATE_CREATED` datetime default NULL,
  `STATUS_ID` tinyint(4) default '4',
  PRIMARY KEY  (`ARTICLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for break_types
-- ----------------------------
CREATE TABLE `break_types` (
  `BREAK_TYPE_ID` int(8) NOT NULL auto_increment,
  `BREAK_TYPE` varchar(100) default NULL,
  PRIMARY KEY  (`BREAK_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for breaks
-- ----------------------------
CREATE TABLE `breaks` (
  `BREAK_ID` int(8) NOT NULL auto_increment,
  `BREAK_TYPE_ID` tinyint(4) default NULL,
  `TITLE` varchar(150) default NULL,
  `SUMMARY` text,
  `LOCATION` varchar(150) default NULL,
  `WHO` varchar(100) default NULL,
  `DATE_DISPLAY` date default NULL,
  `DATE_EDITED` date default NULL,
  `DATE_CREATED` date default NULL,
  `STATUS_ID` tinyint(4) default '3',
  PRIMARY KEY  (`BREAK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
CREATE TABLE `categories` (
  `CATEGORY_ID` int(10) NOT NULL auto_increment,
  `CATEGORY` char(100) default NULL,
  `TOP_10` tinyint(4) default '0',
  `STATUS_ID` tinyint(4) default '1',
  PRIMARY KEY  (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
CREATE TABLE `cities` (
  `CITY_ID` int(8) NOT NULL auto_increment,
  `COUNTRY_ID` int(8) default NULL,
  `CITY` varchar(150) default NULL,
  PRIMARY KEY  (`CITY_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_containers
-- ----------------------------
CREATE TABLE `cms_containers` (
  `container_id` int(8) NOT NULL auto_increment,
  `container` varchar(255) default NULL,
  PRIMARY KEY  (`container_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_doc_mod_lookup
-- ----------------------------
CREATE TABLE `cms_doc_mod_lookup` (
  `document_id` int(8) default NULL,
  `module_id` int(8) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_documents
-- ----------------------------
CREATE TABLE `cms_documents` (
  `document_id` int(8) NOT NULL auto_increment,
  `document_name` varchar(50) default NULL,
  `file_name` varchar(100) default NULL,
  `date_created` datetime default NULL,
  `date_modified` datetime default NULL,
  `created_by_id` int(8) default NULL,
  `modified_by_id` tinyint(8) default NULL,
  `work_flow_id` tinyint(4) default NULL,
  PRIMARY KEY  (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_images
-- ----------------------------
CREATE TABLE `cms_images` (
  `image_id` int(8) NOT NULL auto_increment,
  `image_name` varchar(50) default NULL,
  `file_name` varchar(100) default NULL,
  `date_created` datetime default NULL,
  `date_modified` datetime default NULL,
  `created_by_id` int(8) default NULL,
  `modified_by_id` int(8) default NULL,
  `work_flow_id` tinyint(4) default NULL,
  PRIMARY KEY  (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_img_mod_lookup
-- ----------------------------
CREATE TABLE `cms_img_mod_lookup` (
  `image_id` int(8) default NULL,
  `module_id` int(8) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_menu_doc_lookup
-- ----------------------------
CREATE TABLE `cms_menu_doc_lookup` (
  `menu_id` int(8) default NULL,
  `document_id` int(8) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_menus
-- ----------------------------
CREATE TABLE `cms_menus` (
  `menu_id` int(8) NOT NULL auto_increment,
  `parent_id` int(8) default '0',
  `menu_level` int(4) default '0',
  `menu_order` int(11) default NULL,
  `page_id` int(8) default '0',
  `template_id` tinyint(4) default '0',
  `container_id` int(8) default '0',
  `label` varchar(255) default NULL,
  `meta_data` text,
  `on_home_page` tinyint(4) default '0',
  `date_display` datetime default NULL,
  `date_created` datetime default NULL,
  `date_modified` datetime default NULL,
  `created_by_id` int(8) default NULL,
  `modified_by_id` int(8) default NULL,
  `work_flow_id` tinyint(4) default '0',
  PRIMARY KEY  (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_modules
-- ----------------------------
CREATE TABLE `cms_modules` (
  `module_id` int(8) NOT NULL auto_increment,
  `module` varchar(100) default NULL,
  `template` varchar(100) default NULL,
  `core` tinyint(4) default NULL,
  `documents` tinyint(4) default '0',
  `images` tinyint(4) default '0',
  PRIMARY KEY  (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_pages
-- ----------------------------
CREATE TABLE `cms_pages` (
  `page_id` int(8) NOT NULL auto_increment,
  `page_title` varchar(255) default NULL,
  `page_copy` text,
  `date_created` datetime default NULL,
  `date_modified` datetime default NULL,
  `created_by_id` int(8) default NULL,
  `modified_by_id` int(8) default NULL,
  `work_flow_id` tinyint(4) default NULL,
  PRIMARY KEY  (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_sections
-- ----------------------------
CREATE TABLE `cms_sections` (
  `section_id` int(8) NOT NULL auto_increment,
  `section_name` varchar(100) default NULL,
  PRIMARY KEY  (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_templates
-- ----------------------------
CREATE TABLE `cms_templates` (
  `template_id` int(8) NOT NULL auto_increment,
  `template_name` varchar(255) default NULL,
  `template_file` varchar(100) default NULL,
  PRIMARY KEY  (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_user_type_lookup
-- ----------------------------
CREATE TABLE `cms_user_type_lookup` (
  `admin_user_type_id` int(8) default NULL,
  `module_id` int(8) default NULL,
  `work_flow_type_id` int(8) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_user_types
-- ----------------------------
CREATE TABLE `cms_user_types` (
  `admin_user_type_id` int(8) NOT NULL auto_increment,
  `admin_user_type` varchar(100) default NULL,
  `date_modified` datetime default NULL,
  `date_created` datetime default NULL,
  `created_by_id` int(8) default NULL,
  `modified_by_id` int(8) default NULL,
  `work_flow_id` tinyint(4) default '0',
  PRIMARY KEY  (`admin_user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_users
-- ----------------------------
CREATE TABLE `cms_users` (
  `admin_user_id` int(8) NOT NULL auto_increment,
  `first_name` varchar(100) default NULL,
  `family_name` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `password` varchar(50) default NULL,
  `admin_user_type_id` tinyint(8) default NULL,
  `company_id` tinyint(8) default NULL,
  `date_created` datetime default NULL,
  `date_modified` datetime default NULL,
  `created_by_id` int(8) default NULL,
  `modified_by_id` int(8) unsigned default NULL,
  `work_flow_id` tinyint(4) default NULL,
  PRIMARY KEY  (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_work_flow
-- ----------------------------
CREATE TABLE `cms_work_flow` (
  `work_flow_id` int(4) NOT NULL auto_increment,
  `work_flow` varchar(50) default NULL,
  PRIMARY KEY  (`work_flow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_work_flow_lookup
-- ----------------------------
CREATE TABLE `cms_work_flow_lookup` (
  `work_flow_id` int(8) default NULL,
  `work_flow_type_id` int(8) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cms_work_flow_types
-- ----------------------------
CREATE TABLE `cms_work_flow_types` (
  `work_flow_type_id` int(8) NOT NULL auto_increment,
  `work_flow_type` varchar(50) default NULL,
  `can_delete` tinyint(4) default '0',
  `can_create` tinyint(4) default '0',
  PRIMARY KEY  (`work_flow_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for continents
-- ----------------------------
CREATE TABLE `continents` (
  `CONTINENT_ID` int(8) NOT NULL auto_increment,
  `CONTINENT` varchar(150) default NULL,
  PRIMARY KEY  (`CONTINENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
CREATE TABLE `countries` (
  `COUNTRY_ID` int(11) NOT NULL auto_increment,
  `CONTINENT_ID` tinyint(4) default NULL,
  `COUNTRY` varchar(255) default NULL,
  `SUMMARY` varchar(255) default NULL,
  `CONTENT` text,
  `THUMB_ID` int(8) default NULL,
  `VISITS` tinyint(4) default '1',
  `DATE_EDITED` date default NULL,
  `DATE_CREATED` date default NULL,
  `STATUS_ID` tinyint(4) default '3',
  PRIMARY KEY  (`COUNTRY_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for documents
-- ----------------------------
CREATE TABLE `documents` (
  `DOCUMENT_ID` int(10) NOT NULL auto_increment,
  `DOCUMENT_NAME` char(100) default NULL,
  `FILE_NAME` char(100) default NULL,
  `DATE_ADDED` date default NULL,
  `USER_ID` int(8) default NULL,
  `STATUS_ID` tinyint(4) default NULL,
  PRIMARY KEY  (`DOCUMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for domains
-- ----------------------------
CREATE TABLE `domains` (
  `DOMAIN_ID` int(8) NOT NULL auto_increment,
  `DOMAIN_NAME` varchar(255) NOT NULL default '',
  `REGISTRA` varchar(255) default NULL,
  `SUMMARY` text,
  `THUMB_ID` int(8) default '0',
  `DATE_FROM` datetime default NULL,
  `DATE_TO` datetime default NULL,
  `STATUS_ID` tinyint(4) default '0',
  PRIMARY KEY  (`DOMAIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for employers
-- ----------------------------
CREATE TABLE `employers` (
  `EMPLOYER_ID` int(8) NOT NULL auto_increment,
  `EMPLOYER` varchar(100) default NULL,
  PRIMARY KEY  (`EMPLOYER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for image_section_lookup
-- ----------------------------
CREATE TABLE `image_section_lookup` (
  `IMAGE_ID` int(8) default NULL,
  `SECTION_ID` int(8) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for image_types
-- ----------------------------
CREATE TABLE `image_types` (
  `IMAGE_TYPE_ID` int(8) NOT NULL auto_increment,
  `IMAGE_TYPE` varchar(50) default NULL,
  PRIMARY KEY  (`IMAGE_TYPE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for images
-- ----------------------------
CREATE TABLE `images` (
  `IMAGE_ID` int(10) NOT NULL auto_increment,
  `IMAGE_TYPE_ID` tinyint(4) default '0',
  `COUNTRY_ID` int(11) default NULL,
  `IMAGE_NAME` varchar(100) default NULL,
  `FILE_NAME` varchar(100) default NULL,
  `BIG_FILE_NAME` varchar(100) default NULL,
  `SUMMARY` varchar(255) default NULL,
  `GALLERY` tinyint(3) unsigned default '0',
  `VIDEO` tinyint(4) default '0',
  `FRONT_PAGE` tinyint(4) default '0',
  `DATE_DISPLAY` date default NULL,
  `DATE_EDITED` date default NULL,
  `DATE_CREATED` date default NULL,
  `STATUS_ID` tinyint(4) default '3',
  PRIMARY KEY  (`IMAGE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=422 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for journey_types
-- ----------------------------
CREATE TABLE `journey_types` (
  `JOURNEY_TYPE_ID` int(8) NOT NULL auto_increment,
  `JOURNEY_TYPE` varchar(100) default NULL,
  PRIMARY KEY  (`JOURNEY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for journeys
-- ----------------------------
CREATE TABLE `journeys` (
  `JOURNEY_ID` int(8) NOT NULL auto_increment,
  `JOURNEY_TYPE_ID` int(8) default '1',
  `JOURNEY_FROM` int(8) default NULL,
  `JOURNEY_TO` int(8) default NULL,
  `SUMMARY` text,
  `REF` varchar(50) default NULL,
  `OPERATOR` varchar(100) default NULL,
  `CLASS` varchar(50) default NULL,
  `DISTANCE` varchar(50) default '0',
  `DATE_DEPART` datetime default NULL,
  `DATE_ARRIVE` datetime default NULL,
  `DATE_EDITED` datetime default NULL,
  `DATE_CREATED` datetime default NULL,
  `STATUS_ID` tinyint(4) default NULL,
  PRIMARY KEY  (`JOURNEY_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=284 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mod_article_doc_lookup
-- ----------------------------
CREATE TABLE `mod_article_doc_lookup` (
  `article_id` int(8) default NULL,
  `document_id` int(8) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mod_article_section_lookup
-- ----------------------------
CREATE TABLE `mod_article_section_lookup` (
  `article_id` int(8) default NULL,
  `section_id` int(8) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mod_articles
-- ----------------------------
CREATE TABLE `mod_articles` (
  `article_id` int(8) NOT NULL auto_increment,
  `module_id` int(8) default NULL,
  `title` varchar(255) default NULL,
  `summary` varchar(255) default NULL,
  `copy` text,
  `web` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `contact` varchar(100) default NULL,
  `web_desc` varchar(100) default NULL,
  `content` varchar(255) default NULL,
  `on_home_page` tinyint(4) default '0',
  `thumb_id` int(8) default '0',
  `date_event` datetime default NULL,
  `date_display` datetime default NULL,
  `date_created` datetime default NULL,
  `date_modified` datetime default NULL,
  `created_by_id` int(8) default NULL,
  `modified_by_id` int(8) unsigned default NULL,
  `work_flow_id` int(4) default NULL,
  PRIMARY KEY  (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mod_gallery
-- ----------------------------
CREATE TABLE `mod_gallery` (
  `gallery_id` int(8) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `summary` text,
  `file_small` varchar(255) default NULL,
  `file_large` varchar(255) default NULL,
  `country_id` int(8) default '0',
  `section_id` int(8) default '0',
  `gallery_type` int(8) default '0',
  `front_page` tinyint(4) default '0',
  `created_by_id` int(8) default NULL,
  `modified_by_id` int(8) default '0',
  `date_display` datetime default NULL,
  `date_created` datetime default NULL,
  `date_modified` datetime default NULL,
  `work_flow_id` int(8) default NULL,
  PRIMARY KEY  (`gallery_id`)
) ENGINE=MyISAM AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mod_gallery_section_lookup
-- ----------------------------
CREATE TABLE `mod_gallery_section_lookup` (
  `gallery_id` int(8) default NULL,
  `section_id` int(8) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for modules
-- ----------------------------
CREATE TABLE `modules` (
  `MODULE_ID` int(8) NOT NULL auto_increment,
  `MODULE` varchar(100) default NULL,
  `TEMPLATE` varchar(100) default NULL,
  `ARTICLE` tinyint(4) default NULL,
  `ACTIVE` tinyint(4) default '0',
  PRIMARY KEY  (`MODULE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for navigation
-- ----------------------------
CREATE TABLE `navigation` (
  `NAVIGATION_ID` int(8) unsigned NOT NULL auto_increment,
  `PARENT_ID` int(8) unsigned NOT NULL default '0',
  `CONTENT_ID` int(8) unsigned NOT NULL default '0',
  `NAVIGATION_LEVEL` tinyint(4) default NULL,
  `POSITION` tinyint(4) default NULL,
  PRIMARY KEY  (`NAVIGATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sections
-- ----------------------------
CREATE TABLE `sections` (
  `SECTION_ID` int(8) NOT NULL auto_increment,
  `SECTION` varchar(100) default NULL,
  `SECTION_PATH` varchar(50) default NULL,
  PRIMARY KEY  (`SECTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for statuses
-- ----------------------------
CREATE TABLE `statuses` (
  `STATUS_ID` tinyint(4) unsigned NOT NULL auto_increment,
  `STATUS` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`STATUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for thisday
-- ----------------------------
CREATE TABLE `thisday` (
  `THIS_DAY_ID` int(8) NOT NULL auto_increment,
  `SUMMARY` varchar(255) default NULL,
  `CITY_ID` int(8) default '0',
  `ARTICLE_ID` int(8) default '0',
  `DATE_DISPLAY` datetime default NULL,
  `DATE_EDITED` datetime default NULL,
  `DATE_CREATED` datetime default NULL,
  `STATUS_ID` tinyint(4) default '3',
  PRIMARY KEY  (`THIS_DAY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_category_lookup
-- ----------------------------
CREATE TABLE `user_category_lookup` (
  `USER_ID` int(10) default NULL,
  `CATEGORY_ID` int(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users` (
  `USER_ID` int(10) NOT NULL auto_increment,
  `FIRST_NAME` varchar(50) default NULL,
  `FAMILY_NAME` varchar(50) default NULL,
  `PROFILE` text,
  `JOB` varchar(150) default NULL,
  `COMPANY` varchar(255) default NULL,
  `PHONE` varchar(50) default NULL,
  `MOBILE` varchar(50) default NULL,
  `FAX` varchar(50) default NULL,
  `EMAIL` varchar(100) default NULL,
  `USER_NAME` varchar(100) default NULL,
  `PASSWORD` varchar(100) default NULL,
  `SENT` tinyint(4) NOT NULL default '0',
  `ADDRESS` varchar(255) default NULL,
  `CITY` varchar(150) default NULL,
  `SUBURB` varchar(150) default NULL,
  `STATE` varchar(150) default NULL,
  `COUNTRY_ID` int(10) default '0',
  `IMAGE_FILENAME` varchar(255) default NULL,
  `DATE_CREATED` date default NULL,
  `STATUS_ID` tinyint(4) unsigned default '0',
  PRIMARY KEY  (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for web_techs
-- ----------------------------
CREATE TABLE `web_techs` (
  `TECH_ID` int(8) NOT NULL auto_increment,
  `TECH_NAME` varchar(100) default '0',
  `TECH_ICON` varchar(255) default NULL,
  `ORDER_BY` int(8) default '0',
  PRIMARY KEY  (`TECH_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `admin_file_categories` VALUES ('1', 'News');
INSERT INTO `admin_file_categories` VALUES ('2', 'Events');
INSERT INTO `admin_status_lookup` VALUES ('2937', '1', '2', '1');
INSERT INTO `admin_status_lookup` VALUES ('2938', '2', '2', '1');
INSERT INTO `admin_status_lookup` VALUES ('2939', '3', '2', '1');
INSERT INTO `admin_status_lookup` VALUES ('2940', '4', '2', '1');
INSERT INTO `admin_status_lookup` VALUES ('2941', '1', '2', '2');
INSERT INTO `admin_status_lookup` VALUES ('2942', '2', '2', '2');
INSERT INTO `admin_status_lookup` VALUES ('2943', '3', '2', '2');
INSERT INTO `admin_status_lookup` VALUES ('2944', '4', '2', '2');
INSERT INTO `admin_status_lookup` VALUES ('2945', '1', '2', '3');
INSERT INTO `admin_status_lookup` VALUES ('2946', '2', '2', '3');
INSERT INTO `admin_status_lookup` VALUES ('2947', '3', '2', '3');
INSERT INTO `admin_status_lookup` VALUES ('2948', '4', '2', '3');
INSERT INTO `admin_status_lookup` VALUES ('2949', '1', '2', '4');
INSERT INTO `admin_status_lookup` VALUES ('2950', '2', '2', '4');
INSERT INTO `admin_status_lookup` VALUES ('2951', '3', '2', '4');
INSERT INTO `admin_status_lookup` VALUES ('2952', '4', '2', '4');
INSERT INTO `admin_status_lookup` VALUES ('2953', '1', '2', '5');
INSERT INTO `admin_status_lookup` VALUES ('2954', '2', '2', '5');
INSERT INTO `admin_status_lookup` VALUES ('2955', '3', '2', '5');
INSERT INTO `admin_status_lookup` VALUES ('2956', '4', '2', '5');
INSERT INTO `admin_status_lookup` VALUES ('2957', '1', '2', '6');
INSERT INTO `admin_status_lookup` VALUES ('2958', '2', '2', '6');
INSERT INTO `admin_status_lookup` VALUES ('2959', '3', '2', '6');
INSERT INTO `admin_status_lookup` VALUES ('2960', '4', '2', '6');
INSERT INTO `admin_status_lookup` VALUES ('2961', '1', '2', '7');
INSERT INTO `admin_status_lookup` VALUES ('2962', '2', '2', '7');
INSERT INTO `admin_status_lookup` VALUES ('2963', '3', '2', '7');
INSERT INTO `admin_status_lookup` VALUES ('2964', '4', '2', '7');
INSERT INTO `admin_status_lookup` VALUES ('2965', '1', '2', '8');
INSERT INTO `admin_status_lookup` VALUES ('2966', '2', '2', '8');
INSERT INTO `admin_status_lookup` VALUES ('2967', '3', '2', '8');
INSERT INTO `admin_status_lookup` VALUES ('2968', '4', '2', '8');
INSERT INTO `admin_status_lookup` VALUES ('2969', '1', '2', '9');
INSERT INTO `admin_status_lookup` VALUES ('2970', '2', '2', '9');
INSERT INTO `admin_status_lookup` VALUES ('2971', '3', '2', '9');
INSERT INTO `admin_status_lookup` VALUES ('2972', '4', '2', '9');
INSERT INTO `admin_status_lookup` VALUES ('2973', '1', '2', '10');
INSERT INTO `admin_status_lookup` VALUES ('2974', '2', '2', '10');
INSERT INTO `admin_status_lookup` VALUES ('2975', '3', '2', '10');
INSERT INTO `admin_status_lookup` VALUES ('2976', '4', '2', '10');
INSERT INTO `admin_status_lookup` VALUES ('2977', '1', '2', '11');
INSERT INTO `admin_status_lookup` VALUES ('2978', '2', '2', '11');
INSERT INTO `admin_status_lookup` VALUES ('2979', '3', '2', '11');
INSERT INTO `admin_status_lookup` VALUES ('2980', '4', '2', '11');
INSERT INTO `admin_status_lookup` VALUES ('2981', '1', '2', '12');
INSERT INTO `admin_status_lookup` VALUES ('2982', '2', '2', '12');
INSERT INTO `admin_status_lookup` VALUES ('2983', '3', '2', '12');
INSERT INTO `admin_status_lookup` VALUES ('2984', '4', '2', '12');
INSERT INTO `admin_status_lookup` VALUES ('2985', '1', '2', '13');
INSERT INTO `admin_status_lookup` VALUES ('2986', '2', '2', '13');
INSERT INTO `admin_status_lookup` VALUES ('2987', '3', '2', '13');
INSERT INTO `admin_status_lookup` VALUES ('2988', '4', '2', '13');
INSERT INTO `admin_status_lookup` VALUES ('2997', '2', '5', '4');
INSERT INTO `admin_status_lookup` VALUES ('2998', '3', '5', '4');
INSERT INTO `admin_status_lookup` VALUES ('2999', '2', '5', '5');
INSERT INTO `admin_status_lookup` VALUES ('3000', '3', '5', '5');
INSERT INTO `admin_status_lookup` VALUES ('3001', '2', '5', '7');
INSERT INTO `admin_status_lookup` VALUES ('3002', '3', '5', '7');
INSERT INTO `admin_status_lookup` VALUES ('3003', '2', '5', '8');
INSERT INTO `admin_status_lookup` VALUES ('3004', '3', '5', '8');
INSERT INTO `admin_status_lookup` VALUES ('3005', '2', '5', '10');
INSERT INTO `admin_status_lookup` VALUES ('3006', '3', '5', '10');
INSERT INTO `admin_status_lookup` VALUES ('3027', '1', '1', '6');
INSERT INTO `admin_status_lookup` VALUES ('3028', '2', '1', '6');
INSERT INTO `admin_status_lookup` VALUES ('3029', '3', '1', '6');
INSERT INTO `admin_status_lookup` VALUES ('3030', '4', '1', '6');
INSERT INTO `admin_status_lookup` VALUES ('3047', '1', '1', '11');
INSERT INTO `admin_status_lookup` VALUES ('3048', '2', '1', '11');
INSERT INTO `admin_status_lookup` VALUES ('3049', '3', '1', '11');
INSERT INTO `admin_status_lookup` VALUES ('3050', '4', '1', '11');
INSERT INTO `admin_status_lookup` VALUES ('3051', '1', '1', '12');
INSERT INTO `admin_status_lookup` VALUES ('3052', '2', '1', '12');
INSERT INTO `admin_status_lookup` VALUES ('3053', '3', '1', '12');
INSERT INTO `admin_status_lookup` VALUES ('3054', '4', '1', '12');
INSERT INTO `admin_status_lookup` VALUES ('3055', '1', '1', '13');
INSERT INTO `admin_status_lookup` VALUES ('3056', '2', '1', '13');
INSERT INTO `admin_status_lookup` VALUES ('3057', '3', '1', '13');
INSERT INTO `admin_status_lookup` VALUES ('3058', '4', '1', '13');
INSERT INTO `admin_status_lookup` VALUES ('3059', '1', '6', '8');
INSERT INTO `admin_status_lookup` VALUES ('3060', '2', '6', '8');
INSERT INTO `admin_status_lookup` VALUES ('3061', '3', '6', '8');
INSERT INTO `admin_status_lookup` VALUES ('3062', '4', '6', '8');
INSERT INTO `admin_status_lookup` VALUES ('3183', '1', '1', '1');
INSERT INTO `admin_status_lookup` VALUES ('3184', '2', '1', '1');
INSERT INTO `admin_status_lookup` VALUES ('3185', '3', '1', '1');
INSERT INTO `admin_status_lookup` VALUES ('3186', '4', '1', '1');
INSERT INTO `admin_status_lookup` VALUES ('3187', '1', '1', '2');
INSERT INTO `admin_status_lookup` VALUES ('3188', '2', '1', '2');
INSERT INTO `admin_status_lookup` VALUES ('3189', '3', '1', '2');
INSERT INTO `admin_status_lookup` VALUES ('3190', '4', '1', '2');
INSERT INTO `admin_status_lookup` VALUES ('3191', '1', '1', '3');
INSERT INTO `admin_status_lookup` VALUES ('3192', '2', '1', '3');
INSERT INTO `admin_status_lookup` VALUES ('3193', '3', '1', '3');
INSERT INTO `admin_status_lookup` VALUES ('3194', '4', '1', '3');
INSERT INTO `admin_status_lookup` VALUES ('3195', '1', '1', '4');
INSERT INTO `admin_status_lookup` VALUES ('3196', '2', '1', '4');
INSERT INTO `admin_status_lookup` VALUES ('3197', '3', '1', '4');
INSERT INTO `admin_status_lookup` VALUES ('3198', '4', '1', '4');
INSERT INTO `admin_status_lookup` VALUES ('3199', '1', '1', '5');
INSERT INTO `admin_status_lookup` VALUES ('3200', '2', '1', '5');
INSERT INTO `admin_status_lookup` VALUES ('3201', '3', '1', '5');
INSERT INTO `admin_status_lookup` VALUES ('3202', '4', '1', '5');
INSERT INTO `admin_status_lookup` VALUES ('3203', '1', '1', '7');
INSERT INTO `admin_status_lookup` VALUES ('3204', '2', '1', '7');
INSERT INTO `admin_status_lookup` VALUES ('3205', '3', '1', '7');
INSERT INTO `admin_status_lookup` VALUES ('3206', '4', '1', '7');
INSERT INTO `admin_status_lookup` VALUES ('3207', '1', '1', '8');
INSERT INTO `admin_status_lookup` VALUES ('3208', '2', '1', '8');
INSERT INTO `admin_status_lookup` VALUES ('3209', '3', '1', '8');
INSERT INTO `admin_status_lookup` VALUES ('3210', '4', '1', '8');
INSERT INTO `admin_status_lookup` VALUES ('3211', '1', '1', '9');
INSERT INTO `admin_status_lookup` VALUES ('3212', '2', '1', '9');
INSERT INTO `admin_status_lookup` VALUES ('3213', '3', '1', '9');
INSERT INTO `admin_status_lookup` VALUES ('3214', '4', '1', '9');
INSERT INTO `admin_status_lookup` VALUES ('3215', '1', '1', '10');
INSERT INTO `admin_status_lookup` VALUES ('3216', '2', '1', '10');
INSERT INTO `admin_status_lookup` VALUES ('3217', '3', '1', '10');
INSERT INTO `admin_status_lookup` VALUES ('3218', '4', '1', '10');
INSERT INTO `admin_status_lookup` VALUES ('3219', '1', '1', '15');
INSERT INTO `admin_status_lookup` VALUES ('3220', '2', '1', '15');
INSERT INTO `admin_status_lookup` VALUES ('3221', '3', '1', '15');
INSERT INTO `admin_status_lookup` VALUES ('3222', '4', '1', '15');
INSERT INTO `admin_user_types` VALUES ('1', 'Reading Room');
INSERT INTO `admin_user_types` VALUES ('2', 'Super User');
INSERT INTO `admin_user_types` VALUES ('5', 'Editor');
INSERT INTO `admin_user_types` VALUES ('6', 'Events Editor');
INSERT INTO `article_category_lookup` VALUES ('129', '5');
INSERT INTO `article_category_lookup` VALUES ('0', '3');
INSERT INTO `article_category_lookup` VALUES ('248', '16');
INSERT INTO `article_category_lookup` VALUES ('244', '16');
INSERT INTO `article_category_lookup` VALUES ('98', '3');
INSERT INTO `article_category_lookup` VALUES ('135', '3');
INSERT INTO `article_category_lookup` VALUES ('136', '19');
INSERT INTO `article_category_lookup` VALUES ('138', '19');
INSERT INTO `article_category_lookup` VALUES ('139', '6');
INSERT INTO `article_category_lookup` VALUES ('141', '27');
INSERT INTO `article_category_lookup` VALUES ('126', '26');
INSERT INTO `article_category_lookup` VALUES ('143', '2');
INSERT INTO `article_category_lookup` VALUES ('160', '3');
INSERT INTO `article_category_lookup` VALUES ('165', '17');
INSERT INTO `article_category_lookup` VALUES ('360', '15');
INSERT INTO `article_category_lookup` VALUES ('246', '16');
INSERT INTO `article_category_lookup` VALUES ('226', '25');
INSERT INTO `article_category_lookup` VALUES ('184', '9');
INSERT INTO `article_category_lookup` VALUES ('245', '16');
INSERT INTO `article_category_lookup` VALUES ('225', '25');
INSERT INTO `article_category_lookup` VALUES ('250', '16');
INSERT INTO `article_category_lookup` VALUES ('144', '16');
INSERT INTO `article_category_lookup` VALUES ('35', '3');
INSERT INTO `article_category_lookup` VALUES ('38', '2');
INSERT INTO `article_category_lookup` VALUES ('35', '2');
INSERT INTO `article_category_lookup` VALUES ('51', '1');
INSERT INTO `article_category_lookup` VALUES ('131', '26');
INSERT INTO `article_category_lookup` VALUES ('38', '3');
INSERT INTO `article_category_lookup` VALUES ('150', '26');
INSERT INTO `article_category_lookup` VALUES ('148', '26');
INSERT INTO `article_category_lookup` VALUES ('295', '26');
INSERT INTO `article_category_lookup` VALUES ('151', '26');
INSERT INTO `article_category_lookup` VALUES ('27', '10');
INSERT INTO `article_category_lookup` VALUES ('50', '11');
INSERT INTO `article_category_lookup` VALUES ('35', '1');
INSERT INTO `article_category_lookup` VALUES ('36', '3');
INSERT INTO `article_category_lookup` VALUES ('36', '2');
INSERT INTO `article_category_lookup` VALUES ('36', '1');
INSERT INTO `article_category_lookup` VALUES ('161', '2');
INSERT INTO `article_category_lookup` VALUES ('161', '1');
INSERT INTO `article_category_lookup` VALUES ('162', '15');
INSERT INTO `article_category_lookup` VALUES ('249', '16');
INSERT INTO `article_category_lookup` VALUES ('247', '16');
INSERT INTO `article_category_lookup` VALUES ('172', '13');
INSERT INTO `article_category_lookup` VALUES ('365', '16');
INSERT INTO `article_category_lookup` VALUES ('174', '2');
INSERT INTO `article_category_lookup` VALUES ('175', '2');
INSERT INTO `article_category_lookup` VALUES ('176', '2');
INSERT INTO `article_category_lookup` VALUES ('153', '18');
INSERT INTO `article_category_lookup` VALUES ('154', '26');
INSERT INTO `article_category_lookup` VALUES ('185', '16');
INSERT INTO `article_category_lookup` VALUES ('289', '26');
INSERT INTO `article_category_lookup` VALUES ('378', '17');
INSERT INTO `article_category_lookup` VALUES ('309', '8');
INSERT INTO `article_category_lookup` VALUES ('301', '26');
INSERT INTO `article_category_lookup` VALUES ('292', '29');
INSERT INTO `article_category_lookup` VALUES ('299', '17');
INSERT INTO `article_category_lookup` VALUES ('290', '26');
INSERT INTO `article_category_lookup` VALUES ('380', '17');
INSERT INTO `article_category_lookup` VALUES ('298', '17');
INSERT INTO `article_category_lookup` VALUES ('300', '26');
INSERT INTO `article_category_lookup` VALUES ('308', '8');
INSERT INTO `article_category_lookup` VALUES ('296', '16');
INSERT INTO `article_category_lookup` VALUES ('301', '18');
INSERT INTO `article_category_lookup` VALUES ('150', '18');
INSERT INTO `article_category_lookup` VALUES ('304', '15');
INSERT INTO `article_category_lookup` VALUES ('381', '17');
INSERT INTO `article_category_lookup` VALUES ('291', '26');
INSERT INTO `article_category_lookup` VALUES ('307', '8');
INSERT INTO `article_category_lookup` VALUES ('303', '16');
INSERT INTO `article_category_lookup` VALUES ('287', '26');
INSERT INTO `article_category_lookup` VALUES ('297', '16');
INSERT INTO `article_category_lookup` VALUES ('295', '18');
INSERT INTO `article_category_lookup` VALUES ('290', '18');
INSERT INTO `article_category_lookup` VALUES ('294', '29');
INSERT INTO `article_category_lookup` VALUES ('293', '26');
INSERT INTO `article_category_lookup` VALUES ('288', '26');
INSERT INTO `article_category_lookup` VALUES ('300', '18');
INSERT INTO `article_category_lookup` VALUES ('284', '16');
INSERT INTO `article_category_lookup` VALUES ('305', '8');
INSERT INTO `article_category_lookup` VALUES ('293', '18');
INSERT INTO `article_category_lookup` VALUES ('286', '26');
INSERT INTO `article_category_lookup` VALUES ('306', '8');
INSERT INTO `article_category_lookup` VALUES ('283', '26');
INSERT INTO `article_category_lookup` VALUES ('283', '18');
INSERT INTO `article_category_lookup` VALUES ('285', '26');
INSERT INTO `article_category_lookup` VALUES ('291', '18');
INSERT INTO `article_category_lookup` VALUES ('151', '18');
INSERT INTO `article_category_lookup` VALUES ('148', '18');
INSERT INTO `article_category_lookup` VALUES ('227', '25');
INSERT INTO `article_category_lookup` VALUES ('228', '25');
INSERT INTO `article_category_lookup` VALUES ('229', '25');
INSERT INTO `article_category_lookup` VALUES ('230', '25');
INSERT INTO `article_category_lookup` VALUES ('231', '25');
INSERT INTO `article_category_lookup` VALUES ('232', '25');
INSERT INTO `article_category_lookup` VALUES ('233', '25');
INSERT INTO `article_category_lookup` VALUES ('234', '14');
INSERT INTO `article_category_lookup` VALUES ('235', '14');
INSERT INTO `article_category_lookup` VALUES ('236', '14');
INSERT INTO `article_category_lookup` VALUES ('237', '14');
INSERT INTO `article_category_lookup` VALUES ('238', '14');
INSERT INTO `article_category_lookup` VALUES ('239', '14');
INSERT INTO `article_category_lookup` VALUES ('240', '14');
INSERT INTO `article_category_lookup` VALUES ('241', '14');
INSERT INTO `article_category_lookup` VALUES ('242', '14');
INSERT INTO `article_category_lookup` VALUES ('377', '17');
INSERT INTO `article_category_lookup` VALUES ('243', '16');
INSERT INTO `article_category_lookup` VALUES ('251', '16');
INSERT INTO `article_category_lookup` VALUES ('252', '19');
INSERT INTO `article_category_lookup` VALUES ('253', '13');
INSERT INTO `article_category_lookup` VALUES ('254', '13');
INSERT INTO `article_category_lookup` VALUES ('130', '29');
INSERT INTO `article_category_lookup` VALUES ('127', '29');
INSERT INTO `article_category_lookup` VALUES ('166', '29');
INSERT INTO `article_category_lookup` VALUES ('277', '29');
INSERT INTO `article_category_lookup` VALUES ('278', '29');
INSERT INTO `article_category_lookup` VALUES ('279', '29');
INSERT INTO `article_category_lookup` VALUES ('280', '29');
INSERT INTO `article_category_lookup` VALUES ('154', '18');
INSERT INTO `article_category_lookup` VALUES ('310', '8');
INSERT INTO `article_category_lookup` VALUES ('311', '8');
INSERT INTO `article_category_lookup` VALUES ('315', '29');
INSERT INTO `article_category_lookup` VALUES ('325', '16');
INSERT INTO `article_category_lookup` VALUES ('316', '16');
INSERT INTO `article_category_lookup` VALUES ('328', '26');
INSERT INTO `article_category_lookup` VALUES ('328', '15');
INSERT INTO `article_category_lookup` VALUES ('330', '16');
INSERT INTO `article_category_lookup` VALUES ('331', '17');
INSERT INTO `article_category_lookup` VALUES ('332', '16');
INSERT INTO `article_category_lookup` VALUES ('333', '17');
INSERT INTO `article_category_lookup` VALUES ('334', '17');
INSERT INTO `article_category_lookup` VALUES ('335', '17');
INSERT INTO `article_category_lookup` VALUES ('337', '17');
INSERT INTO `article_category_lookup` VALUES ('339', '26');
INSERT INTO `article_category_lookup` VALUES ('342', '17');
INSERT INTO `article_category_lookup` VALUES ('339', '18');
INSERT INTO `article_category_lookup` VALUES ('340', '24');
INSERT INTO `article_category_lookup` VALUES ('336', '24');
INSERT INTO `article_category_lookup` VALUES ('326', '24');
INSERT INTO `article_category_lookup` VALUES ('329', '24');
INSERT INTO `article_category_lookup` VALUES ('345', '24');
INSERT INTO `article_category_lookup` VALUES ('344', '24');
INSERT INTO `article_category_lookup` VALUES ('343', '24');
INSERT INTO `article_category_lookup` VALUES ('346', '24');
INSERT INTO `article_category_lookup` VALUES ('347', '24');
INSERT INTO `article_category_lookup` VALUES ('348', '24');
INSERT INTO `article_category_lookup` VALUES ('349', '24');
INSERT INTO `article_category_lookup` VALUES ('350', '24');
INSERT INTO `article_category_lookup` VALUES ('351', '24');
INSERT INTO `article_category_lookup` VALUES ('352', '24');
INSERT INTO `article_category_lookup` VALUES ('353', '24');
INSERT INTO `article_category_lookup` VALUES ('354', '24');
INSERT INTO `article_category_lookup` VALUES ('355', '17');
INSERT INTO `article_category_lookup` VALUES ('356', '17');
INSERT INTO `article_category_lookup` VALUES ('357', '17');
INSERT INTO `article_category_lookup` VALUES ('358', '17');
INSERT INTO `article_category_lookup` VALUES ('359', '18');
INSERT INTO `article_category_lookup` VALUES ('383', '17');
INSERT INTO `article_category_lookup` VALUES ('384', '17');
INSERT INTO `article_category_lookup` VALUES ('385', '17');
INSERT INTO `article_category_lookup` VALUES ('386', '17');
INSERT INTO `article_category_lookup` VALUES ('387', '17');
INSERT INTO `article_category_lookup` VALUES ('388', '26');
INSERT INTO `article_category_lookup` VALUES ('388', '17');
INSERT INTO `article_category_lookup` VALUES ('388', '16');
INSERT INTO `article_category_lookup` VALUES ('389', '17');
INSERT INTO `article_category_lookup` VALUES ('389', '16');
INSERT INTO `article_category_lookup` VALUES ('390', '17');
INSERT INTO `article_category_lookup` VALUES ('390', '16');
INSERT INTO `article_category_lookup` VALUES ('393', '17');
INSERT INTO `article_category_lookup` VALUES ('394', '26');
INSERT INTO `article_category_lookup` VALUES ('394', '18');
INSERT INTO `article_category_lookup` VALUES ('395', '26');
INSERT INTO `article_category_lookup` VALUES ('396', '17');
INSERT INTO `article_category_lookup` VALUES ('397', '16');
INSERT INTO `article_category_lookup` VALUES ('398', '17');
INSERT INTO `article_category_lookup` VALUES ('398', '16');
INSERT INTO `article_document_lookup` VALUES ('110', '9');
INSERT INTO `article_document_lookup` VALUES ('110', '10');
INSERT INTO `article_document_lookup` VALUES ('136', '23');
INSERT INTO `article_document_lookup` VALUES ('135', '22');
INSERT INTO `article_document_lookup` VALUES ('141', '28');
INSERT INTO `article_document_lookup` VALUES ('126', '22');
INSERT INTO `article_document_lookup` VALUES ('0', '14');
INSERT INTO `article_document_lookup` VALUES ('127', '23');
INSERT INTO `article_document_lookup` VALUES ('130', '22');
INSERT INTO `article_document_lookup` VALUES ('131', '23');
INSERT INTO `article_document_lookup` VALUES ('141', '30');
INSERT INTO `article_document_lookup` VALUES ('141', '29');
INSERT INTO `article_document_lookup` VALUES ('200', '34');
INSERT INTO `article_document_lookup` VALUES ('166', '29');
INSERT INTO `article_document_lookup` VALUES ('166', '30');
INSERT INTO `article_document_lookup` VALUES ('166', '28');
INSERT INTO `article_document_lookup` VALUES ('165', '33');
INSERT INTO `article_document_lookup` VALUES ('165', '32');
INSERT INTO `article_document_lookup` VALUES ('55', '3');
INSERT INTO `article_document_lookup` VALUES ('34', '5');
INSERT INTO `article_document_lookup` VALUES ('50', '5');
INSERT INTO `article_document_lookup` VALUES ('52', '5');
INSERT INTO `article_document_lookup` VALUES ('50', '2');
INSERT INTO `article_document_lookup` VALUES ('34', '2');
INSERT INTO `article_image_lookup` VALUES ('139', '47');
INSERT INTO `article_image_lookup` VALUES ('184', '54');
INSERT INTO `article_image_lookup` VALUES ('34', '0');
INSERT INTO `article_image_lookup` VALUES ('51', '0');
INSERT INTO `article_image_lookup` VALUES ('35', '0');
INSERT INTO `article_image_lookup` VALUES ('36', '0');
INSERT INTO `article_image_lookup` VALUES ('37', '0');
INSERT INTO `article_image_lookup` VALUES ('38', '0');
INSERT INTO `article_image_lookup` VALUES ('39', '0');
INSERT INTO `article_image_lookup` VALUES ('285', '154');
INSERT INTO `article_image_lookup` VALUES ('43', '0');
INSERT INTO `article_image_lookup` VALUES ('44', '0');
INSERT INTO `article_image_lookup` VALUES ('45', '0');
INSERT INTO `article_image_lookup` VALUES ('21', '0');
INSERT INTO `article_image_lookup` VALUES ('46', '0');
INSERT INTO `article_image_lookup` VALUES ('185', '78');
INSERT INTO `article_image_lookup` VALUES ('47', '0');
INSERT INTO `article_image_lookup` VALUES ('49', '0');
INSERT INTO `article_image_lookup` VALUES ('52', '0');
INSERT INTO `article_image_lookup` VALUES ('53', '0');
INSERT INTO `article_image_lookup` VALUES ('54', '0');
INSERT INTO `article_image_lookup` VALUES ('55', '0');
INSERT INTO `article_image_lookup` VALUES ('90', '0');
INSERT INTO `article_image_lookup` VALUES ('91', '0');
INSERT INTO `article_image_lookup` VALUES ('92', '0');
INSERT INTO `article_image_lookup` VALUES ('93', '0');
INSERT INTO `article_image_lookup` VALUES ('94', '0');
INSERT INTO `article_image_lookup` VALUES ('95', '0');
INSERT INTO `article_image_lookup` VALUES ('96', '0');
INSERT INTO `article_image_lookup` VALUES ('97', '0');
INSERT INTO `article_image_lookup` VALUES ('98', '0');
INSERT INTO `article_image_lookup` VALUES ('99', '0');
INSERT INTO `article_image_lookup` VALUES ('100', '0');
INSERT INTO `article_image_lookup` VALUES ('101', '0');
INSERT INTO `article_image_lookup` VALUES ('102', '0');
INSERT INTO `article_image_lookup` VALUES ('103', '0');
INSERT INTO `article_image_lookup` VALUES ('104', '0');
INSERT INTO `article_image_lookup` VALUES ('105', '0');
INSERT INTO `article_image_lookup` VALUES ('106', '0');
INSERT INTO `article_image_lookup` VALUES ('107', '0');
INSERT INTO `article_image_lookup` VALUES ('108', '0');
INSERT INTO `article_image_lookup` VALUES ('109', '0');
INSERT INTO `article_image_lookup` VALUES ('110', '0');
INSERT INTO `article_image_lookup` VALUES ('111', '0');
INSERT INTO `article_image_lookup` VALUES ('112', '0');
INSERT INTO `article_image_lookup` VALUES ('113', '0');
INSERT INTO `article_image_lookup` VALUES ('114', '0');
INSERT INTO `article_image_lookup` VALUES ('115', '0');
INSERT INTO `article_image_lookup` VALUES ('116', '0');
INSERT INTO `article_image_lookup` VALUES ('148', '155');
INSERT INTO `article_image_lookup` VALUES ('151', '157');
INSERT INTO `article_image_lookup` VALUES ('150', '156');
INSERT INTO `article_image_lookup` VALUES ('361', '296');
INSERT INTO `article_image_lookup` VALUES ('284', '38');
INSERT INTO `article_image_lookup` VALUES ('284', '39');
INSERT INTO `article_image_lookup` VALUES ('284', '37');
INSERT INTO `article_image_lookup` VALUES ('42', '104');
INSERT INTO `article_image_lookup` VALUES ('42', '100');
INSERT INTO `article_image_lookup` VALUES ('42', '101');
INSERT INTO `article_image_lookup` VALUES ('42', '99');
INSERT INTO `article_image_lookup` VALUES ('42', '85');
INSERT INTO `article_image_lookup` VALUES ('42', '95');
INSERT INTO `article_image_lookup` VALUES ('42', '96');
INSERT INTO `article_image_lookup` VALUES ('42', '94');
INSERT INTO `article_image_lookup` VALUES ('42', '98');
INSERT INTO `article_image_lookup` VALUES ('42', '91');
INSERT INTO `article_image_lookup` VALUES ('296', '34');
INSERT INTO `article_image_lookup` VALUES ('296', '164');
INSERT INTO `article_image_lookup` VALUES ('299', '173');
INSERT INTO `article_image_lookup` VALUES ('299', '172');
INSERT INTO `article_image_lookup` VALUES ('299', '171');
INSERT INTO `article_image_lookup` VALUES ('299', '34');
INSERT INTO `article_image_lookup` VALUES ('298', '38');
INSERT INTO `article_image_lookup` VALUES ('298', '39');
INSERT INTO `article_image_lookup` VALUES ('298', '37');
INSERT INTO `article_image_lookup` VALUES ('298', '34');
INSERT INTO `article_image_lookup` VALUES ('165', '34');
INSERT INTO `article_image_lookup` VALUES ('297', '295');
INSERT INTO `article_image_lookup` VALUES ('297', '294');
INSERT INTO `article_image_lookup` VALUES ('297', '293');
INSERT INTO `article_image_lookup` VALUES ('297', '292');
INSERT INTO `article_image_lookup` VALUES ('297', '291');
INSERT INTO `article_image_lookup` VALUES ('300', '169');
INSERT INTO `article_image_lookup` VALUES ('300', '170');
INSERT INTO `article_image_lookup` VALUES ('300', '168');
INSERT INTO `article_image_lookup` VALUES ('301', '169');
INSERT INTO `article_image_lookup` VALUES ('301', '170');
INSERT INTO `article_image_lookup` VALUES ('301', '168');
INSERT INTO `article_image_lookup` VALUES ('303', '34');
INSERT INTO `article_image_lookup` VALUES ('304', '34');
INSERT INTO `article_image_lookup` VALUES ('331', '299');
INSERT INTO `article_image_lookup` VALUES ('145', '274');
INSERT INTO `article_image_lookup` VALUES ('145', '272');
INSERT INTO `article_image_lookup` VALUES ('331', '297');
INSERT INTO `article_image_lookup` VALUES ('316', '205');
INSERT INTO `article_image_lookup` VALUES ('325', '40');
INSERT INTO `article_image_lookup` VALUES ('325', '34');
INSERT INTO `article_image_lookup` VALUES ('325', '164');
INSERT INTO `article_image_lookup` VALUES ('331', '264');
INSERT INTO `article_image_lookup` VALUES ('331', '263');
INSERT INTO `article_image_lookup` VALUES ('331', '262');
INSERT INTO `article_image_lookup` VALUES ('331', '261');
INSERT INTO `article_image_lookup` VALUES ('331', '260');
INSERT INTO `article_image_lookup` VALUES ('331', '259');
INSERT INTO `article_image_lookup` VALUES ('331', '258');
INSERT INTO `article_image_lookup` VALUES ('331', '257');
INSERT INTO `article_image_lookup` VALUES ('331', '256');
INSERT INTO `article_image_lookup` VALUES ('331', '253');
INSERT INTO `article_image_lookup` VALUES ('331', '252');
INSERT INTO `article_image_lookup` VALUES ('331', '251');
INSERT INTO `article_image_lookup` VALUES ('331', '250');
INSERT INTO `article_image_lookup` VALUES ('331', '249');
INSERT INTO `article_image_lookup` VALUES ('297', '290');
INSERT INTO `article_image_lookup` VALUES ('297', '289');
INSERT INTO `article_image_lookup` VALUES ('330', '262');
INSERT INTO `article_image_lookup` VALUES ('330', '255');
INSERT INTO `article_image_lookup` VALUES ('330', '254');
INSERT INTO `article_image_lookup` VALUES ('249', '34');
INSERT INTO `article_image_lookup` VALUES ('382', '241');
INSERT INTO `article_image_lookup` VALUES ('382', '191');
INSERT INTO `article_image_lookup` VALUES ('382', '186');
INSERT INTO `article_image_lookup` VALUES ('382', '189');
INSERT INTO `article_image_lookup` VALUES ('382', '339');
INSERT INTO `article_image_lookup` VALUES ('382', '190');
INSERT INTO `article_image_lookup` VALUES ('382', '215');
INSERT INTO `article_image_lookup` VALUES ('382', '341');
INSERT INTO `article_webtech_lookup` VALUES ('366', '14');
INSERT INTO `article_webtech_lookup` VALUES ('323', '14');
INSERT INTO `article_webtech_lookup` VALUES ('323', '6');
INSERT INTO `article_webtech_lookup` VALUES ('321', '14');
INSERT INTO `article_webtech_lookup` VALUES ('321', '6');
INSERT INTO `article_webtech_lookup` VALUES ('321', '4');
INSERT INTO `article_webtech_lookup` VALUES ('321', '1');
INSERT INTO `article_webtech_lookup` VALUES ('323', '8');
INSERT INTO `article_webtech_lookup` VALUES ('323', '7');
INSERT INTO `article_webtech_lookup` VALUES ('320', '14');
INSERT INTO `article_webtech_lookup` VALUES ('320', '6');
INSERT INTO `article_webtech_lookup` VALUES ('320', '4');
INSERT INTO `article_webtech_lookup` VALUES ('320', '5');
INSERT INTO `article_webtech_lookup` VALUES ('320', '1');
INSERT INTO `article_webtech_lookup` VALUES ('367', '13');
INSERT INTO `article_webtech_lookup` VALUES ('367', '6');
INSERT INTO `article_webtech_lookup` VALUES ('367', '7');
INSERT INTO `article_webtech_lookup` VALUES ('367', '4');
INSERT INTO `article_webtech_lookup` VALUES ('367', '5');
INSERT INTO `article_webtech_lookup` VALUES ('367', '1');
INSERT INTO `article_webtech_lookup` VALUES ('323', '4');
INSERT INTO `article_webtech_lookup` VALUES ('323', '5');
INSERT INTO `article_webtech_lookup` VALUES ('323', '1');
INSERT INTO `article_webtech_lookup` VALUES ('366', '6');
INSERT INTO `article_webtech_lookup` VALUES ('366', '4');
INSERT INTO `article_webtech_lookup` VALUES ('366', '1');
INSERT INTO `article_webtech_lookup` VALUES ('210', '11');
INSERT INTO `article_webtech_lookup` VALUES ('210', '3');
INSERT INTO `article_webtech_lookup` VALUES ('193', '13');
INSERT INTO `article_webtech_lookup` VALUES ('193', '3');
INSERT INTO `article_webtech_lookup` VALUES ('198', '25');
INSERT INTO `article_webtech_lookup` VALUES ('198', '13');
INSERT INTO `article_webtech_lookup` VALUES ('198', '6');
INSERT INTO `article_webtech_lookup` VALUES ('198', '8');
INSERT INTO `article_webtech_lookup` VALUES ('198', '7');
INSERT INTO `article_webtech_lookup` VALUES ('198', '4');
INSERT INTO `article_webtech_lookup` VALUES ('324', '14');
INSERT INTO `article_webtech_lookup` VALUES ('324', '6');
INSERT INTO `article_webtech_lookup` VALUES ('324', '4');
INSERT INTO `article_webtech_lookup` VALUES ('324', '5');
INSERT INTO `article_webtech_lookup` VALUES ('324', '1');
INSERT INTO `article_webtech_lookup` VALUES ('210', '1');
INSERT INTO `article_webtech_lookup` VALUES ('187', '13');
INSERT INTO `article_webtech_lookup` VALUES ('187', '6');
INSERT INTO `article_webtech_lookup` VALUES ('187', '4');
INSERT INTO `article_webtech_lookup` VALUES ('187', '2');
INSERT INTO `article_webtech_lookup` VALUES ('193', '2');
INSERT INTO `article_webtech_lookup` VALUES ('322', '14');
INSERT INTO `article_webtech_lookup` VALUES ('322', '6');
INSERT INTO `article_webtech_lookup` VALUES ('322', '4');
INSERT INTO `article_webtech_lookup` VALUES ('322', '1');
INSERT INTO `article_webtech_lookup` VALUES ('196', '22');
INSERT INTO `article_webtech_lookup` VALUES ('202', '19');
INSERT INTO `article_webtech_lookup` VALUES ('202', '17');
INSERT INTO `article_webtech_lookup` VALUES ('202', '13');
INSERT INTO `article_webtech_lookup` VALUES ('202', '3');
INSERT INTO `article_webtech_lookup` VALUES ('202', '2');
INSERT INTO `article_webtech_lookup` VALUES ('196', '13');
INSERT INTO `article_webtech_lookup` VALUES ('196', '9');
INSERT INTO `article_webtech_lookup` VALUES ('196', '6');
INSERT INTO `article_webtech_lookup` VALUES ('196', '4');
INSERT INTO `article_webtech_lookup` VALUES ('199', '19');
INSERT INTO `article_webtech_lookup` VALUES ('199', '17');
INSERT INTO `article_webtech_lookup` VALUES ('199', '13');
INSERT INTO `article_webtech_lookup` VALUES ('199', '3');
INSERT INTO `article_webtech_lookup` VALUES ('199', '2');
INSERT INTO `article_webtech_lookup` VALUES ('190', '16');
INSERT INTO `article_webtech_lookup` VALUES ('190', '20');
INSERT INTO `article_webtech_lookup` VALUES ('190', '4');
INSERT INTO `article_webtech_lookup` VALUES ('190', '2');
INSERT INTO `article_webtech_lookup` VALUES ('190', '1');
INSERT INTO `article_webtech_lookup` VALUES ('370', '25');
INSERT INTO `article_webtech_lookup` VALUES ('370', '17');
INSERT INTO `article_webtech_lookup` VALUES ('370', '13');
INSERT INTO `article_webtech_lookup` VALUES ('370', '3');
INSERT INTO `article_webtech_lookup` VALUES ('208', '18');
INSERT INTO `article_webtech_lookup` VALUES ('208', '13');
INSERT INTO `article_webtech_lookup` VALUES ('208', '3');
INSERT INTO `article_webtech_lookup` VALUES ('208', '2');
INSERT INTO `article_webtech_lookup` VALUES ('188', '13');
INSERT INTO `article_webtech_lookup` VALUES ('188', '6');
INSERT INTO `article_webtech_lookup` VALUES ('188', '8');
INSERT INTO `article_webtech_lookup` VALUES ('188', '7');
INSERT INTO `article_webtech_lookup` VALUES ('188', '4');
INSERT INTO `article_webtech_lookup` VALUES ('188', '2');
INSERT INTO `article_webtech_lookup` VALUES ('186', '13');
INSERT INTO `article_webtech_lookup` VALUES ('186', '9');
INSERT INTO `article_webtech_lookup` VALUES ('186', '6');
INSERT INTO `article_webtech_lookup` VALUES ('186', '4');
INSERT INTO `article_webtech_lookup` VALUES ('186', '2');
INSERT INTO `article_webtech_lookup` VALUES ('216', '13');
INSERT INTO `article_webtech_lookup` VALUES ('201', '8');
INSERT INTO `article_webtech_lookup` VALUES ('201', '7');
INSERT INTO `article_webtech_lookup` VALUES ('201', '4');
INSERT INTO `article_webtech_lookup` VALUES ('201', '2');
INSERT INTO `article_webtech_lookup` VALUES ('216', '6');
INSERT INTO `article_webtech_lookup` VALUES ('216', '8');
INSERT INTO `article_webtech_lookup` VALUES ('216', '7');
INSERT INTO `article_webtech_lookup` VALUES ('216', '4');
INSERT INTO `article_webtech_lookup` VALUES ('216', '2');
INSERT INTO `article_webtech_lookup` VALUES ('213', '17');
INSERT INTO `article_webtech_lookup` VALUES ('213', '13');
INSERT INTO `article_webtech_lookup` VALUES ('213', '6');
INSERT INTO `article_webtech_lookup` VALUES ('213', '4');
INSERT INTO `article_webtech_lookup` VALUES ('213', '5');
INSERT INTO `article_webtech_lookup` VALUES ('213', '2');
INSERT INTO `article_webtech_lookup` VALUES ('207', '13');
INSERT INTO `article_webtech_lookup` VALUES ('207', '6');
INSERT INTO `article_webtech_lookup` VALUES ('207', '4');
INSERT INTO `article_webtech_lookup` VALUES ('207', '2');
INSERT INTO `article_webtech_lookup` VALUES ('191', '4');
INSERT INTO `article_webtech_lookup` VALUES ('189', '4');
INSERT INTO `article_webtech_lookup` VALUES ('189', '2');
INSERT INTO `article_webtech_lookup` VALUES ('191', '2');
INSERT INTO `article_webtech_lookup` VALUES ('374', '24');
INSERT INTO `article_webtech_lookup` VALUES ('374', '21');
INSERT INTO `article_webtech_lookup` VALUES ('312', '4');
INSERT INTO `article_webtech_lookup` VALUES ('312', '2');
INSERT INTO `article_webtech_lookup` VALUES ('192', '13');
INSERT INTO `article_webtech_lookup` VALUES ('192', '6');
INSERT INTO `article_webtech_lookup` VALUES ('192', '4');
INSERT INTO `article_webtech_lookup` VALUES ('192', '2');
INSERT INTO `article_webtech_lookup` VALUES ('195', '13');
INSERT INTO `article_webtech_lookup` VALUES ('195', '6');
INSERT INTO `article_webtech_lookup` VALUES ('195', '8');
INSERT INTO `article_webtech_lookup` VALUES ('195', '7');
INSERT INTO `article_webtech_lookup` VALUES ('195', '4');
INSERT INTO `article_webtech_lookup` VALUES ('195', '2');
INSERT INTO `article_webtech_lookup` VALUES ('194', '13');
INSERT INTO `article_webtech_lookup` VALUES ('194', '6');
INSERT INTO `article_webtech_lookup` VALUES ('194', '8');
INSERT INTO `article_webtech_lookup` VALUES ('194', '7');
INSERT INTO `article_webtech_lookup` VALUES ('194', '4');
INSERT INTO `article_webtech_lookup` VALUES ('194', '2');
INSERT INTO `article_webtech_lookup` VALUES ('200', '13');
INSERT INTO `article_webtech_lookup` VALUES ('200', '6');
INSERT INTO `article_webtech_lookup` VALUES ('200', '4');
INSERT INTO `article_webtech_lookup` VALUES ('200', '5');
INSERT INTO `article_webtech_lookup` VALUES ('200', '2');
INSERT INTO `article_webtech_lookup` VALUES ('219', '13');
INSERT INTO `article_webtech_lookup` VALUES ('219', '3');
INSERT INTO `article_webtech_lookup` VALUES ('219', '2');
INSERT INTO `article_webtech_lookup` VALUES ('206', '13');
INSERT INTO `article_webtech_lookup` VALUES ('206', '3');
INSERT INTO `article_webtech_lookup` VALUES ('206', '2');
INSERT INTO `article_webtech_lookup` VALUES ('223', '13');
INSERT INTO `article_webtech_lookup` VALUES ('223', '3');
INSERT INTO `article_webtech_lookup` VALUES ('223', '21');
INSERT INTO `article_webtech_lookup` VALUES ('223', '2');
INSERT INTO `article_webtech_lookup` VALUES ('224', '13');
INSERT INTO `article_webtech_lookup` VALUES ('224', '11');
INSERT INTO `article_webtech_lookup` VALUES ('224', '3');
INSERT INTO `article_webtech_lookup` VALUES ('224', '1');
INSERT INTO `article_webtech_lookup` VALUES ('282', '13');
INSERT INTO `article_webtech_lookup` VALUES ('282', '3');
INSERT INTO `article_webtech_lookup` VALUES ('282', '2');
INSERT INTO `article_webtech_lookup` VALUES ('221', '3');
INSERT INTO `article_webtech_lookup` VALUES ('221', '1');
INSERT INTO `article_webtech_lookup` VALUES ('222', '3');
INSERT INTO `article_webtech_lookup` VALUES ('222', '1');
INSERT INTO `article_webtech_lookup` VALUES ('204', '3');
INSERT INTO `article_webtech_lookup` VALUES ('204', '1');
INSERT INTO `article_webtech_lookup` VALUES ('215', '13');
INSERT INTO `article_webtech_lookup` VALUES ('215', '3');
INSERT INTO `article_webtech_lookup` VALUES ('215', '2');
INSERT INTO `article_webtech_lookup` VALUES ('218', '3');
INSERT INTO `article_webtech_lookup` VALUES ('218', '1');
INSERT INTO `article_webtech_lookup` VALUES ('209', '13');
INSERT INTO `article_webtech_lookup` VALUES ('209', '3');
INSERT INTO `article_webtech_lookup` VALUES ('209', '1');
INSERT INTO `article_webtech_lookup` VALUES ('214', '13');
INSERT INTO `article_webtech_lookup` VALUES ('214', '11');
INSERT INTO `article_webtech_lookup` VALUES ('214', '3');
INSERT INTO `article_webtech_lookup` VALUES ('214', '1');
INSERT INTO `article_webtech_lookup` VALUES ('217', '25');
INSERT INTO `article_webtech_lookup` VALUES ('217', '3');
INSERT INTO `article_webtech_lookup` VALUES ('203', '3');
INSERT INTO `article_webtech_lookup` VALUES ('203', '1');
INSERT INTO `article_webtech_lookup` VALUES ('212', '3');
INSERT INTO `article_webtech_lookup` VALUES ('212', '1');
INSERT INTO `article_webtech_lookup` VALUES ('205', '11');
INSERT INTO `article_webtech_lookup` VALUES ('205', '3');
INSERT INTO `article_webtech_lookup` VALUES ('205', '1');
INSERT INTO `article_webtech_lookup` VALUES ('211', '11');
INSERT INTO `article_webtech_lookup` VALUES ('211', '3');
INSERT INTO `article_webtech_lookup` VALUES ('211', '1');
INSERT INTO `article_webtech_lookup` VALUES ('220', '3');
INSERT INTO `article_webtech_lookup` VALUES ('220', '1');
INSERT INTO `article_webtech_lookup` VALUES ('198', '2');
INSERT INTO `article_webtech_lookup` VALUES ('217', '1');
INSERT INTO `article_webtech_lookup` VALUES ('370', '2');
INSERT INTO `article_webtech_lookup` VALUES ('196', '2');
INSERT INTO `article_webtech_lookup` VALUES ('371', '14');
INSERT INTO `article_webtech_lookup` VALUES ('371', '6');
INSERT INTO `article_webtech_lookup` VALUES ('371', '4');
INSERT INTO `article_webtech_lookup` VALUES ('371', '1');
INSERT INTO `article_webtech_lookup` VALUES ('372', '3');
INSERT INTO `article_webtech_lookup` VALUES ('372', '1');
INSERT INTO `article_webtech_lookup` VALUES ('374', '1');
INSERT INTO `article_webtech_lookup` VALUES ('373', '13');
INSERT INTO `article_webtech_lookup` VALUES ('373', '6');
INSERT INTO `article_webtech_lookup` VALUES ('373', '8');
INSERT INTO `article_webtech_lookup` VALUES ('373', '7');
INSERT INTO `article_webtech_lookup` VALUES ('373', '4');
INSERT INTO `article_webtech_lookup` VALUES ('373', '5');
INSERT INTO `article_webtech_lookup` VALUES ('373', '2');
INSERT INTO `article_webtech_lookup` VALUES ('373', '1');
INSERT INTO `article_webtech_lookup` VALUES ('197', '13');
INSERT INTO `article_webtech_lookup` VALUES ('197', '6');
INSERT INTO `article_webtech_lookup` VALUES ('197', '4');
INSERT INTO `article_webtech_lookup` VALUES ('197', '2');
INSERT INTO `article_webtech_lookup` VALUES ('375', '24');
INSERT INTO `article_webtech_lookup` VALUES ('375', '21');
INSERT INTO `article_webtech_lookup` VALUES ('375', '1');
INSERT INTO `articles` VALUES ('32', '4', '', 'Mark and Jasmine', 'It was without doubt the best indian and second best of any wedding I have ever been too. OK so I have only been to two weddings(apart from my own) and the other one was my sisters! Seriously though this was about as good as a wedding gets, it had it all; free food and drink, fancy dress, live satellite link to the UK, great speaches, fire dancing, cake and not forgetting the thing that held it all together - true love! ', '', '', '', '', '', '', '0', '0', '', 'Concord Function Centre', '0', '', '', '', '158', '5', '1', '0', '0', '2003-12-29', '2008-01-01 00:00:00', '2007-05-23 16:26:25', '2003-11-08 00:00:00', '1');
INSERT INTO `articles` VALUES ('40', '4', '', '2003 - The good the bad and the pink and fluffy', 'What a year it was, more ups and downs than I can remember. The highs included my parents amazing visit to Sydney, finishing 13th in the US National 8 ball championships and getting married in Las Vegas of course! But alas there has to be lows, the numerous visits to hospital with chest pains due to work stress and leaving Reading Room where undoubtable lows. But the betrayal by a good friend and colleague was a harsh lesson and something that I will never forget.', '', '', '', '', '', '', '1', '0', '', '', '0', '', '', '', '0', '1', '1', '0', '0', '2003-12-31', '2008-01-01 00:00:00', '2007-05-23 16:28:08', '2003-12-08 00:00:00', '1');
INSERT INTO `articles` VALUES ('42', '4', '', 'Dirty Thirty', 'Wow, where the f*ck did that come from! Yes it\'s true, on January 9th 2004 I turned the big three\'0, dirty thirty! In order to celebrate this momentous occassion I headed up to Queensland in true riley fashion to do something memorable. What could be more memorable than spending the day scuba diving with turtles, sharks, and huge grupper fish on the great barrier reef - unforgetable!  \r\n\r\nWe also spent New Year in Surfers Paradise and visited fraser island, the biggest sand island in the world.', '', '', '', '', '', '', '1', '0', '', '', '0', '', '', '', '158', '4', '1', '0', '0', '2004-01-09', '2008-01-01 00:00:00', '2007-05-23 16:25:14', '2003-08-21 00:00:00', '1');
INSERT INTO `articles` VALUES ('50', '4', '', 'Xroom', 'I have developed 3 different Content Management Systems over the last 4 years including a fully dynamic CMS called \"MyBackEnd\" which was sold by my previous employer (Reading Room) to numerous clients. Unfortunately despite these contributions Reading Room refused to allow me to keep any of this work for my own portfolio. Therefore, I decided to build a new CMS that I originally had an idea for back in October 2002. This new system is much, much more than a CMS and is called \"Xroom\".', 'Xroom has evolved from an idea for a flash based CMS into what can best be described as a fully customizable website in a box. Websites have evolved greatly over the last 10 years and only recently have we seen standards adopted across the industry. However the layout, design, useability and functionality of a website is still interpreted in many different ways. In designing Xroom I have used my experience and looked at how websites are designed and used from the bottom up. Xroom contains a structure and layout that I believe the majority of websites should adopt in order to make the web more usable to all. This does not mean that all websites should look alike, far from it, but I believe there are common elements that 99% of websites should, as a bare minimum accommodate.\r\n\r\nXroom will be flexible enough to make each implementation unique while retaining the core features that will set a new standard in web development. Xroom will be xml based and contain many RIA modules that can be fully customizable. I have made no decision if I will make Xroom commercially available, but I am currently favouring using the system on my own suite of websites. \r\n', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '12', '3', '0', '0', '2004-01-15', '2008-01-01 00:00:00', '2005-09-02 00:21:47', '2003-08-27 00:00:00', '2');
INSERT INTO `articles` VALUES ('127', '4', '', 'Rolling Stones', 'I finally got to see the greatest rock band that ever lived. I will never forget the year and a day I spent travelling around the USA in 1994/95 listening to the stones. My old mate Jim had brought just one cassette with the stones on one side and the doors on the other! We spent weeks and weeks travelling for free on a 4 day greyhound pass, I\'m not sure I would have survived the 3 day coast to coast trip without that tape! ', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', 'Olympic Park, Sydney', '0', '', '', '', '158', '9', '4', '0', '0', '2003-03-15', '2008-01-01 00:00:00', '2004-02-07 00:00:00', '2008-01-01 00:00:00', '1');
INSERT INTO `articles` VALUES ('131', '4', '', 'Rugby World Cup [England v France]', '', '', '', '', '', '', '', '0', '0', '', 'Telstra Stadium, Sydney', '0', '', '', '', '158', '161', '4', '0', '0', '2003-11-16', '2008-01-01 00:00:00', '2005-11-05 02:27:17', '2008-01-01 00:00:00', '1');
INSERT INTO `articles` VALUES ('143', '4', '', 'I just got Married!', 'Wedding', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', 'Little Wedding Chapel, Las Vegas', '0', '', '', '', '106', '0', '1', '0', '0', '2003-05-19', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-01-18 00:00:00', '3');
INSERT INTO `articles` VALUES ('144', '4', '', 'Reighton Sands UK Open Singles', 'In only my second attempt I managed to win the singles title. I don\'t remember much about the matches except that I got a little lucky in the semi final but won the final quite comfortably, oh and they game me the runner up trophy by mistake! I won somewhere in the region of 3-400 pounds and my first national title.', '', '', '', '', '', '', '0', '0', '', 'Reighton Sands, UK', '256', '1st', '500', '', '235', '312', '4', '0', '0', '1995-05-01', '2008-01-01 00:00:00', '2005-11-04 01:30:02', '2004-01-18 00:00:00', '1');
INSERT INTO `articles` VALUES ('145', '4', '', 'Craig Riley Beng - I graduated!', 'After 19 years of education I finally graduated I\'m now known as Craig Riley Beng! Ok, its not quite the same as Sir or Dr Riley but its a start! After choosing the wrong course (Electronic Englineering and Physics) at Loughborough University I knew I had to make the right choice the second time. I decided study at Manchester to be near the mighty red devils and opted to study Electronic and Computer Engineering. I graduated with a 2:2 (hons) and got a 2:1 for my final year project in web design (10th highest out of over 100 students). \r\n\r\n', 'I also completed my placement year at Compaq computers, the worlds largest PC maker. My favourite academic moment was scoring 79% on my final (3 hour) maths exam after missing most of the lessons and studying for less than a week. Although I (sadly) loved maths it was a great feeling knowing I never had to sit a maths exam again!\r\n\r\nHitching to Derby\r\nBlonde wigs\r\nRoyals nightclub - giggs\r\n', '', '', '', '', '', '0', '0', '', 'Opera House,Manchester', '0', '', '', '', '235', '20', '2', '0', '0', '1999-07-14', '2008-01-01 00:00:00', '2005-09-02 01:25:42', '2004-01-18 00:00:00', '1');
INSERT INTO `articles` VALUES ('146', '4', '', 'Almost Drowned!', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', 'Hikaduwa Beach', '0', '', '', '', '145', '0', '1', '0', '0', '1997-06-06', '2008-01-01 00:00:00', '2008-01-01 00:00:00', '2004-01-18 00:00:00', '3');
INSERT INTO `articles` VALUES ('147', '4', '', 'September 11th', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '1', '0', '', '', '0', '', '', '', '106', '8', '1', '0', '0', '2001-09-11', '2008-01-01 00:00:00', '2008-01-01 00:00:00', '2004-01-18 00:00:00', '2');
INSERT INTO `articles` VALUES ('148', '4', '', 'Japan World Cup 2002 - England 1 v 1 Sweden', '', '', '', '', '', '', '', '1', '0', '', 'Saitama, Tokyo', '0', '', '', '', '124', '6', '4', '0', '0', '2002-06-02', '2008-01-01 00:00:00', '2007-03-26 06:06:24', '2004-01-18 00:00:00', '1');
INSERT INTO `articles` VALUES ('149', '4', '', 'Pink and Fluffy', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '1', '0', '', '', '0', '', '', '', '158', '0', '1', '0', '0', '2003-10-24', '2008-01-01 00:00:00', '2008-01-01 00:00:00', '2004-01-18 00:00:00', '2');
INSERT INTO `articles` VALUES ('150', '4', '', 'Japan World Cup 2002 [Germany v Rep. of Ireland]', '', '', '', '', '', '', '', '0', '0', '', 'Ibaraki, Tokyo', '0', '', '', '', '124', '6', '4', '0', '0', '2002-06-05', '2008-01-01 00:00:00', '2005-11-05 02:28:18', '2004-01-18 00:00:00', '1');
INSERT INTO `articles` VALUES ('151', '4', '', 'Japan World Cup 2002 [Turkey v Senegal]', '', 'World Cup quarter final ', '', '', '', '', '', '0', '0', '', 'Osaka', '0', '', '', '', '124', '6', '4', '0', '0', '2002-06-22', '2008-01-01 00:00:00', '2005-11-05 02:27:57', '2004-01-18 00:00:00', '1');
INSERT INTO `articles` VALUES ('152', '4', '', '\'Sue the Bastards\'', 'I bought Richard Bransons \"Losing my virginity\" book in 2001. It\'s a great book about a man who ovbiously knows how to live life to max and still find time to run his business empire. Most people seem to trust Mr Branson and its obvious he has the respect of all his employees. A business will never succeed unless the people that manage it lead from the front. My favourite chapter has to be \"Sue the bastards\"! It\'s unbelievable what so called \"respectable\" companies will stoop to when it comes to Money!', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '158', '18', '1', '0', '0', '2004-01-17', '2008-01-01 00:00:00', '2006-02-06 23:31:11', '2004-01-18 00:00:00', '1');
INSERT INTO `articles` VALUES ('153', '4', '', 'Japan World Cup 2002', 'I flew to Japan for the first time to join the barmy army and cheer on England in the 2002 world cup finals. I was going back to the UK to visit family and decided to stop in Japan in both directions! First I stopped in Tokyo where I saw England and Ireland play there opening games. On the way back I stopped in Osaka for a quarter final game what I had hopped would be England v Brazil. ', 'Unfortunately despite getting revenge over Argentina England failed to beat Sweden and finished second in their group. This meant that I had to settle for the excitement of Turkey v Senegal! ', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '124', '6', '4', '0', '0', '2002-06-01', '2008-01-01 00:00:00', '2005-11-05 02:37:51', '2004-01-18 00:00:00', '1');
INSERT INTO `articles` VALUES ('154', '4', '', 'World Cup USA 1994 - Ireland 0 v 0 Norway', 'I decided to go to America for a year after quiting Loughborough Univerity. I had chosen the wrong course and I wanted to take a year out to \'find myself\' and err, party!\r\nI arrived in New York City and the sight of its imposing skyline is something I\'ll never forget. I met my friend Jim in the middle of Manhatton and we decieded to try and buy some blackmarket tickets. ', '<P>England new of my plans to go to America and had deliberatly avoided qualification in order to spoil my trip. I was determined to experience the occassion nevertheless and we headed off to gients stadium.</P>\r\n<P>We where lucky enough to get some great tickets and along with 76,322 other people watched Norway v Ireland play out an entertaining 0:0 draw! </P>', '', '', '', '', '', '0', '0', '', 'Giants Stadium, New York City', '0', '', '', '', '106', '11', '4', '0', '0', '1994-06-28', '2008-01-01 00:00:00', '2007-03-26 06:05:49', '2004-01-18 00:00:00', '1');
INSERT INTO `articles` VALUES ('155', '4', '', 'Dream Machine', 'New PC', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '3', '0', '0', '2002-12-25', '2008-01-01 00:00:00', '2008-01-01 00:00:00', '2004-01-18 00:00:00', '3');
INSERT INTO `articles` VALUES ('156', '4', '', 'Grimsby Masters', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', 'Cue World, Grimsby', '0', '', '', '', '235', '0', '4', '0', '0', '1999-06-01', '2008-01-01 00:00:00', '2008-01-01 00:00:00', '2004-01-20 00:00:00', '3');
INSERT INTO `articles` VALUES ('157', '4', '', 'Beachcomber Friday Flyer Winner', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', 'Beachcomber, Cleethorpes', '0', '', '', '', '235', '0', '4', '0', '0', '2000-06-01', '2008-01-01 00:00:00', '2008-01-01 00:00:00', '2004-01-20 00:00:00', '3');
INSERT INTO `articles` VALUES ('159', '4', '', 'Reighton Sands Doubles winner', 'Friday Flyer winner & Doubles', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '4', '0', '0', '1995-06-01', '2008-01-01 00:00:00', '2008-01-01 00:00:00', '2004-01-20 00:00:00', '3');
INSERT INTO `articles` VALUES ('160', '6', '', 'Benidorm', 'Bonkidorm, sticky vicki, water park, strip clothes swap', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1989-01-01', '1989-01-25 00:00:00', '2004-01-31 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('161', '4', '', 'I got engaged', 'Hotel restaurant bangkok, plus cocktail up bangkoks tallest tower. bayoke 2?', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '149', '0', '1', '0', '0', '1999-01-01', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-01-30 00:00:00', '2');
INSERT INTO `articles` VALUES ('162', '4', '', 'YTS Snooker', '', '<P>&nbsp;</P>\r\n<P><IMG alt=\"\" src=\"http://localhost:8500/wwwthelifeofrileyorg/uploads/images/snooker_yts13.jpg\" border=1></P>\r\n<P>&nbsp;</P>\r\n<P><IMG alt=\"\" src=\"http://localhost:8500/wwwthelifeofrileyorg/uploads/images/snooker_yts2.jpg\" border=1></P>', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '284', '4', '0', '0', '1990-08-21', '2008-01-01 00:00:00', '2005-11-05 02:38:48', '2004-01-30 00:00:00', '1');
INSERT INTO `articles` VALUES ('163', '4', '', 'BTEC Graduation', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '2', '0', '0', '1993-06-01', '2008-01-01 00:00:00', '2004-01-30 00:00:00', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('164', '4', '', 'No More School!', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '2', '0', '0', '1990-05-01', '2008-01-01 00:00:00', '2004-01-30 00:00:00', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('165', '4', '', '2003 NSW Central Coast Classic', 'In my first ever 9 ball event I drew Ian Barber, a BCA master in the first round. I won this and my next couple of matches before losing to my good friend Andrew Gillson (VNEA Master). This put me in the loser side and I had to face the prospect of having to come back to play snooker and 9 ball professional Johl Younger the next day!', 'I returned and went 3:0 down to Johl very quickly before winning the next 5 frames in a row to win 5:3. Next I had to play Steve Misfud, world amateur snooker champion. I beat Steve and then won my next match to set up a semi final with Dave Reljic, full time 9 ball professional and BCA master. I beat Dave 11:10 before losing 11:9 in the final to Ben Nunan. ', '', '', '', '', '', '0', '0', '', 'Central Coast', '128', '2nd', '500', '', '158', '175', '4', '0', '0', '2003-06-01', '2008-01-01 00:00:00', '2005-11-04 02:00:08', '2004-01-30 00:00:00', '1');
INSERT INTO `articles` VALUES ('166', '4', '', 'Chilli Peppers', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '158', '3', '4', '0', '0', '2002-06-01', '2008-01-01 00:00:00', '2005-11-05 02:25:18', '2004-01-30 00:00:00', '1');
INSERT INTO `articles` VALUES ('167', '4', '', 'I passed my driving test!', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '1', '0', '0', '1998-01-01', '2008-01-01 00:00:00', '2004-01-30 00:00:00', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('168', '4', '', 'I passed my motor bike test!', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '158', '0', '1', '0', '0', '2001-12-01', '2008-01-01 00:00:00', '2004-01-30 00:00:00', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('169', '4', '', 'Meningitis', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', 'Philidelphia', '0', '', '', '', '106', '0', '1', '0', '0', '1996-01-30', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('170', '4', '', 'Bali Bomb', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', 'Kuta Beach', '0', '', '', '', '172', '0', '5', '0', '0', '2002-10-01', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('171', '4', '', 'RR Director', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '158', '0', '3', '0', '0', '2001-12-20', '2008-01-01 00:00:00', '2004-01-30 00:00:00', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('172', '4', '', 'Compaq Job', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '3', '0', '0', '1997-09-01', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-01-30 00:00:00', '2');
INSERT INTO `articles` VALUES ('173', '4', '', 'Reading Room Job', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '3', '0', '0', '2000-04-01', '2008-01-01 00:00:00', '2005-10-21 20:42:49', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('174', '4', '', 'Max Died', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '1', '0', '0', '1999-12-01', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('175', '4', '', 'Sugar Died', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '149', '0', '1', '0', '0', '1998-06-01', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('176', '4', '', 'Ruby Died', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '149', '0', '1', '0', '0', '1999-06-01', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-01-30 00:00:00', '3');
INSERT INTO `articles` VALUES ('177', '6', '', 'Oman 2', 'Sydney, Singapore, Dubai (emirates towers), Oman(grand hyatt), Dubai(airport hotel), Singapore(2 nights),Bali(week), Sydney', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2002-10-09', '2002-10-28 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('178', '6', '', 'Macromedia Conference', 'Sydney Brisbaine Return, dolphins, beach party, snorkleling', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2002-12-08', '2002-12-11 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('179', '6', '', 'UK (via Japan)', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2002-06-01', '2002-06-24 00:00:00', '2004-01-25 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('180', '6', '', 'Hunter Valley & Lake Maqauire', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2003-01-02', '2003-01-05 00:00:00', '2004-01-31 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('181', '6', '', 'UK (via vegas)', 'Sydney, Bali, HK(SARS), London, Grimsby, London, NYC, Chicago, Vegas, LA, Hawaii', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2003-04-24', '2003-05-27 00:00:00', '2004-01-31 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('182', '6', '', 'Queensland', 'Surfers Paradise (NYE), Hervey bay(fishing, dolphins), fraser island (lake makenzie, wabbi creek, colored sands, wreck, 90k beach), Brisbaine (boat), Airlie beach(scuba hook island, scuba barrier reef, hamilton island buggy, polynesian dance (30th) sth molle, mackay airport', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2003-12-29', '2004-01-12 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('184', '6', '', 'Amsterdam Xmas Party', 'Reading Room', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2000-12-14', '2000-12-16 00:00:00', '2004-02-08 00:00:00', '2004-01-28 00:00:00', '1');
INSERT INTO `articles` VALUES ('185', '4', '', 'Sydney 8 Ball League', 'I had been living in Sydney for about a year and I hadn\'t found much pool action. But one day at work I met someone froma rival web agency who invited me to play for his pool team. I went along on the Monday night only to discover that they had a full team and I wasn\'t needed. A few months later I got a call asking me if I still wanted to play as the team was struggling to qualify.', '<P>I decided to give it another try and I won all of my five games that first week. It seemed that there might be a pool scene in Sydney after all!</P>\r\n<P>I averaged about 4 wins per week over the remainder of the season and my team, \"The Jizz\" managed to qualify for the finals. The finals where to be held at the Bald Faced Stagin Leichardt and the Family Inn in Ryde. There was about 16 teams in the finals which where played over two days double elimination. The prize was a trip to play in the BCA National Tournament in Las Vegas for all the team (slightly better than the plastic trophy that I was used to in the UK!). </P>\r\n<P>We had a good team, James hardy, Alex Render, Daniel Mahgey, Dermot, Pat Farrel and Myself. On the first day in Leichardt I managed to play really well and pulled out a few 10:0 wins to put us into the final day undefeated. \r\n<P>On the second day we started really well thrashing a good team easily with almost all of us winning most of our games 10:0 with clearences. We made the final undefeated which meant we would have to lose twice to avoid the trip to Vegas! We where playing Grumpy\'s 8 and it looked like we would win the first game to take the prize. However Dermot missed a couple of balls which meant we would have to play again. We won the second match quite comfortably with Daniel and I potting the final balls for victory! \r\n<P>I couldn\'t belive it, in my first year back playing I had won a trip to play in the BCA national finals in the Riviera hotel in Las Vegas, a dream come true! All we had to do now was wait almost a year to go! </P>', '', '', '', '', '', '0', '0', '', 'Family Inn, Sydney', '64', '1st', '1000', '', '158', '81', '4', '0', '0', '2002-06-01', '2008-01-01 00:00:00', '2005-11-04 17:40:57', '2004-02-01 00:00:00', '1');
INSERT INTO `articles` VALUES ('186', '9', '', 'Stockbrokers Mutual Reference Society', '', '', '', '', '', 'http://www.smrs.com.au/', '', '0', '0', '', '', '0', '', '', '', '0', '137', '3', '3', '0', '2003-09-01', '2008-01-01 00:00:00', '2005-11-03 03:32:11', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('187', '9', '', 'Australian Technology Park Extranet', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '108', '3', '3', '0', '2003-10-31', '2008-01-01 00:00:00', '2005-11-08 13:31:36', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('188', '9', '', 'Caesarstone Australia', '', '', '', '', '', 'http://www.caesarstoneaustralia.com', '', '0', '0', '', '', '0', '', '', '', '0', '143', '3', '3', '0', '2003-10-21', '2008-01-01 00:00:00', '2005-11-03 03:31:55', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('189', '9', '', 'Haz and Zard', '', '', '', '', '', 'http://www.hazandzard.com/', '', '0', '0', '', '', '0', '', '', '', '0', '136', '3', '3', '0', '2002-12-01', '2008-01-01 00:00:00', '2005-11-03 03:37:36', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('190', '9', '', 'Petroleum Development Oman', '', '', '', '', '', 'http://was01.pdo.co.om/pdohse/', '', '0', '0', '', '', '0', '', '', '', '0', '116', '3', '3', '0', '2002-10-01', '2008-01-01 00:00:00', '2005-11-03 03:37:51', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('191', '9', '', 'Yellow Fish Road', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '141', '3', '3', '0', '2002-09-30', '2008-01-01 00:00:00', '2005-11-08 13:34:01', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('192', '9', '', 'South Sydney Regional Organisation of Councils', '', '', '', '', '', 'http://www.ssroc.nsw.gov.au/', '', '0', '0', '', '', '0', '', '', '', '0', '138', '3', '3', '0', '2003-07-01', '2008-01-01 00:00:00', '2005-11-03 03:33:19', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('193', '9', '', 'Australian Technology Park', '', '', '', '', '', 'http://www.atp.com.au', '', '0', '0', '', '', '0', '', '', '', '0', '107', '3', '3', '0', '2002-04-01', '2008-01-01 00:00:00', '2005-11-03 03:39:24', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('194', '9', '', 'An Mea', '', '', '', '', '', 'http://www.anmea.com', '', '0', '0', '', '', '0', '', '', '', '0', '139', '3', '3', '0', '2002-07-01', '2008-01-01 00:00:00', '2005-11-03 03:34:30', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('195', '9', '', 'Green Web', '', '', '', '', '', 'http://www.greenwebsydney.net.au/', '', '0', '0', '', '', '0', '', '', '', '0', '130', '3', '3', '0', '2003-05-01', '2008-01-01 00:00:00', '2005-11-03 03:36:17', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('196', '9', '', 'Cansmart', '', '', '', '', '', 'http://www.cansmart.org/', '', '0', '0', '', '', '0', '', '', '', '0', '109', '3', '3', '0', '2002-05-01', '2008-01-01 00:00:00', '2005-11-03 03:39:02', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('197', '9', '', 'Green Logic', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '3', '3', '0', '2003-06-01', '2008-01-01 00:00:00', '2005-11-03 03:33:44', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('198', '9', '', 'Hornsbyshire Council', '', '', '', '', '', 'http://www.hornsby.nsw.gov.au/', '', '0', '0', '', '', '0', '', '', '', '0', '113', '3', '3', '0', '2003-10-31', '2008-01-01 00:00:00', '2005-11-03 03:29:24', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('199', '9', '', 'Red Gum Books', '', '', '', '', '', 'http://www.redgumbooks.com/', '', '0', '0', '', '', '0', '', '', '', '0', '118', '3', '3', '0', '2001-08-01', '2008-01-01 00:00:00', '2005-11-03 03:40:12', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('200', '9', '', 'Future School Hangman Game', '', '', '', '', '', 'http://www.futureschool.com.au/hangman/index.cfm', '', '0', '0', '', '', '0', '', '', '', '0', '112', '3', '3', '0', '2002-06-01', '2008-01-01 00:00:00', '2005-11-03 03:38:39', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('201', '9', '', 'Sahkalin Energy', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '323', '3', '3', '0', '2003-08-31', '2008-01-01 00:00:00', '2005-11-03 03:32:56', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('202', '9', '', 'Planetree Books', '', '', '', '', '', 'http://www.planetree.com/', '', '0', '0', '', '', '0', '', '', '', '0', '324', '3', '4', '0', '2000-11-01', '2008-01-01 00:00:00', '2005-11-03 03:45:41', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('203', '9', '', 'Eastborne College', '', '', '', '', '', 'http://www.eastbourne-college.co.uk/', '', '0', '0', '', '', '0', '', '', '', '0', '110', '3', '4', '0', '2000-11-01', '2008-01-01 00:00:00', '2005-11-03 03:45:56', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('204', '9', '', 'GiNET', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '3', '4', '0', '2001-02-01', '2008-01-01 00:00:00', '2005-11-03 03:42:51', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('205', '9', '', 'Tax Faculty', '', '', '', '', '', 'http://www.taxfac.co.uk', '', '0', '0', '', '', '0', '', '', '', '0', '142', '3', '4', '0', '2000-07-01', '2008-01-01 00:00:00', '2005-11-03 03:46:50', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('206', '9', '', 'Jetstar', '', '', '', '', '', 'http://www.jetstar.co.uk/', '', '0', '0', '', '', '0', '', '', '', '0', '131', '3', '3', '0', '2001-10-01', '2008-01-01 00:00:00', '2005-11-08 13:37:21', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('207', '9', '', 'London Museums Archives and Libraries', '', '', '', '', '', 'http://www.lmal.org.uk/', '', '0', '0', '', '', '0', '', '', '', '0', '115', '3', '3', '0', '2003-02-01', '2008-01-01 00:00:00', '2005-11-03 03:37:00', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('208', '9', '', 'St Andrews Golf Course', '', '', '', '', '', 'http://www.standrews.com/', '', '0', '0', '', '', '0', '', '', '', '0', '328', '3', '4', '0', '2001-04-01', '2008-01-01 00:00:00', '2005-11-03 03:42:00', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('209', '9', '', 'Medical Dictionary', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '3', '4', '0', '2001-01-01', '2008-01-01 00:00:00', '2005-11-03 03:43:37', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('210', '9', '', 'Occupiers Property Databank', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '325', '3', '4', '0', '2000-05-01', '2008-01-01 00:00:00', '2005-11-03 03:47:24', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('211', '9', '', 'Tax Briefs', '', '', '', '', '', 'http://www.taxbriefs.co.uk/', '', '0', '0', '', '', '0', '', '', '', '0', '133', '3', '4', '0', '2000-07-01', '2008-01-01 00:00:00', '2005-11-03 03:46:35', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('212', '9', '', 'Internal Audit People', '', '', '', '', '', 'http://www.internalauditpeople.com/', '', '0', '0', '', '', '0', '', '', '', '0', '128', '3', '4', '0', '2000-10-01', '2008-01-01 00:00:00', '2005-11-03 03:46:15', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('213', '9', '', 'Toms Company', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '121', '3', '1', '0', '2003-03-01', '2008-01-01 00:00:00', '2005-11-03 03:33:58', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('214', '9', '', 'Corporate Finance People', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '327', '3', '4', '0', '2001-01-01', '2008-01-01 00:00:00', '2005-11-03 03:43:54', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('215', '9', '', 'eDott', '', '', '', '', '', 'http://www.edott.it/', '', '0', '0', '', '', '0', '', '', '', '0', '129', '3', '4', '0', '2001-02-01', '2008-01-01 00:00:00', '2005-11-08 13:37:55', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('216', '9', '', 'People News / Regency House', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '106', '3', '3', '0', '2003-04-01', '2008-01-01 00:00:00', '2005-11-08 13:34:18', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('217', '9', '', 'Trainline', '', '', '', '', '', 'http://www.thetrainline.com/', '', '0', '0', '', '', '0', '', '', '', '0', '135', '3', '4', '0', '2001-01-01', '2008-01-01 00:00:00', '2005-11-03 03:44:19', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('218', '9', '', 'Fox Kids Europe', '', '', '', '', '', 'http://www.foxkidseurope.com/', '', '0', '0', '', '', '0', '', '', '', '0', '105', '3', '4', '0', '2001-02-01', '2008-01-01 00:00:00', '2005-11-03 03:42:29', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('219', '9', '', 'BetterContractIT', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '3', '3', '0', '2002-02-01', '2008-01-01 00:00:00', '2005-11-03 03:39:44', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('220', '9', '', 'HM Treasury', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '326', '3', '4', '0', '2000-06-01', '2008-01-01 00:00:00', '2005-11-03 03:47:06', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('221', '9', '', 'World Aids Day', '', '', '', '', '', 'http://www.worldaidsday.org/', '', '0', '0', '', '', '0', '', '', '', '0', '127', '3', '4', '0', '2001-03-01', '2008-01-01 00:00:00', '2005-11-03 03:42:18', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('222', '9', '', 'Reading Room', '', '', '', '', '', 'http://www.readingroom.com/', '', '0', '0', '', '', '0', '', '', '', '0', '140', '3', '4', '0', '2001-03-01', '2008-01-01 00:00:00', '2005-11-03 03:43:12', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('223', '9', '', 'Reading Room Sydney', '', '', '', '', '', 'http://www.readingroom.com.au/', '', '0', '0', '', '', '0', '', '', '', '0', '140', '3', '3', '0', '2001-07-01', '2008-01-01 00:00:00', '2005-11-03 03:40:26', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('224', '9', '', 'Reading Room Intranet', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '3', '4', '0', '2001-06-01', '2008-01-01 00:00:00', '2005-11-03 03:41:04', '2004-02-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('244', '4', '', 'Beachcomber UK Open Singles', 'After several years out of the game to complete my degree I returned to Grimsby to await my results. Shortly after I arrived home I entered a national 8 ball event, the UK Open with Butch Reynolds and Ewen Robertson. I managed to make the final without dropping a frame where I just edged out my opponent 4:3 in a tight high quality final. ', '', '', '', '', '', '', '0', '0', '', '', '128', '1st', '400', '', '235', '310', '4', '0', '0', '1999-05-21', '2008-01-01 00:00:00', '2005-11-08 23:30:42', '2004-02-06 00:00:00', '1');
INSERT INTO `articles` VALUES ('245', '4', '', 'London Singles - England Wild Card', 'After moving to London to work for a web development agency in April 2000 I started playing 8 ball again. I found out about a weekly competition that some of the best players in London played in. I managed to win it twice, finish runner up once and losing semi finalist once in the first 4 weeks. I then found out that the England 8 ball captain was playing in the event and he approached me asking if I wanted to play for the England team. Unfortunately I had already decided to move to australia so I was unable to take up his offer.', '', '', '', '', '', '', '0', '0', '', 'London', '0', '', '', '', '235', '306', '4', '0', '0', '2000-10-01', '2008-01-01 00:00:00', '2005-10-23 23:29:54', '2004-02-06 00:00:00', '1');
INSERT INTO `articles` VALUES ('247', '4', '', 'Grimsby Division 1 Singles', 'Between 1990 and 1992 I managed to win the Grimsby and District Division 1 singles title 3 times in a row. The only other winner of the event was Butch Reynolds, for this achievment I got to keep the sheild.', '', '', '', '', '', '', '0', '0', '', '', '128', '1st', 'TROPHY', '', '235', '309', '4', '0', '0', '1992-05-01', '2008-01-01 00:00:00', '2005-11-04 18:22:45', '2004-02-06 00:00:00', '1');
INSERT INTO `articles` VALUES ('248', '4', '', 'Reighton Sands UK Open Doubles', 'After winning the singles event I played the doubles with a young wayne camm. Wayne was still a very good player at the time but I remember him taking my advice on every shot. We won through some tight games against a couple of pro teams and managed to win the overall title in what turned out to be a great weekend for me. Wayne went on to turn professional and become one of the best players in the UK.', '', '', '', '', '', '', '0', '0', '', '', '64', '1st', '400', '', '235', '308', '4', '0', '0', '1995-05-01', '2008-01-01 00:00:00', '2005-11-04 01:30:54', '2004-02-06 00:00:00', '1');
INSERT INTO `articles` VALUES ('249', '4', '', 'Reighton Sands UK Open Speed Pool', 'This tournament was my first major national tournament that I had been too. It was around the time when I was playing heavily and was cueing very well. I decided to have a go at a new speed pool challenge that had been touring the country. This game used an electronic machine that allowed a few seconds for every shot. ', '<P>The referee would press a button after each shot and the clock was stopped to rack the balls. You only scored points for each ball pocketed if&nbsp;you played your shot within the few seconds allowed. Also, you scored more points for potting red or yellow balls in sequence, so if you potted one red you got 10 points and if you potted a second red after the first red you would get an extra 20 points and then 30 for the next red etc. </P>\r\n<P>The person with the highest points total in the allowed time won the event. I was lucky enough to pot all 7 reds in a row, then all 7 yellows in a row and then the black (which had to be taken last) without missing a ball at speed pool pace. \r\n<P>I was told that I was the first person to do this in the all the events that had been held in the UK. </P>', '', '', '', '', '', '0', '0', '', 'Reighton Sands, UK', '128', '1st', '200', '', '235', '311', '4', '0', '0', '1993-05-01', '2008-01-01 00:00:00', '2005-11-04 17:45:50', '2004-02-06 00:00:00', '1');
INSERT INTO `articles` VALUES ('250', '4', '', 'Coaching', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '149', '306', '4', '0', '0', '1997-07-01', '2008-01-01 00:00:00', '2005-10-23 23:30:40', '2004-02-06 00:00:00', '2');
INSERT INTO `articles` VALUES ('251', '4', '', 'Beachcomber UK Open Team', 'After winning the singles event I was invited to play in the team competition with the England captain. We made it through to the semi final where the match finished tied so we had to play a single frame decider. I was playing so well that the England captain asked me if I wanted to play the play off game. I decided to let him play it as he had a good record against the opposition player. He won the frame and we went on to win in the final.', '', '', '', '', '', '', '0', '0', '', '', '64', '1st', '250', '', '235', '310', '4', '0', '0', '1999-05-21', '2008-01-01 00:00:00', '2005-11-04 01:29:38', '2004-02-06 00:00:00', '1');
INSERT INTO `articles` VALUES ('252', '4', '', '1.79m High Jump', 'From 4 steps', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '4', '0', '0', '1989-01-01', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-02-06 00:00:00', '2');
INSERT INTO `articles` VALUES ('253', '4', '', 'Tele Tubbies', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '3', '0', '0', '1998-01-01', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-02-06 00:00:00', '2');
INSERT INTO `articles` VALUES ('254', '4', '', 'Quad Bikes', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '3', '0', '0', '1998-02-01', '2008-01-01 00:00:00', '2004-02-06 00:00:00', '2004-02-06 00:00:00', '2');
INSERT INTO `articles` VALUES ('255', '6', '', 'Crete', 'Rob, Craig Smith, Mark, ?', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1993-06-01', '1993-08-01 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('256', '6', '', 'Corfu', 'Mam Dad and Jason', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1990-08-01', '1990-08-01 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('257', '6', '', 'Work America', '1 Year and a Day, 25 states, USA, Iceland, Leichtenstein, Switzerland, Italy, Greece, Athens, Paros, Ios', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1994-01-01', '1995-06-26 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('258', '6', '', 'S.E.Asia and Middle East', 'First class flights/babe, Maldives, Sril Lanka, Singapore(free champage, hostesses), Malaysia(Tioman Island,KL,Penang), Indonesia(Port,Bukit Lewang, Volcano), Thailand(Phuket, Phi Phi, Bangkok Airport Sleep)', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1997-06-01', '1997-07-25 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('259', '6', '', 'Turkey 1', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1996-11-08', '1996-11-12 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('260', '6', '', 'Turkey 2', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1996-12-06', '1996-12-09 00:00:00', '2004-01-25 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('261', '6', '', 'Turkey 3', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1997-02-23', '1997-03-03 00:00:00', '2004-01-25 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('262', '6', '', 'American Summer', '3 months, removals and studies', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1996-06-14', '1996-09-01 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('263', '6', '', 'American New Year', '2 Weeks with Jim and Mrs. NYC, New Orleans(NYE), Miami, NYC', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1997-12-29', '1998-01-10 00:00:00', '2004-01-25 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('264', '6', '', 'Thai Summer', 'Dubai(Jumeirah Beach), Bangkok(Landmark, Amari Boulavard, Puppies), Koh Samaui(Tongsai Bay, Shack), Phuket(seven sea),Bangkok, Phetchabuun, Bangkok, over stayed by 56 days and had to pay 5600 bhat!', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1998-06-12', '1998-09-08 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('265', '6', '', 'Thai New Year', 'Free Tickets (France Air Bump)Bangkok (NYE, Engagement (Jan 1st 1999), Pattaya, Bangkok', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1998-12-26', '1999-01-11 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('266', '6', '', 'Graduation RTW', 'Sri Lanka (Kandy, Snooker, elephants, disco), Singapore,Malaysia, Thailand (work, restaurant), HK, Singapore, Melbourne, NZ, Melbourne bus Sydney, bangkok, pattaya(motorbike), bangkok, singpaore, Home', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1999-07-15', '2000-03-01 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('268', '6', '', 'Thai Fight', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2000-07-06', '2000-07-22 00:00:00', '2004-02-08 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('269', '6', '', 'Australia Bound', 'London, Rio, Boenes Aires, Aukland, Sydney', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2001-05-12', '2001-05-22 00:00:00', '2004-01-25 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('270', '6', '', 'Oman 1', 'Sydney, Singapore, Dubai (met Jon), Oman, Dubai(2 nights), Singapore, Sydney', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2002-04-11', '2002-04-21 00:00:00', '2004-01-25 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('276', '6', '', 'Thai Easter', 'Phuket Charter Flight, Crazy golf?', 'Animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere.', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '1998-03-16', '1998-04-01 00:00:00', '2004-01-25 00:00:00', '2004-01-25 00:00:00', '1');
INSERT INTO `articles` VALUES ('277', '4', '', 'Mamma Mia', '', '', '', '', '', '', '', '0', '0', '', 'L19, Lyric Theartre, Star City', '0', '', '', '', '158', '7', '4', '0', '0', '2003-01-01', '2008-01-01 00:00:00', '2005-11-05 02:25:02', '2004-02-07 00:00:00', '1');
INSERT INTO `articles` VALUES ('278', '4', '', 'Simply Red', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '4', '0', '0', '1994-02-01', '2008-01-01 00:00:00', '2004-02-07 00:00:00', '2004-02-07 00:00:00', '2');
INSERT INTO `articles` VALUES ('279', '4', '', 'Peter Andre', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '235', '0', '4', '0', '0', '1997-02-01', '2008-01-01 00:00:00', '2004-02-07 00:00:00', '2004-02-07 00:00:00', '3');
INSERT INTO `articles` VALUES ('280', '4', '', 'Cirque Du Soleil - Mystere', '', '', '', '', '', '', '', '0', '0', '', 'Treasure Island Hotel and Casino', '0', '', '', '', '106', '146', '4', '0', '0', '2003-05-15', '2008-01-01 00:00:00', '2005-11-05 02:24:38', '2004-02-07 00:00:00', '1');
INSERT INTO `articles` VALUES ('281', '4', '', 'Jim Goes Home', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '106', '0', '5', '0', '0', '1994-12-29', '2008-01-01 00:00:00', '2004-02-08 00:00:00', '2004-02-08 00:00:00', '2');
INSERT INTO `articles` VALUES ('282', '9', '', 'Go Matilida', '', '', '', '', '', 'http://www.gomatilda.com/', '', '0', '0', '', '', '0', '', '', '', '0', '134', '3', '4', '0', '2001-06-01', '2008-01-01 00:00:00', '2005-11-03 03:41:33', '2004-02-08 16:43:13', '1');
INSERT INTO `articles` VALUES ('283', '4', '', 'FIFA World Stars v Brazil', ' A crowd of 78,416 turned out at Giants Stadium on July 14, 1996, at the time, the crowd was the largest ever for a sporting event at the Meadowlands Sports Complex, surpassed only by the Pope\'s visit in 1995. \r\n\r\nIn the following exhibition, Brazil\'s Olympic team -- featuring budding superstar Ronaldo -- defeated the FIFA World Stars 2-1.', 'Brazilian World Cup star Bebeto opened the scoring for Brazil three minutes into the second half when he beat Chilean goalkeeper Nelson Tapia. Responding in the 69th minute, Argentine star Fernando Redondo raced down the left wing and crossed the ball to Germany\'s Juergen Klinsmann, who hit a volley to beat Brazilian goalkeeper Dida.\r\n\r\nBrazil\'s Roberto Carlos scored the game winner nine minutes later when he surprised Tapia with a shot that slipped inside the near post.\r\n\r\nFor Brazil, the game was the final tuneup before the Atlanta Olympic Games.\r\n\r\n\"I was very impressed with the stadium and the crowd,\" Klinsmann said. \"We were not surprised by Brazil and the way they played.\"', '', '', '', '', '', '0', '0', '', 'Giants Stadium', '0', '', '', '', '106', '148', '4', '0', '0', '1996-07-14', '2008-01-01 00:00:00', '2004-02-10 20:18:11', '2004-02-10 00:00:00', '1');
INSERT INTO `articles` VALUES ('284', '4', '', '2003 BCA 8 Ball Championships', 'I flew into Vegas after several weeks travelling in Bali, England and NYC. I had had a weeks snooker and 9 ball practice in  Grimsby, England and I was hitting the ball ok. However I had only ever played a few times on the USA style bar box tables while travelling in 1995. I was confident that I could play well because the pockets are huge but I was unsure about how I would cope with the bigger balls.', '<P>It always been my dream to play in the BCA national championships in Las Vegas and I can only say the sheer size of tournament far exceeded my wildest expectations and rekindled my pashion for the sport! </P>\r\n<P>May 11th to May 17th Las Vegas </P>\r\n<P>&nbsp;</P>\r\n<P><IMG alt=\"\" src=\"http://localhost:8500/wwwthelifeofrileyorg/uploads/images/article_jizzvegas2.jpg\" border=1></P>\r\n<P>&nbsp;</P>\r\n<P><IMG alt=\"\" src=\"http://localhost:8500/wwwthelifeofrileyorg/uploads/images/article_vegas2002.jpg\" border=1></P>', '', '', '', '', '', '0', '0', '', 'Riviera Hotel and Casino', '2000', '13th', '1500', '', '106', '149', '4', '0', '0', '2003-05-11', '2008-01-01 00:00:00', '2005-11-04 17:40:07', '2004-02-10 19:26:34', '1');
INSERT INTO `articles` VALUES ('285', '4', '', 'Riddock Bowe v Andrw Golota', '', '', '', '', '', '', '', '0', '0', '', 'Madison Square Garden', '0', '', '', '', '106', '150', '4', '0', '0', '1996-07-11', '2008-01-01 00:00:00', '2005-11-05 02:30:01', '2004-02-10 19:30:40', '1');
INSERT INTO `articles` VALUES ('286', '4', '', 'The Ashes - England v Australia', '', '', '', '', '', '', '', '0', '0', '', 'Sydney Cricket Ground', '0', '', '', '', '158', '147', '4', '0', '0', '2003-01-02', '2008-01-01 00:00:00', '2005-11-05 02:27:40', '2004-02-10 19:33:40', '1');
INSERT INTO `articles` VALUES ('287', '4', '', 'Friendly - England v Hungary', '', '', '', '', '', '', '', '0', '0', '', 'Wembly Stadium', '0', '', '', '', '235', '145', '4', '0', '0', '1996-05-18', '2008-01-01 00:00:00', '2007-03-26 06:03:51', '2004-02-10 19:39:35', '1');
INSERT INTO `articles` VALUES ('288', '4', '', 'Waratahs v British Lions', '', '', '', '', '', '', '', '0', '0', '', 'Sydney Football Stadium', '0', '', '', '', '235', '151', '4', '0', '0', '2001-06-23', '2008-01-01 00:00:00', '2005-11-05 02:29:05', '2004-02-10 19:42:14', '1');
INSERT INTO `articles` VALUES ('289', '4', '', 'Australian Tennis Open', '', 'Chris Woodruff 5-7, 6-1, 4-6, 6-3, 5-7 17th - 30th January 2000 ', '', '', '', '', '', '0', '0', '', 'Melbourne', '0', '', '', '', '158', '153', '4', '0', '0', '2000-01-23', '2008-01-01 00:00:00', '2005-11-05 02:29:20', '2004-02-10 19:44:14', '1');
INSERT INTO `articles` VALUES ('290', '4', '', 'Euro 96 - Germany 2 : 0 Czech Republic', '', 'Live on BBC1 Ziege 25 Moller 31 ', '', '', '', '', '', '0', '0', '', 'Old Trafford', '0', '', '', '', '235', '0', '4', '0', '0', '1996-06-09', '2008-01-01 00:00:00', '2007-03-26 06:03:25', '2004-02-10 19:54:34', '1');
INSERT INTO `articles` VALUES ('291', '4', '', 'Italian Seria A - Lazio v Brescia', '', '', '', '', '', '', '', '0', '0', '', 'Rome Olympic Stadium', '0', '', '', '', '215', '0', '4', '0', '0', '1995-05-01', '2008-01-01 00:00:00', '2007-03-26 06:04:30', '2004-02-10 20:31:34', '1');
INSERT INTO `articles` VALUES ('292', '4', '', 'Robbie Williams', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '158', '162', '4', '0', '0', '2003-12-14', '2008-01-01 00:00:00', '2005-11-05 02:23:45', '2004-02-10 21:21:54', '1');
INSERT INTO `articles` VALUES ('293', '4', '', 'F.A. Cup - Wimbledon 0 v 1 Grimsby Town', 'I decided to go to America for a year after quiting Loughborough Univerity. I had chosen the wrong course and I wanted to take a year out to \'find myself\' and err, party! I arrived in New York City and the sight of its imposing skyline is something I\'ll never forget. I met my friend Jim in the middle of Manhatton and we decieded to try and buy some blackmarket tickets. England new of my plans to go to America and had deliberatly avoided qualification in order to spoil my trip. ', 'I was determined to experience the occassion nevertheless and we headed off to gients stadium. I decided to go to America for a year after quiting Loughborough Univerity. I had chosen the wrong course and I wanted to take a year out to \'find myself\' and err, party! I arrived in New York City and the sight of its imposing skyline is something I\'ll never forget. I met my friend Jim in the middle of Manhatton and we decieded to try and buy some blackmarket tickets. England new of my plans to go to America and had deliberatly avoided qualification in order to spoil my trip. I was determined to experience the occassion nevertheless and we headed off to gients stadium. ', '', '', '', '', '', '0', '0', '', 'Wandle End, Plough Lane', '0', '', '', '', '235', '0', '4', '0', '0', '1989-02-18', '2008-01-01 00:00:00', '2007-03-26 06:05:16', '2004-02-10 21:28:14', '1');
INSERT INTO `articles` VALUES ('294', '4', '', 'Eddie Izzard', '', '', '', '', '', '', '', '0', '0', '', 'T22, Enmore Theartre', '0', '', '', '', '158', '159', '4', '0', '0', '2003-08-01', '2008-01-01 00:00:00', '2005-11-05 02:23:58', '2004-02-10 21:33:36', '1');
INSERT INTO `articles` VALUES ('295', '4', '', 'Euro 2004 Portugal', 'I arrived in the UK after a few crazy weeks in the USA. I was really looking forward to watching the footy in the UK as opposed to Australia but I wasn\'t planning on flying to Portugal to use my tickets. I was running out of holidays from work and I was hoping to sell my tickets during my stay. However I missed my flight back to Oz and decided to take advantage of this bad luck by ctaching a last minute flight to Portugal to watch two Quarter Final matches.', 'Flights to Portugal where already hard to come by but when England set up a Quater final clash with the hosts, Portugal the price started to go through the roof! I was lucky enough to get a pretty cheap open jaw ticket flying into Faro near the ALgarve and out of Porto. This was pretty good as the two games I wanted to see where in Lisbon. \r\n<P>I spent the night in heathrow airport on the way out in order to catch an earlier flight which brought back many memories from my backpacking exploits. Then when I arrived in Faro I had to jump straight onto a bus for a 5 hour ride to Lisbon!. \r\n<P>By the time I arrived in Lisbon I was very tired but I couldn\'t find a hotel room for love or money. I was also running out of time to make it to the stadium to watch Germany v Czech, therefore I decided to leave my bags in left luggage and sort out a hotel after the game. \r\n<P>More... \r\n<P>A few months ago I was lucky enough to get all the tickets I wanted for Euro 2004. I have category A tickets for Germany v Czech and two Quarter Final matches. Therefore I will be jetting off to Portugal to join up with the barmy army once again. I will probably stop in Portugal as part of a round the world trip as I\'m hoping to play in a couple of big pool comps in Asia and the US. Last but not least I\'ll be back in blighty for a week or so and I\'m very much looking forward to seeing some old friends in London and Grimsby. Its promises to be another crazy world tour, COME ON ENGLAND! </P>', '', '', '', '', '', '1', '0', '', '', '0', '', '', '', '225', '160', '4', '0', '0', '2004-06-27', '2008-01-01 00:00:00', '2005-11-05 02:26:37', '2004-03-13 12:22:58', '1');
INSERT INTO `articles` VALUES ('296', '4', '', 'Australia NSW Easter Cup', 'This event was a NSW ranking event held in the Bald Face Stag in Leichardt, Sydney. There where more than 64 runners and the event was run over two days, Saturday the 10th and Monday the 12th of April. I had\'t played much pool but I decided to go along and try not to get bored like I usually do with the endless waiting. I played really well in patches and was lucky enough to get to the final. ', 'In the first round I beat one of the asian guys 5:1. \r\n<P>I next played a pommie guy and potted out the first four games first visit. The guy looked a little shocked as he was 4:0 down and he had only broken twice. I snookered myself on the my last ball in the 4th frame and his wife shouted good shot which pissed me off a little. My last ball was over the middle pocket but the natural angle to come of the cushion was blocked. I swerved the white into the cushion and came across the table to pot my ball. This left a really thinkg snick on the black which I smahed in. In the 5th frame I had a chance for the white wash and five finishes which I had never done from memory and i had a good chance. Unfortunately I had to play a cannon to free up a ball but it rattled and didn\'d drop. I managed to win the frame anyway which put me in the last 16 and meant I had to come back on Easter Monday. \r\n<P>My first game on Monday was against Steve Woods, a very good player from Canberra who mainly plays two shot 8 ball on UK tables. I was playing well and pulled off some good finsihes to go 3:0 up. Again, my oponent looked a little shocked as he had only had one shot and was 3:0 down. This meant I had finsihed 7 out of the last 8 frames first visit and would have been 8 in a row if I hadn\'t rattled that cannon! But to Steve\'s credit he then started to play really well and pulled off some great shots to go 4:3 in front! I managed to level under pressure and level the match. In the final frame Steve had a half chance and missed a ball which left me a tough finish. I had one ball tied up on the cushion which I tried to move straight away. Unfortunately I was left with a ugly cut back into a very tight blind middle pocket with all the balls on for both of us. I decided to go for it anyway and it dropped in and I went on to clear the table. \r\n<P>In the Quater finals I had to play George the number three seed. I started off badly and George had a few chances to get out in front but he also missed a few easy balls. At 3:2 down I got my act together and made three good finishes potting some long pressure blacks to win 5:3. \r\n<P>In the semi final I had to play Steve Abdul, the number four seed. Again I started badly and went behind 3:2 even though I didn\'t miss many shots. Again I managed to start concentrating again and managed to win 5:3. \r\n<P>In the final I had to play Shaun Budd, the number one ranked player and probably the best player I have seen in Australia. I went 1:0 up thanks to a miss by Shaun and then missed an easy ball myself to go 2:0 up. We both continued to miss easy shots and I missed 4 easy balls in the next four frames to go 4:2 down. I pulled off a good finishe to make it 4:3 and then missed a good chance in the last to tie the match. I lost 5:3 but all in all it was a good couple of days. I relaxed a bit in the final as I usauly do, it was only when i got home that I realised I was effectively playing for $400 - doh! </P>', '', '', '', '', '', '1', '0', '', 'Bald Faced Stag', '64', '2nd', '200', '', '158', '306', '4', '0', '0', '2004-04-12', '2008-01-01 00:00:00', '2005-11-04 01:22:54', '2004-04-16 10:30:55', '1');
INSERT INTO `articles` VALUES ('297', '4', '', '2004 VNEA 8 Ball Championships', 'After finishing 13th in the 2003 BCA open I was determined to return to Vegas to pit my skills against the best players in America and the world. This year however I would be playing in the VNEA event as I missed the deadline for the BCA. Over 1000 runners turned up for the open 8 ball all hoping to take home the US$8000 first prize.', '', '', '', '', '', '', '0', '0', '', 'Riviera Hotel, Las Vegas', '1000', '33rd', '650', '', '106', '315', '4', '0', '0', '2004-05-28', '2008-01-01 00:00:00', '2005-11-04 01:22:01', '2004-07-04 17:43:52', '1');
INSERT INTO `articles` VALUES ('298', '4', '', '2004 VNEA National 9 Ball Championship', 'I stepped of a plane from a long flight from Sydney to Las Vegas to enter only my second ever 9 ball competition. The event was played on bar boxes which made it very tough, but in addition in order to qualify for the finals each player had to win a 16 player mini tounrament. I managed to win one of the first (and most difficult) qualifying tournaments at my first attempt to book my place in the last 128.', 'In the finals it was single elimination and I had to play a multi state champion in the first round, I played well and won 5:3. In the next round I had to play the guy who had played so well to knock me onto the losers side of the8 ball singles. I was lucky enough to get my revenge and advance to the next round. I had little sleep and was drinking many red bull energy drinks in order to stay awake but I somehow managed to make the quarter final. Here I had to play a guy who finished 5th in the 8 ball singles event. I raced to a 4:0 lead and had a simple run out for the match. On the 8 ball I simply had to screq the ball back for positon on the 9 ball. However somehow I managed to jump the cue ball which cost me the frame. My opponent then ran out the next frame to set up a decider. I had him in jail in the last frame full ball snookered with all the balls open. He decided to smash the white of the cushion into the opject ball and he was lucky enough to fluke another ball and he ran out for the win. I had missed a great chance to win the event but that\'s 9 ball! ', '', '', '', '', '', '0', '0', '', 'Riviera Hotel and Casino, Las Vegas', '500', '5th', '300', '', '106', '315', '4', '0', '0', '2004-05-27', '2008-01-01 00:00:00', '2005-11-04 01:48:33', '2004-07-04 17:45:30', '1');
INSERT INTO `articles` VALUES ('299', '4', '', '2004 Reno Open', 'After playing in two 9 balls events I decided to try my look against the professionals on full sized tables. In the first round I got my wish as I was drawn against Max Eberle, the WPA ranked 10th best player in the world at the time.', 'I ran out the first two racks for a 2:0 lead and then missed a couple of easy balls which left the match tied at 2:2. I then found my rythm again and won the next three racks for a 5:3 lead. In the enxt frame I played a great positional shot to leave me a 5-9 combo. Max called the ref to put some pressure on me as it was a little tight, I made the combo but unbeleivably the white double kissed the 5 and follewed the 9 ball along the rail for a scratch. I was left cursing my look and when I realised that I could could have been 8:0 up with a little more care, instead it was 5:3. Max seized his oppotunity and went on to win the match but I went away believing that with proper practice I could certainly compete at this level. I went on to win 4 matches on the losers side for a 33rd place finish and $150. ', '', '', '', '', '', '0', '0', '', 'Sands Casino, Reno', '200', '33rd', '150', '4', '106', '314', '4', '0', '0', '2004-06-07', '2008-01-01 00:00:00', '2005-11-04 19:12:59', '2004-07-04 17:47:01', '1');
INSERT INTO `articles` VALUES ('300', '4', '', 'Euro 2004 - England v Portugal', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '225', '165', '4', '0', '0', '2004-06-24', '2008-01-01 00:00:00', '2004-07-04 21:01:22', '2004-07-04 17:49:10', '1');
INSERT INTO `articles` VALUES ('301', '4', '', 'Euro 2004 - Germany v Czech Rep.', '', '', '', '', '', '', '', '0', '0', '', 'Alvalade Stadium, Lisbon', '0', '', '', '', '225', '166', '4', '0', '0', '2004-06-23', '2008-01-01 00:00:00', '2004-07-04 21:01:05', '2004-07-04 17:49:39', '1');
INSERT INTO `articles` VALUES ('302', '6', '', 'USA, England and Portugal RTW', 'I was originally only going to go to America to play in a couple of pool tournaments, but it turned into a 1 month round the world trip! I played pool in Las Vegas and Reno, stopped in NYC for a great weekend and also went on a crazy road trip to the infamous Area 51! I also spent a week in England and a crazy few days in Portugal with the barmy army cheering on England!', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2004-05-27', '2004-06-27 00:00:00', '2004-07-04 00:00:00', '2004-07-04 00:00:00', '1');
INSERT INTO `articles` VALUES ('303', '4', '', 'Australia NSW State Championship', 'In what turned out to be another marathon weekend I managed to make the final of the NSW state championships which where held at the colyton hotel for the first time. Playing best of 9 frames with only 7 tables and almost 128 of the best players in the state nationwide ensured the first day lasted late into the night.', '<P>I managed to remain patient and although I missed out on a monster 7 card brag pot(over $200!) I managed to win my first two matches 5:0 and 5:1.</P>\r\n<P>This booked my place in the last 32 and meant I could go home for a few hours sleep before returning Sunday morning for an early start. In my first match I lost the first two frames to Brian Bently before waking up and running out 5:2 winner for a place in the last 16. </P>\r\n<P>Next I played Joe D (the number 7 seed) and I played quite well to win 5:1. It was my old foe George M (the number 3 seed) next and despite missing two simple balls for a 4:0 lead I managed to fall over the line 5:4 with a couple of special clearences. In the semi final I played Hok (the 2002 winner) and although I started poorly I pulled of some very good finishes to win comfortably 5:1. \r\n<P>This put me in the final where I played Digby Paul for the first time. I missed an easy ball to lose the first frame but then ran out the next two to lead 2:1. In the next frame I snookered myself by a inch on my last ball to go 2:2 instead of 3:1 up. I won the next with a good clearence to lead 3:2. The next frame proved to be the turning point of the match. Digby went for the finish first but despite a couple of attempts could not develop his last ball. This left the table open for me to finish which I did up until my last ball which was over the corner pocket. The white was no more than 6 inches away and with the black over the middle pocket I only had to screw back a foot or so to lead 4:2. When I was down on my shot I was thinking about how I jumped the white ball in Las Vegas (which cost me a place in the 9 ball semi finals) and I tried to make sure I didn\'t do this again. Unbelievably I hit the white and it jumped clean over my last ball and even though it came back and hit my ball, a ball didn\'t hit a cushion which meant ball in hand to my opponent. Digby snookered me and I played a good escape to leave the white down the table . Digby played an outragous length of the table treble which he missed but he only left me a very difficult cut down the cushion which I also missed. Digby finished the frame to square the match at 3:3 and I was left wondering how I hadn\'t already won the match 5:1? Digby then produced a couple of excellent finishes to win the next two games and run out 5:3 winner. \r\n<P>Although I was dissapointed to lose the final I was pleased to have got that far since I hadn\'t played pool for a month and I had missed a lot of balls and hadn\'t really played my best pool over the weekend. </P>', '', '', '', '', '', '1', '0', '', 'Colyton Hotel', '128', '2nd', '1000', '', '158', '306', '4', '0', '0', '2004-07-11', '2008-01-01 00:00:00', '2005-11-04 17:38:44', '2004-07-12 20:58:33', '1');
INSERT INTO `articles` VALUES ('304', '4', '', '2003-2004 Jock McLean Snooker League', 'In only 14 matches this season I have manged to make eight 50+ breaks (69,62,58,53,52,52,51,50). I have also made over fifteen 30+ breaks and over ten 40+ breaks. My team Coogee A finished top of the league having gone the whole season unbeaten. I lost one match 2:1, which was my first league loss in Australia.', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '158', '163', '4', '0', '0', '2004-07-21', '2008-01-01 00:00:00', '2005-08-04 16:01:03', '2004-07-21 12:24:10', '1');
INSERT INTO `articles` VALUES ('312', '9', '', 'Logic Space', '', '', '', '', '', 'http://www.logicspace.com.au/', '', '0', '0', '', '', '0', '', '', '', '0', '132', '3', '3', '0', '2002-08-01', '2008-01-01 00:00:00', '2005-11-03 03:34:13', '2004-08-10 22:37:44', '1');
INSERT INTO `articles` VALUES ('313', '6', '', 'Wogga Wogga with a sprinkling of snow', 'What better way to spend a looong weekend than playing pool in Jazzy Wagga Wagga followed by a couple of days snowboarding in the Snowy Mountains. Yes 6 days, 1300 kms, a brand new ipod, my trusty balabuska and some very warm clothes resulted in some serious drinking and muscle cramp, definately (maybe) never again!', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '158', '0', '0', '0', '0', '2004-09-10', '2004-09-15 00:00:00', '2004-09-16 00:00:00', '2004-09-16 00:00:00', '1');
INSERT INTO `articles` VALUES ('315', '4', '', 'Cirque Du Soleil - Quidam', 'I first saw a Cirque Du Soleil performance in in the Ballagio Hotel in Las Vegas. That first performance took my breath away and is something I will never forget. Although Quidam was a travelling production it still contained enough quality to produce an endless amount of \"ooh\'s\" and \"agh\'s\". I had bought front row seats and as I suspected I was picked on half way through the show to get up on stage.  ', 'Like the 3 people before me a clinged to my seat as though my life depended on it which earnt me a severe \"hair ruffling\" from the performer in question. Even though I was successful in resisting the stage I still felt like a right <EM>clown</EM>! ', '', '', '', '', '', '0', '0', '', 'Fox Studios, Sydney', '0', '', '', '', '158', '203', '4', '0', '0', '2004-09-19', '2008-01-01 00:00:00', '2005-11-05 02:22:19', '2004-09-19 22:25:17', '1');
INSERT INTO `articles` VALUES ('316', '4', '', 'Efren', 'I had been trying to find Efren \"The Magician\" Reyes for about two weeks. I was a stranger in Manila and I had all but given up hope of locating this legend when my luck finally changed. I met a guy who knew Efren and after a couple of phone calls the Match was on. I had 30 minutes to get to the other side of Manila to play Efren Reyes, the greatest pool player that ever lived for my hard earned cash.', '<P>What are you doing you fool I thought, this is the best player on the planet and recently back from sweeping all before him in the Derby City Classic in the USA!</P>\r\n<P>Well that was the whole point after all, I was confident in my ability but I was not playing him to win money. I wanted to find out how good the BEST really was, and in my opinion he was head and shoulders above every other professional pool player in the world. A legend in the game \"The Magician\" was famous for his cue ball control and calm demeanor but it was his brilliant shot making that earned him is often understated nickname. </P>\r\n<P>Twenty minutes to go and I could feel the butterfly\'s as my driver who was doing a fine impression of Michael Schumacher weaved through the red lights and districts of Manila\'s back streets. I had made the mistake (in my excitement) of telling Mr Schumacher that I was about to play Efren \"Bata\" Reyes - this was almost the death of me! Pool is the national sport of the Philippines and Efren Reyes is basically a god there, more famous than almost any other person. I sensed that my taxi driver friend felt it his duty to deliver me to Efren as quickly as possible so he could relieve me of my cash. \r\n<P>He arrived outside the building and I walked up the stairs. I had been in this pool hall a week earlier in the day time but it was quite and it didn\'t really prepare me for what I saw. The place was packed with about 200-300 local players and it looked like there was another money match being played in the middle. I turned around and went to the bathroom before walking in. What are you doing I thought, you can\'t play on 9 ball tables with a 9 ball cue! You\'re going to make yourself look like a right idiot! However I reminded mysef that I was only going to see how good the very best was, it didn\'t matter if I lost I was expected too! I also have to admit that although it had been over 10 years since I played for money in front of a packed house, the buzz was there and I recognized it, I couldn\'t wait to play him! \r\n<P>I walked into the pool room and leant against the bar and scanned the room with my eyes looking for a guy that looked like he was expecting me, or better still the Magician himself. I spotted them both in the corner so I walked over, attracting many curious stares along the way. I felt like new meat in a Lions den and I was being eye\'s up by all the young cubs, but I only had eyes for the King. I shook hands with Efren\'s backer and also Efren. He hardly noticed me though as he was engrossed in a game of chess for $5 and I almost felt bag disturbing him. After a few minutes he quit the game from a losing position which didn\'t seem to help his mood. Great I thought he might take it out on me and play his best game. I wanted this more than anything and I knew I had to make a game that gave me the best chance of achieving this. We started talking about the game and I told him I wanted to play 8 bal. He said \"not 1 pocket? I replied that I was \"crap at one pocket\" and he would \"murder me\", he replied it was \"his best game\" probably realizing I wasn\'t going to play it. He agreed to play 8 ball, I asked for the break playing even and to my surprise he said \"he wouldn\'t get a shot\". I took this as a compliment but I knew he was only trying to get the best game. Still this took me by surprise as I really didn\'t expect him to be so unwilling to offer me much in terms of weight? Not that I wanted it really but I was still surprised. However he did say I can have the first break, \"very generous, thanks\" I replied (given you\'re the world champion I thought!) \r\n<P>[more soon...] </P>', '', '', '', '', '', '0', '0', '', 'Manila', '2', '2nd', '-200', '', '184', '185', '4', '0', '0', '2005-02-05', '2008-01-01 00:00:00', '2005-11-04 17:37:52', '2005-03-02 14:24:52', '1');
INSERT INTO `articles` VALUES ('317', '4', '', '2004 - Pool, Holidays and Gadgets Galore!', 'Well in order to celebrate another year end I decided to go on another vacation! It had been a few years since I had last been to Thailand so I thought it would be good to see in the New Year and drowned my Birthday sorrows Thai style. <br>\r\nHowever never one to miss out on free stopover\'s I got to see Ayers Rock, Darwin and Borneo on the way! After starting the year visiting Queensland, summer vacations in Las Vegas and Skiing in the Snowy Mountains this really was a year of adventure!  \r\n', '', '', '', '', '', '', '1', '0', '', '', '0', '', '', '', '149', '204', '1', '0', '0', '2004-12-31', '2008-01-01 00:00:00', '2006-02-06 23:28:45', '2005-03-03 06:12:14', '1');
INSERT INTO `articles` VALUES ('318', '6', '', '4 Country  Xmas and New Year Vacation', 'Ayers Rock, Darwin, Brunei, Malaysia, and Pattaya.', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2004-12-13', '2005-01-21 00:00:00', '2005-03-13 00:00:00', '2005-03-13 00:00:00', '3');
INSERT INTO `articles` VALUES ('319', '6', '', 'Philipines Visa Run and Fun', 'Efren Reyes, Rice Fields, Passport, Thai Visa.', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '184', '0', '0', '0', '0', '2005-01-21', '2005-02-11 00:00:00', '2005-03-13 00:00:00', '2005-03-13 00:00:00', '3');
INSERT INTO `articles` VALUES ('320', '9', '', 'SHFA', '', '', '', '', '', 'http://www.shfa.nsw.gov.au/', '', '0', '0', '', '', '0', '', '', '', '0', '319', '3', '2', '0', '2005-03-01', '2008-01-01 00:00:00', '2005-11-08 13:12:06', '2005-03-13 13:36:38', '1');
INSERT INTO `articles` VALUES ('321', '9', '', 'Rocks Chamber of Commerce', '', '', '', '', '', 'http://www.therocks.com/chamber', '', '0', '0', '', '', '0', '', '', '', '0', '348', '3', '2', '0', '2005-01-01', '2008-01-01 00:00:00', '2005-11-08 13:27:57', '2005-03-13 13:37:25', '1');
INSERT INTO `articles` VALUES ('322', '9', '', 'Darling Harbour', '', '', '', '', '', 'http://www.darlingharbour.com', '', '0', '0', '', '', '0', '', '', '', '0', '320', '3', '2', '0', '2004-02-01', '2008-01-01 00:00:00', '2005-11-08 13:30:38', '2005-03-13 13:37:46', '1');
INSERT INTO `articles` VALUES ('323', '9', '', 'Australian Technology Park - Redesign', '', '', '', '', '', 'http://www.atp.com.au', '', '0', '0', '', '', '0', '', '', '', '0', '318', '3', '2', '0', '2004-12-01', '2008-01-01 00:00:00', '2005-11-03 03:26:27', '2005-03-13 13:44:12', '1');
INSERT INTO `articles` VALUES ('324', '9', '', 'The Rocks', '', '', '', '', '', 'http://www.therocks.com', '', '0', '0', '', '', '0', '', '', '', '0', '321', '3', '2', '0', '2004-04-01', '2008-01-01 00:00:00', '2005-11-03 03:28:03', '2005-03-13 13:46:12', '1');
INSERT INTO `articles` VALUES ('325', '4', '', 'Australia NSW 2004 Ranking List', 'In only my second year and despite only playing 6 out of the 9 events, I finished ranked 2nd in the New South Wales rankings. In the 6 events I played in I accumilated more points than any other player which makes me wonder if I would have topped the overall rankings if I had played in all the available events.', 'The overall standings where as follows: \r\n<P><B>404</B> - Shaun Budd<BR><B>327</B> - Craig Riley<BR><B>300</B> - Dennis Paul<BR><B>236</B> - Joe Deguara<BR><B>236</B> - George Mariglis<BR><B>229</B> - Stuart Lawler<BR><B>221</B> - Steve Abdul<BR>\r\n<P>The standings for the 6 events that I played in ONLY are: \r\n<P><B>327</B> - Craig Riley<BR><B>294</B> - Shaun Budd<BR><B>270</B> - Dennis Paul<BR><B>192</B> - Joe Deguara<BR>\r\n<P>Of course not everyone played in all the 6 events that I played in so it is hard to get a true impression. Given that it was my choice to miss some events and that Shaun Budd won more events than anyone else this year most people would he agree he deserves the overall number 1 ranking. \r\n<P></P>', '', '', '', '', '', '0', '0', '', 'Sydney', '200', '2nd', '0', '', '158', '306', '4', '0', '0', '2004-12-13', '2008-01-01 00:00:00', '2005-11-04 01:19:39', '2005-03-13 14:17:41', '1');
INSERT INTO `articles` VALUES ('326', '4', '', 'World Wide Wonder - Angkor Wat?', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '117', '0', '5', '0', '0', '2005-03-24', '2008-01-01 00:00:00', '2005-08-04 16:37:19', '2005-08-04 15:32:00', '2');
INSERT INTO `articles` VALUES ('327', '4', '', '31st Birthday - Lets (Hard) Rock!', 'I happened to turn celebrate my 31st birthday in Pattaya, Thailand this year. It was on January the 9th (just like last year coincidently) and just a few days after the devastating Tsunami in south Thailand. Therefore Pattaya was pumping and I had a nice meal and got wasted in the new Hard Rock Cafe on the Beach!\r\n<p>\r\nIt doesn\'t seem like five minutes since I was swimming in the sea admiring the Great Barrier Reef in Queensland, Australia last year, oh well - soon be dead! :(', '', '', '', '', '', '', '1', '0', '', 'Pattaya', '0', '', '', '', '149', '269', '1', '0', '0', '2005-01-09', '2008-01-01 00:00:00', '2005-09-02 00:11:18', '2005-08-04 15:33:48', '1');
INSERT INTO `articles` VALUES ('328', '4', '', 'World Snooker Championships', '', 'Crucible Visit Last ever? Davis, Hendry etc.<BR>Program Scan, pics and video', '', '', '', '', '', '0', '0', '', 'Sheffield', '0', '', '', '', '235', '276', '4', '0', '0', '2005-04-27', '2008-01-01 00:00:00', '2005-11-04 17:48:05', '2005-08-04 15:37:53', '1');
INSERT INTO `articles` VALUES ('329', '4', '', 'World Wide Wonder - Batad Rice Terraces', '', '', '', '', '', '', '', '0', '0', '', 'Batad and Banaue', '0', '', '', '', '184', '0', '5', '0', '0', '2005-02-09', '2008-01-01 00:00:00', '2005-08-04 16:37:35', '2005-08-04 15:40:57', '2');
INSERT INTO `articles` VALUES ('330', '4', '', '2005 BCA Masters', '', '5:0 up, all results, runners?, fight problems, mini winner...', '', '', '', '', '', '0', '0', '', 'Las Vegas', '200', '25th', '300', '', '106', '277', '4', '0', '0', '2005-05-13', '2008-01-01 00:00:00', '2005-11-04 01:18:18', '2005-08-04 15:43:58', '1');
INSERT INTO `articles` VALUES ('331', '4', '', '2005 VNEA 9 Ball', 'In 2005 the International VNEA 9 ball singles was run as a full blown event for the first time. In the previous years the final 128 players qualified by winning a mini tournament. 2004 was my first year playing in the VNEA and I came 5th in the 9 ball event, sadly miscuing on the hill in the quarter final. This year would be tough with over 500 runners and a larger entry fee.', '<P>I never really liked playing 9 ball on a bar box as it seems more of a lottery than 8 ball, especially race to 5! None the less I was looking forward to the event and I had high hopes of a top finish.</P>\r\n<P>I arrived in Vegas a couple of days early in order to prepare properly. The previous year I had arrived late the day before the tournament started and it took me a few days to get over the jet lag. Still I had just recovered from a week in hospital with a severe case of tonsillitis and I was still pretty sick. </P>\r\n<P>I actually almost lost my first match, trailing 4:2. However I gritted my teeth and held my nerve to win the match 5:4 and progress to the second round. Fortunately I then started to play well despite my cough getting extremely worse. I can\'t remember how many matches I played on the first day but by around 9pm I think it was about eight! I was extremely sick, tired and ready for bed but I realized I still had one more match to play. \r\n<P>I went to the bar and bought another Red Bull energy drink, about my 5th of the day and prepared myself for my next match. I was to play Dave Krenzel for a place in the final of the winners side. Fortunately Dave missed a ball early to give me some confidence and with a large crowd of Aussies cheering me on I managed to win the match 5:0. \r\n<P>I didn\'t get much sleep that night but I was delighted to be through to the finals day which was to take place a couple of days later after the 8 ball singles. I had already secured $2000 but I really wanted to get to the final and win a trophy (infamous Charlie) more than anything! \r\n<P>I woke up early and played a few games to warm up and then we started the match. I went behind early but held my nerve to move 4:2 ahead. In the final frame I did tighten up a little and made an extremely poor positional shot on my penultimate ball. Fortunately I pulled I great positional shot to save the match and advance to my first Las Vegas final. \r\n<P>I was now guaranteed at least $3000, but more importantly a Charlie and a chance to play in the main arena. However I would have to wait for my chance for much longer than I anticipated. Dave Krenzel, the guy I have sent to the losers side of the draw had remained unbeaten and was one match away from a rematch. Unfortunately he was also still in the 8 ball singles AND the scotch doubles! I spent most of the day hanging around waiting for a time to play. Finally we got the nod and we started our match around 4pm. \r\n<P>I struggled in the first set, mainly with my break, I just couldn\'t make a ball and Dave won it 5:2. However because DI had won the winners side of the draw Dave had to beat me twice so we played again. I started well and one the first and was looking good in the second. However a poorly judged positional shot on the 9 left me a bank shot. I misjudged it badly so instead of 2:0 up it was 1:1 and with my break struggling I never really recovered. Dave was playing extremely well and seemed to be unbeatable that day. He got his revenge for my 5:0 win and he also won the 8 ball singles AND got to the final of the scotch doubles. Quite an achievement which earnt him around $11,000 for the week and great respect. Well done Dave, I\'ll get you next time! </P>', '', '', '', '', '', '0', '0', '', 'Las Vegas', '500', '2nd', '3000', '', '106', '195', '4', '0', '0', '2005-05-27', '2008-01-01 00:00:00', '2005-11-04 17:34:12', '2005-08-04 15:45:44', '1');
INSERT INTO `articles` VALUES ('332', '4', '', '2005 VNEA 8 Ball Championships', 'Runners, all results, program scan and other pics. Travis and Rev Dave 5:3, sick as dog.. shares. $100 matches, 7:3 and 5:1, stiffed! Team fucked up. Sctoch doubles', '', '', '', '', '', '', '0', '0', '', 'Las Vegas', '1000', '17th', '1000', '1', '106', '195', '4', '0', '0', '2005-05-28', '2008-01-01 00:00:00', '2005-11-04 02:30:07', '2005-08-04 15:47:50', '1');
INSERT INTO `articles` VALUES ('333', '4', '', '2005 Reno Open', '', 'Asleep almost missed match! all results, pics and video? Wimms chohan, Manalo match up / final. El Dorado!', '', '', '', '', '', '0', '0', '', 'Reno', '200', '65th', '0', '', '106', '313', '4', '0', '0', '2005-06-06', '2008-01-01 00:00:00', '2005-11-04 01:45:56', '2005-08-04 15:50:37', '1');
INSERT INTO `articles` VALUES ('334', '4', '', '2005 Hard Times Summer Jamboree', 'I arrived in Sacramento in greyhound style with the rest of the Aussies. We had just spent a week in Reno where none of us had done particulary well. I was determined to do better in this event and I couldn\'t wait to drop my stuff at the hotel and get to the pool hall. I had been told that Hard Times Billiards in Sacramento was a fine pool hall and I wasn\'t dissapointed.', '<P>The front room&nbsp;was very&nbsp;big with a large number of nice tables a&nbsp;young crowd. We had arrived&nbsp;on a Monday which was ladies night and I can honestly say I\'ve never seen so many cute girls in a pool room! It was funny to see many pf the players walking around drooling. However it was the back room which was the place to be, well except Monday nights of course ;-)</P>\r\n<P>It was an L-shaped room with large bleechers at the back rising 5 or 6 rows high. This was the \'action\'&nbsp;room and it was already packed with world class players such as Buddy Hall, Kid&nbsp;Delicous, Mike Davis, Santos, and the new Reno Champion Marlon Manalo!</P>\r\n<P>[More soon here]&nbsp;</P>\r\n<P>The TV cameras where there to watch local favourite Mark Haddard. They where filning during my match with Dominguez but I\'m not sureif any of it made it too TV lol!</P>\r\n<P>In fact my match with Dominguez, a former World Champion Runner up will go down as one of my best performances to date. I think I ran 5 racks at one point and pretty kept Ernesto in his chair. I needed to of course as he had just crushed Tony Chohan 9:1 and is a world class player.</P>\r\n<P>Next I had to play the local favourite himself, Mark Haddard. I have to admit I was hoping to play Hall of famer Budy Hall (who had also just won the 1 pocket) but he lost his match to Mark.<BR></P>\r\n<P>[More soon... (car sleep, smashed cue)]</P>\r\n<UL>\r\n<LI>9:4 v R. Roque (I ran last 3 racks)</LI>\r\n<LI>9:7 v A. Khan (I ran last 3 racks)</LI>\r\n<LI>9:3 v E. Dominguez&nbsp;(ran 7 out of 9 racks)</LI>\r\n<LI>9:5 v&nbsp;M. Haddad</LI>\r\n<LI>6:9 v M. Manalo 9:6 (0:2,3:2,3:7,6:7, 6:9)</LI>\r\n<LI>9:6 v J. Wimms</LI>\r\n<LI>9:6 v J. Gregory</LI>\r\n<LI>4:9 v G. Gerado: (0:4, 4:4, 4:9 -&nbsp;played crap!)&nbsp;</LI></UL>\r\n<P><STRONG>PAYOUTS</STRONG></P>\r\n<UL>\r\n<LI>1st - M. Manalo</LI>\r\n<LI>2nd - G. Gerado</LI>\r\n<LI>3rd - C. Riley</LI>\r\n<LI>4th - J. Gregory</LI>\r\n<LI>5-6th - J. Wimms</LI>\r\n<LI>5-6th - J. Parica</LI>\r\n<LI>7-8th - B. Hunter</LI>\r\n<LI>7-8th - T. Annigoni</LI>\r\n<LI>9-12th - M. Haddad</LI>\r\n<LI>9-12th - A. Khan</LI>\r\n<LI>9-12th - E. Ames</LI>\r\n<LI>9-12th - I. Runnels</LI>\r\n<LI>13-16th - D. Alishan</LI>\r\n<LI>13-16th - M. Davis</LI>\r\n<LI>13-16th - B. Hall</LI>\r\n<LI>13-16th - B. Palmer</LI>\r\n<LI>17-24th - D. Petralba</LI>\r\n<LI>17-24th - D. Olson</LI>\r\n<LI>17-24th - K. Johnson</LI>\r\n<LI>17-24th - S. Sambajon</LI>\r\n<LI>17-24th - F. Garcia</LI>\r\n<LI>17-24th - E. Dominguez</LI>\r\n<LI>17-24th - J. Matchin</LI>\r\n<LI>17-24th - R. Estelle</LI>\r\n<LI>25-32nd - J. Fabionar</LI>\r\n<LI>25-32nd - T. Soria</LI>\r\n<LI>25-32nd - T. Chohan</LI>\r\n<LI>25-32nd - O. Dominguez</LI>\r\n<LI>25-32nd - D. Basavich</LI>\r\n<LI>25-32nd - R. Juarez</LI>\r\n<LI>25-32nd - J. Abernathy</LI>\r\n<LI>25-32nd - R. Jerez</LI></UL>\r\n<P>&nbsp;</P>\r\n<P><STRONG>RELATED LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.azbilliards.com/2005hardtimes/brackets.cfm\" target=_blank>AZ Billiards Tournament Bracket</A></P>', '', '', '', '', '', '0', '0', '', 'Hard Times Pool Hall', '128', '3rd', '2000', '5', '106', '317', '4', '0', '0', '2005-06-14', '2008-01-01 00:00:00', '2006-06-19 12:41:31', '2005-08-04 15:56:05', '1');
INSERT INTO `articles` VALUES ('335', '4', '', '2005 World Pool Championship Qualifying', '', '5 days, tough field, program, pics etc. ref partying ', '', '', '', '', '', '0', '0', '', 'Fashion Pool Hall, Kaohsiung', '200', '', '0', '', '147', '194', '4', '0', '0', '2005-06-26', '2008-01-01 00:00:00', '2005-11-04 17:55:04', '2005-08-04 15:58:28', '1');
INSERT INTO `articles` VALUES ('336', '4', '', 'World Wide Wonder - Taipei 101', 'Worlds Tallest Building', '', '', '', '', '', '', '0', '0', '', 'Taipei', '0', '', '', '', '147', '0', '5', '0', '0', '2005-07-10', '2008-01-01 00:00:00', '2005-08-04 16:36:57', '2005-08-04 16:03:48', '2');
INSERT INTO `articles` VALUES ('337', '4', '', '2005 Korea International Open (ESPN Debut!)', 'After failing to qualify for the 2005 World Pool Championships in Taiwan I thought I would try my luck in the Korea International Open. I had never been to Korea before and since the event was only a short flight away in Seoul, I new I couldn\'t turn the chance to play pool and get another stamp in my passport. ', '<P><SPAN class=txt_title>I was lucky enough to be invited to play in the last 64 of this event by Charlie Williams and I was determined to make the most of this opportunity!</SPAN></P>\r\n<P><SPAN class=txt_title><STRONG>RESULTS</STRONG></SPAN></P>\r\n<UL>\r\n<LI>9:1 v Qualifier</LI>\r\n<LI>9:7 v Japanese Pro</LI>\r\n<LI>8:9 v C Williams (I ran first 3 racks)</LI>\r\n<LI>9:3 v Japanese Pro (he beat Jap No.1 9:1)</LI>\r\n<LI>9:8 v C Bryant (8:6 down)</LI>\r\n<LI>9:7 v Young (Korea No.1 beat Hohman, 4:1 up)</LI>\r\n<LI>3:7 C.Williams (ESPN TV, missed 8 for 3:0)<BR></LI></UL>\r\n<P>Comments to come... \r\n<P></P>', '', '', '', '', '', '1', '0', '', 'Saokyo Hotel, Seoul', '64', '3rd', '1300', '5', '144', '207', '4', '0', '0', '2005-07-15', '2008-01-01 00:00:00', '2005-11-04 19:12:50', '2005-08-04 16:08:54', '1');
INSERT INTO `articles` VALUES ('338', '4', '', 'DMZ - Don\'t shoot!', 'Axe murders, pics /video etc', '', '', '', '', '', '', '0', '0', '', 'Pyamjong', '0', '', '', '', '137', '0', '5', '0', '0', '2005-07-21', '2008-01-01 00:00:00', '2005-08-04 16:10:32', '2005-08-04 16:10:32', '2');
INSERT INTO `articles` VALUES ('339', '4', '', 'Manchester v Beijing Hyundai', 'I have been supporting Manchester United since 1985 when I saw Norman Whiteside scored \"that goal\" in the FA Cup Final. Sadly despite living in Manchester for 3 years while at University their sheer popularity meant I never got to see them play.\r\nHow ironic then that over 20 years later I should watch them live for the first time in Beijing, China!\r\n\r\n', 'More soon... ', '', '', '', '', '', '1', '0', '', 'Workers Stadium, Beijing', '0', '', '', '', '118', '268', '4', '0', '0', '2005-07-26', '2008-01-01 00:00:00', '2005-11-05 02:26:02', '2005-08-04 16:12:36', '1');
INSERT INTO `articles` VALUES ('340', '4', '', 'World Wide Wonder - Great Wall of China', 'pics, burnt, taxi 3 hours, cable car food soup and noodles', '', '', '', '', '', '', '0', '0', '', 'Simatai, Beijing', '0', '', '', '', '118', '0', '5', '0', '0', '2005-07-29', '2008-01-01 00:00:00', '2005-08-04 16:36:40', '2005-08-04 16:15:30', '2');
INSERT INTO `articles` VALUES ('341', '4', '', 'Shanghai - Bund-abar!', 'Flight terror!,pool, comp/killer win, pics, video, M on the bund meal, shopping bargains, hotel view, karen?  whore of the east', '', '', '', '', '', '', '0', '0', '', 'Shanghai', '0', '', '', '', '118', '0', '0', '0', '0', '2005-07-30', '2008-01-01 00:00:00', '2005-08-04 16:19:07', '2005-08-04 16:18:43', '2');
INSERT INTO `articles` VALUES ('342', '4', '', '2005 Big Apple Open', '', '', '', '', '', '', '', '0', '0', '', 'Master Billiards, Queens NYC', '128', '33rd', '0', '', '106', '281', '4', '0', '0', '2005-08-11', '2008-01-01 00:00:00', '2005-11-04 01:37:55', '2005-08-04 16:20:35', '1');
INSERT INTO `articles` VALUES ('343', '4', '', 'World Wide Wonder - Ayers Rock & The Ogles', 'Hotel, rock climb deaths! Stars dinner, ogles walk pics video', '', '', '', '', '', '', '0', '0', '', 'Ayers Rock Resort', '0', '', '', '', '158', '0', '5', '0', '0', '2004-12-14', '2008-01-01 00:00:00', '2005-08-04 16:38:29', '2005-08-04 16:22:39', '2');
INSERT INTO `articles` VALUES ('344', '4', '', 'World Wide Wonder - Brunei Mosque', 'water homes and theme park, fabulos shareton buffets!', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '116', '0', '5', '0', '0', '2004-12-17', '2008-01-01 00:00:00', '2005-08-04 16:38:06', '2005-08-04 16:24:57', '2');
INSERT INTO `articles` VALUES ('345', '4', '', 'World Wide Wonder - Seminyak Orangutan Reserve', 'flight mountain biz class, snake, two feedings, pics and video', '', '', '', '', '', '', '0', '0', '', 'Seminyak', '0', '', '', '', '132', '0', '5', '0', '0', '2004-12-21', '2008-01-01 00:00:00', '2005-08-04 16:37:51', '2005-08-04 16:27:57', '2');
INSERT INTO `articles` VALUES ('346', '4', '', 'Grand Canyon', '', '', '', '', '', '', '', '0', '0', '', 'Nevada', '0', '', '', '', '106', '0', '5', '0', '0', '2005-08-04', '2008-01-01 00:00:00', '2005-08-04 16:39:21', '2005-08-04 16:39:21', '3');
INSERT INTO `articles` VALUES ('347', '4', '', 'The Colesium', '', '', '', '', '', '', '', '0', '0', '', 'Rome', '0', '', '', '', '215', '0', '5', '0', '0', '2005-08-04', '2008-01-01 00:00:00', '2005-08-04 16:40:30', '2005-08-04 16:40:30', '3');
INSERT INTO `articles` VALUES ('348', '4', '', 'Statue of Liberty', '', '', '', '', '', '', '', '0', '0', '', 'NYC', '0', '', '', '', '106', '0', '5', '0', '0', '2005-08-04', '2008-01-01 00:00:00', '2005-08-04 16:42:06', '2005-08-04 16:42:06', '3');
INSERT INTO `articles` VALUES ('349', '4', '', 'Burj Al Arab Hotel', 'Worlds Tallest Hotel', '', '', '', '', '', '', '0', '0', '', 'Dubai', '0', '', '', '', '152', '0', '5', '0', '0', '2005-08-04', '2008-01-01 00:00:00', '2005-08-04 16:43:48', '2005-08-04 16:43:48', '3');
INSERT INTO `articles` VALUES ('350', '4', '', 'Great Barrier Reef', '', '', '', '', '', '', '', '0', '0', '', 'Queensland', '0', '', '', '', '158', '0', '5', '0', '0', '2005-08-04', '2008-01-01 00:00:00', '2005-08-04 16:44:41', '2005-08-04 16:44:41', '3');
INSERT INTO `articles` VALUES ('351', '4', '', 'Rio Christ', '', '', '', '', '', '', '', '0', '0', '', 'Rio', '0', '', '', '', '66', '0', '5', '0', '0', '2005-08-04', '2008-01-01 00:00:00', '2005-08-04 16:45:37', '2005-08-04 16:45:37', '3');
INSERT INTO `articles` VALUES ('352', '4', '', 'Turkey Mosque', 'largest dome / building', '', '', '', '', '', '', '0', '0', '', 'Istanbul', '0', '', '', '', '234', '0', '5', '0', '0', '2005-08-04', '2008-01-01 00:00:00', '2005-08-04 16:47:40', '2005-08-04 16:47:40', '3');
INSERT INTO `articles` VALUES ('353', '4', '', 'St Pauls & Vatican Square', '', '', '', '', '', '', '', '0', '0', '', 'Vatican City', '0', '', '', '', '236', '0', '5', '0', '0', '2005-08-04', '2008-01-01 00:00:00', '2005-08-04 16:50:28', '2005-08-04 16:50:28', '3');
INSERT INTO `articles` VALUES ('354', '4', '', 'Petronis Towers', 'Old Tallest Building', '', '', '', '', '', '', '0', '0', '', 'Kuala Lumpar', '0', '', '', '', '132', '0', '5', '0', '0', '2005-08-04', '2008-01-01 00:00:00', '2005-08-04 16:51:34', '2005-08-04 16:51:34', '3');
INSERT INTO `articles` VALUES ('355', '4', '', '2005 Euro Tour - Holland', '', '<P><STRONG>RESULTS</STRONG></P>\r\n<UL>\r\n<LI>9-8 v&nbsp;<TD>GONZALES Jose Luis</TD> <TD>ESP</LI>\r\n<LI>9-2 v&nbsp;TRAUTMANN Sascha GER<TD></TD><TD></TD> </LI>\r\n<LI>2-9 v SCHMIDT Michael GER</LI>\r\n<LI>9-0 v&nbsp;<TD>ENFROY Pascal</TD> <TD>FRA</LI>\r\n<LI>9-5 v&nbsp;<TD>KAY James</TD> <TD>GBR</LI>\r\n<LI>6-9 v&nbsp;<!--StartFragment --><TD bgcolor=\"#ffffcc\">KIRSTEN Marcel</TD> <TD bgcolor=\"#ffffcc\">GER</TD></TD></TD></TD></LI></UL>\r\n<P><STRONG>LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.epbf.com/sportsite/2005/Eurotour/Weert/group_a.htm\" target=_blank>EPBF Results (Group A)</A></P>\r\n<P><A class=\"\" href=\"http://www.epbf.com/sportsite/2005/Eurotour/Weert/Weert.htm\" target=_blank>Dutch Open Results in Full</A></P>\r\n<P>&nbsp;</P>', '', '', '', '', '', '0', '0', '', 'House of Billiards, Weert', '256', '33rd', '150', '', '222', '398', '4', '0', '0', '2005-09-07', '2008-01-01 00:00:00', '2007-05-23 12:58:21', '2005-10-16 02:31:45', '1');
INSERT INTO `articles` VALUES ('356', '4', '', '2005 World Summit of Pool', 'I flew to my NYC for a tournament I was really looking forward to. The World Summit of Pool was my first UPA event with a extreemly strong world class field. Previously it was held in Grand Central station but this year it was held in Slate Billiards club in Chelsea. Although I would have loved to have played in Grand Central slate turned out to be a great venue despite some initial fears.', '<P>In my first match I was drawn against Brandon Ashcraft, a very good young player. I went behind early on after missing some easy balls but I got my soft break working to edge in front. I missed a 9 ball down the rail for a 11-8 win and this almost cost me the match. In the final frame Brandon get me in a good hook and I played one of my best shots of the tournament to not only hit the ball but bank it two rails into the corner.</P>\r\n<P>Next up was fellow Brit Richard Broumpton. This match was a little scrappy but I played some excellent frames and decent safety\'s to win 11-5. </P>\r\n<P>This earnt me a tough match up with in form Ralph Souquet. Even though I wasn\'t playing my best pool I enjoy playing the best players and I was convinced I could win. I escaped from a tough hook to make a ball and run out a very hard layout to win the first set after winning the lag. Sadly I missed a few easy balls after this to fall behind 7-4. I dug in though and pulled the match back to 8-8 with the break. Unfortunetely couple of dry breaks handed the advantage back to Ralph and I was 10-9 down. A dry break by ralph gave me the chance to steal the match but unfortunately I finished straight on a long 7 ball down the rail with the 8 ball on the opposite rail just past the centre pocket. I decided to play position on the bank and go for the match. Sadly for me the 8 ball hit both knuckles after I banked it and then went across the table hanging on the lip of the opposite side pocket! :( Ralph ran the two balls to edge the win and set up a match with Corey Duel in the last 8 of the winners side.</P>\r\n<P>Next I played new World Pool Masters Champion Raj Hundal. Despite winning the lag and leading for most of the match I missed 4 crucial balls to hand the match to Raj. Despite playing well overall,&nbsp;this match and the one with Ralph&nbsp;where matchs I really let slip away. But still enocuraging results given the severe lack of practice I had before this tournament.</P>\r\n<P><STRONG>RESULTS</STRONG></P>\r\n<UL>\r\n<LI>11-10 v Brandon Ashcraft</LI>\r\n<LI>11-5 v Richard Broumpton</LI>\r\n<LI>9-11 v Ralph Souquet</LI>\r\n<LI>9-11 v Raj Hundal</LI></UL>\r\n<P>&nbsp;</P>', '', '', '', '', '', '0', '0', '', 'Slate Billiards, Queens NYC', '64', '17th', '450', '', '106', '280', '4', '0', '0', '2005-09-13', '2008-01-01 00:00:00', '2005-11-28 21:57:52', '2005-10-16 02:34:37', '1');
INSERT INTO `articles` VALUES ('357', '4', '', '2005 Planet Pool - Cambridge', 'After a finishing 17th in the World Summit of Pool in NYC I drove down to the US Open warm up event with Tony Crosby, Richard Broupton, and Ronnie Parks. I had a decent tournament beating some very good players and finishing 13th overall, however I will never forget my first match up with the one and only Earl the Pearl Strickland!', '<EM>Great Slates in Cambridge, MD played host to the official US Open warm-up event on September 17/18th and a full field of 64 players came out to vie for their share of the $4000 added prize money. Strong player and room owner John Moody Sr. had everything in perfect working order in this beautiful venue for tournaments. The back feature room had one table with seating for 75 anxious fans taking in the action. </EM>\r\n<P><EM>This was a super strong field with no less than 30 players on their way to the US Open. Pre-tournament favorites included Warren Kiamco, Earl Strickland, Jose Parica, Shawn Putnam, Mike Davis and Jason Kirkwood. It was a long day getting through the matches on the 9 Gabriel tables. Strickland survived a first round 9-8 scare from Jerry Slivka and overcame a 6-1 deficit to visiting British player Craig Riley winning 9-7. Kiamco had an easier time of it winning his first three matches by a combined score of 27-7. A couple of other strong matches were Putnam over Parica 9-7 and Kirkwood rolling over Allen Hopkins 9-1. It took all night and early into the next morning to whittle the field down to 24 players. The winner bracket wound up with friends Chris Szuter vs Putnam, Kirkwood vs Kiamco, young Filipino star Deo Alpajora vs regular tour player BJ Ussery and Steve Lillis vs Strickland. </EM>\r\n<P><IMG height=334 alt=\"\" src=\"http://localhost:8500/wwwthelifeofrileyorg/uploads/images/IMG_4390.jpg\" width=508 border=1> \r\n<P><EM>On Sunday, Putnam and Kiamco advanced easily with 9-4 wins. Ussery overcame Alpajora 9-7 and Strickland eked out a 9-8 entertaining match over Lillis. Putnam and Strickland continued on to the hot seat match without any drama. The winner side final was also uneventful as Strickland won 9-4. The elimination bracket had a bunch of superstars and the 3 Filipino contingent of Kiamco, Parica and Alpajora all wound up playing each other with Kiamco emerging at the end. Ussery eliminated Mike Davis hopes and followed that up by sending Kiamco on his way. Putnam was not happy with his loss to Strickland and defeated Ussery 7-4 to set up his rematch. He came out of the gate strong in the final stretching a 4-0 lead to 7-1. A dejected Strickland was getting no sympathy from the crowd but was able to look within to mount a comeback. After a constant banter with the crowd including telling stories during his own backswing, Strickland worked the score back to 8-6. Putnam put and end to that winning the next 3 games to post the 11-6 victory over this impressive field. 1st place took home $2300 with $1500 for 2nd. </EM>\r\n<P><STRONG>RESULTS</STRONG> \r\n<UL>\r\n<LI>9-2 v Troy Huffman Jr.</LI>\r\n<LI>9-4 v Chris Bartram</LI>\r\n<LI>7-9 v Earl Strickland (was 6-1 Up!)</LI>\r\n<LI>7-6 v Chris Comstock</LI>\r\n<LI>3-7 v Tony Crosby</LI></UL>\r\n<P><STRONG>RELATED LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.planet-pool.com/Results2005/9_Ball/OpenEvent9.gif\" target=_blank>Tournament Chart</A></P>\r\n<P><A class=\"\" href=\"http://www.planet-pool.com/Event_Pics/2005/gs_0917_1.aspx\" target=_blank>Planet Pool Event Photos</A> </P>\r\n<P><A href=\"http://www.planet-pool.com/results.aspx?Year=2005&amp;EventID=9&amp;Game=9_Ball\" target=_blank>Planet Pool Results</A> \r\n<P><A href=\"http://www.azbilliards.com/2000storya.cfm?storynum=3027\" target=_blank>AZ Billiards Reveiw</A> \r\n<P><A href=\"http://www.azbilliards.com/2000storya.cfm?storynum=3011\" target=_blank>AZ Billiards Preveiw</A> </P>\r\n<P>&nbsp;</P>', '', '', '', '', '', '0', '0', '', 'Great Slates, Cambridge', '64', '13th', '130', '3', '106', '283', '4', '0', '0', '2005-09-17', '2008-01-01 00:00:00', '2006-07-12 17:04:52', '2005-10-16 02:41:20', '1');
INSERT INTO `articles` VALUES ('358', '4', '', '2005 US Open', 'I arrived at the US Open after 3 decent tournament results in a row. I was playing well and confident of doing well but sadly I had picked up my first ever pool injury! I pulled a muscle quite badly in my back/shoulder during the US Open warm up and I couldn\'t straighten my bridge arm properly. I was quite embarrassed by this injury as its not often a pool player gets injured but still decided to play. Sadly I struggled and lost my first two matches to BJ Ussery and Lee Holt.', '', '', '', '', '', '', '0', '0', '', '', '256', '192', '0', '', '106', '279', '4', '0', '0', '2005-09-19', '2008-01-01 00:00:00', '2006-04-23 23:43:38', '2005-10-16 02:42:25', '1');
INSERT INTO `articles` VALUES ('359', '4', '', 'Grimsby v Scunthorpe', '', '', '', '', '', '', '', '0', '0', '', 'Blundel Park, Cleethorpes', '0', '', '', '', '235', '275', '4', '0', '0', '2005-04-23', '2008-01-01 00:00:00', '2005-10-16 03:03:06', '2005-10-16 03:02:04', '1');
INSERT INTO `articles` VALUES ('360', '4', '', '2002-2003 Jock McLean Snooker League', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '158', '163', '4', '0', '0', '2003-12-16', '2008-01-01 00:00:00', '2005-10-16 03:42:37', '2005-10-16 03:42:37', '1');
INSERT INTO `articles` VALUES ('361', '4', '', 'SIMMple Travels', 'I first took a mobile phone abroad in 1997. It was my amazing Sony Z1 and I used it to roam Thailand with great success. Mobile phones where still quite a new technology at the time, especially in Asia. But remarkably I was even able to use my mobile in the remote villages in north Thailand with few problems.\r\nOne of the funniest things that I remember was when my phone ran one evening while I was in Pattaya. It was one of my friends that didn\'t know I was out of the country asking me if I wanted to go to a party in England!', '<P>Although calling internationally while roaming was very expensive it was only about 20p per minute for local calls.</P>\r\n<P>Nowadays though I find that the best solution is to get a tri-band phone and simply buy a SIMM card locally in the country you are visiting. Obviously this means your number will change but in Asia especially it is extreemly cheap. </P>\r\n<P>I now find myself travelling around with a little bag of SIMM cards, 7 at the last count!</P>\r\n<P>If you wish to contact me while I\'m abroad please use the relevant number below:</P>\r\n<UL>\r\n<LI>AUSTRALIA:</LI>\r\n<LI>USA:</LI>\r\n<LI>UK:</LI>\r\n<LI>THAILAND:</LI>\r\n<LI>PHILLIPINES:</LI>\r\n<LI>KOREA:</LI>\r\n<LI>CHINA:</LI></UL>\r\n<P>The best news is it won\'t cost me an arm and a leg if you call me! :-)</P>', '', '', '', '', '', '0', '0', '', 'Global', '0', '', '', '', '0', '288', '5', '0', '0', '2005-10-16', '2008-01-01 00:00:00', '2005-11-14 22:00:54', '2005-10-16 03:58:35', '1');
INSERT INTO `articles` VALUES ('362', '4', '', 'Sydney Harbour Foreshore Authority (SHFA)', '', '', '', '', '', '', '', '0', '0', '', 'Sydney', '0', '', '', '', '158', '0', '3', '0', '0', '2005-01-16', '2008-01-01 00:00:00', '2005-10-21 20:32:48', '2005-10-16 20:16:16', '1');
INSERT INTO `articles` VALUES ('363', '6', '', 'American and Asian Summer', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2005-05-06', '2005-08-15 00:00:00', '2005-10-17 00:00:00', '2005-10-17 00:00:00', '3');
INSERT INTO `articles` VALUES ('364', '6', '', 'Euro Tour and US Pool Jaunt', 'Weert, World Summit, Cambridge Planet Pool, US Open, Washington, NYC', '<P>&nbsp;</P>', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '0', '0', '0', '2005-09-07', '2005-09-28 00:00:00', '2005-11-03 00:00:00', '2005-10-17 00:00:00', '3');
INSERT INTO `articles` VALUES ('365', '4', '', 'Grimsby Masters Singles', '', '<IMG alt=\"\" src=\"http://localhost:8500/wwwthelifeofrileyorg/uploads/images/grimsby_masters1.jpg\" border=1> ', '', '', '', '', '', '0', '0', '', '', '4', '1st', '300', '', '235', '316', '4', '0', '0', '1999-06-01', '2008-01-01 00:00:00', '2005-11-04 01:26:18', '2005-10-24 00:49:48', '1');
INSERT INTO `articles` VALUES ('366', '9', '', 'SHFA Intranet', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '347', '3', '2', '0', '2004-07-25', '2008-01-01 00:00:00', '2005-11-08 13:12:21', '2005-10-25 00:26:53', '1');
INSERT INTO `articles` VALUES ('367', '9', '', 'Latte Brothers', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '349', '3', '1', '0', '2005-07-01', '2008-01-01 00:00:00', '2005-11-08 13:20:11', '2005-10-25 01:37:06', '1');
INSERT INTO `articles` VALUES ('370', '9', '', 'Warris Vianni', '', '', '', '', '', 'http://www.warrisvianni.com/', '', '0', '0', '', '', '0', '', '', '', '0', '126', '3', '4', '0', '2001-07-01', '2008-01-01 00:00:00', '2005-11-03 03:40:45', '2005-11-01 03:08:59', '1');
INSERT INTO `articles` VALUES ('371', '9', '', 'Institute of Internal Auditors', '', '', '', '', '', 'http://www.iia.org.uk/', '', '0', '0', '', '', '0', '', '', '', '0', '114', '3', '3', '0', '2003-01-01', '2008-01-01 00:00:00', '2005-11-03 03:37:16', '2005-11-01 22:32:46', '1');
INSERT INTO `articles` VALUES ('372', '9', '', 'MyGSK Intranet', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '322', '3', '4', '0', '2000-12-01', '2008-01-01 00:00:00', '2005-11-03 03:45:23', '2005-11-01 22:55:05', '1');
INSERT INTO `articles` VALUES ('373', '9', '', 'Home Maintenance Service', '', '<P>&nbsp;</P>', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '3', '1', '0', '2005-11-01', '2008-01-01 00:00:00', '2005-11-03 05:00:54', '2005-11-01 23:05:26', '2');
INSERT INTO `articles` VALUES ('374', '9', '', 'Discount World', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '3', '5', '0', '1997-12-01', '2008-01-01 00:00:00', '2005-11-03 03:34:59', '2005-11-02 00:12:28', '1');
INSERT INTO `articles` VALUES ('375', '9', '', 'Final Year Project', '', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '0', '3', '6', '0', '1999-06-01', '2008-01-01 00:00:00', '2005-11-03 03:49:46', '2005-11-02 00:16:37', '1');
INSERT INTO `articles` VALUES ('377', '4', '', '2005 World Pool Masters', '', '', '', '', '', '', '', '0', '0', '', 'The Dome, Doncaster', '0', '', '', '', '235', '0', '4', '0', '0', '2005-09-02', '2008-01-01 00:00:00', '2006-05-09 08:27:10', '2005-11-04 17:49:34', '2');
INSERT INTO `articles` VALUES ('378', '4', '', '2006 BPPPA Nottingham Open', 'While visiting the UK for an extended stay I decided to play in my first UK pro tour event. I started my first match well against young Phil Burford to go 4:2 up but then played poorly to lose 7:5. I then got on a roll to win my next 3 matches quit comfortably to put me just one win away from making the last 32. \r\n\r\nIan West was my oponent, it was approaching midnight and it was the last match of the day.', '<P>I started badly to go behind but cmae back strongly to take a 4:2 lead. However this is where I threw the match away, I somehow managed to miss two 9 balls in the next two frames! So instead of being 6:2 up and breaking for the match it was 4:4 and I was under pressure. </P>\r\n<P>I then went behind 6:5 but held my nerve to tie the match 6:6. This is where my luck well and truly ran out, twice my opponent missed and hooked me with the balls open. On the second occassion I was left with a slight swerve shot to make a long 7 ball for what would have been the match. Unbelievably the cue ball hit a join in the slate causing it to leave the table and I missed the 7 ball!</P>\r\n<P>That being said I lost the match much earlier than this when I missed two 9 balls. Ian went on to finish 5th and young Phil Burford finished 17th.</P>\r\n<P>Tommy Donlon beat Damian Overton&nbsp;11:10 in the final.</P>\r\n<P><A href=\"http://www.bpppa.org/\" target=_blank>http://www.bpppa.org/</A></P>\r\n<P>&nbsp;</P>', '', '', '', '', '', '0', '0', '', 'Nottingham', '118', '33rd', '0', '3', '235', '360', '4', '0', '0', '2006-02-04', '2008-01-01 00:00:00', '2006-04-17 22:13:01', '2006-02-06 22:44:31', '1');
INSERT INTO `articles` VALUES ('379', '4', '', 'My First Wheels!', 'I bought my first vehicle in Sydney Australia in January 2002. However my first wheels where not a car! I had been turned down at the last minute for finance for a MGF convertable so I decided to buy a Italjet Dragster Scooter! 0-60 in under 6 seconds, awesome acceleration and handling with racing disc breaks!\r\n\r\nHowever in 2005 I decided to swap my beloved scooter for my first car, a 2001 ford puma! A former Car of the Year, handling designed by jackie Stuart, and the reliability of a ford fiesta made this car an easy choice. It\'s great to drive and I\'m sure I\'ll keep it for a few years at least (well until I buy my ferrari! :) ', '', '', '', '', '', '', '0', '0', '', '', '0', '', '', '', '0', '361', '1', '0', '0', '2005-09-01', '2008-01-01 00:00:00', '2006-02-06 23:27:44', '2006-02-06 23:20:29', '1');
INSERT INTO `articles` VALUES ('380', '4', '', '2006 Euro Tour - Czezh Rep', 'While back in the UK to catch up with family I decided to fly to Prague to play on the Euro Tour. I also thought it was a good way to celebrate my 32nd birthday as this would be the 40th country I had visited.\r\nThe bad news was Prague isn\'t that far from Russia and it was the middle of winter! ', '<P>I started to get worried when I noticed half my fellow passengers where wearing snow boots, a couple of hours later I got off the plane and discovered why! </P>\r\n<P>32nd Birthday, Biggest Club Europe</P>\r\n<P><STRONG>RESULTS</STRONG></P>\r\n<UL>\r\n<LI>9:6&nbsp;MENILLO Guglielmo</LI>\r\n<LI>9:8 VAN DEN BERG Nick</LI>\r\n<LI>9:7 FREI Petr</LI>\r\n<LI>6:9 HILL Mick</LI>\r\n<LI>7:9&nbsp;VAN DEN BERG&nbsp;Nick&nbsp;(5:1 down)</LI></UL>\r\n<P><STRONG>RELATED LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.epbf.com/sportsite/2006/Eurotour/Czech/Praha.htm\" target=_blank>EPBF Results (Group F)</A></P>\r\n<P>&nbsp;</P>\r\n<P>&nbsp;</P>', '', '', '', '', '', '0', '0', '', 'Prague', '256', '33rd', '130', '', '201', '396', '4', '0', '0', '2006-01-18', '2008-01-01 00:00:00', '2007-05-23 12:59:54', '2006-04-17 21:51:25', '1');
INSERT INTO `articles` VALUES ('381', '4', '', '2006 Euro Tour - Italy', 'After having such a great time in Prague I decided to try my luck on the Italian leg of the Euro 9 Ball Tour. However this time I decided to a) take it more seriously and b) do a bit more travelling. \r\n\r\nI flew to Trieste, Italy in the hope of catching a bus over the border into Slovenia and Croatia. However it was election day in Italy and the only way out of Trieste was a train to Ljubljana! ', '<P>So Ljubljana it was and I arrived in the Capital of Slovenia (a mini Prague) in the early evening. I had met a famous Opera singer on the train who helped me find a hotel and also invited me to rehearsal the next day. However it was the weekend so despite a long days travel I was keen to get out of my hotel and explore the city after dark!</P>\r\n<P>It was a small but extremely city, only 300,000 residents made up mostly of students. The centre of the city, the old town covers both sides of a lovely river and is dominated by a large ancient castle on a hill. Despite it being a Sunday, the quietest night of the week I found several bars and ended up in the K4 club until about 3am in the morning.</P>\r\n<P>I spent the next day sightseeing before popping in to see my first ever opera in the small but beautiful national opera house, the lead singer who I had met on the train was waiting by the back door as promised to get me in for a sneak preview of rehearsals. Although I only stayed for an hour it was amazing to see and hear such powerful voices live and without any amplified aids.</P>\r\n<P>On my last day I finally found the local pool hall and spent almost 5 hours practicing for the Euro Tour which was now only a couple of days away! I needed the practice as I had practiced little in recent, but by the end of the session I felt a lot better about my chances.</P>\r\n<P>The next morning I woke up early and caught the&nbsp;10:28 express train to Monfalcone, Italy. It was only a&nbsp;two and a half hour journey and it wasn\'t long before I was in and out of my hotel and hitting balls again in the pool hall, albeit a different country! There were already several British players there but I managed to play for about 5 hours on absolutely stunning pool tables.</P>\r\n<P style=\"font-size: 10pt; font-family: verdana\">I had planned to get an early night but ended up having about 4 beers while waiting for the draw and match times to be finalised. I drew a fellow Brit, but worse still had to play at 9am!</P>\r\n<P>I woke up early feeling not great after drinking the local full strength beer but managed to play ok and I won my first match 9:2. I went back to my hotel for a few hours to relax before my evening match, which was supposed to be against Thorston Hohman, ex World Champion. However when I arrived back at the pool hall I was told&nbsp;that he wasn\'t coming and I was through to the next round. Although this was good news I was still disappointed as I wanted to test myself against the best and I felt I&nbsp;had a decent chance of causing an upset.</P>\r\n<P>I had a quite night again and the next morning I played a young Dutch player, I had a couple of lucky rolls but played solid and won 9:2 again. </P>\r\n<P>I was now through to the final match of the double elimination stage and had two chances to get through to the single elimination last 32. I had played in two Euro Tour events previously and both times I had narrowly missed out on the last 32. Not only does the last 32 carry more&nbsp;ranking points&nbsp;but the 550 euros goes a long way to covering the costs of the trip. </P>\r\n<P>The bad news was my next opponent was Stephan Cohan, long time professional who finished 3rd in the previous event in Prague. I started badly and went 2:0 down before pulling it back to 2:2. Cohan is famous for using an extremely soft break where the one ball barely makes it past the side pocket and the wing ball goes in the corner. In order to counter this proven technique I made sure I racked the balls as difficult as possible to ensure that the 2 ball always finished on the top rail making the run out as difficult as possible. This tactic worked well and I played pretty well to take an 8:4 lead. However I missed a couple of easy chances to lose out the match but eventually fell over the line for a 9:5 win.</P>\r\n<P>Unfortunately I didnt get an easy draw in the last 32 and I had a 9am match up with Sandor Tot, former European No1. Nonetheless I knew I was playing well and was confident of doing well now the pressure was off somewhat. Sadly I made a few two many mistakes and combined with a couple of slopped 9 ball by my opponent I never really got into the match and lost 9:3.</P>\r\n<P>The good news was I had earned another 275 ranking points which meant I jumped from about 180th to 121st in Europe despite only having played in 3 of the 6 scoring events. It will be very tough but if I can repeat these results in the next 3 events I will break into the top 32 which is my ultimate goal.</P>\r\n<P></P>\r\n<P>After I lost I caught the train to Venice which was only a 1.5 hour journey along the coast. It was a cloudy day but it was a city I had long wanted to see and I had a great time exploring Marco Square, the Grand Canal and the small back streets of this place.</P>\r\n<P>I was disappointed to not make it back for the final but please that the British players had done well and Imran Majid had won his first title. It wasn\'t long before the beer had got the better of most of the players, Niels took over the DJ booth and I and a few others where dancing around the bar to Zorba the Greek! I also met the lovely Alexia and many of us ended up in La Bomba, more of a Latin Dance club than a disco until 6am!</P>\r\n<P><STRONG>RESULTS</STRONG></P>\r\n<UL>\r\n<LI>9:2 EDGE Geoff \r\n<DIV></DIV></LI>\r\n<LI>9:0 HOHMANN Thorsten (walk over)</LI>\r\n<LI>9:2 BEEKERS Brian</LI>\r\n<LI>9:6 COHEN Stephane</LI>\r\n<LI>3:9 TOT Sandor</LI></UL>\r\n<P><STRONG>RELATED LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.epbf.com/sportsite/2006/Eurotour/Italy/Italy.htm\" target=_blank>EPBF Results (Group B)</A></P>\r\n<P>&nbsp;</P>', '', '', '', '', '', '0', '0', '', 'Monfalcone', '256', '17th', '650', '', '215', '399', '4', '0', '0', '2006-04-12', '2008-01-01 00:00:00', '2007-05-23 12:57:48', '2006-04-17 21:54:21', '1');
INSERT INTO `articles` VALUES ('382', '4', '', '2005 - World Wide Adventure and My Dream TV Debut!', 'What a year! I will always remember 2005 as the year I rediscovered my passion for pool and lived the dream.\r\n\r\nI had been in Australia for almost 5 years and I missed family and friends in England. I was also a bit burnt out from IT so I decided to take a break. The goal was simple: travel, play pool, and spend sometime back in England.', '<P>The adventure started with a couple of months of amazing travels. Ayers rock was first up, I spent an amazing few days in the middle of the Australian outback exploring the Olga\'s, and almost climbing the big red rock itself. A&nbsp;<!--StartFragment --> terrifying experience which I wouldn\'t recommend! The unexpected highlight was an evening meal in the desert where I got to see the night sky in all its glory without the effects of light pollution. We arrived at a floodlit table in the middle of the desert and I will never forget the \"oo\'s\" and \"aagh\'s\" then the lights where turned off to allow us to see the millions of stars in all their glory.</P>\r\n<P>Next up was a couple of days in Darwin checking out the awesome crocs before flying into to the capital of Brunei, <SPAN style=\"font-size: 9pt\">Bandar Seri Begawan. Brunei is probably more famous for its Richest man, the Sultan of Brunei, a former richest person of the year holder. However I had come for other reasons, to visit its famous mosque, the largest theme park in the world, the billion dollar hotel built by the sultans brother and to hop across the border into Malaysia to see the Orangutans. </SPAN></P>\r\n<P style=\"font-size: 9pt\">I also got to speed across the fabulous canals in a long boat of this enchanting city, the venice of the east as its also known, but it wasn\'t long before I found myself on another boat crossing the border into Kota Kinabalu. It was from hear that I booked my flight to sandokan to see my acient cousins, flying first class (it was only £10 extra! :). </P>\r\n<P style=\"font-size: 9pt\">There are only two places in the world that have an Orangutan orphanage, Sumatra and Borneo. I was fortunate to visit the one in Sumatra in 1997 and it is still to this day one of the best places I have ever visited. I was excited to see these amazing animals in the wild again and to see how the Borneo sanctuary compared to my first experience.</P>\r\n<P style=\"font-size: 9pt\"><STRONG>Coming Soon...</STRONG></P>\r\n<P>100 Ball Challenge</P>\r\n<P>Efren Reyes</P>\r\n<P>BCA Masters</P>\r\n<P>VNEA 9 Ball and 8 Ball</P>\r\n<P>Hard Times</P>\r\n<P>WPC</P>\r\n<P>Korean Open</P>\r\n<P>World Summit</P>\r\n<P>US Open Warm Up</P>\r\n<P>Euro Tour</P>\r\n<P>Big AppleOpen</P>\r\n<P>14 Countries</P>\r\n<P>UK Xmas</P>\r\n<P>&nbsp;</P>\r\n<P>&nbsp;</P>', '', '', '', '', '', '1', '0', '', '', '0', '', '', '', '0', '366', '1', '0', '0', '2005-12-31', '2008-01-01 00:00:00', '2006-04-24 08:45:36', '2006-04-17 22:23:29', '1');
INSERT INTO `articles` VALUES ('383', '4', null, '2006 Euro Tour - Germany', 'I flew into Germany for my 4th Euro Tour event with little practice behind but I was still hopeful of doing well. I started of with a 9:3 win against a greak player before missing a host of chances to lose against the always impressive Foldes. I won my next match 9:1 but then got some extrreemly bad roles against a very slow Swiss player losing 6:9. My European ranking jumped from 121st to 101st.', '<P><STRONG>RESULTS</STRONG></P>\r\n<UL>\r\n<LI>&nbsp;9:3 KARPOUZELIS Dimitris</LI>\r\n<LI>&nbsp;<SPAN class=txt>4:9 FOLDES Vilmos \r\n<LI>&nbsp;9:1 DECORTE Kenneth</LI>\r\n<LI>&nbsp;6:9&nbsp;BORA Anar</LI></UL>\r\n<P><STRONG>RELATED LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.epbf.com/sportsite/2006/Eurotour/Germany/Sindelfingen.htm\" target=_blank>EPBF Results (Group C)</A></P>\r\n<P>&nbsp;</P></SPAN>', null, null, null, null, null, '0', '0', null, 'Sindelfingen', '256', '97th', '0', '', '208', '397', '4', '0', '0', '2006-05-07', null, '2007-05-23 12:57:27', '2006-05-09 07:58:45', '1');
INSERT INTO `articles` VALUES ('384', '4', null, '2006 WPA World Straight Pool Championships', 'I only found out that I would be playing in this prestigious event 3 weeks before it was due to start. My 9 ball results during the last year had earnt me a place on the alternate list of players and fortunately somebody decided not to play. Only 64 players in the world would get the chance to be called the World Straight Pool Champion, 16 years since the last player, Bobby Hunter earnt that right.\r\n', '<P><IMG height=379 alt=\"Bridge shot in last 32 against Vilmos Foldes\" src=\"http://www.thelifeofriley.org/uploads/images/me_bridge_sm1.jpg\" width=539 border=1></P>\r\n<P>I arrived in NY on Saturday 27th May 2006 several days before the start of the tournament. I had been working as a full time web developer for the past few months so I new I needed as much practice as I could get in order to play well. In order to save a few quid I stayed with a friend on the upper west side of Manhattan, this was also an ideal base as it was close to the world famous Amsterdam Billiards Club. \r\n<P>I was a bit rusty on my first day\'s practice but still managed to run a 79 first visit before playing a few sets with a good pool friend. The next day I played a little better and ran my first ever century, 104 before missing a simple ball with another rack at my mercy! Also just to top off a perfect day Mike Sigel, Oliver Ortman, and Thurston Hohman walked in late in the evening for a few hours practice - I think my century remained the high run of the day and its not often that happens in such world class company! \r\n<P>I arrived at the Hilton Hotel on Tuesday afternoon and the hotel lobby was already buzzing with a few familiar faces including Janette Lee and Max Eberle. I met up with Lee Chenman my room mate and we had a wonder around the hotel. The pool tables had been delayed at customs and so we didn\'t really get much chance to have a practice before the tournament started. We did have an interesting players meeting though as planned which raised various differences between the old and the new school players, all the issues where resolved and we awaited the match time schedule. I was drawn in&nbsp;Group 1, the clear favorites where Danny Harriman (World Bank Champion, and current Derby City Straight Pool Champion), Johnny Archer (multiple World 9 ball Champion), Max Eberle (Hollywood Billiard House Pro and former BCA Champion), and Japanese Pro Kusano (current Korean Open Champion). However the group also contained two talented German players, young Nico Wehner who reportedly runs 100\'s daily and 200+ ball runner Kevin Becker. Current IPT Pro player Larry Schwartz completed&nbsp;the group which meant it would be extremely tough to qualify in one of the 4 spots. \r\n<P>In my first match I started a little scrappy but managed to make a tough long ball to the top pocket from the back rail and split the pack, I ran 54 and out to start off with a good win. \r\n<P>Next I played young 15 year old German Nico Wehner but after missing two bank shots early in the match I pulled out a pressure bank and a long ball down the rail to win a tight match. \r\n<P>In my third match of the day I played Danny Harriman, a match I had been looking forward too. In January Danny had beaten some of the best players in the world at the Derby City Classic to win the inaugural Straight Pool Challenge, therefore Danny was not only favorite to win our match but also one of the favorites to win the tournament. It turned out to be one of the best matches either of us has ever been involved in! I started out well and raced into a 60:10 lead before Danny clawed his way back into the match to set up a tense final. We were also put on a shot clock at the end of the match which only added to the tension. There was so many twists in the last few racks its hard to recall them all, Danny missed a bank shot, I hooked myself on a rack ball, we both missed various shots, I tried a crazy carom with the shot clock running out, and I finished an inch short of getting the cue ball in the rack which would have left me with a perfect break shot. \r\n<P>In my last match of the day I played Larry Schwartz at around 3am in the morning! It was a scrappy close match and after leading early on I somehow managed to string a 40+ ball run together to win the match at around 4am. I was extremely tired and my poor eyes where red raw from wearing contacts for the first time in a pool event. It had been an extremely long and grueling day but I was so pleased to have won 3 out of 4 matches and give myself a great chance to qualify. \r\n<P>My first match the next day was against Kevin Becker who had ran a big run in beating Johnny Archer the previous day. I won the lag and started off well running the first 3 racks for a 42: 0 points lead. I had a perfect break shot to the side of the pack but I let myself down by watching a guy walk past my line of shot and missing the break ball. I should have stood up as I really felt like I was going to run 100 and out! However I managed to keep my nose in front for another 60:10 lead before Kevin ran about 70 balls to take the lead. The match went down to the wire but Kevin made a great combo from the stack at the end of the match to fall over the line. Sadly I felt Kevin used a number of unsporting sharking tactics towards the end which spoilt what was otherwise a great match. \r\n<P>Next up was a good friend Max Eberle who was playing extremely well and had run all his 5 matches so far. We both missed tons of balls early on in the match; I was struggling badly with my eyes at this stage of the event and missed many balls I wouldnt normally due because I couldnt see the balls clearly. I might still have lost the match as Max was playing very well but this was very frustrating. \r\n<P>This result meant I was still looking for the final win that would guarantee my passage through the group stage. The bad news was I had to play four times 9 ball champion Johnny Archer in my last match. The good news was I had a high ball count and I knew I probably only really needed to make about 80 balls to make it through. I played quite well in this match making a lot of big shots to win the match and make the last 32! \r\n<P> \r\n<P><STRONG>RESULTS</STRONG> \r\n<P><U><FONT face=\"Courier New\">DAY 1</FONT></U> \r\n<P>\r\n<UL>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><FONT face=\"Courier New\"><?xml:namespace prefix = o /><o:p>100 - 52&nbsp; Kusano, Hisashi&nbsp;(JPN)</o:p></FONT></DIV></LI>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><FONT face=\"Courier New\"><o:p>100 - 84&nbsp; Wehner, Nico&nbsp;(GER)</o:p></FONT></DIV></LI>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><FONT face=\"Courier New\"><o:p>96&nbsp; - 100 Harriman, Danny&nbsp;(USA)</o:p></FONT></DIV></LI>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><FONT face=\"Courier New\"><o:p>100 - 73&nbsp; Schwartz, Larry&nbsp;(USA)</o:p></FONT><o:p><FONT face=\"Courier New\">&nbsp;</FONT></o:p></DIV></LI></UL>\r\n<P class=MsoPlainText style=\"margin: 0in 0in 0pt\"><FONT face=\"Courier New\"><U>DAY 2</U></FONT></P>\r\n<UL>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><FONT face=\"Courier New\"><o:p>80&nbsp; - 100&nbsp;Becker, Kevin (GER)</o:p></FONT></DIV></LI>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><FONT face=\"Courier New\"><o:p>21&nbsp; - 100&nbsp;Eberle, Max (USA)</o:p></FONT></DIV></LI>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><FONT face=\"Courier New\"><o:p>100 - 67&nbsp; Johnny, Archer (USA)</o:p></FONT><B><SPAN style=\"mso-no-proof: yes\"><o:p><FONT face=\"Courier New\">&nbsp;</FONT></o:p></SPAN></B></DIV></LI></UL>\r\n<P class=MsoPlainText style=\"margin: 0in 0in 0pt\"><SPAN style=\"mso-no-proof: yes\"><FONT face=\"Courier New\"><U>LAST 32</U></FONT></SPAN></P>\r\n<UL>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><SPAN style=\"mso-no-proof: yes\"><FONT face=\"Courier New\">150 - 78&nbsp; Foldes, Vilmos (HUN)</FONT></SPAN></DIV></LI>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><SPAN style=\"mso-no-proof: yes\"><FONT face=\"Courier New\">142 -&nbsp;150 Barouty, Danny (USA)</FONT></SPAN></DIV></LI>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><SPAN style=\"mso-no-proof: yes\"><FONT face=\"Courier New\"><o:p>150 - 130 Wehner, Nico (GER)</o:p></FONT></SPAN><SPAN style=\"mso-no-proof: yes\"><o:p><FONT face=\"Courier New\">&nbsp;</FONT></o:p></SPAN></DIV></LI></UL>\r\n<P class=MsoPlainText style=\"margin: 0in 0in 0pt\"><SPAN style=\"mso-no-proof: yes\"><FONT face=\"Courier New\"><U>LAST 16</U></FONT></SPAN></P>\r\n<UL>\r\n<LI>\r\n<DIV class=MsoPlainText style=\"margin: 0in 0in 0pt\"><SPAN style=\"mso-no-proof: yes\"><FONT face=\"Courier New\">200 - 82&nbsp; Davis, Mike (USA)</FONT></SPAN></DIV></LI></UL>\r\n<P class=MsoPlainText style=\"margin: 0in 0in 0pt\"><STRONG></STRONG>&nbsp;</P>\r\n<P class=MsoPlainText style=\"margin: 0in 0in 0pt\"><STRONG>PAYOUTS</STRONG></P>\r\n<P><U>1st - $13,000</U><BR>Thorsten Hohman<BR><BR><U>2nd - $6,000</U><BR>Thomas Engert<BR><BR><U>3rd - $3,500<BR></U>Max Eberle<BR><BR><U>4th - $3,500<BR></U>Mika Immonen<BR><BR><U>5th-8th - $2,500<BR></U>Mike Davis<BR>Danny Harriman<BR>Allen Hopkins<BR>Jasmin Ouschan<BR><BR><U>9th-16th - $1,500</U><BR>Danny Barouty<BR>Michael Felder<BR>Bobby Hunter<BR>Nico Otterman<BR><EM>Craig Riley</EM><BR>John Schmidt<BR>Ralf Souquet<BR>Charlie Williams<BR><BR><U>17th-24th - $500</U><BR>Vilmos Foldes<BR>Jeanette Lee<BR>Bob Maidhof<BR>Oliver Ortmann<BR>Fabio Petroni<BR>Mike Sigel<BR>Go Takami<BR>Nico Wehner<BR><BR><U>25th-32nd</U><BR>Carlos Cabello<BR>Stefan Cohen<BR>Antonio Fazanes<BR>Hayato Hijikata<BR>Steve Lipsky<BR>Dennis Orcullo<BR>Matt Tetrault<BR>Mike Zuglan</P>\r\n<P>&nbsp;</P>\r\n<P><STRONG>GROUP DRAWS</STRONG></P>\r\n<P><U>Group 1<BR></U>USA Johnny Archer <BR>JAP Hisashi Kusano <BR>ENG Craig Riley <BR>USA Danny Harriman <BR>GER Nico Wehner <BR>USA Max Eberle <BR>NET Kevin Becker <BR>USA Larry Schwartz </P>\r\n<P>(<A class=\"\" href=\"http://www.seyberts.com/world/brackets/RR/rr.php?tournament_id=1&amp;round_id=1&amp;group_id=2\" target=_blank>Results</A>)<BR><BR><U>Group 2</U><BR>GER Oliver Ortmann <BR>USA Dennis Hatch <BR>JAP Hayato Hijikata <BR>USA Mike Davis <BR>USA James Baraks <BR>USA Carlos Vieira <BR>CHI Lee Chenman <BR>USA Bob Maidhof <BR><BR><U>Group 3<BR></U>GER Thorsten Hohmann <BR>USA Allen Hopkins <BR>USA John Schmidt <BR>AUS Jasmin Ouschan <BR>USA Megan Minnerich <BR>USA Ed Deska <BR>USA Jim Gottier <BR>CAN Tom Cacic <BR><BR><U>Group 4</U><BR>USA Mike Sigel <BR>USA Jeanette Lee <BR>GER Ralf Souquet <BR>USA Randy Goldwater <BR>USA Holden Chin <BR>USA Tim Hall <BR>ISR Zion Zvi <BR>USA Matt Tetrault <BR><BR><U>Group 5<BR></U>FIN Mika Immonen <BR>USA Jose Garcia <BR>CAN Luc Salvas <BR>GER Nico Otterman <BR>USA Steve Lipsky <BR>USA Tom Karabotsos <BR>NET Gilliano Smit <BR>GER Michael Felder <BR><BR><U>Group 6<BR></U>GER Thomas Engert <BR>USA Tony Robles <BR>ITY Fabio Petroni <BR>USA Pete Fusco <BR>JAP Go Takami <BR>USA Steve Lillis <BR>SPA Carlos Cabello <BR>USA Jonathan Smith <BR><BR><U>Group 7<BR></U>USA Nick Varner <BR>PHI Dennis Orcullo <BR>FRA Stefan Cohen <BR>USA Danny Barouty <BR>HUN Vilmos Foldes <BR>USA Jimmy Mataya <BR>GER Klaus Zobrekis <BR>USA Ryan McCreesh <BR><BR><U>Group 8<BR></U>USA Bobby Hunter <BR>USA Mike Zuglan <BR>SPA Antonio Fazanes <BR>USA Charlie Williams <BR>JAP Tomoki Mekari <BR>USA Chris Lynch <BR>CAN Jody Matheson <BR>USA Rolando Alavena</P>\r\n<P>&nbsp;</P>\r\n<P><STRONG>RELATED LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.azbilliards.com/2000storya.cfm?storynum=3423\" target=_blank>AZ Promo Link</A></P>\r\n<P><A class=\"\" href=\"http://www.azbilliards.com/2000storya.cfm?storynum=3574\" target=_blank>AZ Results Article</A></P>\r\n<P><A class=\"\" href=\"http://www.seyberts.com/world/\" target=_blank>Seyberts Online Coverage and Results</A></P>\r\n<P>&nbsp;</P>\r\n<P>&nbsp;</P>', null, null, null, null, null, '1', '0', null, 'Hilton Hotel, NJ', '64', '9th', '$1500', '', '106', '370', '4', '0', '0', '2006-06-05', null, '2006-07-03 19:43:34', '2006-06-05 18:48:19', '1');
INSERT INTO `articles` VALUES ('385', '4', null, '2006 Euro Tour - Austria', 'I arrived in Austria early after spending the night in a Stansted airport hotel for an early morning flight. I had spent spent most of the previous week in the USA playing in the world straight pool championships so I had hopes of doing well in Austria. Again I met a few of the British guys at the airport and we all caught a cab from the airport in Germany across the border to the club in Rankweil.', '<P>When I walked into the pool hall I met Steve (aka no-sho from AZ Billiards) and he bought me a beer. After catching up with Steve I practiced for a couple of hours before checking into my hotel. Rankweil was a small town but extreemly pretty surrounded by the alps. the hotels where spread out but a frequent shuttle service was run by the pool hall.</P>\r\n<P><STRONG>RESULTS</STRONG></P>\r\n<UL>\r\n<LI>10:4 RASSI Friedrich</LI>\r\n<LI>10:4 ORTMANN Oliver (TV Table)</LI>\r\n<LI>7:10 ZOBREKIS Klaus</LI>\r\n<LI>10:9 REGLI Ronald</LI>\r\n<LI>10:3 YASSIN Mohammed</LI>\r\n<LI>8:10 STEPANOV Konstantin</LI></UL>\r\n<P><STRONG>LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.epbf.com/sportsite/2006/Eurotour/Austria/Rankweil.htm\" target=_blank>EPBF Results (Group G)</A></P>\r\n<P><SPAN style=\"font-family: courier new\"></SPAN>&nbsp;</P>\r\n<P><SPAN style=\"font-family: courier new\"></SPAN>&nbsp;</P>', null, null, null, null, null, '0', '0', null, 'Rankweil, Austria', '256', '33rd', '$125', '', '194', '398', '4', '0', '0', '2006-06-07', null, '2007-05-23 12:57:01', '2006-07-12 17:06:48', '1');
INSERT INTO `articles` VALUES ('386', '4', null, '2006 Euro Tour - Holland', 'I traveled overland to Holland because I had purchased the pool table that was being used for the final matches. I hadn\'t played much at all since finishing 9th in the world straight pool championships but I was defending my 33rd place finish from the previous year. ', '<P>I managed to practice for a couple of hours the day before the tournament started but this did little to improve my confidence. I wanted to make the last 32 of course but realistically I wanted to get as many points as possible to defend my position in the rankings. \r\n<P>I started out ok with a close 10-8 win over Belka, Jakob. However my next match was a tough match against David Alcaide, the current 8th ranked player who had just done so well in the IPT world open. Although I went behind early on I played solid (despite missing an easy 9 ball!) for another 10-8 win Next up was another Spanish player David Alcoberro. I knew if I won this match I had a good draw to make the last 32. However the match started badly, I lost the lag and only really had 1 shot on the way to a 4:0 deficit! I somehow managed to keep grinding away and pulled the match back to 6:5 before missing another simple 9 ball to go 6:6! This without question cost me the match because my opponent was getting very nervous at this point. However at 7:5 with 3 breaks he ran out the match for the 10-5 win. \r\n<P>I won my next match 10-7 against Andreja Klasovic before facing Ralf Souquet one of the best players in the world who is having a fantastic year. I had only played Ralf once before in the world summit in New York City last year. I lost a tight match 11-9 but despite winning Ralf, rather strangely accused me of playing slowly, yes Ralf Souquet! I won the lag easily and won the first frame before falling behind 2:1. At this point Ralf called David Morris over because he was taking an age to rack the balls and wanted the table retapped. David refused Ralfs request much to his disappointment. At 4:4 I missed a straight 6 ball down the rail trying to pinch an angle and then missed a simple 9 ball in the next because I was still so upset with losing the previous frame! Therefore instead of 6:4 in front I was trailing by this score. \r\n<P>Ralf won the next two racks on his break before we had another rack incident. It was my turn for 3 breaks and I noticed two massive gaps (about 2mm) between t sets of balls. I assumed they had rolled off and tried to correct them myself. Ralph didn\'t seem happy with this (despite doing it himself on several of my racks) and tried to claim the rack was perfect! I let him have another go but he still left several gaps. I pointed them out but decided it wasn\'t worth the trouble so I broke the balls anyway. I was so disappointed with Ralf\'s response that I broke and ran the next 3 racks in about 5 minutes to trail 7:8. Unfortunately despite playing two perfect safeties on the 7 and 8 ball in the next two frames Ralf pulled out a long bank and a good kick to seal the win. Unbelievably at the end Ralf had more excuses, this time I was a \"slow racker\" and not a \"slow player\" anymore. This despite the fact that Ralf had complained about the rack himself and taken an age to rack many times for me. It just goes to show that not all the top players are gentlemen. \r\n<P>I enjoyed the match though and again proved that I can compete with the best players in the world despite only playing about half my top speed. I only dropped 15 ranking points which pretty much retained my position in the rankings. If I have a good result in Switzerland in the next event I could break into the top 32. \r\n<P><STRONG>RESULTS</STRONG> \r\n<UL>\r\n<LI>10:8 Belka, Jakob</LI>\r\n<LI>10:8 Alcaide, David</LI>\r\n<LI>5:10 Alcoberro, David</LI>\r\n<LI>10:7 Klasovic, Andreja</LI>\r\n<LI>7:10 Souquet, Ralf</LI></UL>\r\n<P><STRONG>RELATED LINKS</STRONG></P>\r\n<P><A href=\"http://www.eurotour.nu/drawresults.asp?discipline=M9\" target=_blank>EPBF Results</A></P>\r\n<P>&nbsp;</P>', null, null, null, null, null, '0', '0', null, 'House of Billiards, Weert', '256', '49th', '0', '3', '222', '398', '4', '0', '0', '2006-09-24', null, '2007-05-23 12:56:27', '2006-09-29 13:07:51', '1');
INSERT INTO `articles` VALUES ('387', '4', null, '2006 Euro Tour - Switzerland', 'I arrived at Manchester airport a little late and little bit rough. I had spent the previous night in Manchester partying with an old friend so hadn\'t got much sleep.\r\n\r\nI just managed to make the flight and I met Andy Worthington and Daryl Peach by chance at the gate.', '<P>We were flying swiss air which was a little bit pricey but the most convenient flight as it flew straight to Zurich, not far from the Euro Tour location.</P>\r\n<P>We arrived in Zurich on time and we bumped into Niels Fejien and his girlfriend Katrina at the airport, we all just managed to scrape onto the next train to the venue in Freunfeld about 20 minutes from the airport. </P>\r\n<P>It was a nice pool hall in a small town but unfortunately my hotel was a 30 minute drive away by shuttle, which fortunately was provided free by the venue. </P>\r\n<P>I hung around for the draw but to my surprise my name had be accidentally omitted! Luckily for me it wasn\'t a full draw and a seeded player hadn\'t arrived. Therefore I got a first round bye and my first match wasn\'t until 3pm the following afternoon.</P>\r\n<P><!--StartFragment -->&nbsp;I went back to my hotel early to get an early night and catch up on lost sleep in Manchester! I knew I wasn\'t playing great but as this was my 6th tournament I was determined to try and qualify and jump up the rankings. I had a great sleep and arrived early to sample the fabulous barbecue steak that was being cooked on the balcony. <BR><BR>In my first match I played ????, a decent player from Italy and I manged to do just enough to win 10:8. However I knew that I needed to hit some balls so went to a local pool hall that night with Kevin Uzzell for a few hours practice. I played a bit better even though we made the mistake of pigging out on a massive Mexican meal beforehand! <BR><BR>Unfortunately I had to play at 9am the next day which meant a 7am wake up for the 7:45am shuttle! Anyone that knows me will know that 7am and I just don\'t see eye to eye! I spent most of the night half sleeping worried about waking up late and missing my match. Nonetheless I woke up on time and after a strong coffee started my match. I was playing ????, an Afgani who now lived in France. I have to confess I didn\'t know much about him and I hoped for an easy match. I started off well running my first 2 racks pretty quickly after winning the lag. But then in the next rack I missed a simple 8 ball which almost cost me the match. Instead of a 3:0 lead I found myself 6:2 down and starring defeat in the face. I hadn\'t played too badly but my opponent had had a bit of luck in addition to running racks to reach this score, however he scratched in the next frame to let me back into the match. I took my chance and played well to win the next 7 frames in a row for a 9:6 lead. However my opponent to his credit ran the next two racks to make it 9:8 before I got the chance to close out the match the a 10-8 win.<BR><BR>My next match was against David Alcaide, the 8th seed who I had beaten a week ago in the previous Euro Tour. This was a big match as it was for qualification and I knew he would be out for revenge.</P>\r\n<P><STRONG>RESULTS</STRONG></P>\r\n<UL>\r\n<LI>10:0 Walk-Over</LI>\r\n<LI>10:8 MAURO Pepe</LI>\r\n<LI>10:8 AZIZULLAH Hamrah</LI>\r\n<LI>9:10 ALCAIDE David</LI>\r\n<LI>6:10 REGLI Ronald</LI></UL>\r\n<P><STRONG>LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.epbf.com/sportsite/2006/Eurotour/Switzerland/Swiss.htm\" target=_blank>EPBF Results (Group B)</A></P>\r\n<P>&nbsp;</P>', null, null, null, null, null, '0', '0', null, 'Zurich', '256', '33rd', '$150', '3', '233', '401', '4', '0', '0', '2006-10-09', null, '2007-05-23 12:56:01', '2006-10-09 09:08:20', '1');
INSERT INTO `articles` VALUES ('388', '4', null, 'Penthouse Billiards!', 'Although I started getting back into pool again over the last few years I found it hard to put in the practice required. I worked all day and the local pool halls had poor tables, and even less competition. Therefore I decided to buy my own 9ft table so I could practice anytime I wanted to after work. I measured my flat up and to my suprise it seemed big enough for a full sized table. Unconvinced I made a carboard table and sat it on my ironing board! Eureka it was the perfect size!!! ', 'I loved the Gabriel and Diamond tables that I had played on in America but they are expensive. Also I had discovered that the Dynamic II tables that are used for the final of the Euro Tour are available for sale after each event at a discount price. The&nbsp;price was excellent the only problem was&nbsp;I had to get the table back&nbsp;home myself! &nbsp; ', null, null, null, null, null, '0', '0', null, '', '0', '', '', '', '235', '389', '1', '0', '0', '2006-09-25', null, '2006-11-01 16:22:52', '2006-10-09 11:07:15', '1');
INSERT INTO `articles` VALUES ('389', '4', null, 'World & European Ranking', 'Am am currently ranked 60th on the WPA world ranking list and 40th on the European ranking list.<br>\r\nThis is still based mainly on my 9th place finish in the World Straight Pool Championships, but my reasonable Euro Tour results have also helped.\r\n\r\nI hope to break into the top 32 of the Euro Tour and pssibly the top 50 in the world after the next Euro Tour event in Malaga in December.', '<P><STRONG>RELATED LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.eurotour.nu/Ranking/Eurotour_Ranking_2006-06_Frauenfeld.htm\" target=_blank>Euro Tour Ranking List</A></P>\r\n<P><A class=\"\" href=\"http://www.wpa-pool.com/index.asp?content=players_men\" target=_blank>WPA World Ranking List</A></P>\r\n<P>&nbsp;</P>', null, null, null, null, null, '1', '0', null, '', '0', '', '', '', '0', '388', '4', '0', '0', '2006-10-30', null, '2006-10-30 10:24:11', '2006-10-30 10:00:37', '1');
INSERT INTO `articles` VALUES ('390', '4', null, '2006 Euro Tour, Spain', 'I arrived in Spain with a descent chance of moving up the rankings close, unfortunately two lapse\'s in concentration resulted in an early bath!\r\n\r\nI was 8-5 up and cruising against Fazanes (who finished 5th) before losing 5 games in a row and the match. Amazingly I did exactly the same thing when leading Davettas 8-5 in my next match!', '<P><STRONG>RESULTS</STRONG></P>\r\n<UL>\r\n<LI>10:6&nbsp;Vrakas, Athanasios</LI>\r\n<LI>8:10&nbsp;Fazanes, Antonio</LI>\r\n<LI>8:10&nbsp; Davettas, Christos</LI></UL>\r\n<P><STRONG>LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.eurotour.nu/archive_event_details.asp?eventnr=2006130\" target=_blank>EPBF Results</A></P>', null, null, null, null, null, '0', '0', null, 'Malaga', '256', '129th', '0', '3', '231', '400', '4', '0', '0', '2006-12-15', null, '2007-05-23 13:05:25', '2007-01-15 17:59:10', '1');
INSERT INTO `articles` VALUES ('391', '4', null, '2006 - Professional Pool and 5 New Countries!', 'Coming soon...', '9th 14.1<BR>Broke 100 run<BR>Euro/World Ranking<BR>Job/Sponsor<BR>Mortgage Approved<BR>Penthouse Billiards<BR>', null, null, null, null, null, '0', '0', null, '', '0', '', '', '', '0', '0', '1', '0', '0', '2006-12-31', null, '2007-05-23 16:29:33', '2007-01-15 18:09:45', '1');
INSERT INTO `articles` VALUES ('392', '4', null, '33rd Birthday - Polish Piss Up!', 'Coming soon...', '', null, null, null, null, null, '1', '0', null, 'Wroclaw', '0', '', '', '', '224', '403', '1', '0', '0', '2007-01-09', null, '2007-05-23 16:42:05', '2007-01-15 18:15:46', '1');
INSERT INTO `articles` VALUES ('393', '4', null, 'Euro Tour - Czech', 'Coming soon...', '<P><STRONG>RESULTS</STRONG></P>\r\n<UL>\r\n<LI>10:9 Tomati, Francesco</LI>\r\n<LI>9:10&nbsp;Yassin, Mohammed</LI>\r\n<LI>10:5 Sannwald, Jochen</LI>\r\n<LI>10:4 Herzer, Mario</LI>\r\n<LI>9:10 Das, Serge</LI></UL>\r\n<P><STRONG>LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.eurotour.nu/archive_event_details.asp?eventnr=2007060\" target=_blank>EPBF Results</A></P>\r\n<P>&nbsp;</P>', null, null, null, null, null, '0', '0', null, 'Liberec, Czech', '288', '', '0', '3', '201', '396', '4', '0', '0', '2007-02-25', null, '2007-05-23 14:04:50', '2007-03-25 18:18:02', '1');
INSERT INTO `articles` VALUES ('394', '4', null, 'Wembley Stadium - England v Italy U21', 'Coming soon...', '', null, null, null, null, null, '1', '0', null, 'London, England', '0', '', '', '', '235', '402', '4', '0', '0', '2007-03-24', null, '2007-05-23 16:40:48', '2007-03-25 18:19:25', '1');
INSERT INTO `articles` VALUES ('395', '4', null, 'Cricket World Cup', 'Coming soon...', '<P><STRONG>Tuesday, 17 April 2007</STRONG>&nbsp;- South Africa v England, Barbados, 14:30</P>\r\n<P><STRONG>Wednesday, 18 April 2007 -&nbsp;</STRONG> Ireland v Sri Lanka, Grenada, 14:30</P>\r\n<DIV class=mvb><B>Friday, 20 April 2007 - </B>Australia v New Zealand, Grenada, 14:30</DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb><B>Saturday, 21 April 2007 - </B>West Indies v England, Barbados, 14:30</DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb>\r\n<DIV class=mvb><STRONG>Tuesday, 24 April 2007 - </STRONG>SEMI FINAL (TBC v TBC), Jamaica, 14:30 *</DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb>\r\n<DIV class=mvb><B>Wednesday, 25 April 2007 -&nbsp;</B>SEMI FINAL (TBC v TBC), St Lucia, 14:30</DIV></DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb>\r\n<DIV class=mvb><STRONG>Saturday, 28 April 2007 - </STRONG>FINAL (TBC v TBC), Barbados, 14:30 **</DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb>* Selling ticket</DIV>\r\n<DIV class=mvb>**No ticket yet!</DIV></DIV></DIV>', null, null, null, null, null, '0', '0', null, 'Carribean', '0', '', '', '', '0', '0', '4', '0', '0', '2007-04-16', null, '2007-03-26 05:31:37', '2007-03-25 18:21:37', '1');
INSERT INTO `articles` VALUES ('396', '4', null, '2007 Euro Tour - Italy', 'Coming soon...', '<P><STRONG>RESULTS</STRONG></P>\r\n<UL>\r\n<LI>2:10&nbsp;Lopotko, Hubert</LI>\r\n<LI>10:9&nbsp;Lepke, Bjorn</LI>\r\n<LI>10:5&nbsp;Burato, Fabrizio</LI>\r\n<LI>10:8 Cimmino, Gabriele</LI>\r\n<LI>10:7&nbsp;Stojanovic, Philipp</LI>\r\n<LI>10:7&nbsp;Larssen, Martin</LI>\r\n<LI>9:10 Reimering, Christian</LI></UL>\r\n<P></TD></P>\r\n<P><STRONG>LINKS</STRONG></P>\r\n<P><A class=\"\" href=\"http://www.eurotour.nu/archive_event_details.asp?eventnr=2007130\" target=_blank>EPBF Results</A></P>\r\n<P>&nbsp;</P>', null, null, null, null, null, '0', '0', null, '', '256', '33rd', '150', '3', '215', '399', '4', '0', '0', '2007-05-23', null, '2007-05-23 14:04:22', '2007-05-23 13:01:13', '1');
INSERT INTO `articles` VALUES ('397', '4', null, '2007 BCA Grand Masters', 'Coming soon...', '', null, null, null, null, null, '0', '0', null, 'Riviera Hotel, Las Vegas', '32', '13th', '0', '', '106', '149', '4', '0', '0', '2007-05-14', null, '2007-05-23 14:04:05', '2007-05-23 13:44:20', '1');
INSERT INTO `articles` VALUES ('398', '4', null, 'Worlds Top 100 Pool Players - voted 93rd by my peers!', 'Coming soon...', '', null, null, null, null, null, '1', '0', null, '', '0', '', '', '', '0', '404', '4', '0', '0', '2007-05-23', null, '2007-05-23 16:23:01', '2007-05-23 16:16:40', '1');
INSERT INTO `articles` VALUES ('399', '6', null, 'Caribbean and America\'s Pool and Cricket Tour', 'Vrrrrrr.....Vrrrrrr.....\"fuck, fuck, FUCKKKKKKKKKK!\"....Vrrrrrrr. It was pitch black and my phone was hovering across my dresser. Please be some pissed up twat sending me a drunken text I thought, but deep down I knew it was time to wake up. I opened one eye and glanced over to my watch, yep 4:40am rise and shine!', '<P><STRONG>All aboard!</STRONG></P>\r\n<P>Only 5 hours earlier I had (almost) finished packing my bags for a 3 month trip, I had only slept for a total of 30 hours in the last 6 days. My move out of my Nottingham apartment and the purchase and renovation of my new house had really taken its toll. I could hardly move a muscle and I would have eaten a chocolate cheese toasty for just 1 minute more sleep.None the less I leapt in the air, got dressed and ran down stairs with my bag, this was it...the 3 Month Caribbean and Americas World Championship Pool and Cricket Tour.</P>\r\n<P>I had spent the last 18 months working for a web agency fixing more bugs than you could shake an apathetic stick it so I was well ready for the break. </P>\r\n<P><STRONG>A slice of Pisa</STRONG></P>\r\n<P>I arrived in Pisa after an interesting flight, I had decided to fly from Doncaster to Pisa and then catch the train down to my pool tournament in Naples because of a Ryan air 1p special fair. </P>\r\n<P>Doncaster was close to my home town so bargain&amp;or so I thought! The price had already jumped to 20 quid due to taxes etc. but I wasnt expecting the 40 quid excess baggage charge due to Ryan Airs not so special 15kg baggage allowance! </P>\r\n<P>Security seemed a little tight for such an unspectacular route (unless old Osama was planning to take out the leaning tower with my 1p flight!). It was then I started to realize the reason I was outnumbered 7-1 by miserable looking Italian men was that they were all Roma supporters flying home after their Old Trafford Mauling! I got a little more worried when I noticed many of the faces looked pretty similar to the guys photographed during ugly scenes of violence in Manchester and splashed all over the sun which I was foolishly reading! </P>\r\n<P>I arrived in Pisa after a bumpy but (thankfully) uneventful flight. I spent a couple of hours admiring the view and taking the usual cheesy innuendo laced snaps before heading back to the station for a long train ride down the coast to Naples&amp;or so I thought! </P>\r\n<P><STRONG>Euro Tour - Naples</STRONG></P>\r\n<P>About an hour outside Naples I realized that the tournament wasnt in Naples at all but some town outside it, this is where it all went wrong! To cut a long story short, 3 trains, 2 strange dodgy towns, many texts, lots of bartering, a friendly hotel manager, 4 hours, and 50 Euros later I finally got to my room. Of course not only had my two room mates left me with the camp bed but I had also drawn an early morning match against the guy who finished 5<SUP>th</SUP> in the last event! </P>\r\n<P>I got as much sleep as I could before playing terrible and losing my first match 10-2. Italy was the last event of the year and I need to make the semi finals to finish in the top 28 in the rankings and therefore qualify for the world championships in Manila in November. Losing my first match was not a great start; this put me on the losers side of the double elimination draw meaning I would need to win 6 more matches just to qualify for the last 32. </P>\r\n<P>I sneaked through my next match 10-9 and won my next which gave me chance. I managed to get a good nights sleep and started out the next day much better. I beat 3 good players in a row (ending 1 guys dreams of the world championship spot. I was dead on my feet but the good news was I just needed to win one more match, the bad news was it was against a top German player ranked well above me and it was on the TV table. I started out ok but I quickly realized this wasnt going to be my day as lady luck seemed to be against me many times early on. </P>\r\n<P>I went 8:5 down but battled hard to get back into a 9:8 lead. Unfortunately in the last frame I broke but didnt have a shot, I played a bad safety which resulted in 9-9 with my opponent breaking. He broke and ran down to the 7 ball which was tight on the cushion on the point of the middle pocket; he left himself a long shot past the 8 ball which was just off the cushion. He jumped up after the shot as he knew hed missed it, hed hit it very badly and it actually it the 8 ball before rattling in the jaws of the pocket. As I stood up to walk to the table I was shocked to see the 7 ball drop in and the whole crowd groaned in shock! </P>\r\n<P>My Opponent, Christian Reimering went on to win the event, oh well that\'s the way the mop flops!&nbsp; </P>\r\n<P><STRONG>2007 Cricket World Cup - Caribbean</STRONG></P>\r\n<P>I have the following match tickets:</P>\r\n<P><U>Tuesday, 17 April 2007</U>&nbsp;- South Africa v England, Barbados, 14:30</P>\r\n<P><U>Wednesday, 18 April 2007</U><STRONG> -</STRONG>&nbsp; Ireland v Sri Lanka, Grenada, 14:30</P>\r\n<DIV class=mvb><U>Friday, 20 April 2007</U><STRONG> -</STRONG> Australia v New Zealand, Grenada, 14:30</DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb><U>Saturday, 21 April 2007</U><STRONG> -</STRONG> West Indies v England, Barbados, 14:30</DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb>\r\n<DIV class=mvb><U>Tuesday, 24 April 2007</U><STRONG> -</STRONG> SEMI FINAL (TBC v TBC), Jamaica, 14:30 *</DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb>\r\n<DIV class=mvb><U>Wednesday, 25 April 2007</U><STRONG> -&nbsp;</STRONG>SEMI FINAL (TBC v TBC), St Lucia, 14:30</DIV></DIV>\r\n<DIV class=mvb>&nbsp;</DIV>\r\n<DIV class=mvb>* Missed game</DIV>\r\n<DIV class=mvb>&nbsp;</DIV></DIV>\r\n<P><STRONG>Barbados I</STRONG></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Dodgy flight + delay<?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /><o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Aloe vera<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Flying fish sandwhich<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">The captain gravy<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Penguins, sumo, pimps etc..<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><?xml:namespace prefix = st1 ns = \"urn:schemas-microsoft-com:office:smarttags\" /><st1:place w:st=\"on\"><st1:country-region w:st=\"on\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">England</SPAN></FONT></st1:country-region></st1:place><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\"> suck!<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">So hot!<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">The gap beach + hotel<o:p></o:p></SPAN></FONT></P>\r\n<P>\r\n<P><STRONG>Grenada</STRONG></P>\r\n<P></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><st1:country-region w:st=\"on\"><st1:place w:st=\"on\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Grenada</SPAN></FONT></st1:place></st1:country-region><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\"> propeller <o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Sick, great views<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Missed <st1:country-region w:st=\"on\"><st1:place w:st=\"on\">Ireland</st1:place></st1:country-region> match lol<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Top ten grande answer beach<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Cruise ships<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Oz awesome <o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Coup + hurricane<o:p></o:p></SPAN></FONT></P>\r\n<P>\r\n<P><STRONG>Barbados II</STRONG></P>\r\n<P></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><st1:place w:st=\"on\"><st1:country-region w:st=\"on\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Barbados</SPAN></FONT></st1:country-region></st1:place><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\"> II<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Walked to game<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Missed lara and catch!<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Packed stadium 23,000 more like 27,000<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Gravy and gang full force, frying pan!<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Dreadlocks double takes etc<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><st1:place w:st=\"on\"><st1:City w:st=\"on\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">London</SPAN></FONT></st1:City></st1:place><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\"> bridge then empire strikes back<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Peiterson 100, Vaughan can play a bit! <o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Walked into town, more and more dreadlocks lol<o:p></o:p></SPAN></FONT></P>\r\n<P>\r\n<P><STRONG>St Lucia</STRONG></P>\r\n<P></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">St Lucifer <o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">St Innocent &amp; the <st1:place w:st=\"on\">Grenadines</st1:place><o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Armpit of St Lucifer <o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Last for bus, long drive, ozzies!<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Baking, rum punch, awesome ozzies<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Pitons, volcano water, fall movie, Sufrie <o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Airport chaos<o:p></o:p></SPAN></FONT></P>\r\n<P>\r\n<P><STRONG>Barbados III</STRONG></P>\r\n<P></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><st1:place w:st=\"on\"><st1:country-region w:st=\"on\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Barbados</SPAN></FONT></st1:country-region></st1:place><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\"> III<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Lost bags again!<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Ozzie banker, pissed, nurse<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Great hotel and beach relax<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Work day!<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">Lesbian bun fight<o:p></o:p></SPAN></FONT></P>\r\n<P class=MsoNormal style=\"margin: 0in 0in 0pt\"><FONT face=Arial size=2><SPAN style=\"font-size: 10pt; font-family: arial\">World cup final fiasco firworks<o:p></o:p></SPAN></FONT></P>\r\n<P>\r\n<P><STRONG>Jamaica</STRONG></P>\r\n<P>missed manu thumping! Airport taxi, sunset, beach, hustlers, jungle club, freaky friday,hedo</P>\r\n<P><STRONG>Las Vegas 1 -&nbsp;BCA Grand Masters</STRONG>&nbsp;</P>\r\n<P>Coming soon...</P>\r\n<P><STRONG>Jacksonville - World 10 Ball Championships</STRONG></P>\r\n<P>Coming soon...</P>\r\n<P>&nbsp;</P>\r\n<P>&nbsp;</P>', null, null, null, null, null, '0', '0', null, null, '0', null, null, null, '0', '0', '0', '0', '0', '2007-04-11', '2007-07-16 00:00:00', '2007-05-23 00:00:00', '2007-05-23 00:00:00', '1');
INSERT INTO `articles` VALUES ('400', '4', null, '2007 - Coming soon...', '\r\n\r\n\r\n\r\n\r\n', 'Poland<BR>First House<BR>Left Souk<BR>Euro Tour missed cut<BR>Cricket World Cup (Barbados,Grenada,St Lucia,Jamacia)<BR>BCA Grand Masters<BR>World 10 Ball<BR>World 14.1 ', null, null, null, null, null, '0', '0', null, '', '0', '', '', '', '0', '0', '1', '0', '0', '2007-12-31', null, '2007-05-23 16:36:15', '2007-05-23 16:35:55', '3');
INSERT INTO `break_types` VALUES ('1', 'Practice');
INSERT INTO `break_types` VALUES ('2', 'Friendly');
INSERT INTO `break_types` VALUES ('3', 'Competition');
INSERT INTO `break_types` VALUES ('4', 'Line Up');
INSERT INTO `breaks` VALUES ('92', '2', '80,52', '', 'City Tatts', '', '2002-08-14', '2004-04-20', '2004-01-01', '1');
INSERT INTO `breaks` VALUES ('109', '3', '85,62', 'I missed a blue of the spot for 90 with 4 reds left and a possble 141. 3 reds where perfect around the black and pink and one was available in bulk. I had to play the blue slow to stay on the red and just jawed it, I probably should have played it with gentle screw as it was the slowest table in the world but also the first time I had played on it. It was the first time I was playing for this team and I also had a 62 against Alex R after the match.', 'North Leagues Club', '', '2003-02-06', '2004-04-20', '2004-01-01', '1');
INSERT INTO `breaks` VALUES ('110', '2', '103,79', 'I had a 79 clearence and I was really cueing well, I had to play an outragous canon to rescue the break and open the reds which made it possible.\r\n\r\nIn the next frame I potted the last red with the rest and unfortuately canned into the black which left the white in the jaws of the corner pocket on 95! The black wasn\'t poterable so I faced a tough pink into the middle from the jaws! I got down and cocentrated on cueing straight and positive thoughts! Luckily the pink just dropped which was a great feeling as it was a really tough shot. There was 128 on but I had a fairly difficult long yellow from close the the cushion. I missed the yellow which went around the table and I fluked it in the corner, unfortunately I snookered myself on the green and that was end of break. ', 'Coogee RSL', 'Kieren', '2003-07-24', '2004-04-20', '2004-01-01', '1');
INSERT INTO `breaks` VALUES ('113', '2', '105,74', 'Again I was playign kieren on table 5, my favourite table in coogee. All the table\'s coogee are very slow but when they have been cleaned and ironed they play faster and become much more playable. I don\'t remember much from this break except that it was a total clearence and I was shaking on the black! I also had a 74 for good measure.', 'Coogee RSL', 'Kieren', '2003-08-21', '2004-04-20', '2004-01-01', '1');
INSERT INTO `breaks` VALUES ('114', '2', '86,81', '', 'City Tatts', '', '2003-07-19', '2004-04-24', '2004-01-01', '1');
INSERT INTO `breaks` VALUES ('142', '2', '54,54', '', 'Coogee RSL', 'Danniel', '2003-12-05', '2004-01-26', '2004-01-01', '1');
INSERT INTO `breaks` VALUES ('143', '2', '66', '143 on the table', 'Coogee RSL', 'Alex R', '2004-02-11', '2004-02-12', '2004-02-12', '1');
INSERT INTO `breaks` VALUES ('144', '2', '52', '', 'Coogee RSL', 'Alex R', '2004-02-28', '2004-02-29', '2004-02-29', '1');
INSERT INTO `breaks` VALUES ('145', '4', '87,68', 'Missed 1 red on 87 then had a 49 for a possible 136 total clearence :-(', 'Coogee RSL', 'Myself', '2004-02-28', '2004-04-20', '2004-02-29', '1');
INSERT INTO `breaks` VALUES ('146', '3', '51', 'I missed a straight black screwing back with deep reverse side. There was 4 reds left in a small cluster', 'Coogee RSL', 'Malabar', '2004-03-01', '2004-03-01', '2004-03-01', '1');
INSERT INTO `breaks` VALUES ('147', '2', '55', 'Missed a black with the rest with 3 reds left perfect after Joe had made 30 on table 5.', 'Coogee RSL', 'Joe D', '2004-03-01', '2004-03-01', '2004-03-01', '1');
INSERT INTO `breaks` VALUES ('148', '2', '67', 'Missed tricky red in the middle with 3 reds left, possible 118.', 'Coogee RSL', 'Rudy', '2004-03-09', '2004-03-09', '2004-03-09', '1');
INSERT INTO `breaks` VALUES ('149', '2', '56', 'Missed straight red bridging with about 7 reds left and perfect!', 'Coogee RSL', 'Chris M', '2004-03-15', '2004-03-17', '2004-03-17', '1');
INSERT INTO `breaks` VALUES ('150', '2', '60', 'Missed long pink with 73 left.', 'Coogee RSL', 'Chris M', '2004-03-17', '2004-03-17', '2004-03-17', '1');
INSERT INTO `breaks` VALUES ('151', '3', '58', 'Missed pink after huge kick on the blue left a half ball cut, possible 71.', 'Coogee RSL', 'Mascot', '2004-03-29', '2004-03-30', '2004-03-30', '1');
INSERT INTO `breaks` VALUES ('152', '2', '95,80,74,68,63,53', 'Missed loads of chances for a 100. Missed blue of the spot pissed in the last frame for a hundred with one red left, possible 135!', 'Coogee RSL', 'Brett O', '2004-04-01', '2004-04-01', '2004-04-01', '1');
INSERT INTO `breaks` VALUES ('153', '2', '74,57', 'Missed red om 74 with 4 reds left, carried on and missed last red on what would have been 102', 'Coogee RSL', 'Kannika S', '2004-04-02', '2004-04-03', '2004-04-03', '1');
INSERT INTO `breaks` VALUES ('154', '1', '139', 'First visit after break 139 total clearence on my 17th birthday.', 'Cyclists', '', '1991-01-09', '2004-04-05', '2004-04-05', '1');
INSERT INTO `breaks` VALUES ('155', '2', '50', 'Missed last red down the rail into bulk pocket, possible 85', 'Coogee RSL', 'Thai Alex', '2004-04-08', '2004-04-08', '2004-04-08', '1');
INSERT INTO `breaks` VALUES ('156', '2', '70,59', '70 Clearence and missed difficult red down the rail with two reds left on 59, possible 102.', 'Coogee RSL', 'Steve T', '2004-04-08', '2004-04-08', '2004-04-08', '1');
INSERT INTO `breaks` VALUES ('157', '1', '102', 'Potted straight black and didn\'t attempt to get on yellow which was stuck behind brown. Smashed it but it didn\'t go in, possible 129 (Table 5).', 'Coogee RSL', 'Alex R', '2004-04-19', '2004-04-19', '2004-04-19', '1');
INSERT INTO `breaks` VALUES ('158', '3', '53,52', 'Two 50 breaks in the same frame, missed the pack potting the pink in the middle and left with a tricky plany which a rattled. Next vist I got 52 missing a long blue with possible 70, also table 5.', 'Coogee RSL', 'Maroubra A', '2004-04-19', '2004-04-19', '2004-04-19', '1');
INSERT INTO `breaks` VALUES ('159', '2', '68,55', 'Clearence on 68.', 'Coogee RSL', 'Andrew G', '2004-04-24', '2004-04-24', '2004-04-24', '1');
INSERT INTO `breaks` VALUES ('160', '2', '60,51', 'Another good chance for a ton, 51 and 60 in the same frame. Missed one ball between breaks and missed yellow with the rest on 60.', 'Coogee RSL', 'Kannika S', '2004-04-25', '2004-04-27', '2004-04-27', '1');
INSERT INTO `breaks` VALUES ('161', '2', '102,72', 'Missed last red into middle digging into the white to get position on the black, possible 137. Also missed medium easy red on 72 with 4 reds left, possible 131.', 'Coogee RSL', 'Andrew G', '2004-04-28', '2004-04-28', '2004-04-28', '1');
INSERT INTO `breaks` VALUES ('162', '2', '68,60,58,53,52', 'Missed countless chances for a ton.', 'Coogee RSL', 'Alex R', '2004-04-30', '2004-05-01', '2004-05-01', '1');
INSERT INTO `breaks` VALUES ('163', '2', '68', 'Just missed a tough back double on last red with all the colors perfect.', 'Rooty Hill', 'Andrew G', '2004-05-01', '2004-05-01', '2004-05-01', '1');
INSERT INTO `breaks` VALUES ('164', '2', '53', '', 'Coogee RSL', 'Kieren', '2004-05-05', '2004-05-05', '2004-05-05', '1');
INSERT INTO `breaks` VALUES ('165', '4', '120', 'Had 15 reds and blacks and then finished stragit on long yellow with the white tight on the cushion. I smashed th yellow in trying to pinch and angle and followed through in off - great cueing! :-(', 'Coogee RSL', 'Myself', '2004-05-05', '2004-05-05', '2004-05-05', '1');
INSERT INTO `breaks` VALUES ('166', '2', '84', 'Clearence', 'Coogee RSL', 'Kannika S', '2004-05-07', '2004-05-08', '2004-05-08', '1');
INSERT INTO `breaks` VALUES ('167', '2', '61', 'Snooker myself on last red with 96 on the table', 'Coogee RSL', 'Daniel M', '2004-05-10', '2004-05-10', '2004-05-10', '1');
INSERT INTO `breaks` VALUES ('168', '2', '95,75', '95 clearence and missed double on last red on 75, possible 110.', 'Coogee RSL', 'Andrew G', '2004-05-11', '2004-05-11', '2004-05-11', '1');
INSERT INTO `breaks` VALUES ('169', '2', '88,56', 'Missed a tough pink in the middle with two easy reds left and 137 on! ', 'Coogee RSL', 'Alex R', '2004-05-14', '2004-05-15', '2004-05-15', '1');
INSERT INTO `breaks` VALUES ('170', '3', '50', 'Missed a tough yellow along the cushion with 77 on', 'Malabar', 'Malabar', '2004-05-17', '2004-05-18', '2004-05-18', '1');
INSERT INTO `breaks` VALUES ('171', '2', '52', 'Missed a red into the middle with 95 on.', 'Coogee RSL', 'Kieren', '2004-05-17', '2004-05-18', '2004-05-18', '1');
INSERT INTO `breaks` VALUES ('172', '2', '87', 'Missed a long medium pink with 100 on.', 'Coogee RSL', 'Akex R', '2004-05-21', '2004-05-23', '2004-05-23', '1');
INSERT INTO `breaks` VALUES ('173', '3', '62', 'Missed tricky cut on pink with loads of reds left, good chance for 100.', 'Coogee RSL', 'Maroubra B', '2004-05-24', '2004-05-24', '2004-05-24', '1');
INSERT INTO `breaks` VALUES ('174', '2', '69,67', 'Missed two good chances for a ton in back to back frames.', 'Coogee RSL', 'Alex R', '2004-05-24', '2004-05-24', '2004-05-24', '1');
INSERT INTO `breaks` VALUES ('175', '3', '69', 'I missed a simple red on 69 with 4 open reds left and another two near the cushion not too difficult, possible 144!', 'Coogee RSL', 'Coogee B', '2004-07-12', '2004-07-21', '2004-07-12', '1');
INSERT INTO `breaks` VALUES ('176', '3', '52', 'Faced a difficult yellow down the rail with the rest. The green was safe so I played the double and missed it, possible 79 on the table.', 'Bronte', 'Bronte', '2004-07-19', '2004-07-21', '2004-07-21', '1');
INSERT INTO `breaks` VALUES ('177', '1', '62,52', 'Missed straight pink in the middle on 52 with 3 easy and two difficult reds left.', 'Coogee RSL', 'Andrew G', '2004-07-24', '2004-07-25', '2004-07-25', '1');
INSERT INTO `breaks` VALUES ('178', '2', '64', 'Missed a straight forward red with 6 easy reds left, wasted chance', 'Coogee RSL', 'James Hardy', '2004-10-02', '2004-10-03', '2004-10-03', '1');
INSERT INTO `breaks` VALUES ('179', '3', '55', 'Missed last red with possible 90 on playing shell out for 20c a point.\r\n\r\nPlaying Daniel, Alex, Ziggy and Brendon.', 'Coogee RSL', 'Various', '2004-10-08', '2004-10-12', '2004-10-12', '1');
INSERT INTO `breaks` VALUES ('180', '2', '51', 'Missed with loads of reds left, first visit to table.', 'Coogee RSL', 'Daniel', '2004-10-11', '2004-10-12', '2004-10-12', '1');
INSERT INTO `breaks` VALUES ('181', '2', '77', 'I missed a pink off the blue spot with two easy reds left and a possible 126. It was the first frame of the session and I potted two massive long reds from the baulk area to keep the break going - another 100 got away!', 'Coogee RSL', 'Alex R', '2004-10-15', '2004-10-19', '2004-10-19', '1');
INSERT INTO `breaks` VALUES ('182', '2', '102,64,62,61', 'I had a 102 first shot after the break off. I potted the last long red down the rail to finish on the black. I had to play the black hard and finish a little short on the yellow. I played the yellow with drag and right hand side and just jawed it missing out on a 129. \r\n\r\nIn the next frame I was on 64 when I potted the red with the long stuff and fouled the blue giving up the visit. The shot before having to use the long stuff I finished an inch short off perfect position after potting the pink and running through to break up two reds. Otherwise I would have had a great chance of back to back centuries.\r\n\r\nI had two further 60 breaks playing shell out, messing up another good chance in the last frame trying to move a red of the rail (Shell out was with Daniel and Brendon).', 'Coogee RSL', 'Daniel', '2004-10-20', '2004-10-20', '2004-10-20', '1');
INSERT INTO `breaks` VALUES ('183', '2', '67', 'Missed a easy red with 6 left and a possible 142 on the table. Everything was perfect but let myself get distracted!', 'Coogee RSL', 'Brendon', '2004-10-26', '2004-10-27', '2004-10-27', '1');
INSERT INTO `breaks` VALUES ('184', '2', '60,55', '', 'Coogee RSL', 'Kieren', '2004-11-08', '2004-11-09', '2004-11-09', '1');
INSERT INTO `breaks` VALUES ('185', '2', '56', 'I potted a red into the corner and ran through of another red which was touching it. Somehow I finished touvhing the red and couldn\'t hit enough of the pink to pot it in the middle. I also couldn\'t pot the black as it was an impossible cut bridging over the red. There was two easy reds left with colors on spots and 105 on the table if I could have taken the pink!', 'Coogee RSL', 'Jim', '2004-11-10', '2004-11-10', '2004-11-10', '1');
INSERT INTO `breaks` VALUES ('186', '2', '83', 'Missed a blue into middle with colors on their spots and a possible 115 on the table. Got distracted when my opponent forgot the score and ran out of position but cut a crazy red in the corner and I also fluked another red on the same shot otherwise would have had an even larger break.', 'Coogee RSL', 'Alex R', '2004-11-12', '2004-11-12', '2004-11-12', '1');
INSERT INTO `breaks` VALUES ('187', '2', '56', 'Missed tricky red in middle after just missing cluster of two reds to hold the white. About 5 reds left and easy ton. Was pissed though!', 'Coogee RSL', 'Kannika', '2004-11-26', '2004-11-29', '2004-11-29', '1');
INSERT INTO `breaks` VALUES ('188', '2', '65', 'Total clearance even though I was pretty drunk after playing in the pool league finals all day!', 'Coogee RSL', 'Daniel M', '2004-12-04', '2004-12-06', '2004-12-06', '1');
INSERT INTO `breaks` VALUES ('189', '1', '57', 'I had a 35,22,57 break on the crazy tight table 12 at cue world with my 12.75mm pool cue! Only two very close misses away from 114 clearance, 121 if I hadn\'t rattled the final black! I also made the first 14 balls at straight pool, my first show of the session.', 'Cue World', '', '2005-11-04', '2005-11-05', '2005-11-05', '1');
INSERT INTO `categories` VALUES ('11', 'Freelance Web Developer', '0', '1');
INSERT INTO `categories` VALUES ('15', 'Snooker', '0', '1');
INSERT INTO `categories` VALUES ('16', '8 Ball Pool', '0', '1');
INSERT INTO `categories` VALUES ('17', '9 Ball Pool', '0', '1');
INSERT INTO `categories` VALUES ('18', 'Football', '0', '1');
INSERT INTO `categories` VALUES ('24', 'World Wide Wonders', '0', '1');
INSERT INTO `categories` VALUES ('26', 'Sporting Events', '0', '1');
INSERT INTO `categories` VALUES ('27', 'Gadgets', '1', '1');
INSERT INTO `categories` VALUES ('28', 'Dices with Death', '1', '1');
INSERT INTO `categories` VALUES ('29', 'Concerts & Shows', '0', '1');
INSERT INTO `categories` VALUES ('30', 'Animals', '1', '1');
INSERT INTO `categories` VALUES ('31', 'Acheivments', '1', '1');
INSERT INTO `categories` VALUES ('32', 'Goals', '1', '1');
INSERT INTO `categories` VALUES ('34', 'Cities', '1', '1');
INSERT INTO `categories` VALUES ('35', 'Beaches', '1', '1');
INSERT INTO `categories` VALUES ('36', 'Hotels', '1', '1');
INSERT INTO `categories` VALUES ('37', 'Restaurants', '1', '1');
INSERT INTO `categories` VALUES ('38', 'Buildings', '1', '1');
INSERT INTO `categories` VALUES ('39', 'News Events', '1', '1');
INSERT INTO `categories` VALUES ('40', 'Sporting Moments', '1', '1');
INSERT INTO `categories` VALUES ('41', 'Quotes', '1', '1');
INSERT INTO `categories` VALUES ('42', 'Inventions', '1', '1');
INSERT INTO `categories` VALUES ('43', 'Sexual Encounters', '1', '1');
INSERT INTO `categories` VALUES ('44', 'Scams', '1', '1');
INSERT INTO `categories` VALUES ('45', 'Journeys', '1', '1');
INSERT INTO `categories` VALUES ('46', 'Movies', '1', '1');
INSERT INTO `categories` VALUES ('47', 'Songs', '1', '1');
INSERT INTO `categories` VALUES ('48', 'Bazaar Moments', '1', '1');
INSERT INTO `categories` VALUES ('49', 'Photos', '1', '1');
INSERT INTO `categories` VALUES ('50', 'Tours', '1', '1');
INSERT INTO `categories` VALUES ('51', 'Stories', '1', '1');
INSERT INTO `categories` VALUES ('52', 'People', '1', '1');
INSERT INTO `categories` VALUES ('53', 'Women', '1', '1');
INSERT INTO `categories` VALUES ('54', 'NYE\'s', '1', '1');
INSERT INTO `categories` VALUES ('55', 'Birthdays', '1', '1');
INSERT INTO `categories` VALUES ('56', 'Islands', '1', '1');
INSERT INTO `cities` VALUES ('1', '152', 'Dubai');
INSERT INTO `cities` VALUES ('2', '138', 'Muscat');
INSERT INTO `cities` VALUES ('3', '112', 'Bahrain');
INSERT INTO `cities` VALUES ('4', '234', 'Istanbul');
INSERT INTO `cities` VALUES ('5', '215', 'Rome');
INSERT INTO `cities` VALUES ('6', '210', 'Athens');
INSERT INTO `cities` VALUES ('7', '210', 'Crete');
INSERT INTO `cities` VALUES ('8', '210', 'Corfu');
INSERT INTO `cities` VALUES ('9', '210', 'Ios');
INSERT INTO `cities` VALUES ('10', '210', 'Paros');
INSERT INTO `cities` VALUES ('11', '215', 'Brindisi');
INSERT INTO `cities` VALUES ('12', '215', 'Bari');
INSERT INTO `cities` VALUES ('13', '215', 'Milan');
INSERT INTO `cities` VALUES ('14', '207', 'Paris');
INSERT INTO `cities` VALUES ('15', '231', 'Alicante');
INSERT INTO `cities` VALUES ('16', '231', 'Benidorm');
INSERT INTO `cities` VALUES ('17', '233', 'Zurich');
INSERT INTO `cities` VALUES ('18', '222', 'Amsterdam');
INSERT INTO `cities` VALUES ('19', '219', 'Luxemburg');
INSERT INTO `cities` VALUES ('20', '202', 'Copenhagen');
INSERT INTO `cities` VALUES ('21', '145', 'Columbo');
INSERT INTO `cities` VALUES ('22', '145', 'Kandy');
INSERT INTO `cities` VALUES ('23', '145', 'Hikaduwa');
INSERT INTO `cities` VALUES ('24', '28', 'Male');
INSERT INTO `cities` VALUES ('25', '28', 'Paradise Isle');
INSERT INTO `cities` VALUES ('26', '143', 'Singapore');
INSERT INTO `cities` VALUES ('27', '132', 'Johah Baru');
INSERT INTO `cities` VALUES ('28', '132', 'Kuala Lumpa');
INSERT INTO `cities` VALUES ('29', '132', 'Tioman Island');
INSERT INTO `cities` VALUES ('30', '132', 'Penang');
INSERT INTO `cities` VALUES ('31', '172', 'Bukit Lewang');
INSERT INTO `cities` VALUES ('32', '149', 'Krabi');
INSERT INTO `cities` VALUES ('33', '149', 'Phuket');
INSERT INTO `cities` VALUES ('34', '149', 'Surat Thani');
INSERT INTO `cities` VALUES ('35', '149', 'Koh Sumaui');
INSERT INTO `cities` VALUES ('36', '149', 'Bangkok');
INSERT INTO `cities` VALUES ('37', '149', 'Phetchabuun');
INSERT INTO `cities` VALUES ('38', '149', 'Pattaya');
INSERT INTO `cities` VALUES ('39', '149', 'Koh Samet');
INSERT INTO `cities` VALUES ('40', '120', 'Hong Kong');
INSERT INTO `cities` VALUES ('41', '124', 'Tokyo');
INSERT INTO `cities` VALUES ('42', '124', 'Kyoto');
INSERT INTO `cities` VALUES ('43', '124', 'Osaka');
INSERT INTO `cities` VALUES ('44', '124', 'Saitama');
INSERT INTO `cities` VALUES ('45', '124', 'Iberkachi');
INSERT INTO `cities` VALUES ('46', '172', 'Bali');
INSERT INTO `cities` VALUES ('47', '172', 'Jakarta');
INSERT INTO `cities` VALUES ('48', '158', 'Sydney');
INSERT INTO `cities` VALUES ('49', '158', 'Melbourne');
INSERT INTO `cities` VALUES ('50', '158', 'Brisbane');
INSERT INTO `cities` VALUES ('51', '158', 'Surfers Paradise');
INSERT INTO `cities` VALUES ('52', '158', 'Airlie Beach');
INSERT INTO `cities` VALUES ('53', '158', 'Blue Mountains');
INSERT INTO `cities` VALUES ('54', '158', 'Hunter Valley');
INSERT INTO `cities` VALUES ('55', '158', 'Lake Maquirie');
INSERT INTO `cities` VALUES ('56', '158', 'Hervey Bay');
INSERT INTO `cities` VALUES ('57', '179', 'Auckland');
INSERT INTO `cities` VALUES ('58', '179', 'Keri Keri');
INSERT INTO `cities` VALUES ('59', '106', 'LA');
INSERT INTO `cities` VALUES ('60', '106', 'San Fransisco');
INSERT INTO `cities` VALUES ('61', '106', 'Hawaii');
INSERT INTO `cities` VALUES ('62', '106', 'Winter Park');
INSERT INTO `cities` VALUES ('63', '106', 'Pheonix');
INSERT INTO `cities` VALUES ('64', '106', 'Reno');
INSERT INTO `cities` VALUES ('65', '106', 'Las Vegas');
INSERT INTO `cities` VALUES ('66', '106', 'Dallas');
INSERT INTO `cities` VALUES ('67', '106', 'Oklahoma City');
INSERT INTO `cities` VALUES ('68', '106', 'El Passo');
INSERT INTO `cities` VALUES ('69', '106', 'Denver');
INSERT INTO `cities` VALUES ('70', '106', 'Madison');
INSERT INTO `cities` VALUES ('71', '106', 'Ohio');
INSERT INTO `cities` VALUES ('72', '106', 'Chicago');
INSERT INTO `cities` VALUES ('73', '106', 'Phillidelphia');
INSERT INTO `cities` VALUES ('74', '106', 'NYC');
INSERT INTO `cities` VALUES ('75', '106', 'New Jersey');
INSERT INTO `cities` VALUES ('76', '106', 'Miami');
INSERT INTO `cities` VALUES ('77', '106', 'New Orleans');
INSERT INTO `cities` VALUES ('78', '106', 'Atlanta');
INSERT INTO `cities` VALUES ('79', '106', 'Myrtle Beach');
INSERT INTO `cities` VALUES ('80', '235', 'London');
INSERT INTO `cities` VALUES ('81', '235', 'Manchester');
INSERT INTO `cities` VALUES ('82', '235', 'Glasgow');
INSERT INTO `cities` VALUES ('83', '235', 'Birmingham');
INSERT INTO `cities` VALUES ('84', '235', 'Edingborough');
INSERT INTO `cities` VALUES ('85', '235', 'Newcastle');
INSERT INTO `cities` VALUES ('86', '235', 'Hull');
INSERT INTO `cities` VALUES ('87', '235', 'Leeds');
INSERT INTO `cities` VALUES ('88', '235', 'Nottingham');
INSERT INTO `cities` VALUES ('89', '235', 'Leicster');
INSERT INTO `cities` VALUES ('90', '235', 'Derby');
INSERT INTO `cities` VALUES ('91', '235', 'Doncaster');
INSERT INTO `cities` VALUES ('92', '235', 'Lincoln');
INSERT INTO `cities` VALUES ('93', '235', 'Grimsby');
INSERT INTO `cities` VALUES ('94', '235', 'Cleethorpes');
INSERT INTO `cities` VALUES ('95', '212', 'Rekyavik');
INSERT INTO `cities` VALUES ('96', '215', 'Vatican');
INSERT INTO `cities` VALUES ('97', '158', 'Moreton Island');
INSERT INTO `cities` VALUES ('98', '158', 'Hamilton Island');
INSERT INTO `cities` VALUES ('99', '158', 'Hook Island');
INSERT INTO `cities` VALUES ('100', '158', 'Great Barrier Reef');
INSERT INTO `cities` VALUES ('101', '158', 'Makay');
INSERT INTO `cities` VALUES ('102', '158', 'Gold Coast');
INSERT INTO `cities` VALUES ('103', '106', 'Grand Canyon');
INSERT INTO `cities` VALUES ('104', '172', 'Sumatra');
INSERT INTO `cities` VALUES ('105', '59', 'Buenos Aires');
INSERT INTO `cities` VALUES ('106', '66', 'Rio De Janeiro');
INSERT INTO `cities` VALUES ('107', '235', 'Reighton Sands');
INSERT INTO `cities` VALUES ('110', '225', 'Faro');
INSERT INTO `cities` VALUES ('111', '225', 'Lisbon');
INSERT INTO `cities` VALUES ('112', '225', 'Porto');
INSERT INTO `cities` VALUES ('113', '106', 'Area 51');
INSERT INTO `cities` VALUES ('114', '158', 'Ayers Rock');
INSERT INTO `cities` VALUES ('115', '158', 'Alice Springs');
INSERT INTO `cities` VALUES ('116', '158', 'Darwin');
INSERT INTO `cities` VALUES ('117', '116', 'Brunei');
INSERT INTO `cities` VALUES ('118', '132', 'Kota Kinabalu');
INSERT INTO `cities` VALUES ('119', '132', 'Sandakan');
INSERT INTO `cities` VALUES ('120', '184', 'Manilla');
INSERT INTO `cities` VALUES ('121', '117', 'Siam Riep');
INSERT INTO `cities` VALUES ('122', '60', 'Sacremento');
INSERT INTO `cities` VALUES ('123', '147', 'Taipei');
INSERT INTO `cities` VALUES ('124', '147', 'Kaohsiung');
INSERT INTO `cities` VALUES ('125', '144', 'Seoul');
INSERT INTO `cities` VALUES ('126', '118', 'Beijing');
INSERT INTO `cities` VALUES ('127', '118', 'Shanghai');
INSERT INTO `cities` VALUES ('128', '117', 'Poi Pet');
INSERT INTO `cities` VALUES ('129', '0', 'Pynjong');
INSERT INTO `cities` VALUES ('130', '235', 'Sheffield');
INSERT INTO `cities` VALUES ('131', '18', 'Eindhoven');
INSERT INTO `cities` VALUES ('132', '106', 'Cambridge,MD');
INSERT INTO `cities` VALUES ('133', '106', 'Chesapeake');
INSERT INTO `cities` VALUES ('134', '106', 'Washington');
INSERT INTO `cities` VALUES ('135', '201', 'Prague');
INSERT INTO `cities` VALUES ('136', '215', 'Trieste');
INSERT INTO `cities` VALUES ('137', '215', 'Monfalcone');
INSERT INTO `cities` VALUES ('138', '215', 'Venice');
INSERT INTO `cities` VALUES ('139', '230', 'Ljubljana');
INSERT INTO `cities` VALUES ('142', '208', 'Sindelfingen');
INSERT INTO `cities` VALUES ('141', '208', 'Karlsruhe');
INSERT INTO `cities` VALUES ('143', '194', 'Rankweil');
INSERT INTO `cities` VALUES ('144', '217', 'Vaduz');
INSERT INTO `cities` VALUES ('145', '208', 'friedrichshafen');
INSERT INTO `cities` VALUES ('146', '224', 'Wroclaw');
INSERT INTO `cities` VALUES ('147', '231', 'Malaga');
INSERT INTO `cities` VALUES ('148', '215', 'Pisa');
INSERT INTO `cities` VALUES ('149', '215', 'Naples');
INSERT INTO `cities` VALUES ('150', '62', 'Bridgetown');
INSERT INTO `cities` VALUES ('151', '80', 'St George');
INSERT INTO `cities` VALUES ('152', '98', 'Castries');
INSERT INTO `cities` VALUES ('153', '98', 'Veaux Fort');
INSERT INTO `cities` VALUES ('154', '84', 'Montego Bay');
INSERT INTO `cities` VALUES ('155', '84', 'Kingston');
INSERT INTO `cities` VALUES ('156', '84', 'Negril');
INSERT INTO `cities` VALUES ('157', null, null);
INSERT INTO `cities` VALUES ('158', '106', 'Charlotte');
INSERT INTO `cities` VALUES ('178', '68', 'Toronto');
INSERT INTO `cities` VALUES ('160', '106', 'Jacksonville');
INSERT INTO `cities` VALUES ('161', null, null);
INSERT INTO `cities` VALUES ('162', '84', 'Ocho Rios');
INSERT INTO `cities` VALUES ('163', '63', 'Belize City');
INSERT INTO `cities` VALUES ('164', '63', 'Caye Caulker');
INSERT INTO `cities` VALUES ('165', '63', 'Ambergris Caye');
INSERT INTO `cities` VALUES ('166', '63', 'Corozal');
INSERT INTO `cities` VALUES ('167', '171', 'Guatemala City');
INSERT INTO `cities` VALUES ('168', '171', 'Antigua');
INSERT INTO `cities` VALUES ('169', '171', 'Flores');
INSERT INTO `cities` VALUES ('170', '171', 'Tikal');
INSERT INTO `cities` VALUES ('171', '213', 'Dublin');
INSERT INTO `cities` VALUES ('172', '131', 'Macau City');
INSERT INTO `cities` VALUES ('173', '86', 'Cancun');
INSERT INTO `cities` VALUES ('174', '86', 'Playa Del Carmen');
INSERT INTO `cities` VALUES ('175', '154', 'Saigon');
INSERT INTO `cities` VALUES ('176', '117', 'Phnom Penh');
INSERT INTO `cities` VALUES ('177', '117', 'Sihanoukville');
INSERT INTO `cities` VALUES ('179', '68', 'Niagra Falls');
INSERT INTO `cms_documents` VALUES ('2', 'a', 'cv_2008.doc', '2008-03-22 22:45:50', '2008-03-22 22:45:50', '4', '4', '3');
INSERT INTO `cms_images` VALUES ('1', 'Kiss', 'kiss_lips.gif', '2006-06-17 21:39:55', '2006-09-03 01:10:51', '1', '1', '1');
INSERT INTO `cms_images` VALUES ('2', 'a', 'nicole_02.jpg', '2008-03-22 22:44:49', '2008-03-22 22:44:49', '4', '4', '1');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '6');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '8');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '15');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '9');
INSERT INTO `cms_img_mod_lookup` VALUES ('2', '9');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '6');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '8');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '15');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '9');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '6');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '8');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '15');
INSERT INTO `cms_img_mod_lookup` VALUES ('1', '9');
INSERT INTO `cms_menu_doc_lookup` VALUES ('2', '0');
INSERT INTO `cms_menu_doc_lookup` VALUES ('3', '0');
INSERT INTO `cms_menu_doc_lookup` VALUES ('1', '0');
INSERT INTO `cms_modules` VALUES ('1', 'Users', 'admin_users.cfm', '1', '0', '0');
INSERT INTO `cms_modules` VALUES ('2', 'User Types', 'admin_user_types.cfm', '1', '0', '0');
INSERT INTO `cms_modules` VALUES ('3', 'Images', 'image_manager.cfm', '1', '0', '0');
INSERT INTO `cms_modules` VALUES ('4', 'Documents', 'document_manager.cfm', '1', '0', '0');
INSERT INTO `cms_modules` VALUES ('5', 'Videos', 'video_manager.cfm', '1', '0', '0');
INSERT INTO `cms_modules` VALUES ('6', 'Pages', 'page_manager.cfm', '1', '0', '1');
INSERT INTO `cms_modules` VALUES ('7', 'Menus', 'menu_manager.cfm', '1', '0', '0');
INSERT INTO `cms_modules` VALUES ('8', 'News', 'news.cfm', '0', '1', '1');
INSERT INTO `cms_modules` VALUES ('9', 'Events', 'events.cfm', '0', '0', '1');
INSERT INTO `cms_modules` VALUES ('15', 'Gallery', 'gallery.cfm', '0', '0', '1');
INSERT INTO `cms_pages` VALUES ('1', 'Test Page', 'Some text... <IMG alt=\"\" src=\"http://localhost:8500/www.atp.com.au/uploads/images/kiss_lips.gif\" border=0> ', '2006-06-17 20:11:51', '2006-09-03 02:23:02', '1', '1', '1');
INSERT INTO `cms_sections` VALUES ('1', 'RILEY');
INSERT INTO `cms_sections` VALUES ('2', 'EDUCATION');
INSERT INTO `cms_sections` VALUES ('3', 'EMPLOYMENT');
INSERT INTO `cms_sections` VALUES ('4', 'SPORTS & LEISURE');
INSERT INTO `cms_sections` VALUES ('5', 'TRAVEL');
INSERT INTO `cms_templates` VALUES ('1', 'Default Template', 'default.cfm');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '15', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '14', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '13', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '12', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '11', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '10', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '9', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '8', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '7', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '6', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '5', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '4', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '3', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '2', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('1', '1', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('3', '1', '3');
INSERT INTO `cms_user_type_lookup` VALUES ('3', '2', '3');
INSERT INTO `cms_user_type_lookup` VALUES ('3', '3', '3');
INSERT INTO `cms_user_type_lookup` VALUES ('3', '4', '3');
INSERT INTO `cms_user_type_lookup` VALUES ('3', '5', '3');
INSERT INTO `cms_user_type_lookup` VALUES ('3', '6', '3');
INSERT INTO `cms_user_type_lookup` VALUES ('3', '7', '3');
INSERT INTO `cms_user_type_lookup` VALUES ('3', '8', '3');
INSERT INTO `cms_user_type_lookup` VALUES ('3', '9', '3');
INSERT INTO `cms_user_type_lookup` VALUES ('3', '15', '3');
INSERT INTO `cms_user_type_lookup` VALUES ('2', '1', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('2', '2', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('2', '3', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('2', '4', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('2', '6', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('2', '7', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('2', '8', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('2', '9', '1');
INSERT INTO `cms_user_type_lookup` VALUES ('2', '15', '1');
INSERT INTO `cms_user_types` VALUES ('2', 'Global Admin', '2008-03-22 22:48:02', '2006-04-11 00:11:52', '1', '4', '1');
INSERT INTO `cms_user_types` VALUES ('3', 'Global Editor', '2008-03-22 22:38:37', '2006-04-11 00:13:40', '1', '4', '1');
INSERT INTO `cms_users` VALUES ('2', 'Test', 'Approver', 'b', 'b', '3', '1', '2006-04-11 00:15:58', '2008-03-22 22:18:42', '1', '2', '1');
INSERT INTO `cms_users` VALUES ('3', 'Test', 'Editor', 'c', 'c', '2', '1', '2006-04-11 00:16:42', '2008-03-22 22:38:29', '1', '4', '1');
INSERT INTO `cms_users` VALUES ('4', 'Global', 'Approver', 'a', 'a', '2', '1', '2006-04-11 00:16:42', '2008-03-22 22:46:48', '0', '4', '1');
INSERT INTO `cms_work_flow` VALUES ('1', 'LIVE');
INSERT INTO `cms_work_flow` VALUES ('2', 'PENDING');
INSERT INTO `cms_work_flow` VALUES ('3', 'DECLINED');
INSERT INTO `cms_work_flow` VALUES ('4', 'DRAFT');
INSERT INTO `cms_work_flow` VALUES ('5', 'ARCHIVED');
INSERT INTO `cms_work_flow` VALUES ('6', 'DELETED');
INSERT INTO `cms_work_flow_lookup` VALUES ('1', '1');
INSERT INTO `cms_work_flow_lookup` VALUES ('2', '1');
INSERT INTO `cms_work_flow_lookup` VALUES ('3', '1');
INSERT INTO `cms_work_flow_lookup` VALUES ('4', '1');
INSERT INTO `cms_work_flow_lookup` VALUES ('5', '1');
INSERT INTO `cms_work_flow_lookup` VALUES ('6', '1');
INSERT INTO `cms_work_flow_lookup` VALUES ('1', '2');
INSERT INTO `cms_work_flow_lookup` VALUES ('2', '2');
INSERT INTO `cms_work_flow_lookup` VALUES ('3', '2');
INSERT INTO `cms_work_flow_lookup` VALUES ('2', '3');
INSERT INTO `cms_work_flow_lookup` VALUES ('3', '3');
INSERT INTO `cms_work_flow_lookup` VALUES ('5', '3');
INSERT INTO `cms_work_flow_lookup` VALUES ('4', '3');
INSERT INTO `cms_work_flow_types` VALUES ('1', 'Administrator', '1', '1');
INSERT INTO `cms_work_flow_types` VALUES ('2', 'Approver', '1', '0');
INSERT INTO `cms_work_flow_types` VALUES ('3', 'Editor', '0', '1');
INSERT INTO `continents` VALUES ('1', 'Africa');
INSERT INTO `continents` VALUES ('2', 'Antarctica');
INSERT INTO `continents` VALUES ('3', 'Asia');
INSERT INTO `continents` VALUES ('4', 'Oceana');
INSERT INTO `continents` VALUES ('5', 'Europe');
INSERT INTO `continents` VALUES ('6', 'North America');
INSERT INTO `continents` VALUES ('7', 'South America');
INSERT INTO `countries` VALUES ('1', '1', 'Algeria', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('2', '1', 'Angola', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('3', '1', 'Benin', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('4', '1', 'Botswana', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('5', '1', 'Burkina Faso', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('6', '1', 'Burundi', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('7', '1', 'Cameroon', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('8', '1', 'Cape Verde', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('9', '1', 'Central African Republic', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('10', '1', 'Chad', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('11', '1', 'Comoro Island', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('12', '1', 'Congo', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('13', '1', 'Djibouti', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('14', '1', 'Egypt', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('15', '1', 'Equatorial Guinea', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('16', '1', 'Ethiopia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('17', '1', 'Gabon', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('18', '1', 'Ghana', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('19', '1', 'Guinea Bissau', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('20', '1', 'Guinea Republic', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('21', '1', 'Ivory Coast', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('22', '1', 'Kenya', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('23', '1', 'Lesotho', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('24', '1', 'Liberia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('25', '1', 'Libya', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('26', '1', 'Madagascar', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('27', '1', 'Malawi', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('28', '1', 'Maldives Republic', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '59', '0', '0000-00-00', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('29', '1', 'Mali', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('30', '1', 'Mauritania', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('31', '1', 'Mauritius', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('32', '1', 'Mayotte', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('33', '1', 'Morocco', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('34', '1', 'Mozambique', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('35', '1', 'Namibia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('36', '1', 'Niger', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('37', '1', 'Nigeria', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('38', '1', 'Principe', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('39', '1', 'Reunion', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('40', '1', 'Rwanda', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('41', '1', 'Sao Tome', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('42', '1', 'Senegal', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('43', '1', 'Seychelles', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('44', '1', 'Sierra Leone', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('45', '1', 'Somalia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('46', '1', 'South Africa', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('47', '1', 'Sudan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('48', '1', 'Swaziland', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('49', '1', 'Tanzania', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('50', '1', 'The Gambia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('51', '1', 'Togo', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('52', '1', 'Tunisia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('53', '1', 'Uganda', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('54', '1', 'Zaire', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('55', '1', 'Zambia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('56', '1', 'Zimbabwe', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('57', '6', 'Anguilla', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('58', '6', 'Antigua', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('59', '7', 'Argentina', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '<P>&nbsp;</P>', '41', '1', '2005-11-03', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('60', '6', 'Aruba', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('61', '6', 'Bahamas', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('62', '6', 'Barbados', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '391', '1', '2007-05-01', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('63', '6', 'Belize', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '412', '1', '2007-06-20', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('64', '6', 'Bequia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('65', '6', 'Bermuda', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('66', '7', 'Brazil', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '46', '0', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('67', '6', 'Caicos Island', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('68', '6', 'Canada', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', ' \r\n				\r\n			', '417', '1', '2008-01-06', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('69', '7', 'Chile', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '2004-01-25', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('70', '7', 'Colombia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '2004-01-25', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('71', '6', 'Costa Rica', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('72', '6', 'Cuba', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('73', '6', 'Dominica Island', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('74', '6', 'Dominican Republic', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('75', '6', 'Ecuador', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('76', '7', 'El Salvador', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '2004-01-25', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('77', '7', 'Falkland Islands', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '2004-01-25', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('78', '7', 'French Guiana', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '2004-01-25', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('79', '6', 'Greenland', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('80', '6', 'Grenada', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '393', '1', '2007-05-01', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('81', '7', 'Guyana', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '2004-01-25', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('82', '6', 'Haiti', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('83', '6', 'Honduras', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('84', '6', 'Jamaica', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '394', '1', '2007-05-09', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('85', '6', 'Martinique', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('86', '6', 'Mexico', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '413', '1', '2007-06-07', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('87', '6', 'Miquelon', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('88', '6', 'Montserrat', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('89', '6', 'Netherlands Antilles', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('90', '6', 'Nevis', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('91', '6', 'Nicaragua', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('92', '6', 'Panama', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('93', '7', 'Paraguay', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '2004-01-25', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('94', '7', 'Peru', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '2004-01-25', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('95', '6', 'Puerto Rico', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('96', '6', 'St Helena', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('97', '6', 'St Kitts', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('98', '6', 'St Lucia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '392', '1', '2007-05-01', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('99', '6', 'St Pierre', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('100', '6', 'St Vincent', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('101', '6', 'Surinam', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('102', '6', 'Tobago', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('103', '6', 'Trinidad', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('104', '6', 'Turks', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('105', '7', 'Uruguay', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '2004-01-25', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('106', '6', 'USA', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '64', '4', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('107', '7', 'Venezuela', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '2004-01-25', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('108', '6', 'Virgin Islands (UK)', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('109', '6', 'Virgin Islands (USA)', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('110', '3', 'Afghanistan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '0', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('111', '3', 'Albania', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('112', '3', 'Bahrain', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '45', '0', '0000-00-00', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('113', '3', 'Bangladesh', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '2007-05-01', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('114', '3', 'Belarus', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('115', '3', 'Bhutan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('116', '3', 'Brunei', '', '', '177', '2', '2005-03-05', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('117', '3', 'Cambodia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', ' \r\n				\r\n			', '196', '1', '2008-01-06', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('118', '3', 'China', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '47', '2', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('119', '3', 'Diego Garcia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('120', '3', 'Hong Kong', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '54', '2', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('121', '3', 'India', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('122', '3', 'Iran', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('123', '3', 'Iraq', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('124', '3', 'Japan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '58', '2', '2006-06-11', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('125', '3', 'Jordan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('126', '3', 'Kazakhstan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('127', '3', 'Kuwait', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('128', '3', 'Kyrgyzstan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('129', '3', 'Laos', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('130', '3', 'Lebanon', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('131', '3', 'Macau', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', ' \r\n				\r\n			', '419', '1', '2008-01-06', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('132', '3', 'Malaysia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '67', '3', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('133', '3', 'Moldova', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('134', '3', 'Mongolia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('135', '3', 'Myanmar', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('136', '3', 'Nepal', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('137', '3', 'North Korea', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '198', '1', '2005-08-29', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('138', '3', 'Oman', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '61', '3', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('139', '3', 'Pakistan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('140', '3', 'Qatar', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('141', '3', 'San Merino', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('142', '3', 'Saudi Arabia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('143', '3', 'Singapore', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '65', '4', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('144', '3', 'South Korea', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '199', '1', '2005-08-29', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('145', '3', 'Sri Lanka', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '72', '2', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('146', '3', 'Syria', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('147', '3', 'Taiwan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '200', '1', '2005-08-29', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('148', '3', 'Tajikistan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('149', '3', 'Thailand', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '70', '9', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('150', '3', 'Turkmenistan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('151', '3', 'Ukraine', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('152', '3', 'United Arab Emirates', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '74', '10', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('153', '3', 'Uzbekistan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('154', '3', 'Vietnam', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', ' \r\n				\r\n			', '421', '1', '2008-01-06', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('155', '3', 'Yemen (Arab Rep)', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('156', '3', 'Yemen (PDR)', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('157', '4', 'American Samoa', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('158', '4', 'Australia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '42', '7', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('159', '4', 'Bali', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '2007-06-07', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('160', '4', 'Cayman Island', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('161', '4', 'Christmas Island', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('162', '4', 'Cocos Island', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('163', '4', 'Cook Islands', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('164', '4', 'East Timor', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('165', '4', 'Eritrea', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('166', '4', 'Fiji', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('167', '4', 'French Polynesia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('168', '4', 'Futuna Islands', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('169', '4', 'Guadeloupe', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('170', '4', 'Guam', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('171', '6', 'Guatemala', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '415', '1', '2007-06-07', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('172', '4', 'Indonesia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '55', '3', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('173', '4', 'Kiribati', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('174', '4', 'Mariana Island', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('175', '4', 'Marshall Islands', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('176', '4', 'Micronesia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('177', '4', 'Naru', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('178', '4', 'New Caledonia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('179', '4', 'New Zealand', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '60', '2', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('180', '4', 'Niue Island', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('181', '4', 'Norfolk Island', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('182', '4', 'Palau', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('183', '4', 'Papua New Guinea', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('184', '3', 'Philippines', '', '', '179', '1', '2005-03-05', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('185', '4', 'Solomon Islands', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('186', '4', 'Tonga', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('187', '4', 'Tuvalu', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('188', '4', 'Vanuatu', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('189', '4', 'Wallis Islands', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('190', '4', 'Western Samoa', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('191', '5', 'Andorra', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('192', '5', 'Armenia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('193', '5', 'Ascension Islands', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('194', '5', 'Austria', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '374', '1', '2006-06-11', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('195', '5', 'Azerbaijan', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('196', '5', 'Belgium', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '44', '2', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('197', '5', 'Bolivia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('198', '5', 'Bosnia Herzegovina', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('199', '5', 'Bulgaria', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('200', '5', 'Cyprus', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('201', '5', 'Czech Republic', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '362', '1', '2006-02-08', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('202', '5', 'Denmark', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '49', '0', '0000-00-00', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('203', '5', 'Estonia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('204', '5', 'Europe', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '2007-06-07', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('205', '5', 'Faroe Island', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('206', '5', 'Finland', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('207', '5', 'France', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '52', '2', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('208', '5', 'Germany', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '48', '2', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('209', '5', 'Gibraltar', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('210', '5', 'Greece', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '53', '3', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('211', '5', 'Hungary', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('212', '5', 'Iceland', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '56', '0', '0000-00-00', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('213', '5', 'Ireland', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', ' \r\n				\r\n			', '420', '1', '2008-01-06', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('214', '5', 'Israel', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('215', '5', 'Italy', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '57', '0', '0000-00-00', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('216', '5', 'Latvia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('217', '5', 'Liechtenstein', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '371', '1', '2006-06-11', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('218', '5', 'Lithuania', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('219', '5', 'Luxembourg', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '66', '0', '0000-00-00', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('220', '5', 'Malta', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('221', '5', 'Monaco', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('222', '5', 'Netherlands', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '71', '3', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('223', '5', 'Norway', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('224', '5', 'Poland', '', '', '390', '1', '2007-01-15', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('225', '5', 'Portugal', '', '', '176', '1', '2004-09-18', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('226', '5', 'Romania', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('227', '5', 'Russia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('228', '5', 'Serbia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('229', '5', 'Slovak Republic', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('230', '5', 'Slovenia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '363', '1', '2006-04-17', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('231', '5', 'Spain', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '51', '0', '0000-00-00', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('232', '5', 'Sweden', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('233', '5', 'Switzerland', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '68', '0', '0000-00-00', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('234', '5', 'Turkey', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '75', '3', '2004-01-25', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('235', '5', 'England', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '50', '1', '2006-06-11', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('236', '5', 'Vatican City', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '63', '0', '0000-00-00', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('237', '5', 'Yugoslavia', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `countries` VALUES ('238', '5', 'Scotland', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '197', '1', '2005-08-29', '2004-01-09', '1');
INSERT INTO `countries` VALUES ('239', '5', 'Wales', 'Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.', '', '0', '1', '0000-00-00', '2004-01-09', '3');
INSERT INTO `documents` VALUES ('2', 'Doc 1a', 'xxx-Margaret.doc', '2003-08-12', '0', '1');
INSERT INTO `documents` VALUES ('3', 'Christmas Application', 'ChristmasApplication.pdf', '2003-08-21', '0', '1');
INSERT INTO `documents` VALUES ('5', 'Quick Reference Guide for the AMD chip blah blah blah', 'quick_ref_faq.pdf', '2003-08-21', '0', '1');
INSERT INTO `domains` VALUES ('2', 'http://www.thelifeofriley.org', '', '', '0', '2002-11-30 00:00:00', '2004-09-18 00:00:00', '1');
INSERT INTO `employers` VALUES ('1', 'Log1k.com');
INSERT INTO `employers` VALUES ('2', 'SHFA');
INSERT INTO `employers` VALUES ('3', 'Reading Room Sydney');
INSERT INTO `employers` VALUES ('4', 'Reading Room London');
INSERT INTO `employers` VALUES ('5', 'Compaq');
INSERT INTO `employers` VALUES ('6', 'University');
INSERT INTO `employers` VALUES ('8', 'SOUK Digital');
INSERT INTO `image_section_lookup` VALUES ('36', '1');
INSERT INTO `image_section_lookup` VALUES ('9', '4');
INSERT INTO `image_section_lookup` VALUES ('34', '3');
INSERT INTO `image_section_lookup` VALUES ('34', '1');
INSERT INTO `image_section_lookup` VALUES ('37', '5');
INSERT INTO `image_section_lookup` VALUES ('38', '5');
INSERT INTO `image_section_lookup` VALUES ('76', '4');
INSERT INTO `image_section_lookup` VALUES ('77', '5');
INSERT INTO `image_section_lookup` VALUES ('78', '4');
INSERT INTO `image_section_lookup` VALUES ('79', '4');
INSERT INTO `image_section_lookup` VALUES ('80', '4');
INSERT INTO `image_section_lookup` VALUES ('81', '4');
INSERT INTO `image_section_lookup` VALUES ('82', '5');
INSERT INTO `image_section_lookup` VALUES ('83', '5');
INSERT INTO `image_section_lookup` VALUES ('84', '5');
INSERT INTO `image_section_lookup` VALUES ('85', '5');
INSERT INTO `image_section_lookup` VALUES ('86', '5');
INSERT INTO `image_section_lookup` VALUES ('86', '4');
INSERT INTO `image_section_lookup` VALUES ('87', '4');
INSERT INTO `image_section_lookup` VALUES ('87', '5');
INSERT INTO `image_section_lookup` VALUES ('88', '5');
INSERT INTO `image_section_lookup` VALUES ('88', '4');
INSERT INTO `image_section_lookup` VALUES ('89', '5');
INSERT INTO `image_section_lookup` VALUES ('89', '4');
INSERT INTO `image_section_lookup` VALUES ('90', '4');
INSERT INTO `image_section_lookup` VALUES ('90', '5');
INSERT INTO `image_section_lookup` VALUES ('91', '5');
INSERT INTO `image_section_lookup` VALUES ('92', '4');
INSERT INTO `image_section_lookup` VALUES ('93', '5');
INSERT INTO `image_section_lookup` VALUES ('94', '5');
INSERT INTO `image_section_lookup` VALUES ('95', '5');
INSERT INTO `image_section_lookup` VALUES ('96', '5');
INSERT INTO `image_section_lookup` VALUES ('97', '5');
INSERT INTO `image_section_lookup` VALUES ('97', '1');
INSERT INTO `image_section_lookup` VALUES ('98', '1');
INSERT INTO `image_section_lookup` VALUES ('98', '5');
INSERT INTO `image_section_lookup` VALUES ('99', '5');
INSERT INTO `image_section_lookup` VALUES ('100', '5');
INSERT INTO `image_section_lookup` VALUES ('101', '5');
INSERT INTO `image_section_lookup` VALUES ('102', '5');
INSERT INTO `image_section_lookup` VALUES ('103', '1');
INSERT INTO `image_section_lookup` VALUES ('103', '5');
INSERT INTO `image_section_lookup` VALUES ('104', '5');
INSERT INTO `image_section_lookup` VALUES ('154', '4');
INSERT INTO `image_section_lookup` VALUES ('154', '1');
INSERT INTO `image_section_lookup` VALUES ('155', '4');
INSERT INTO `image_section_lookup` VALUES ('156', '4');
INSERT INTO `image_section_lookup` VALUES ('157', '4');
INSERT INTO `image_section_lookup` VALUES ('158', '4');
INSERT INTO `image_section_lookup` VALUES ('163', '4');
INSERT INTO `image_section_lookup` VALUES ('164', '4');
INSERT INTO `image_section_lookup` VALUES ('165', '4');
INSERT INTO `image_section_lookup` VALUES ('168', '1');
INSERT INTO `image_section_lookup` VALUES ('168', '4');
INSERT INTO `image_section_lookup` VALUES ('168', '5');
INSERT INTO `image_section_lookup` VALUES ('169', '4');
INSERT INTO `image_section_lookup` VALUES ('169', '5');
INSERT INTO `image_section_lookup` VALUES ('170', '4');
INSERT INTO `image_section_lookup` VALUES ('170', '5');
INSERT INTO `image_section_lookup` VALUES ('171', '5');
INSERT INTO `image_section_lookup` VALUES ('172', '5');
INSERT INTO `image_section_lookup` VALUES ('173', '5');
INSERT INTO `image_section_lookup` VALUES ('174', '5');
INSERT INTO `image_section_lookup` VALUES ('176', '5');
INSERT INTO `image_section_lookup` VALUES ('177', '4');
INSERT INTO `image_section_lookup` VALUES ('178', '5');
INSERT INTO `image_section_lookup` VALUES ('178', '4');
INSERT INTO `image_section_lookup` VALUES ('178', '1');
INSERT INTO `image_section_lookup` VALUES ('179', '4');
INSERT INTO `image_section_lookup` VALUES ('179', '5');
INSERT INTO `image_section_lookup` VALUES ('180', '4');
INSERT INTO `image_section_lookup` VALUES ('181', '1');
INSERT INTO `image_section_lookup` VALUES ('182', '4');
INSERT INTO `image_section_lookup` VALUES ('183', '5');
INSERT INTO `image_section_lookup` VALUES ('184', '1');
INSERT INTO `image_section_lookup` VALUES ('184', '5');
INSERT INTO `image_section_lookup` VALUES ('185', '5');
INSERT INTO `image_section_lookup` VALUES ('185', '1');
INSERT INTO `image_section_lookup` VALUES ('186', '1');
INSERT INTO `image_section_lookup` VALUES ('186', '5');
INSERT INTO `image_section_lookup` VALUES ('188', '1');
INSERT INTO `image_section_lookup` VALUES ('188', '5');
INSERT INTO `image_section_lookup` VALUES ('189', '1');
INSERT INTO `image_section_lookup` VALUES ('189', '5');
INSERT INTO `image_section_lookup` VALUES ('190', '5');
INSERT INTO `image_section_lookup` VALUES ('191', '1');
INSERT INTO `image_section_lookup` VALUES ('191', '5');
INSERT INTO `image_section_lookup` VALUES ('194', '1');
INSERT INTO `image_section_lookup` VALUES ('194', '4');
INSERT INTO `image_section_lookup` VALUES ('193', '4');
INSERT INTO `image_section_lookup` VALUES ('194', '4');
INSERT INTO `image_section_lookup` VALUES ('195', '4');
INSERT INTO `image_section_lookup` VALUES ('202', '4');
INSERT INTO `image_section_lookup` VALUES ('205', '1');
INSERT INTO `image_section_lookup` VALUES ('205', '4');
INSERT INTO `image_section_lookup` VALUES ('208', '4');
INSERT INTO `image_section_lookup` VALUES ('209', '4');
INSERT INTO `image_section_lookup` VALUES ('210', '4');
INSERT INTO `image_section_lookup` VALUES ('211', '4');
INSERT INTO `image_section_lookup` VALUES ('212', '4');
INSERT INTO `image_section_lookup` VALUES ('212', '1');
INSERT INTO `image_section_lookup` VALUES ('213', '4');
INSERT INTO `image_section_lookup` VALUES ('213', '1');
INSERT INTO `image_section_lookup` VALUES ('214', '4');
INSERT INTO `image_section_lookup` VALUES ('214', '1');
INSERT INTO `image_section_lookup` VALUES ('215', '4');
INSERT INTO `image_section_lookup` VALUES ('215', '1');
INSERT INTO `image_section_lookup` VALUES ('216', '1');
INSERT INTO `image_section_lookup` VALUES ('217', '1');
INSERT INTO `image_section_lookup` VALUES ('218', '1');
INSERT INTO `image_section_lookup` VALUES ('219', '4');
INSERT INTO `image_section_lookup` VALUES ('220', '4');
INSERT INTO `image_section_lookup` VALUES ('221', '4');
INSERT INTO `image_section_lookup` VALUES ('222', '4');
INSERT INTO `image_section_lookup` VALUES ('223', '4');
INSERT INTO `image_section_lookup` VALUES ('224', '4');
INSERT INTO `image_section_lookup` VALUES ('225', '4');
INSERT INTO `image_section_lookup` VALUES ('226', '4');
INSERT INTO `image_section_lookup` VALUES ('227', '4');
INSERT INTO `image_section_lookup` VALUES ('228', '4');
INSERT INTO `image_section_lookup` VALUES ('229', '4');
INSERT INTO `image_section_lookup` VALUES ('230', '4');
INSERT INTO `image_section_lookup` VALUES ('231', '4');
INSERT INTO `image_section_lookup` VALUES ('232', '4');
INSERT INTO `image_section_lookup` VALUES ('233', '4');
INSERT INTO `image_section_lookup` VALUES ('233', '1');
INSERT INTO `image_section_lookup` VALUES ('234', '4');
INSERT INTO `image_section_lookup` VALUES ('235', '4');
INSERT INTO `image_section_lookup` VALUES ('236', '4');
INSERT INTO `image_section_lookup` VALUES ('237', '4');
INSERT INTO `image_section_lookup` VALUES ('238', '4');
INSERT INTO `image_section_lookup` VALUES ('239', '4');
INSERT INTO `image_section_lookup` VALUES ('239', '1');
INSERT INTO `image_section_lookup` VALUES ('240', '1');
INSERT INTO `image_section_lookup` VALUES ('240', '4');
INSERT INTO `image_section_lookup` VALUES ('241', '4');
INSERT INTO `image_section_lookup` VALUES ('241', '1');
INSERT INTO `image_section_lookup` VALUES ('242', '4');
INSERT INTO `image_section_lookup` VALUES ('242', '1');
INSERT INTO `image_section_lookup` VALUES ('245', '1');
INSERT INTO `image_section_lookup` VALUES ('243', '4');
INSERT INTO `image_section_lookup` VALUES ('244', '4');
INSERT INTO `image_section_lookup` VALUES ('244', '1');
INSERT INTO `image_section_lookup` VALUES ('245', '4');
INSERT INTO `image_section_lookup` VALUES ('246', '1');
INSERT INTO `image_section_lookup` VALUES ('246', '4');
INSERT INTO `image_section_lookup` VALUES ('247', '1');
INSERT INTO `image_section_lookup` VALUES ('247', '4');
INSERT INTO `image_section_lookup` VALUES ('181', '5');
INSERT INTO `image_section_lookup` VALUES ('248', '4');
INSERT INTO `image_section_lookup` VALUES ('249', '4');
INSERT INTO `image_section_lookup` VALUES ('250', '4');
INSERT INTO `image_section_lookup` VALUES ('251', '4');
INSERT INTO `image_section_lookup` VALUES ('252', '4');
INSERT INTO `image_section_lookup` VALUES ('253', '4');
INSERT INTO `image_section_lookup` VALUES ('254', '4');
INSERT INTO `image_section_lookup` VALUES ('255', '4');
INSERT INTO `image_section_lookup` VALUES ('255', '1');
INSERT INTO `image_section_lookup` VALUES ('256', '4');
INSERT INTO `image_section_lookup` VALUES ('257', '1');
INSERT INTO `image_section_lookup` VALUES ('257', '4');
INSERT INTO `image_section_lookup` VALUES ('258', '1');
INSERT INTO `image_section_lookup` VALUES ('258', '4');
INSERT INTO `image_section_lookup` VALUES ('259', '4');
INSERT INTO `image_section_lookup` VALUES ('260', '1');
INSERT INTO `image_section_lookup` VALUES ('260', '4');
INSERT INTO `image_section_lookup` VALUES ('260', '5');
INSERT INTO `image_section_lookup` VALUES ('187', '5');
INSERT INTO `image_section_lookup` VALUES ('187', '1');
INSERT INTO `image_section_lookup` VALUES ('261', '4');
INSERT INTO `image_section_lookup` VALUES ('262', '4');
INSERT INTO `image_section_lookup` VALUES ('263', '4');
INSERT INTO `image_section_lookup` VALUES ('264', '4');
INSERT INTO `image_section_lookup` VALUES ('265', '4');
INSERT INTO `image_section_lookup` VALUES ('266', '4');
INSERT INTO `image_section_lookup` VALUES ('267', '4');
INSERT INTO `image_section_lookup` VALUES ('267', '1');
INSERT INTO `image_section_lookup` VALUES ('270', '1');
INSERT INTO `image_section_lookup` VALUES ('270', '5');
INSERT INTO `image_section_lookup` VALUES ('271', '5');
INSERT INTO `image_section_lookup` VALUES ('271', '1');
INSERT INTO `image_section_lookup` VALUES ('272', '2');
INSERT INTO `image_section_lookup` VALUES ('273', '1');
INSERT INTO `image_section_lookup` VALUES ('273', '2');
INSERT INTO `image_section_lookup` VALUES ('274', '2');
INSERT INTO `image_section_lookup` VALUES ('274', '1');
INSERT INTO `image_section_lookup` VALUES ('275', '4');
INSERT INTO `image_section_lookup` VALUES ('276', '4');
INSERT INTO `image_section_lookup` VALUES ('277', '4');
INSERT INTO `image_section_lookup` VALUES ('278', '4');
INSERT INTO `image_section_lookup` VALUES ('279', '4');
INSERT INTO `image_section_lookup` VALUES ('280', '4');
INSERT INTO `image_section_lookup` VALUES ('281', '4');
INSERT INTO `image_section_lookup` VALUES ('282', '4');
INSERT INTO `image_section_lookup` VALUES ('283', '4');
INSERT INTO `image_section_lookup` VALUES ('284', '4');
INSERT INTO `image_section_lookup` VALUES ('285', '5');
INSERT INTO `image_section_lookup` VALUES ('286', '5');
INSERT INTO `image_section_lookup` VALUES ('289', '5');
INSERT INTO `image_section_lookup` VALUES ('289', '1');
INSERT INTO `image_section_lookup` VALUES ('290', '5');
INSERT INTO `image_section_lookup` VALUES ('290', '1');
INSERT INTO `image_section_lookup` VALUES ('291', '5');
INSERT INTO `image_section_lookup` VALUES ('291', '1');
INSERT INTO `image_section_lookup` VALUES ('292', '5');
INSERT INTO `image_section_lookup` VALUES ('292', '1');
INSERT INTO `image_section_lookup` VALUES ('293', '5');
INSERT INTO `image_section_lookup` VALUES ('293', '1');
INSERT INTO `image_section_lookup` VALUES ('294', '5');
INSERT INTO `image_section_lookup` VALUES ('294', '1');
INSERT INTO `image_section_lookup` VALUES ('295', '5');
INSERT INTO `image_section_lookup` VALUES ('295', '1');
INSERT INTO `image_section_lookup` VALUES ('303', '1');
INSERT INTO `image_section_lookup` VALUES ('296', '5');
INSERT INTO `image_section_lookup` VALUES ('297', '4');
INSERT INTO `image_section_lookup` VALUES ('298', '4');
INSERT INTO `image_section_lookup` VALUES ('299', '4');
INSERT INTO `image_section_lookup` VALUES ('300', '5');
INSERT INTO `image_section_lookup` VALUES ('301', '1');
INSERT INTO `image_section_lookup` VALUES ('302', '1');
INSERT INTO `image_section_lookup` VALUES ('303', '2');
INSERT INTO `image_section_lookup` VALUES ('304', '1');
INSERT INTO `image_section_lookup` VALUES ('304', '5');
INSERT INTO `image_section_lookup` VALUES ('305', '1');
INSERT INTO `image_section_lookup` VALUES ('305', '5');
INSERT INTO `image_section_lookup` VALUES ('307', '5');
INSERT INTO `image_section_lookup` VALUES ('307', '1');
INSERT INTO `image_section_lookup` VALUES ('339', '5');
INSERT INTO `image_section_lookup` VALUES ('339', '1');
INSERT INTO `image_section_lookup` VALUES ('342', '1');
INSERT INTO `image_section_lookup` VALUES ('340', '5');
INSERT INTO `image_section_lookup` VALUES ('341', '5');
INSERT INTO `image_section_lookup` VALUES ('341', '1');
INSERT INTO `image_section_lookup` VALUES ('343', '4');
INSERT INTO `image_section_lookup` VALUES ('344', '4');
INSERT INTO `image_section_lookup` VALUES ('344', '1');
INSERT INTO `image_section_lookup` VALUES ('345', '4');
INSERT INTO `image_section_lookup` VALUES ('346', '4');
INSERT INTO `image_section_lookup` VALUES ('346', '5');
INSERT INTO `image_section_lookup` VALUES ('350', '4');
INSERT INTO `image_section_lookup` VALUES ('353', '4');
INSERT INTO `image_section_lookup` VALUES ('354', '5');
INSERT INTO `image_section_lookup` VALUES ('354', '4');
INSERT INTO `image_section_lookup` VALUES ('355', '4');
INSERT INTO `image_section_lookup` VALUES ('356', '4');
INSERT INTO `image_section_lookup` VALUES ('356', '1');
INSERT INTO `image_section_lookup` VALUES ('357', '4');
INSERT INTO `image_section_lookup` VALUES ('358', '4');
INSERT INTO `image_section_lookup` VALUES ('359', '4');
INSERT INTO `image_section_lookup` VALUES ('367', '4');
INSERT INTO `image_section_lookup` VALUES ('377', '4');
INSERT INTO `image_section_lookup` VALUES ('362', '4');
INSERT INTO `image_section_lookup` VALUES ('378', '4');
INSERT INTO `image_section_lookup` VALUES ('379', '4');
INSERT INTO `image_section_lookup` VALUES ('380', '1');
INSERT INTO `image_section_lookup` VALUES ('381', '1');
INSERT INTO `image_section_lookup` VALUES ('382', '1');
INSERT INTO `image_section_lookup` VALUES ('383', '1');
INSERT INTO `image_section_lookup` VALUES ('384', '1');
INSERT INTO `image_section_lookup` VALUES ('385', '1');
INSERT INTO `image_section_lookup` VALUES ('386', '1');
INSERT INTO `image_section_lookup` VALUES ('387', '1');
INSERT INTO `image_section_lookup` VALUES ('36', '1');
INSERT INTO `image_section_lookup` VALUES ('9', '4');
INSERT INTO `image_section_lookup` VALUES ('34', '3');
INSERT INTO `image_section_lookup` VALUES ('34', '1');
INSERT INTO `image_section_lookup` VALUES ('37', '5');
INSERT INTO `image_section_lookup` VALUES ('38', '5');
INSERT INTO `image_section_lookup` VALUES ('76', '4');
INSERT INTO `image_section_lookup` VALUES ('77', '5');
INSERT INTO `image_section_lookup` VALUES ('78', '4');
INSERT INTO `image_section_lookup` VALUES ('79', '4');
INSERT INTO `image_section_lookup` VALUES ('80', '4');
INSERT INTO `image_section_lookup` VALUES ('81', '4');
INSERT INTO `image_section_lookup` VALUES ('82', '5');
INSERT INTO `image_section_lookup` VALUES ('83', '5');
INSERT INTO `image_section_lookup` VALUES ('84', '5');
INSERT INTO `image_section_lookup` VALUES ('85', '5');
INSERT INTO `image_section_lookup` VALUES ('86', '5');
INSERT INTO `image_section_lookup` VALUES ('86', '4');
INSERT INTO `image_section_lookup` VALUES ('87', '4');
INSERT INTO `image_section_lookup` VALUES ('87', '5');
INSERT INTO `image_section_lookup` VALUES ('88', '5');
INSERT INTO `image_section_lookup` VALUES ('88', '4');
INSERT INTO `image_section_lookup` VALUES ('89', '5');
INSERT INTO `image_section_lookup` VALUES ('89', '4');
INSERT INTO `image_section_lookup` VALUES ('90', '4');
INSERT INTO `image_section_lookup` VALUES ('90', '5');
INSERT INTO `image_section_lookup` VALUES ('91', '5');
INSERT INTO `image_section_lookup` VALUES ('92', '4');
INSERT INTO `image_section_lookup` VALUES ('93', '5');
INSERT INTO `image_section_lookup` VALUES ('94', '5');
INSERT INTO `image_section_lookup` VALUES ('95', '5');
INSERT INTO `image_section_lookup` VALUES ('96', '5');
INSERT INTO `image_section_lookup` VALUES ('97', '5');
INSERT INTO `image_section_lookup` VALUES ('97', '1');
INSERT INTO `image_section_lookup` VALUES ('98', '1');
INSERT INTO `image_section_lookup` VALUES ('98', '5');
INSERT INTO `image_section_lookup` VALUES ('99', '5');
INSERT INTO `image_section_lookup` VALUES ('100', '5');
INSERT INTO `image_section_lookup` VALUES ('101', '5');
INSERT INTO `image_section_lookup` VALUES ('102', '5');
INSERT INTO `image_section_lookup` VALUES ('103', '1');
INSERT INTO `image_section_lookup` VALUES ('103', '5');
INSERT INTO `image_section_lookup` VALUES ('104', '5');
INSERT INTO `image_section_lookup` VALUES ('154', '4');
INSERT INTO `image_section_lookup` VALUES ('154', '1');
INSERT INTO `image_section_lookup` VALUES ('155', '4');
INSERT INTO `image_section_lookup` VALUES ('156', '4');
INSERT INTO `image_section_lookup` VALUES ('157', '4');
INSERT INTO `image_section_lookup` VALUES ('158', '4');
INSERT INTO `image_section_lookup` VALUES ('163', '4');
INSERT INTO `image_section_lookup` VALUES ('164', '4');
INSERT INTO `image_section_lookup` VALUES ('165', '4');
INSERT INTO `image_section_lookup` VALUES ('168', '1');
INSERT INTO `image_section_lookup` VALUES ('168', '4');
INSERT INTO `image_section_lookup` VALUES ('168', '5');
INSERT INTO `image_section_lookup` VALUES ('169', '4');
INSERT INTO `image_section_lookup` VALUES ('169', '5');
INSERT INTO `image_section_lookup` VALUES ('170', '4');
INSERT INTO `image_section_lookup` VALUES ('170', '5');
INSERT INTO `image_section_lookup` VALUES ('171', '5');
INSERT INTO `image_section_lookup` VALUES ('172', '5');
INSERT INTO `image_section_lookup` VALUES ('173', '5');
INSERT INTO `image_section_lookup` VALUES ('174', '5');
INSERT INTO `image_section_lookup` VALUES ('176', '5');
INSERT INTO `image_section_lookup` VALUES ('177', '4');
INSERT INTO `image_section_lookup` VALUES ('178', '5');
INSERT INTO `image_section_lookup` VALUES ('178', '4');
INSERT INTO `image_section_lookup` VALUES ('178', '1');
INSERT INTO `image_section_lookup` VALUES ('179', '4');
INSERT INTO `image_section_lookup` VALUES ('179', '5');
INSERT INTO `image_section_lookup` VALUES ('180', '4');
INSERT INTO `image_section_lookup` VALUES ('181', '1');
INSERT INTO `image_section_lookup` VALUES ('182', '4');
INSERT INTO `image_section_lookup` VALUES ('183', '5');
INSERT INTO `image_section_lookup` VALUES ('184', '1');
INSERT INTO `image_section_lookup` VALUES ('184', '5');
INSERT INTO `image_section_lookup` VALUES ('185', '5');
INSERT INTO `image_section_lookup` VALUES ('185', '1');
INSERT INTO `image_section_lookup` VALUES ('186', '1');
INSERT INTO `image_section_lookup` VALUES ('186', '5');
INSERT INTO `image_section_lookup` VALUES ('188', '1');
INSERT INTO `image_section_lookup` VALUES ('188', '5');
INSERT INTO `image_section_lookup` VALUES ('189', '1');
INSERT INTO `image_section_lookup` VALUES ('189', '5');
INSERT INTO `image_section_lookup` VALUES ('190', '5');
INSERT INTO `image_section_lookup` VALUES ('191', '1');
INSERT INTO `image_section_lookup` VALUES ('191', '5');
INSERT INTO `image_section_lookup` VALUES ('194', '1');
INSERT INTO `image_section_lookup` VALUES ('194', '4');
INSERT INTO `image_section_lookup` VALUES ('193', '4');
INSERT INTO `image_section_lookup` VALUES ('194', '4');
INSERT INTO `image_section_lookup` VALUES ('195', '4');
INSERT INTO `image_section_lookup` VALUES ('202', '4');
INSERT INTO `image_section_lookup` VALUES ('205', '1');
INSERT INTO `image_section_lookup` VALUES ('205', '4');
INSERT INTO `image_section_lookup` VALUES ('208', '4');
INSERT INTO `image_section_lookup` VALUES ('209', '4');
INSERT INTO `image_section_lookup` VALUES ('210', '4');
INSERT INTO `image_section_lookup` VALUES ('211', '4');
INSERT INTO `image_section_lookup` VALUES ('212', '4');
INSERT INTO `image_section_lookup` VALUES ('212', '1');
INSERT INTO `image_section_lookup` VALUES ('213', '4');
INSERT INTO `image_section_lookup` VALUES ('213', '1');
INSERT INTO `image_section_lookup` VALUES ('214', '4');
INSERT INTO `image_section_lookup` VALUES ('214', '1');
INSERT INTO `image_section_lookup` VALUES ('215', '4');
INSERT INTO `image_section_lookup` VALUES ('215', '1');
INSERT INTO `image_section_lookup` VALUES ('216', '1');
INSERT INTO `image_section_lookup` VALUES ('217', '1');
INSERT INTO `image_section_lookup` VALUES ('218', '1');
INSERT INTO `image_section_lookup` VALUES ('219', '4');
INSERT INTO `image_section_lookup` VALUES ('220', '4');
INSERT INTO `image_section_lookup` VALUES ('221', '4');
INSERT INTO `image_section_lookup` VALUES ('222', '4');
INSERT INTO `image_section_lookup` VALUES ('223', '4');
INSERT INTO `image_section_lookup` VALUES ('224', '4');
INSERT INTO `image_section_lookup` VALUES ('225', '4');
INSERT INTO `image_section_lookup` VALUES ('226', '4');
INSERT INTO `image_section_lookup` VALUES ('227', '4');
INSERT INTO `image_section_lookup` VALUES ('228', '4');
INSERT INTO `image_section_lookup` VALUES ('229', '4');
INSERT INTO `image_section_lookup` VALUES ('230', '4');
INSERT INTO `image_section_lookup` VALUES ('231', '4');
INSERT INTO `image_section_lookup` VALUES ('232', '4');
INSERT INTO `image_section_lookup` VALUES ('233', '4');
INSERT INTO `image_section_lookup` VALUES ('233', '1');
INSERT INTO `image_section_lookup` VALUES ('234', '4');
INSERT INTO `image_section_lookup` VALUES ('235', '4');
INSERT INTO `image_section_lookup` VALUES ('236', '4');
INSERT INTO `image_section_lookup` VALUES ('237', '4');
INSERT INTO `image_section_lookup` VALUES ('238', '4');
INSERT INTO `image_section_lookup` VALUES ('239', '4');
INSERT INTO `image_section_lookup` VALUES ('239', '1');
INSERT INTO `image_section_lookup` VALUES ('240', '1');
INSERT INTO `image_section_lookup` VALUES ('240', '4');
INSERT INTO `image_section_lookup` VALUES ('241', '4');
INSERT INTO `image_section_lookup` VALUES ('241', '1');
INSERT INTO `image_section_lookup` VALUES ('242', '4');
INSERT INTO `image_section_lookup` VALUES ('242', '1');
INSERT INTO `image_section_lookup` VALUES ('245', '1');
INSERT INTO `image_section_lookup` VALUES ('243', '4');
INSERT INTO `image_section_lookup` VALUES ('244', '4');
INSERT INTO `image_section_lookup` VALUES ('244', '1');
INSERT INTO `image_section_lookup` VALUES ('245', '4');
INSERT INTO `image_section_lookup` VALUES ('246', '1');
INSERT INTO `image_section_lookup` VALUES ('246', '4');
INSERT INTO `image_section_lookup` VALUES ('247', '1');
INSERT INTO `image_section_lookup` VALUES ('247', '4');
INSERT INTO `image_section_lookup` VALUES ('181', '5');
INSERT INTO `image_section_lookup` VALUES ('248', '4');
INSERT INTO `image_section_lookup` VALUES ('249', '4');
INSERT INTO `image_section_lookup` VALUES ('250', '4');
INSERT INTO `image_section_lookup` VALUES ('251', '4');
INSERT INTO `image_section_lookup` VALUES ('252', '4');
INSERT INTO `image_section_lookup` VALUES ('253', '4');
INSERT INTO `image_section_lookup` VALUES ('254', '4');
INSERT INTO `image_section_lookup` VALUES ('255', '4');
INSERT INTO `image_section_lookup` VALUES ('255', '1');
INSERT INTO `image_section_lookup` VALUES ('256', '4');
INSERT INTO `image_section_lookup` VALUES ('257', '1');
INSERT INTO `image_section_lookup` VALUES ('257', '4');
INSERT INTO `image_section_lookup` VALUES ('258', '1');
INSERT INTO `image_section_lookup` VALUES ('258', '4');
INSERT INTO `image_section_lookup` VALUES ('259', '4');
INSERT INTO `image_section_lookup` VALUES ('260', '1');
INSERT INTO `image_section_lookup` VALUES ('260', '4');
INSERT INTO `image_section_lookup` VALUES ('260', '5');
INSERT INTO `image_section_lookup` VALUES ('187', '5');
INSERT INTO `image_section_lookup` VALUES ('187', '1');
INSERT INTO `image_section_lookup` VALUES ('261', '4');
INSERT INTO `image_section_lookup` VALUES ('262', '4');
INSERT INTO `image_section_lookup` VALUES ('263', '4');
INSERT INTO `image_section_lookup` VALUES ('264', '4');
INSERT INTO `image_section_lookup` VALUES ('265', '4');
INSERT INTO `image_section_lookup` VALUES ('266', '4');
INSERT INTO `image_section_lookup` VALUES ('267', '4');
INSERT INTO `image_section_lookup` VALUES ('267', '1');
INSERT INTO `image_section_lookup` VALUES ('270', '1');
INSERT INTO `image_section_lookup` VALUES ('270', '5');
INSERT INTO `image_section_lookup` VALUES ('271', '5');
INSERT INTO `image_section_lookup` VALUES ('271', '1');
INSERT INTO `image_section_lookup` VALUES ('272', '2');
INSERT INTO `image_section_lookup` VALUES ('273', '1');
INSERT INTO `image_section_lookup` VALUES ('273', '2');
INSERT INTO `image_section_lookup` VALUES ('274', '2');
INSERT INTO `image_section_lookup` VALUES ('274', '1');
INSERT INTO `image_section_lookup` VALUES ('275', '4');
INSERT INTO `image_section_lookup` VALUES ('276', '4');
INSERT INTO `image_section_lookup` VALUES ('277', '4');
INSERT INTO `image_section_lookup` VALUES ('278', '4');
INSERT INTO `image_section_lookup` VALUES ('279', '4');
INSERT INTO `image_section_lookup` VALUES ('280', '4');
INSERT INTO `image_section_lookup` VALUES ('281', '4');
INSERT INTO `image_section_lookup` VALUES ('282', '4');
INSERT INTO `image_section_lookup` VALUES ('283', '4');
INSERT INTO `image_section_lookup` VALUES ('284', '4');
INSERT INTO `image_section_lookup` VALUES ('285', '5');
INSERT INTO `image_section_lookup` VALUES ('286', '5');
INSERT INTO `image_section_lookup` VALUES ('289', '5');
INSERT INTO `image_section_lookup` VALUES ('289', '1');
INSERT INTO `image_section_lookup` VALUES ('290', '5');
INSERT INTO `image_section_lookup` VALUES ('290', '1');
INSERT INTO `image_section_lookup` VALUES ('291', '5');
INSERT INTO `image_section_lookup` VALUES ('291', '1');
INSERT INTO `image_section_lookup` VALUES ('292', '5');
INSERT INTO `image_section_lookup` VALUES ('292', '1');
INSERT INTO `image_section_lookup` VALUES ('293', '5');
INSERT INTO `image_section_lookup` VALUES ('293', '1');
INSERT INTO `image_section_lookup` VALUES ('294', '5');
INSERT INTO `image_section_lookup` VALUES ('294', '1');
INSERT INTO `image_section_lookup` VALUES ('295', '5');
INSERT INTO `image_section_lookup` VALUES ('295', '1');
INSERT INTO `image_section_lookup` VALUES ('303', '1');
INSERT INTO `image_section_lookup` VALUES ('296', '5');
INSERT INTO `image_section_lookup` VALUES ('297', '4');
INSERT INTO `image_section_lookup` VALUES ('298', '4');
INSERT INTO `image_section_lookup` VALUES ('299', '4');
INSERT INTO `image_section_lookup` VALUES ('300', '5');
INSERT INTO `image_section_lookup` VALUES ('301', '1');
INSERT INTO `image_section_lookup` VALUES ('302', '1');
INSERT INTO `image_section_lookup` VALUES ('303', '2');
INSERT INTO `image_section_lookup` VALUES ('304', '1');
INSERT INTO `image_section_lookup` VALUES ('304', '5');
INSERT INTO `image_section_lookup` VALUES ('305', '1');
INSERT INTO `image_section_lookup` VALUES ('305', '5');
INSERT INTO `image_section_lookup` VALUES ('307', '5');
INSERT INTO `image_section_lookup` VALUES ('307', '1');
INSERT INTO `image_section_lookup` VALUES ('339', '5');
INSERT INTO `image_section_lookup` VALUES ('339', '1');
INSERT INTO `image_section_lookup` VALUES ('342', '1');
INSERT INTO `image_section_lookup` VALUES ('340', '5');
INSERT INTO `image_section_lookup` VALUES ('341', '5');
INSERT INTO `image_section_lookup` VALUES ('341', '1');
INSERT INTO `image_section_lookup` VALUES ('343', '4');
INSERT INTO `image_section_lookup` VALUES ('344', '4');
INSERT INTO `image_section_lookup` VALUES ('344', '1');
INSERT INTO `image_section_lookup` VALUES ('345', '4');
INSERT INTO `image_section_lookup` VALUES ('346', '4');
INSERT INTO `image_section_lookup` VALUES ('346', '5');
INSERT INTO `image_section_lookup` VALUES ('350', '4');
INSERT INTO `image_section_lookup` VALUES ('353', '4');
INSERT INTO `image_section_lookup` VALUES ('354', '5');
INSERT INTO `image_section_lookup` VALUES ('354', '4');
INSERT INTO `image_section_lookup` VALUES ('355', '4');
INSERT INTO `image_section_lookup` VALUES ('356', '4');
INSERT INTO `image_section_lookup` VALUES ('356', '1');
INSERT INTO `image_section_lookup` VALUES ('357', '4');
INSERT INTO `image_section_lookup` VALUES ('358', '4');
INSERT INTO `image_section_lookup` VALUES ('359', '4');
INSERT INTO `image_section_lookup` VALUES ('36', '1');
INSERT INTO `image_section_lookup` VALUES ('9', '4');
INSERT INTO `image_section_lookup` VALUES ('34', '3');
INSERT INTO `image_section_lookup` VALUES ('34', '1');
INSERT INTO `image_section_lookup` VALUES ('37', '5');
INSERT INTO `image_section_lookup` VALUES ('38', '5');
INSERT INTO `image_section_lookup` VALUES ('76', '4');
INSERT INTO `image_section_lookup` VALUES ('77', '5');
INSERT INTO `image_section_lookup` VALUES ('78', '4');
INSERT INTO `image_section_lookup` VALUES ('79', '4');
INSERT INTO `image_section_lookup` VALUES ('80', '4');
INSERT INTO `image_section_lookup` VALUES ('81', '4');
INSERT INTO `image_section_lookup` VALUES ('82', '5');
INSERT INTO `image_section_lookup` VALUES ('83', '5');
INSERT INTO `image_section_lookup` VALUES ('84', '5');
INSERT INTO `image_section_lookup` VALUES ('85', '5');
INSERT INTO `image_section_lookup` VALUES ('86', '5');
INSERT INTO `image_section_lookup` VALUES ('86', '4');
INSERT INTO `image_section_lookup` VALUES ('87', '4');
INSERT INTO `image_section_lookup` VALUES ('87', '5');
INSERT INTO `image_section_lookup` VALUES ('88', '5');
INSERT INTO `image_section_lookup` VALUES ('88', '4');
INSERT INTO `image_section_lookup` VALUES ('89', '5');
INSERT INTO `image_section_lookup` VALUES ('89', '4');
INSERT INTO `image_section_lookup` VALUES ('90', '4');
INSERT INTO `image_section_lookup` VALUES ('90', '5');
INSERT INTO `image_section_lookup` VALUES ('91', '5');
INSERT INTO `image_section_lookup` VALUES ('92', '4');
INSERT INTO `image_section_lookup` VALUES ('93', '5');
INSERT INTO `image_section_lookup` VALUES ('94', '5');
INSERT INTO `image_section_lookup` VALUES ('95', '5');
INSERT INTO `image_section_lookup` VALUES ('96', '5');
INSERT INTO `image_section_lookup` VALUES ('97', '5');
INSERT INTO `image_section_lookup` VALUES ('97', '1');
INSERT INTO `image_section_lookup` VALUES ('98', '1');
INSERT INTO `image_section_lookup` VALUES ('98', '5');
INSERT INTO `image_section_lookup` VALUES ('99', '5');
INSERT INTO `image_section_lookup` VALUES ('100', '5');
INSERT INTO `image_section_lookup` VALUES ('101', '5');
INSERT INTO `image_section_lookup` VALUES ('102', '5');
INSERT INTO `image_section_lookup` VALUES ('103', '1');
INSERT INTO `image_section_lookup` VALUES ('103', '5');
INSERT INTO `image_section_lookup` VALUES ('104', '5');
INSERT INTO `image_section_lookup` VALUES ('154', '4');
INSERT INTO `image_section_lookup` VALUES ('154', '1');
INSERT INTO `image_section_lookup` VALUES ('155', '4');
INSERT INTO `image_section_lookup` VALUES ('156', '4');
INSERT INTO `image_section_lookup` VALUES ('157', '4');
INSERT INTO `image_section_lookup` VALUES ('158', '4');
INSERT INTO `image_section_lookup` VALUES ('163', '4');
INSERT INTO `image_section_lookup` VALUES ('164', '4');
INSERT INTO `image_section_lookup` VALUES ('165', '4');
INSERT INTO `image_section_lookup` VALUES ('168', '1');
INSERT INTO `image_section_lookup` VALUES ('168', '4');
INSERT INTO `image_section_lookup` VALUES ('168', '5');
INSERT INTO `image_section_lookup` VALUES ('169', '4');
INSERT INTO `image_section_lookup` VALUES ('169', '5');
INSERT INTO `image_section_lookup` VALUES ('170', '4');
INSERT INTO `image_section_lookup` VALUES ('170', '5');
INSERT INTO `image_section_lookup` VALUES ('171', '5');
INSERT INTO `image_section_lookup` VALUES ('172', '5');
INSERT INTO `image_section_lookup` VALUES ('173', '5');
INSERT INTO `image_section_lookup` VALUES ('174', '5');
INSERT INTO `image_section_lookup` VALUES ('176', '5');
INSERT INTO `image_section_lookup` VALUES ('177', '4');
INSERT INTO `image_section_lookup` VALUES ('178', '5');
INSERT INTO `image_section_lookup` VALUES ('178', '4');
INSERT INTO `image_section_lookup` VALUES ('178', '1');
INSERT INTO `image_section_lookup` VALUES ('179', '4');
INSERT INTO `image_section_lookup` VALUES ('179', '5');
INSERT INTO `image_section_lookup` VALUES ('180', '4');
INSERT INTO `image_section_lookup` VALUES ('181', '1');
INSERT INTO `image_section_lookup` VALUES ('182', '4');
INSERT INTO `image_section_lookup` VALUES ('183', '5');
INSERT INTO `image_section_lookup` VALUES ('184', '1');
INSERT INTO `image_section_lookup` VALUES ('184', '5');
INSERT INTO `image_section_lookup` VALUES ('185', '5');
INSERT INTO `image_section_lookup` VALUES ('185', '1');
INSERT INTO `image_section_lookup` VALUES ('186', '1');
INSERT INTO `image_section_lookup` VALUES ('186', '5');
INSERT INTO `image_section_lookup` VALUES ('188', '1');
INSERT INTO `image_section_lookup` VALUES ('188', '5');
INSERT INTO `image_section_lookup` VALUES ('189', '1');
INSERT INTO `image_section_lookup` VALUES ('189', '5');
INSERT INTO `image_section_lookup` VALUES ('190', '5');
INSERT INTO `image_section_lookup` VALUES ('191', '1');
INSERT INTO `image_section_lookup` VALUES ('191', '5');
INSERT INTO `image_section_lookup` VALUES ('194', '1');
INSERT INTO `image_section_lookup` VALUES ('194', '4');
INSERT INTO `image_section_lookup` VALUES ('193', '4');
INSERT INTO `image_section_lookup` VALUES ('194', '4');
INSERT INTO `image_section_lookup` VALUES ('195', '4');
INSERT INTO `image_section_lookup` VALUES ('202', '4');
INSERT INTO `image_section_lookup` VALUES ('205', '1');
INSERT INTO `image_section_lookup` VALUES ('205', '4');
INSERT INTO `image_section_lookup` VALUES ('208', '4');
INSERT INTO `image_section_lookup` VALUES ('209', '4');
INSERT INTO `image_section_lookup` VALUES ('210', '4');
INSERT INTO `image_section_lookup` VALUES ('211', '4');
INSERT INTO `image_section_lookup` VALUES ('212', '4');
INSERT INTO `image_section_lookup` VALUES ('212', '1');
INSERT INTO `image_section_lookup` VALUES ('213', '4');
INSERT INTO `image_section_lookup` VALUES ('213', '1');
INSERT INTO `image_section_lookup` VALUES ('214', '4');
INSERT INTO `image_section_lookup` VALUES ('214', '1');
INSERT INTO `image_section_lookup` VALUES ('215', '4');
INSERT INTO `image_section_lookup` VALUES ('215', '1');
INSERT INTO `image_section_lookup` VALUES ('216', '1');
INSERT INTO `image_section_lookup` VALUES ('217', '1');
INSERT INTO `image_section_lookup` VALUES ('218', '1');
INSERT INTO `image_section_lookup` VALUES ('219', '4');
INSERT INTO `image_section_lookup` VALUES ('220', '4');
INSERT INTO `image_section_lookup` VALUES ('221', '4');
INSERT INTO `image_section_lookup` VALUES ('222', '4');
INSERT INTO `image_section_lookup` VALUES ('223', '4');
INSERT INTO `image_section_lookup` VALUES ('224', '4');
INSERT INTO `image_section_lookup` VALUES ('225', '4');
INSERT INTO `image_section_lookup` VALUES ('226', '4');
INSERT INTO `image_section_lookup` VALUES ('227', '4');
INSERT INTO `image_section_lookup` VALUES ('228', '4');
INSERT INTO `image_section_lookup` VALUES ('229', '4');
INSERT INTO `image_section_lookup` VALUES ('230', '4');
INSERT INTO `image_section_lookup` VALUES ('231', '4');
INSERT INTO `image_section_lookup` VALUES ('232', '4');
INSERT INTO `image_section_lookup` VALUES ('233', '4');
INSERT INTO `image_section_lookup` VALUES ('233', '1');
INSERT INTO `image_section_lookup` VALUES ('234', '4');
INSERT INTO `image_section_lookup` VALUES ('235', '4');
INSERT INTO `image_section_lookup` VALUES ('236', '4');
INSERT INTO `image_section_lookup` VALUES ('237', '4');
INSERT INTO `image_section_lookup` VALUES ('238', '4');
INSERT INTO `image_section_lookup` VALUES ('239', '4');
INSERT INTO `image_section_lookup` VALUES ('239', '1');
INSERT INTO `image_section_lookup` VALUES ('240', '1');
INSERT INTO `image_section_lookup` VALUES ('240', '4');
INSERT INTO `image_section_lookup` VALUES ('241', '4');
INSERT INTO `image_section_lookup` VALUES ('241', '1');
INSERT INTO `image_section_lookup` VALUES ('242', '4');
INSERT INTO `image_section_lookup` VALUES ('242', '1');
INSERT INTO `image_section_lookup` VALUES ('245', '1');
INSERT INTO `image_section_lookup` VALUES ('243', '4');
INSERT INTO `image_section_lookup` VALUES ('244', '4');
INSERT INTO `image_section_lookup` VALUES ('244', '1');
INSERT INTO `image_section_lookup` VALUES ('245', '4');
INSERT INTO `image_section_lookup` VALUES ('246', '1');
INSERT INTO `image_section_lookup` VALUES ('246', '4');
INSERT INTO `image_section_lookup` VALUES ('247', '1');
INSERT INTO `image_section_lookup` VALUES ('247', '4');
INSERT INTO `image_section_lookup` VALUES ('181', '5');
INSERT INTO `image_section_lookup` VALUES ('248', '4');
INSERT INTO `image_section_lookup` VALUES ('249', '4');
INSERT INTO `image_section_lookup` VALUES ('250', '4');
INSERT INTO `image_section_lookup` VALUES ('251', '4');
INSERT INTO `image_section_lookup` VALUES ('252', '4');
INSERT INTO `image_section_lookup` VALUES ('253', '4');
INSERT INTO `image_section_lookup` VALUES ('254', '4');
INSERT INTO `image_section_lookup` VALUES ('255', '4');
INSERT INTO `image_section_lookup` VALUES ('255', '1');
INSERT INTO `image_section_lookup` VALUES ('256', '4');
INSERT INTO `image_section_lookup` VALUES ('257', '1');
INSERT INTO `image_section_lookup` VALUES ('257', '4');
INSERT INTO `image_section_lookup` VALUES ('258', '1');
INSERT INTO `image_section_lookup` VALUES ('258', '4');
INSERT INTO `image_section_lookup` VALUES ('259', '4');
INSERT INTO `image_section_lookup` VALUES ('260', '1');
INSERT INTO `image_section_lookup` VALUES ('260', '4');
INSERT INTO `image_section_lookup` VALUES ('260', '5');
INSERT INTO `image_section_lookup` VALUES ('187', '5');
INSERT INTO `image_section_lookup` VALUES ('187', '1');
INSERT INTO `image_section_lookup` VALUES ('261', '4');
INSERT INTO `image_section_lookup` VALUES ('262', '4');
INSERT INTO `image_section_lookup` VALUES ('263', '4');
INSERT INTO `image_section_lookup` VALUES ('264', '4');
INSERT INTO `image_section_lookup` VALUES ('265', '4');
INSERT INTO `image_section_lookup` VALUES ('266', '4');
INSERT INTO `image_section_lookup` VALUES ('267', '4');
INSERT INTO `image_section_lookup` VALUES ('267', '1');
INSERT INTO `image_section_lookup` VALUES ('270', '1');
INSERT INTO `image_section_lookup` VALUES ('270', '5');
INSERT INTO `image_section_lookup` VALUES ('271', '5');
INSERT INTO `image_section_lookup` VALUES ('271', '1');
INSERT INTO `image_section_lookup` VALUES ('272', '2');
INSERT INTO `image_section_lookup` VALUES ('273', '1');
INSERT INTO `image_section_lookup` VALUES ('273', '2');
INSERT INTO `image_section_lookup` VALUES ('274', '2');
INSERT INTO `image_section_lookup` VALUES ('274', '1');
INSERT INTO `image_section_lookup` VALUES ('275', '4');
INSERT INTO `image_section_lookup` VALUES ('276', '4');
INSERT INTO `image_section_lookup` VALUES ('277', '4');
INSERT INTO `image_section_lookup` VALUES ('278', '4');
INSERT INTO `image_section_lookup` VALUES ('279', '4');
INSERT INTO `image_section_lookup` VALUES ('280', '4');
INSERT INTO `image_section_lookup` VALUES ('281', '4');
INSERT INTO `image_section_lookup` VALUES ('282', '4');
INSERT INTO `image_section_lookup` VALUES ('283', '4');
INSERT INTO `image_section_lookup` VALUES ('284', '4');
INSERT INTO `image_section_lookup` VALUES ('285', '5');
INSERT INTO `image_section_lookup` VALUES ('286', '5');
INSERT INTO `image_section_lookup` VALUES ('289', '5');
INSERT INTO `image_section_lookup` VALUES ('289', '1');
INSERT INTO `image_section_lookup` VALUES ('290', '5');
INSERT INTO `image_section_lookup` VALUES ('290', '1');
INSERT INTO `image_section_lookup` VALUES ('291', '5');
INSERT INTO `image_section_lookup` VALUES ('291', '1');
INSERT INTO `image_section_lookup` VALUES ('292', '5');
INSERT INTO `image_section_lookup` VALUES ('292', '1');
INSERT INTO `image_section_lookup` VALUES ('293', '5');
INSERT INTO `image_section_lookup` VALUES ('293', '1');
INSERT INTO `image_section_lookup` VALUES ('294', '5');
INSERT INTO `image_section_lookup` VALUES ('294', '1');
INSERT INTO `image_section_lookup` VALUES ('295', '5');
INSERT INTO `image_section_lookup` VALUES ('295', '1');
INSERT INTO `image_section_lookup` VALUES ('303', '1');
INSERT INTO `image_section_lookup` VALUES ('296', '5');
INSERT INTO `image_section_lookup` VALUES ('297', '4');
INSERT INTO `image_section_lookup` VALUES ('298', '4');
INSERT INTO `image_section_lookup` VALUES ('299', '4');
INSERT INTO `image_section_lookup` VALUES ('300', '5');
INSERT INTO `image_section_lookup` VALUES ('301', '1');
INSERT INTO `image_section_lookup` VALUES ('302', '1');
INSERT INTO `image_section_lookup` VALUES ('303', '2');
INSERT INTO `image_section_lookup` VALUES ('304', '1');
INSERT INTO `image_section_lookup` VALUES ('304', '5');
INSERT INTO `image_section_lookup` VALUES ('305', '1');
INSERT INTO `image_section_lookup` VALUES ('305', '5');
INSERT INTO `image_section_lookup` VALUES ('307', '5');
INSERT INTO `image_section_lookup` VALUES ('307', '1');
INSERT INTO `image_section_lookup` VALUES ('339', '5');
INSERT INTO `image_section_lookup` VALUES ('339', '1');
INSERT INTO `image_section_lookup` VALUES ('342', '1');
INSERT INTO `image_section_lookup` VALUES ('340', '5');
INSERT INTO `image_section_lookup` VALUES ('341', '5');
INSERT INTO `image_section_lookup` VALUES ('341', '1');
INSERT INTO `image_section_lookup` VALUES ('343', '4');
INSERT INTO `image_section_lookup` VALUES ('344', '4');
INSERT INTO `image_section_lookup` VALUES ('344', '1');
INSERT INTO `image_section_lookup` VALUES ('345', '4');
INSERT INTO `image_section_lookup` VALUES ('346', '4');
INSERT INTO `image_section_lookup` VALUES ('346', '5');
INSERT INTO `image_section_lookup` VALUES ('350', '4');
INSERT INTO `image_section_lookup` VALUES ('353', '4');
INSERT INTO `image_section_lookup` VALUES ('354', '5');
INSERT INTO `image_section_lookup` VALUES ('354', '4');
INSERT INTO `image_section_lookup` VALUES ('355', '4');
INSERT INTO `image_section_lookup` VALUES ('356', '4');
INSERT INTO `image_section_lookup` VALUES ('356', '1');
INSERT INTO `image_section_lookup` VALUES ('357', '4');
INSERT INTO `image_section_lookup` VALUES ('358', '4');
INSERT INTO `image_section_lookup` VALUES ('359', '4');
INSERT INTO `image_section_lookup` VALUES ('388', '4');
INSERT INTO `image_types` VALUES ('1', 'Thumb');
INSERT INTO `image_types` VALUES ('2', 'Content');
INSERT INTO `image_types` VALUES ('3', 'Large');
INSERT INTO `image_types` VALUES ('4', 'Flag');
INSERT INTO `image_types` VALUES ('5', 'Portfolio');
INSERT INTO `images` VALUES ('1', '1', '0', '2003a', '2003a.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('2', '1', '0', '2003b', '2003b.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('3', '1', '0', 'Chilli Peppers', 'chilli.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('5', '1', '0', 'Brown Wedding', 'brownwedding.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('4', '1', '0', 'Dirty 30', 'dirty30a.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('6', '1', '0', 'Japan 2002', 'japan02.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('7', '1', '0', 'Mamma Mia', 'mammamia.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('8', '1', '0', 'Sept 11th', 'sept11.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('9', '1', '0', 'Rolling Stones', 'stones.gif', '', '', '0', '0', '0', '2004-01-31', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('10', '1', '0', 'Reading Room', 'theenda.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('11', '1', '0', 'USA 1994', 'usa94.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('12', '1', '0', 'Xroom', 'xroom.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-16', '1');
INSERT INTO `images` VALUES ('18', '1', '0', 'Losing my Virginity', 'losingvirginity.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-22', '1');
INSERT INTO `images` VALUES ('19', '1', '0', 'BTEC Diploma', 'btec.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-22', '1');
INSERT INTO `images` VALUES ('20', '1', '0', 'Degree', 'degree.gif', '', '', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-22', '1');
INSERT INTO `images` VALUES ('24', '1', '57', 'Judas', 'judas.jpg', '', 'SOme text', '0', '0', '0', '2008-01-01', '2008-01-01', '2004-01-18', '2');
INSERT INTO `images` VALUES ('30', '2', '106', 'Myrtle Beach, Sth Carolina', 'myrtle1.jpg', '', 'Fuck You!', '1', '0', '0', '2005-03-02', '2008-01-01', '2004-01-22', '1');
INSERT INTO `images` VALUES ('32', '2', '149', 'Thai Waterfall', 'waterfall.jpg', '', 'Help!', '1', '0', '1', '2004-02-29', '2008-01-01', '2004-01-22', '1');
INSERT INTO `images` VALUES ('33', '2', '143', 'Singapore Zoo - Monkey', 'orang.jpg', '', 'Gizz a kiss!', '1', '0', '0', '2008-01-01', '2008-01-01', '2004-01-22', '1');
INSERT INTO `images` VALUES ('34', '2', '235', 'Balls!', 'poolball.jpg', '', 'Reading Room', '1', '0', '0', '2005-09-02', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('37', '2', '106', 'McVegas', 'mcvegas.jpg', '', 'The golden arches, vegas style!', '1', '0', '0', '2004-04-07', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('36', '2', '235', 'Naked Baby', 'naked.jpg', '', '', '1', '0', '0', '2004-04-07', '2025-01-20', '2008-01-01', '2');
INSERT INTO `images` VALUES ('38', '2', '106', 'Viva Las Venice!', 'vivavenice.jpg', '', 'Venice, Las Vegas style!', '1', '0', '0', '2004-01-31', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('39', '2', '106', 'Viva Las Egypt!', 'vivaegypt.jpg', '', 'Egypt, Vegas Style', '1', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('40', '2', '106', 'Hustler', 'hustler.jpg', '', 'Typical American pool room.', '1', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('41', '4', '59', 'smArgentina', 'arsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('42', '4', '158', 'smAustralia', 'ausmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('43', '4', '152', 'smArabEmirates', 'aesmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('44', '4', '196', 'smBelgium', 'besmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('45', '4', '112', 'smBahrain', 'bhsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('46', '4', '66', 'smBrazil', 'brsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('47', '4', '118', 'smChina', 'cnsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('48', '4', '208', 'smGermany', 'desmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('49', '4', '202', 'smDenmark', 'dksmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('50', '4', '152', 'smEngland', 'england.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('51', '4', '0', 'smSpain', 'essmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('52', '4', '207', 'smFrance', 'frsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('53', '4', '0', 'smGreece', 'grsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('54', '4', '120', 'smHongKong', 'hksmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('55', '4', '0', 'smIndonesia', 'idsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('56', '4', '212', 'smIceland', 'issmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('57', '4', '215', 'smItaly', 'itsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('58', '4', '124', 'smJapan', 'jpsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('59', '4', '0', 'smMaldives', 'mvsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('60', '4', '179', 'smNewZealand', 'nzsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('61', '4', '138', 'smOman', 'omsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('62', '4', '235', 'smUK', 'uksmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('63', '4', '236', 'smVatican', 'vasmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('64', '4', '106', 'smUSA', 'usflagb.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('65', '4', '143', 'smSingapore', 'sgsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('66', '4', '219', 'smLuxemburg', 'lusmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('67', '4', '132', 'smMalaysia', 'mysmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('68', '4', '233', 'smSwitzerland', 'chsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('69', '4', '138', 'smOman', 'omsmall1.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('70', '4', '149', 'smThailand', 'thsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('71', '4', '222', 'smNetherlands', 'nlsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('72', '4', '145', 'smSriLanka', 'lksmall.gif', '', '', '0', '0', '0', '2004-01-25', '2025-01-20', '2008-01-01', '1');
INSERT INTO `images` VALUES ('74', '4', '152', 'smUAE', 'uaesmall.gif', '', '', '0', '0', '0', '2004-01-25', '2004-01-25', '2004-01-25', '1');
INSERT INTO `images` VALUES ('75', '4', '0', 'smTurkey', 'trsmall.gif', '', '', '0', '0', '0', '2004-01-25', '2004-01-25', '2004-01-25', '1');
INSERT INTO `images` VALUES ('76', '2', '158', 'Alex Bored', 'alexboring.jpg', '', '', '1', '0', '0', '2003-06-01', '2004-02-01', '2004-02-01', '1');
INSERT INTO `images` VALUES ('77', '2', '152', 'Burj Al Arab Hotel, Dubai', 'burjalarab.jpg', '', 'The world\'s only 7 star hotel', '1', '0', '0', '2004-02-29', '2004-02-01', '2004-02-01', '1');
INSERT INTO `images` VALUES ('78', '2', '158', 'Sydney 8 Ball Winners', 'sydney8ball.jpg', '', 'Vegas here we come!', '1', '0', '0', '2002-06-01', '2004-02-01', '2004-02-01', '1');
INSERT INTO `images` VALUES ('79', '2', '0', 'Jock Mclean Singles', 'jockmclean.jpg', '', '', '1', '0', '0', '2003-10-01', '2004-02-01', '2004-02-01', '1');
INSERT INTO `images` VALUES ('80', '2', '158', 'Jock Mclean League Winners', 'jockmcleanleague.jpg', '', '', '1', '0', '0', '2003-12-01', '2004-02-01', '2004-02-01', '1');
INSERT INTO `images` VALUES ('81', '1', '158', 'Egypt 8 Ball Winners', 'trophy_egyptian2.gif', '', '', '0', '0', '0', '2002-06-01', '2004-02-01', '2004-02-01', '1');
INSERT INTO `images` VALUES ('82', '2', '106', 'Twin Towers', 'twintowers.jpg', '', '', '1', '0', '0', '1994-06-01', '2004-02-02', '2004-02-02', '1');
INSERT INTO `images` VALUES ('83', '2', '106', 'Times Square', 'tsquarejim.jpg', '', '', '1', '0', '0', '1994-06-01', '2004-02-02', '2004-02-02', '1');
INSERT INTO `images` VALUES ('84', '2', '106', 'Statue of Riley', 'statueriley.jpg', '', '', '1', '0', '0', '1994-06-01', '2004-02-02', '2004-02-02', '1');
INSERT INTO `images` VALUES ('85', '2', '158', 'NYE Surfers Paradise', '2004NYE.jpg', '', '', '1', '0', '0', '2005-03-02', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('86', '2', '106', 'USA 94 - World Cup', '94wc.jpg', '', 'Giants Stadium, Ireland v Norway', '1', '0', '0', '2004-02-04', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('87', '2', '106', 'Come on Ireland!', '94wccomeon.jpg', '', '', '1', '0', '0', '1994-06-02', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('88', '2', '106', 'On me head!', '94wcfootball.jpg', '', '', '1', '0', '0', '2005-03-02', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('160', '1', '0', 'Euro2004', 'euro2004.gif', '', '', '0', '0', '0', '2004-03-13', '2004-03-13', '2004-03-13', '1');
INSERT INTO `images` VALUES ('161', '1', '0', 'sport_rugby_engvfra', 'rugby2003_engvfra.gif', '', '', '0', '0', '0', '2004-03-21', '2004-03-21', '2004-03-21', '1');
INSERT INTO `images` VALUES ('90', '2', '106', 'World Cup USA 1994', '94wcirenor.jpg', '', '', '1', '0', '0', '1994-06-02', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('91', '2', '158', 'Airlie Beach', 'airliebeach.jpg', '', '', '1', '0', '0', '2004-02-29', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('92', '2', '0', 'Grimsby Masters', 'gymasters.jpg', '', '', '1', '0', '0', '1999-06-01', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('94', '2', '158', 'Movie World', 'mworldme.jpg', '', '', '1', '0', '0', '2003-12-31', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('95', '2', '158', 'Movie World, Queensland', 'mworldskunk.jpg', '', '', '1', '0', '0', '2003-12-31', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('96', '2', '158', 'Movie World, Queensland', 'mworldus.jpg', '', '', '1', '0', '0', '2003-12-31', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('163', '1', '0', 'Pool 1', 'pool1.gif', '', '', '0', '0', '0', '2004-04-20', '2004-04-20', '2004-04-20', '1');
INSERT INTO `images` VALUES ('98', '2', '158', 'Great Barrier Reef', 'reefus.jpg', '', '30th Birthday, Great Barrier Reef', '1', '0', '0', '2004-01-09', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('99', '2', '158', 'Sea World, Queensland', 'seaworld1.jpg', '', '', '1', '0', '0', '2005-03-02', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('100', '2', '158', 'Sea World, Queensland', 'seaworld2.jpg', '', '', '1', '0', '0', '2003-12-30', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('101', '2', '158', 'Sea World, Queensland', 'seaworld3.jpg', '', '', '1', '0', '0', '2003-12-30', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('162', '1', '0', 'Robbie Willaims', 'robbiewilliams.gif', '', '', '0', '0', '0', '2004-03-21', '2004-03-21', '2004-03-21', '1');
INSERT INTO `images` VALUES ('103', '2', '158', 'Surfers Paradise, Queensland', 'surfersbeach.jpg', '', '', '1', '0', '0', '2003-12-30', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('104', '2', '0', 'Versace Hotel, Queensland', 'versace.jpg', '', '', '1', '0', '0', '2004-01-01', '2004-02-04', '2004-02-04', '1');
INSERT INTO `images` VALUES ('105', '5', '0', 'Fox  1', 'fox1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('106', '5', '0', 'Regency House', 'regency1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('107', '5', '158', 'ATP1', 'atp1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('108', '5', '158', 'ATPEX1', 'atpex1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('109', '5', '158', 'Cansmart', 'cansmart1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('110', '5', '235', 'Eastbourne College', 'eastbourne1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('111', '5', '235', 'Fox Kids Europe', 'fox2.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('112', '5', '0', 'Hangman 1', 'hangman1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('113', '5', '0', 'Hornsby 1', 'hornsby1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('114', '5', '0', 'IIA 1', 'iia.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('115', '5', '0', 'LMAL', 'lmal.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('116', '5', '0', 'PDO 1', 'pdo1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('117', '5', '0', 'PDO 2', 'pdo2.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('118', '5', '0', 'Red Gum 1', 'redgum1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('119', '5', '0', 'Red Gum 2', 'redgum2.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('120', '5', '0', 'Regency 1', 'regency11.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('121', '5', '0', 'Toms 1', 'toms1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('122', '5', '0', 'Toms 2', 'toms2.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('123', '5', '0', 'Warris', 'warris.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('124', '5', '0', 'Warris 1', 'warris1.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('125', '5', '0', 'Warris 2', 'warris2.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('126', '5', '0', 'Warris 3', 'warris3.gif', '', '', '0', '0', '0', '2004-02-08', '2004-02-08', '2004-02-08', '1');
INSERT INTO `images` VALUES ('127', '5', '0', 'World Aids Day', 'aids.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('128', '5', '0', 'Internal Audit People', 'auditpeople.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('129', '5', '0', 'eDott', 'edott.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('130', '5', '0', 'Green Web', 'greenweb.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('131', '5', '0', 'Jetstar', 'jetstar.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('132', '5', '0', 'Logic Space', 'logicspace.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('133', '5', '0', 'Tax Briefs', 'taxbriefs.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('134', '5', '0', 'Go Matilda', 'matilda.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('135', '5', '0', 'Trainline', 'trainline.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('136', '5', '0', 'HazandZard', 'hazandzard.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('137', '5', '0', 'SMRS', 'smrs.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('138', '5', '0', 'SSROC', 'ssroc.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('139', '5', '0', 'An Mea', 'anmea.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('140', '5', '0', 'Reading Room', 'rr.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('141', '5', '0', 'Yellow Fish Road', 'yellowfish1.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('142', '5', '0', 'Tax Fac', 'taxfac.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('143', '5', '0', 'Caesar RIA', 'caesar.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('144', '5', '0', 'Caesar', 'caesar2.gif', '', '', '0', '0', '0', '2004-02-09', '2004-02-09', '2004-02-09', '1');
INSERT INTO `images` VALUES ('145', '1', '0', 'Engalnd v Hungary', 'hungary.gif', '', '', '0', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('146', '1', '0', 'Mystere', 'mystere2003.gif', '', '', '0', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('147', '1', '0', 'Cricket Ashes', 'ashes2002.gif', '', '', '0', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('148', '1', '0', 'All Stars v Brazil', 'brazil96.gif', '', '', '0', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('149', '1', '0', 'BCA Pool', 'bca2003.gif', '', '', '0', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('150', '1', '0', 'Boxing Golota', 'boxing96.gif', '', '', '0', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('151', '1', '0', 'Rugby Lions', 'lions2001.gif', '', '', '0', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('152', '1', '0', 'USA 94 b', 'usa94b.gif', '', '', '0', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('153', '1', '0', 'Tennis Autralian', 'tennis2000.gif', '', '', '0', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('154', '2', '106', 'Madison Square Garden', 'boxing.jpg', '', 'Boxing, Madison Square Garden, Riot', '1', '0', '0', '2004-03-09', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('155', '2', '124', 'Ticket - England v Sweden', 'ticket_engvswe.jpg', '', '', '1', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('156', '2', '124', 'Ticket - Ireland v Germany', 'ticket_irevger.jpg', '', '', '1', '0', '0', '2002-06-15', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('157', '2', '124', 'Ticket - Turkey v Senegal', 'ticket_turvsen.jpg', '', '', '1', '0', '0', '2002-06-22', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('158', '2', '158', 'Eddie Izzard', 'eddieizzard.jpg', '', '', '1', '0', '0', '2005-09-01', '2004-02-10', '2004-02-10', '2');
INSERT INTO `images` VALUES ('159', '1', '0', 'Eddie Izzard', 'eddieizzard.gif', '', '', '0', '0', '0', '2004-02-10', '2004-02-10', '2004-02-10', '1');
INSERT INTO `images` VALUES ('164', '2', '158', '8 Ball - Easter Cup', '8ball_eastercup.jpg', '', '', '1', '0', '0', '2004-05-16', '2004-05-16', '2004-05-16', '1');
INSERT INTO `images` VALUES ('165', '1', '225', 'Euro 2004 - Square', 'euro2004_square.gif', '', '', '0', '0', '0', '2004-07-04', '2004-07-04', '2004-07-04', '1');
INSERT INTO `images` VALUES ('166', '1', '0', 'Euro 2004 - Me', 'euro2004_me.gif', '', '', '0', '0', '0', '2004-07-04', '2004-07-04', '2004-07-04', '1');
INSERT INTO `images` VALUES ('202', '2', '225', 'Euro 2004 - In-Ga-Land!', 'euro2004_square3.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-29', '2005-08-29', '1');
INSERT INTO `images` VALUES ('168', '2', '225', 'Euro 2004 - Balls!', 'euro2004_me.jpg', '', '', '1', '0', '0', '2005-03-02', '2004-07-04', '2004-07-04', '1');
INSERT INTO `images` VALUES ('170', '2', '225', 'Euro 2004 - English \'till I die!', 'euro2004_square2.jpg', '', '', '1', '0', '0', '2004-06-24', '2004-07-04', '2004-07-04', '1');
INSERT INTO `images` VALUES ('171', '2', '106', 'Reno', 'reno_pheonix.jpg', '', '', '1', '0', '0', '2004-07-04', '2004-07-04', '2004-07-04', '1');
INSERT INTO `images` VALUES ('172', '2', '106', 'Reno - Smallest Biggest City!', 'reno_day.jpg', '', '', '1', '0', '0', '2004-06-10', '2004-07-04', '2004-07-04', '1');
INSERT INTO `images` VALUES ('173', '2', '106', 'Reno - Smallest Biggest City!', 'reno_night.jpg', '', '', '1', '0', '0', '2005-03-02', '2004-07-04', '2004-07-04', '1');
INSERT INTO `images` VALUES ('175', '1', '0', 'Pool 2', 'pool.gif', '', '', '0', '0', '0', '2004-07-04', '2004-07-04', '2004-07-04', '1');
INSERT INTO `images` VALUES ('176', '4', '0', 'smPortugal', 'PORT001.GIF', '', '', '0', '0', '0', '2004-09-02', '2004-09-02', '2004-09-02', '1');
INSERT INTO `images` VALUES ('177', '4', '0', 'bnsmall', 'bnsmall.gif', '', '', '0', '0', '0', '2005-03-05', '2005-03-05', '2005-03-05', '1');
INSERT INTO `images` VALUES ('178', '4', '0', 'bnlarge', 'bnlarge.gif', '', '', '0', '0', '0', '2005-03-05', '2005-03-05', '2005-03-05', '1');
INSERT INTO `images` VALUES ('179', '4', '0', 'phsmall', 'phsmall.gif', '', '', '0', '0', '0', '2005-03-05', '2005-03-05', '2005-03-05', '1');
INSERT INTO `images` VALUES ('180', '4', '0', 'phlarge', 'phlarge.gif', '', '', '0', '0', '0', '2005-03-05', '2005-03-05', '2005-03-05', '1');
INSERT INTO `images` VALUES ('181', '1', '149', 'PattayaRiley', 'pattaya_riley.gif', '', '', '0', '0', '0', '2005-09-01', '2005-03-01', '2005-03-01', '1');
INSERT INTO `images` VALUES ('182', '1', '149', 'PattayaHotTuna', 'pattaya_hottuna.gif', '', '', '0', '0', '0', '2005-03-01', '2005-03-01', '2005-03-01', '1');
INSERT INTO `images` VALUES ('183', '1', '149', 'PattayaNeon', 'pattaya_neon.gif', '', '', '0', '0', '0', '2005-03-01', '2005-03-01', '2005-03-01', '1');
INSERT INTO `images` VALUES ('185', '1', '184', 'Efren Reyes', 'efren_thumb.gif', '', '', '0', '0', '0', '2005-03-01', '2005-03-01', '2005-03-01', '1');
INSERT INTO `images` VALUES ('186', '2', '158', 'Ayers Rock', 'ayersrock.jpg', '', '', '1', '0', '1', '2005-03-02', '2005-03-02', '2005-03-02', '1');
INSERT INTO `images` VALUES ('187', '2', '184', 'Rice Terraces - Banuae', 'banaue1.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-03-02', '2005-03-02', '2');
INSERT INTO `images` VALUES ('188', '2', '184', 'Rice Terraces - Banuae', 'banaue2.jpg', '', '', '1', '0', '1', '2005-02-10', '2005-03-02', '2005-03-02', '1');
INSERT INTO `images` VALUES ('189', '2', '116', 'Brunei', 'brunei.jpg', '', '', '1', '0', '1', '2005-12-17', '2005-03-02', '2005-03-02', '1');
INSERT INTO `images` VALUES ('190', '2', '158', 'Darwin Crocodile', 'darwin_croc2.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-03-02', '2005-03-02', '1');
INSERT INTO `images` VALUES ('191', '2', '158', 'Australian Olgas', 'olgas.jpg', '', '', '1', '0', '1', '2004-12-15', '2005-03-02', '2005-03-02', '1');
INSERT INTO `images` VALUES ('192', '2', '158', 'Watch Those Fingers!', 'darwin_croc.jpg', '', '', '1', '0', '0', '2005-03-02', '2005-03-02', '2005-03-02', '1');
INSERT INTO `images` VALUES ('195', '1', '0', 'VNEA Brochure', 'vnea_2005.gif', '', '', '0', '0', '0', '2005-08-27', '2005-08-27', '2005-08-27', '1');
INSERT INTO `images` VALUES ('194', '1', '0', 'WPC Brochure', 'wpc_2005.gif', '', '', '0', '0', '0', '2005-08-27', '2005-08-27', '2005-08-27', '1');
INSERT INTO `images` VALUES ('196', '4', '0', 'smCambodia', 'khsmall.gif', '', '', '0', '0', '0', '2005-08-29', '2005-08-29', '2005-08-29', '1');
INSERT INTO `images` VALUES ('197', '4', '0', 'smScotland', 'scotsml.gif', '', '', '0', '0', '0', '2005-08-29', '2005-08-29', '2005-08-29', '1');
INSERT INTO `images` VALUES ('198', '4', '0', 'smNKorea', 'kpsmall.gif', '', '', '0', '0', '0', '2005-08-29', '2005-08-29', '2005-08-29', '1');
INSERT INTO `images` VALUES ('199', '4', '0', 'smSKorea', 'krsmall.gif', '', '', '0', '0', '0', '2005-08-29', '2005-08-29', '2005-08-29', '1');
INSERT INTO `images` VALUES ('200', '4', '0', 'smTaiwan', 'twsmall.gif', '', '', '0', '0', '0', '2005-08-29', '2005-08-29', '2005-08-29', '1');
INSERT INTO `images` VALUES ('203', '1', '0', 'Quidam', 'quidam.gif', '', '', '0', '0', '0', '2005-08-29', '2005-08-29', '2005-08-29', '1');
INSERT INTO `images` VALUES ('204', '1', '0', 'Pattaya NYE 2004', 'pattaya_neon1.gif', '', '', '0', '0', '0', '2005-08-30', '2005-08-30', '2005-08-30', '1');
INSERT INTO `images` VALUES ('205', '2', '184', 'Efren and I', 'efrenme.jpg', '', '', '1', '0', '1', '2005-08-30', '2005-08-30', '2005-08-30', '1');
INSERT INTO `images` VALUES ('206', '1', '0', 'Efren Reyes', 'efren2_thumb.jpg', '', '', '0', '0', '0', '2005-08-30', '2005-08-30', '2005-08-30', '1');
INSERT INTO `images` VALUES ('207', '1', '0', '2005 Korea Open', '2005koreaopen_thumb.jpg', '', '', '0', '0', '0', '2005-08-30', '2005-08-30', '2005-08-30', '1');
INSERT INTO `images` VALUES ('208', '2', '106', 'Jennifer B, Big Apple Open', 'bigapple_jen2.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('209', '2', '106', 'Jennifer B, Big Apple Open', 'bigapple_jen3.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('210', '2', '106', 'Jennifer B, Big Apple Open', 'bigapple_jenb1.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('211', '2', '106', 'Jen & Melissa, Big Apple Open', 'bigapple_jen&melissa.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('212', '2', '144', 'korea Championships 2005', 'korea_aim1.jpg', '', '', '1', '0', '1', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('213', '2', '144', 'korea Championships 2005', 'korea_confused.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('214', '2', '144', 'korea Championships 2005', 'korea_interview.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('215', '2', '144', 'korea Championships 2005', 'korea_me1.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('216', '2', '144', 'Seoul, Korea', 'korea_corona.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('217', '2', '144', 'Seoul, Korea', 'korea_sophia1.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('218', '2', '144', 'Seoul, Korea', 'korea_sophia2.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '2');
INSERT INTO `images` VALUES ('219', '2', '144', 'Seoul, Korea', 'korea_sophia4.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('220', '2', '144', 'korea Championships 2005', 'korea_winners.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('221', '2', '144', 'korea Championships 2005', 'korea_mikka1.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('222', '2', '147', 'WPC 2005, Taiwan', 'korea_tabb.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('223', '2', '147', 'Jonny Archer, WPC 2005', 'taiwan_archer1.jpg', '', '', '1', '0', '0', '2005-07-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('224', '2', '147', 'Steve Davis, WPC 2005', 'taiwan_davis1.jpg', '', '', '1', '0', '0', '2005-07-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('225', '2', '147', 'Steve Davis, WPC 2005', 'taiwan_davis2.jpg', '', '', '1', '0', '0', '2005-07-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('226', '2', '147', 'Steve Davis, WPC 2005', 'taiwan_davis3.jpg', '', '', '1', '0', '0', '2005-07-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('227', '2', '147', 'Earl Strickland, WPC 2005', 'taiwan_earl1.jpg', '', '', '1', '0', '0', '2005-07-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('228', '2', '147', 'Earl Strickland, WPC 2005', 'taiwan_earl2.jpg', '', '', '1', '0', '0', '2005-07-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('229', '2', '147', 'Efren Reyes, WPC 2005', 'taiwan_efren1.jpg', '', '', '1', '0', '0', '2005-07-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('230', '2', '147', 'Efren Reyes, WPC 2005', 'taiwan_efren2.jpg', '', '', '1', '0', '0', '2005-07-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('231', '2', '147', 'Efren Reyes, WPC 2005', 'taiwan_efren3.jpg', '', '', '1', '0', '0', '2005-07-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('232', '2', '147', 'ESPN, WPC 2005', 'taiwan_espn.jpg', '', '', '1', '0', '0', '2005-07-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('233', '2', '147', 'Kaohsiung, Taiwan', 'taiwan_me&judy1.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('234', '2', '147', 'Kaohsiung, Taiwan', 'taiwan_wimms1.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('235', '2', '147', 'Kaohsiung, Taiwan', 'taiwan_wimms&girls.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('236', '2', '147', 'Kaohsiung, Taiwan', 'taiwan_wimms&yvonne.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('237', '2', '147', 'Kaohsiung, Taiwan', 'taiwan_yvonne1.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('238', '2', '147', 'Kaohsiung, Taiwan', 'taiwan_yvonne&judy1.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('239', '2', '147', 'Kaohsiung, Taiwan', 'taiwan_yvonne&me1.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('240', '2', '106', '2005 Hard Times, Sacramento', 'sacramento_aim12.jpg', '', '', '1', '0', '1', '2005-06-15', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('241', '2', '106', '2005 Hard Times, Sacramento', 'sacramento_aim2.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('242', '2', '106', '2005 Hard Times, Sacramento', 'sacramento_bar.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('243', '2', '106', '2005 Hard Times, Sacramento', 'sacramento_marlon.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('244', '2', '106', '2005 Hard Times, Sacramento', 'sacramento_scott.jpg', '', '', '1', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('246', '2', '118', 'Shanghai, China', 'shanghai_me&colin1.jpg', '', '', '1', '0', '0', '2005-08-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('247', '2', '118', 'Shanghai, China', 'shanghai_me&karen.jpg', '', '', '1', '0', '0', '2005-08-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('353', '2', '106', '2005 BCA 9 Ball Final', 'video_bcafinal1.jpg', '', '', '1', '1', '0', '2005-11-09', '2005-11-09', '2005-11-09', '1');
INSERT INTO `images` VALUES ('249', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_breasts1.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('250', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_breasts2.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('251', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_dave1.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('252', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_finger.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('253', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_girls.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('254', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_jen&dave.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('255', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_jen&me.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('270', '2', '149', 'Pattaya, Thailand', 'thailand_budda1.jpg', '', '', '1', '0', '0', '1999-08-01', '2005-09-02', '2005-09-02', '1');
INSERT INTO `images` VALUES ('256', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_markbodyshot.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('257', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_me&melissa.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('258', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_me&rich.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('259', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_melissa&.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('260', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_meshowgirls.jpg', '', '', '1', '0', '1', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('261', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_shaun&jenny.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('262', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_studio54.jpg', '', '', '1', '0', '1', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('263', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_tequila.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('264', '2', '106', '2005 Pool Champs, Las Vegas', 'vegas_whiteknight.jpg', '', '', '1', '0', '0', '2005-06-10', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('265', '2', '106', 'San Fransisco', 'sanfran_yohana1.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('266', '2', '106', 'San Fransisco', 'sanfran_yohana&friend.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('267', '2', '106', 'San Fransisco', 'sanfran_yohana&me.jpg', '', '', '1', '0', '0', '2005-09-01', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('268', '1', '0', 'Man Utd', 'china_manu.jpg', '', '', '0', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('269', '1', '0', 'Dirtier 31', 'dirty31a.jpg', '', '', '0', '0', '0', '2005-08-31', '2005-08-31', '2005-08-31', '1');
INSERT INTO `images` VALUES ('271', '2', '106', 'Times Square, NYC', 'nyc_timesqme.jpg', '', '', '1', '0', '1', '1996-06-02', '2005-09-02', '2005-09-02', '1');
INSERT INTO `images` VALUES ('272', '2', '235', 'Graduation, Manchester', 'manchester_hall.jpg', '', '', '1', '0', '0', '1999-07-14', '2005-09-02', '2005-09-02', '1');
INSERT INTO `images` VALUES ('275', '1', '0', 'Grimsby v Scunny', 'grimsby_scunny.jpg', '', '', '0', '0', '0', '2005-04-16', '2005-10-16', '2005-10-16', '1');
INSERT INTO `images` VALUES ('274', '2', '235', 'Graduation, Manchester', 'degree_me1.jpg', '', '', '1', '0', '0', '2005-09-02', '2005-09-02', '2005-09-02', '1');
INSERT INTO `images` VALUES ('276', '1', '0', 'World Snooker 2005', 'wsc_2005.jpg', '', '', '0', '0', '0', '2005-05-16', '2005-10-16', '2005-10-16', '1');
INSERT INTO `images` VALUES ('277', '1', '0', 'BCA Masters 2005', 'bca_2005.jpg', '', '', '0', '0', '0', '2005-05-16', '2005-10-16', '2005-10-16', '1');
INSERT INTO `images` VALUES ('278', '1', '0', 'Euro Tour - Weert', 'eurotour_weert.gif', '', '', '0', '0', '0', '2005-09-16', '2005-10-16', '2005-10-16', '1');
INSERT INTO `images` VALUES ('279', '1', '0', '2005 US Open', 'usopen_2005.jpg', '', '', '0', '0', '0', '2005-09-16', '2005-10-16', '2005-10-16', '1');
INSERT INTO `images` VALUES ('280', '1', '0', '2005 World Summit', 'worldsummit_2005.gif', '', '', '0', '0', '0', '2005-09-16', '2005-10-16', '2005-10-16', '1');
INSERT INTO `images` VALUES ('281', '1', '0', '2005 Big Apple', 'bigapple_2005.gif', '', '', '0', '0', '0', '2005-09-16', '2005-10-16', '2005-10-16', '1');
INSERT INTO `images` VALUES ('282', '1', '0', '2005 Big Apple', 'bigapple_20051.gif', '', '', '0', '0', '0', '2005-09-16', '2005-10-16', '2005-10-16', '1');
INSERT INTO `images` VALUES ('283', '1', '0', 'Planet Pool', 'planetpool.gif', '', '', '0', '0', '0', '2005-10-16', '2005-10-16', '2005-10-16', '1');
INSERT INTO `images` VALUES ('284', '1', '0', 'YTS Snooker 1', 'YTS1.gif', '', '', '0', '0', '0', '2005-10-16', '2005-10-16', '2005-10-16', '1');
INSERT INTO `images` VALUES ('289', '2', '106', 'Bodyshot, Las Vegas', 'vegas_bodyshot1.jpg', 'vegas_bodyshot1.jpg', '', '1', '0', '0', '2004-05-29', '2005-10-19', '2005-10-19', '1');
INSERT INTO `images` VALUES ('287', '1', '0', 'SIMM1', 'simm1.jpg', '', '', '0', '0', '0', '2005-10-18', '2005-10-18', '2005-10-18', '1');
INSERT INTO `images` VALUES ('288', '1', '0', 'SIMM2', 'simm2.jpg', '', '', '0', '0', '0', '2005-10-18', '2005-10-18', '2005-10-18', '1');
INSERT INTO `images` VALUES ('290', '2', '106', 'Bodyshot, Las Vegas', 'vegas_bodyshot2.jpg', '', '', '0', '0', '0', '2004-05-29', '2005-10-19', '2005-10-19', '1');
INSERT INTO `images` VALUES ('291', '2', '106', 'Bodyshot, Las Vegas', 'vegas_bodyshot3.jpg', 'vegas_bodyshot3.jpg', '', '1', '0', '0', '2004-05-29', '2005-10-19', '2005-10-19', '1');
INSERT INTO `images` VALUES ('292', '2', '106', 'Bodyshot, Las Vegas', 'vegas_bodyshot4.jpg', 'vegas_bodyshot4.jpg', '', '1', '0', '0', '2004-05-29', '2005-10-19', '2005-10-19', '1');
INSERT INTO `images` VALUES ('293', '2', '106', 'Bodyshot, Las Vegas', 'vegas_bodyshot5.jpg', 'vegas_bodyshot5.jpg', '', '1', '0', '0', '2004-05-29', '2005-10-19', '2005-10-19', '1');
INSERT INTO `images` VALUES ('294', '2', '106', 'Bodyshot, Las Vegas', 'vegas_bodyshot6.jpg', 'vegas_bodyshot6.jpg', '', '1', '0', '0', '2004-05-29', '2005-10-19', '2005-10-19', '1');
INSERT INTO `images` VALUES ('295', '2', '106', 'Bodyshot, Las Vegas', 'vegas_bodyshot7.jpg', 'vegas_bodyshot7.jpg', '', '1', '0', '0', '2004-05-29', '2005-10-19', '2005-10-19', '1');
INSERT INTO `images` VALUES ('296', '2', '0', 'SIMMple Travels', 'SIMMple2.jpg', '', '', '1', '0', '0', '2002-05-29', '2005-10-19', '2005-10-19', '1');
INSERT INTO `images` VALUES ('297', '2', '106', 'Charlie, Las Vegas', 'vegas_charlie1.jpg', '', '', '1', '0', '0', '2005-05-20', '2005-10-20', '2005-10-20', '1');
INSERT INTO `images` VALUES ('298', '2', '106', 'Charlie, Las Vegas', 'vegas_charlie2.jpg', '', '', '1', '0', '0', '2005-05-20', '2005-10-20', '2005-10-20', '2');
INSERT INTO `images` VALUES ('299', '2', '106', 'Charlie, Las Vegas', 'vegas_charlie3.jpg', '', '', '1', '0', '0', '2005-05-20', '2005-10-20', '2005-10-20', '1');
INSERT INTO `images` VALUES ('300', '2', '222', 'Robs Tits, Amsterdam', 'rob_tits.jpg', '', '', '1', '0', '0', '2000-12-20', '2005-10-22', '2005-10-22', '1');
INSERT INTO `images` VALUES ('301', '2', '235', 'Debbies Wedding', 'deb_wedding.jpg', '', '', '1', '0', '0', '1997-06-20', '2005-10-22', '2005-10-22', '1');
INSERT INTO `images` VALUES ('302', '2', '235', 'Debbies Wedding', 'mam_nanna.jpg', '', '', '1', '0', '0', '1997-06-20', '2005-10-22', '2005-10-22', '1');
INSERT INTO `images` VALUES ('303', '2', '235', 'Havelock School', 'havelock1.jpg', '', '', '1', '0', '0', '1989-05-01', '2005-10-22', '2005-10-22', '1');
INSERT INTO `images` VALUES ('304', '2', '210', 'Kavos, Greece', 'greece_corfu_crazy.jpg', '', '', '1', '0', '0', '1991-06-01', '2005-10-22', '2005-10-22', '1');
INSERT INTO `images` VALUES ('305', '2', '210', 'Kavos, Greece', 'greece_corfu_scuba.jpg', '', '', '1', '0', '0', '1991-06-01', '2005-10-22', '2005-10-22', '1');
INSERT INTO `images` VALUES ('306', '1', '0', '8 Ball - Single Ball', '8ball1.jpg', '', '', '0', '0', '0', '2005-10-23', '2005-10-23', '2005-10-23', '1');
INSERT INTO `images` VALUES ('307', '2', '28', 'Lifes a Beach, Maldives', 'maldives_me.jpg', '', '', '1', '0', '0', '1997-05-01', '2005-10-23', '2005-10-23', '1');
INSERT INTO `images` VALUES ('308', '1', '0', 'Trophy - Reighton Team', 'trophy_reighton_singles.jpg', '', '', '0', '0', '0', '2005-10-24', '2005-10-24', '2005-10-24', '1');
INSERT INTO `images` VALUES ('309', '1', '0', 'Trophy - Grimsby Div 1', 'trophy_grimsby_div11.jpg', '', '', '0', '0', '0', '2005-10-24', '2005-10-24', '2005-10-24', '1');
INSERT INTO `images` VALUES ('310', '1', '0', 'Trophy - Beachcomber 1', 'trophy_beachcomber1.jpg', '', '', '0', '0', '0', '2005-10-24', '2005-10-24', '2005-10-24', '1');
INSERT INTO `images` VALUES ('311', '1', '0', '8 Ball - Speed Pool', '8ball2.jpg', '', '', '0', '0', '0', '2005-10-24', '2005-10-24', '2005-10-24', '1');
INSERT INTO `images` VALUES ('312', '1', '0', 'Trophy - Reighton Singles', 'trophy_reighton_singles1.jpg', '', '', '0', '0', '0', '2005-10-24', '2005-10-24', '2005-10-24', '1');
INSERT INTO `images` VALUES ('313', '1', '0', '2005 Reno Open', '2005_reno.jpg', '', '', '0', '0', '0', '2005-10-24', '2005-10-24', '2005-10-24', '1');
INSERT INTO `images` VALUES ('314', '1', '0', '2004 Reno Open', '2004_reno.jpg', '', '', '0', '0', '0', '2005-10-24', '2005-10-24', '2005-10-24', '1');
INSERT INTO `images` VALUES ('315', '1', '0', '2004 VNEA', '2004_vnea.jpg', '', '', '0', '0', '0', '2005-10-24', '2005-10-24', '2005-10-24', '1');
INSERT INTO `images` VALUES ('316', '1', '0', 'Trophy - Grimsby Masters', 'trophy_grimsby_masters.jpg', '', '', '0', '0', '0', '2005-10-24', '2005-10-24', '2005-10-24', '1');
INSERT INTO `images` VALUES ('317', '1', '0', '2005 Hard Times', '2005_hardtimes.jpg', '', '', '0', '0', '0', '2005-10-24', '2005-10-24', '2005-10-24', '1');
INSERT INTO `images` VALUES ('318', '5', '0', 'ATP - Redesign Home', 'atp_redesign2.gif', '', '', '0', '0', '0', '2004-12-01', '2005-10-25', '2005-10-25', '1');
INSERT INTO `images` VALUES ('319', '5', '0', 'SHFA - Corporate', 'shfa_corporate.gif', '', '', '0', '0', '0', '2005-10-25', '2005-10-25', '2005-10-25', '1');
INSERT INTO `images` VALUES ('320', '5', '0', 'SHFA - Darling Harbour', 'shfa_darling.gif', '', '', '0', '0', '0', '2005-10-25', '2005-10-25', '2005-10-25', '1');
INSERT INTO `images` VALUES ('321', '5', '0', 'SHFA - The Rocks', 'shfa_rocks.gif', '', '', '0', '0', '0', '2005-10-25', '2005-10-25', '2005-10-25', '1');
INSERT INTO `images` VALUES ('322', '5', '0', 'GSK', 'gsk.gif', '', '', '0', '0', '0', '2005-11-01', '2005-11-01', '2005-11-01', '1');
INSERT INTO `images` VALUES ('323', '5', '0', 'Sakhalin', 'sakhalin.gif', '', '', '0', '0', '0', '2005-11-01', '2005-11-01', '2005-11-01', '1');
INSERT INTO `images` VALUES ('324', '5', '0', 'PlaneTree', 'planetree.gif', '', '', '0', '0', '0', '2005-11-01', '2005-11-01', '2005-11-01', '1');
INSERT INTO `images` VALUES ('325', '5', '0', 'OPD', 'opd.gif', '', '', '0', '0', '0', '2005-11-01', '2005-11-01', '2005-11-01', '1');
INSERT INTO `images` VALUES ('326', '5', '0', 'HM Treasury', 'hmtreasury.gif', '', '', '0', '0', '0', '2005-11-01', '2005-11-01', '2005-11-01', '1');
INSERT INTO `images` VALUES ('327', '5', '0', 'CF People', 'cfpeople.gif', '', '', '0', '0', '0', '2005-11-01', '2005-11-01', '2005-11-01', '1');
INSERT INTO `images` VALUES ('328', '5', '0', 'St Andrews', 'standrews.gif', '', '', '0', '0', '0', '2005-11-01', '2005-11-01', '2005-11-01', '1');
INSERT INTO `images` VALUES ('329', '5', '0', 'SHFA Intranet', 'shfaintranet.gif', '', '', '0', '0', '0', '2005-11-01', '2005-11-01', '2005-11-01', '1');
INSERT INTO `images` VALUES ('330', '2', '0', 'Article - Vegas Alex', 'article_jizzvegas2.jpg', '', '', '0', '0', '0', '2005-11-03', '2005-11-03', '2005-11-03', '1');
INSERT INTO `images` VALUES ('331', '2', '0', 'Article - 2002 BCA', 'article_vegas2002.jpg', '', '', '0', '0', '0', '2005-11-03', '2005-11-03', '2005-11-03', '1');
INSERT INTO `images` VALUES ('332', '2', '0', 'Article - Grimsby Masters', 'grimsby_masters1.jpg', '', '', '0', '0', '0', '2005-11-03', '2005-11-03', '2005-11-03', '1');
INSERT INTO `images` VALUES ('333', '2', '0', 'Article - YTS1', 'snooker_yts13.jpg', '', '', '0', '0', '0', '2005-11-03', '2005-11-03', '2005-11-03', '1');
INSERT INTO `images` VALUES ('334', '2', '0', 'Article - YTS2', 'snooker_yts2.jpg', '', '', '0', '0', '0', '2005-11-03', '2005-11-03', '2005-11-03', '1');
INSERT INTO `images` VALUES ('335', '2', '0', '2005 Planet Pool Cambridge', 'IMG_4390.jpg', '', '', '0', '0', '0', '2005-11-04', '2005-11-04', '2005-11-04', '1');
INSERT INTO `images` VALUES ('336', '2', '0', 'Article - Hard Times 1', 'July05-01.jpg', '', '', '0', '0', '0', '2005-11-04', '2005-11-04', '2005-11-04', '1');
INSERT INTO `images` VALUES ('337', '2', '0', 'Article - Hard Times 2', 'July05-04.jpg', '', '', '0', '0', '0', '2005-11-04', '2005-11-04', '2005-11-04', '1');
INSERT INTO `images` VALUES ('338', '2', '0', 'Article - Hard Times 3', 'July05-05.jpg', '', '', '0', '0', '0', '2005-11-04', '2005-11-04', '2005-11-04', '1');
INSERT INTO `images` VALUES ('339', '2', '106', 'Capital Hill, Washington', 'washington_me.jpg', '', '', '1', '0', '0', '2005-11-05', '2005-11-05', '2005-11-05', '1');
INSERT INTO `images` VALUES ('340', '2', '106', 'Segway Cop, Washington', 'washington_segway.jpg', '', '', '1', '0', '0', '2005-11-05', '2005-11-05', '2005-11-05', '1');
INSERT INTO `images` VALUES ('341', '2', '118', 'Manu Fans, Beijing', 'manu_cops.jpg', 'china_manu.jpg', '', '1', '0', '0', '2005-11-05', '2005-11-06', '2005-11-06', '1');
INSERT INTO `images` VALUES ('344', '2', '184', '96 Ball 14:1 Run, Manila', 'video_manila_pool.jpg', '14to1.flv', '', '1', '1', '0', '2005-11-06', '2005-11-06', '2005-11-06', '1');
INSERT INTO `images` VALUES ('345', '2', '106', 'Alex US Open Bridge Jump', 'video_usopen_bridgejump.jpg', 'usopen_bridgejump.flv', '', '1', '1', '0', '2005-11-07', '2005-11-07', '2005-11-07', '1');
INSERT INTO `images` VALUES ('346', '2', '152', 'Dubai waterpark surfer', 'video_uae_waterpark.jpg', 'dubai_waterpark.flv', '', '1', '1', '0', '2005-11-07', '2005-11-07', '2005-11-07', '1');
INSERT INTO `images` VALUES ('347', '5', '0', 'SHFA - Intranet', 'shfai_intranet.gif', '', '', '0', '0', '0', '2005-11-08', '2005-11-08', '2005-11-08', '1');
INSERT INTO `images` VALUES ('348', '5', '0', 'SHFA - Rocks Chamber', 'shfai_chamber.gif', '', '', '0', '0', '0', '2005-11-08', '2005-11-08', '2005-11-08', '1');
INSERT INTO `images` VALUES ('349', '5', '0', 'Freelance - Latte', 'freelance_latte.gif', '', '', '0', '0', '0', '2005-11-08', '2005-11-08', '2005-11-08', '1');
INSERT INTO `images` VALUES ('350', '2', '106', 'US Open Final Frame', 'video_finalframe1.jpg', 'usopen_finalframe.flv', '', '1', '1', '0', '2005-11-08', '2005-11-08', '2005-11-08', '1');
INSERT INTO `images` VALUES ('354', '2', '184', 'Phillipine Rice Terraces', 'video_batad.jpg', 'philipines_batad.flv', '', '1', '1', '0', '2005-11-09', '2005-11-09', '2005-11-09', '1');
INSERT INTO `images` VALUES ('352', '1', '106', '2005 BCA Final', 'video_bcafinal.jpg', '', '', '0', '0', '1', '2005-11-09', '2005-11-09', '2005-11-09', '1');
INSERT INTO `images` VALUES ('355', '2', '106', 'US Open Past Champions', 'video_usopen_tribute.jpg', 'usopen_tribute.flv', '', '1', '1', '0', '2005-11-09', '2005-11-09', '2005-11-09', '1');
INSERT INTO `images` VALUES ('356', '2', '235', 'Jo, Friend & I, Grimsby', 'grimsby_sallys1.jpg', '', '', '1', '0', '0', '2005-11-18', '2005-11-18', '2005-11-18', '1');
INSERT INTO `images` VALUES ('357', '2', '235', 'Jo & Friend, Grimsby', 'grimsby_sallys2.jpg', 'jofriend.JPG', '', '1', '0', '0', '2005-11-18', '2005-11-18', '2005-11-18', '1');
INSERT INTO `images` VALUES ('358', '2', '235', 'Fuzz & Jo, Grimsby', 'grimsby_town1.jpg', 'jofuzz.JPG', '', '1', '0', '0', '2005-11-18', '2005-11-18', '2005-11-18', '1');
INSERT INTO `images` VALUES ('359', '2', '235', 'Fuzz, Grimsby', 'grimsby_town2.jpg', 'fuzz.JPG', '', '1', '0', '0', '2005-11-18', '2005-11-18', '2005-11-18', '1');
INSERT INTO `images` VALUES ('360', '1', '0', '2006 BPPPA - Nottingham', '2006_bpppa_nottingham.gif', '', '', '0', '0', '0', '2006-02-06', '2006-02-06', '2006-02-06', '1');
INSERT INTO `images` VALUES ('361', '1', '0', 'Car & Bike', 'riley_car_bike.gif', '', '', '0', '0', '0', '2006-02-06', '2006-02-06', '2006-02-06', '1');
INSERT INTO `images` VALUES ('362', '4', '0', 'Flag Czech', 'czsmall.gif', '', '', '0', '0', '0', '2006-02-08', '2006-02-08', '2006-02-08', '1');
INSERT INTO `images` VALUES ('363', '4', '0', 'Slovenia', 'sismall.gif', '', '', '0', '0', '0', '2006-04-17', '2006-04-17', '2006-04-17', '1');
INSERT INTO `images` VALUES ('364', '1', '201', 'Euro Tour - Prague', 'eurotour_prague.gif', '', '', '0', '0', '0', '2006-04-21', '2006-04-21', '2006-04-21', '1');
INSERT INTO `images` VALUES ('365', '1', '201', 'Euro Tour - Monfalcone', 'eurotour_monfalcone.gif', '', '', '0', '0', '0', '2006-04-21', '2006-04-21', '2006-04-21', '1');
INSERT INTO `images` VALUES ('366', '1', '0', '2005', '2005.gif', '', '', '0', '0', '0', '2006-04-21', '2006-04-21', '2006-04-21', '1');
INSERT INTO `images` VALUES ('367', '1', '0', '14.1 Flyer', 'World141StraightPoolChamp.gif', '', '', '0', '0', '0', '2006-06-05', '2006-06-05', '2006-06-05', '1');
INSERT INTO `images` VALUES ('368', '2', '0', '14.1 Bridge', 'me_bridge_sm1.jpg', '', '', '0', '0', '0', '2006-06-05', '2006-06-05', '2006-06-05', '1');
INSERT INTO `images` VALUES ('369', '2', '0', '14.1 Shot', 'me shot_sm.jpg', '', '', '0', '0', '0', '2006-06-05', '2006-06-05', '2006-06-05', '1');
INSERT INTO `images` VALUES ('370', '1', '0', '2006 Straight Pool', '2006_straightpool.gif', '', '', '0', '0', '0', '2006-06-06', '2006-06-06', '2006-06-06', '1');
INSERT INTO `images` VALUES ('371', '4', '0', 'smLiechtenstien', 'lismall.gif', '', '', '0', '0', '0', '2006-06-11', '2006-06-11', '2006-06-11', '1');
INSERT INTO `images` VALUES ('372', '4', '0', 'lgLiechtenstien', 'lilarge.gif', '', '', '0', '0', '0', '2006-06-11', '2006-06-11', '2006-06-11', '1');
INSERT INTO `images` VALUES ('373', '4', '0', 'lgAustria', 'atlarge.gif', '', '', '0', '0', '0', '2006-06-11', '2006-06-11', '2006-06-11', '1');
INSERT INTO `images` VALUES ('374', '4', '0', 'smAustria', 'atsmall.gif', '', '', '0', '0', '0', '2006-06-11', '2006-06-11', '2006-06-11', '1');
INSERT INTO `images` VALUES ('375', '4', '0', 'smEngland', 'england1.gif', '', '', '0', '0', '0', '2006-06-11', '2006-06-11', '2006-06-11', '1');
INSERT INTO `images` VALUES ('376', '4', '0', 'Euro Tour - Austria', 'eurotour_austria.gif', '', '', '0', '0', '0', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('377', '4', '0', 'Flag - Germany', 'eurotour_germany.gif', '', '', '0', '0', '0', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('378', '1', '0', 'EuroTour - Austria', 'eurotour_austria1.gif', '', '', '0', '0', '0', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('379', '1', '0', 'EuroTour - Germany', 'eurotour_germany1.gif', '', '', '0', '0', '0', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('380', '2', '117', 'Angkor Wat, Cambodia', 'cambodia1.jpg', '', '', '1', '0', '0', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('381', '2', '117', 'Angkor Wat, Cambodia', 'cambodia2.jpg', '', '', '1', '0', '0', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('382', '2', '117', 'Angkor Wat, Cambodia', 'cambodia3.jpg', '', '', '1', '0', '0', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('383', '2', '117', 'Angkor Wat, Cambodia', 'cambodia4.jpg', '', '', '1', '0', '1', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('384', '2', '117', 'Angkor Wat, Cambodia', 'cambodia5.jpg', '', '', '1', '0', '1', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('385', '2', '106', 'World 14.1 Championships', 'usa_pool14_1.jpg', '', '', '1', '0', '1', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('386', '2', '106', 'World 14.1 Championships', 'usa_pool14_2.jpg', '', '', '1', '0', '1', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('387', '2', '215', 'Venice, Italy', 'italy_canal1.jpg', '', '', '1', '0', '1', '2006-07-12', '2006-07-12', '2006-07-12', '1');
INSERT INTO `images` VALUES ('388', '1', '0', 'pool ranking', 'rankingweb.jpg', '', '', '0', '0', '0', '2006-10-30', '2006-10-30', '2006-10-30', '1');
INSERT INTO `images` VALUES ('389', '1', '0', 'Pool - Penthouse Billiards', 'pooltable.gif', '', '', '0', '0', '0', '2006-11-01', '2006-11-01', '2006-11-01', '1');
INSERT INTO `images` VALUES ('390', '4', '0', 'smPoland', 'plsmall.gif', '', '', '0', '0', '0', '2007-01-15', '2007-01-15', '2007-01-15', '1');
INSERT INTO `images` VALUES ('391', '4', '0', 'Flag Barbados', 'barbados.gif', '', '', '0', '0', '0', '2007-05-01', '2007-05-01', '2007-05-01', '1');
INSERT INTO `images` VALUES ('392', '4', '0', 'Flag St Lucia', 'stlucia.gif', '', '', '0', '0', '0', '2007-05-01', '2007-05-01', '2007-05-01', '1');
INSERT INTO `images` VALUES ('393', '4', '0', 'Flag Grenada', 'grenada.gif', '', '', '0', '0', '0', '2007-05-01', '2007-05-01', '2007-05-01', '1');
INSERT INTO `images` VALUES ('394', '4', '0', 'Flag Jamaica', 'jamaica.gif', '', '', '0', '0', '0', '2007-05-01', '2007-05-01', '2007-05-01', '1');
INSERT INTO `images` VALUES ('395', '1', '0', 'EuroTour - Austria', 'eurotour_austria3.gif', '', '', '0', '0', '0', '2007-05-23', '2007-05-23', '2007-05-23', '1');
INSERT INTO `images` VALUES ('396', '1', '0', 'EuroTour - Czech', 'eurotour_czech.gif', '', '', '0', '0', '0', '2007-05-23', '2007-05-23', '2007-05-23', '1');
INSERT INTO `images` VALUES ('397', '1', '0', 'EuroTour - Germany', 'eurotour_germany3.gif', '', '', '0', '0', '0', '2007-05-23', '2007-05-23', '2007-05-23', '1');
INSERT INTO `images` VALUES ('398', '1', '0', 'EuroTour - Holland', 'eurotour_holland.gif', '', '', '0', '0', '0', '2007-05-23', '2007-05-23', '2007-05-23', '1');
INSERT INTO `images` VALUES ('399', '1', '0', 'EuroTour - Italy', 'eurotour_italy.gif', '', '', '0', '0', '0', '2007-05-23', '2007-05-23', '2007-05-23', '1');
INSERT INTO `images` VALUES ('400', '1', '0', 'EuroTour - Spain', 'eurotour_spain.gif', '', '', '0', '0', '0', '2007-05-23', '2007-05-23', '2007-05-23', '1');
INSERT INTO `images` VALUES ('401', '1', '0', 'EuroTour - Swiss', 'eurotour_swiss.gif', '', '', '0', '0', '0', '2007-05-23', '2007-05-23', '2007-05-23', '1');
INSERT INTO `images` VALUES ('402', '1', '0', 'Football - Wembley', 'wembley.jpg', '', '', '0', '0', '0', '2007-05-23', '2007-05-23', '2007-05-23', '1');
INSERT INTO `images` VALUES ('403', '1', '0', 'Birthday - 33', 'birthday_33.jpg', '', '', '0', '0', '0', '2007-05-23', '2007-05-23', '2007-05-23', '1');
INSERT INTO `images` VALUES ('404', '1', '0', 'Pool - Top 100', 'pool_top100.jpg', '', '', '0', '0', '0', '2007-05-23', '2007-05-23', '2007-05-23', '1');
INSERT INTO `images` VALUES ('405', '1', '0', '2007 - Pool 14.1 Flier', '2007straightpoolchampionship.gif', '', '', '0', '0', '0', '2007-06-05', '2007-06-05', '2007-06-05', '1');
INSERT INTO `images` VALUES ('406', '1', '0', '2007 14.1 Flyer', 'pool_141ball.jpg', '', '', '0', '0', '0', '2007-06-06', '2007-06-06', '2007-06-06', '1');
INSERT INTO `images` VALUES ('407', '1', '0', '2007 10 Ball Flyer', 'pool_10ball.jpg', '', '', '0', '0', '0', '2007-06-06', '2007-06-06', '2007-06-06', '1');
INSERT INTO `images` VALUES ('408', '1', '0', 'Mensa', 'mensa.jpg', '', '', '0', '0', '0', '2007-06-06', '2007-06-06', '2007-06-06', '1');
INSERT INTO `images` VALUES ('409', '1', '0', '2007 VNEA', 'pool_2007VNEA.jpg', '', '', '0', '0', '0', '2007-06-06', '2007-06-06', '2007-06-06', '1');
INSERT INTO `images` VALUES ('410', '1', '0', '2007 Cricket', '2007cricket.jpg', '', '', '0', '0', '0', '2007-06-06', '2007-06-06', '2007-06-06', '1');
INSERT INTO `images` VALUES ('411', '1', '0', 'flag guatemala', 'guatemal.gif', '', '', '0', '0', '0', '2007-06-07', '2007-06-07', '2007-06-07', '1');
INSERT INTO `images` VALUES ('412', '4', '0', 'flag belize', 'bzsmall.gif', '', '', '0', '0', '0', '2007-06-07', '2007-06-07', '2007-06-07', '1');
INSERT INTO `images` VALUES ('413', '4', '0', 'flag mexico', 'mxsmall.gif', '', '', '0', '0', '0', '2007-06-07', '2007-06-07', '2007-06-07', '1');
INSERT INTO `images` VALUES ('415', '4', '0', 'Flag Guatemala', 'guatemal1.gif', '', '', '0', '0', '0', '2007-06-07', '2007-06-07', '2007-06-07', '1');
INSERT INTO `images` VALUES ('416', '4', '0', 'Flag Canada', 'calarge.gif', '', '', '0', '0', '0', '2008-01-06', '2008-01-06', '2008-01-06', '1');
INSERT INTO `images` VALUES ('417', '4', '0', 'Flag Canada Small', 'casmall.gif', '', '', '0', '0', '0', '2008-01-06', '2008-01-06', '2008-01-06', '1');
INSERT INTO `images` VALUES ('418', '4', '0', 'Flag Mexico Small', 'mxsmall1.gif', '', '', '0', '0', '0', '2008-01-06', '2008-01-06', '2008-01-06', '1');
INSERT INTO `images` VALUES ('419', '4', '0', 'Flag Macau Small', 'macausm.gif', '', '', '0', '0', '0', '2008-01-06', '2008-01-06', '2008-01-06', '1');
INSERT INTO `images` VALUES ('420', '4', '0', 'Flag Ireland Small', 'iesmall.gif', '', '', '0', '0', '0', '2008-01-06', '2008-01-06', '2008-01-06', '1');
INSERT INTO `images` VALUES ('421', '4', '0', 'Flag Vietnam Small', 'vnsmall.gif', '', '', '0', '0', '0', '2008-01-06', '2008-01-06', '2008-01-06', '1');
INSERT INTO `journey_types` VALUES ('1', 'Plane');
INSERT INTO `journey_types` VALUES ('2', 'Helicopter');
INSERT INTO `journey_types` VALUES ('3', 'Bus');
INSERT INTO `journey_types` VALUES ('4', 'Train');
INSERT INTO `journey_types` VALUES ('5', 'Boat');
INSERT INTO `journey_types` VALUES ('6', 'Car');
INSERT INTO `journey_types` VALUES ('7', 'Other');
INSERT INTO `journeys` VALUES ('1', '1', '48', '102', 'Gate 36, Seat 19A', 'DJ511', 'Virgin Blue', 'Economy', '', '2003-12-29 12:00:00', '2003-12-29 12:20:00', '2004-01-27 22:50:12', '2004-01-25 00:00:00', '1');
INSERT INTO `journeys` VALUES ('2', '1', '101', '50', 'Gate 4, Seat 24A', 'DJ918', 'Virgin Blue', 'Economy', '', '2004-01-11 16:10:00', '2004-01-11 17:30:00', '2004-01-27 22:51:45', '2004-01-25 00:00:00', '1');
INSERT INTO `journeys` VALUES ('3', '1', '50', '48', 'Gate 40, Seat 15D, Macromedia', '256', 'Virgin Blue', 'Economy', '', '2002-12-10 19:00:00', '2002-12-10 21:30:00', '2004-01-27 22:48:25', '2004-01-25 00:00:00', '1');
INSERT INTO `journeys` VALUES ('4', '1', '48', '46', 'Denpasar, Gate 36, Seat 29A', 'QF029', 'Qantas', 'Economy', '', '2003-04-24 09:00:00', '2003-04-24 13:05:00', '2004-01-27 23:12:04', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('5', '1', '46', '40', 'Seat 57C, Gate 4', 'CX784', 'Cathy Pacific', 'Economy', '', '2003-04-27 16:10:00', '2003-04-27 21:00:00', '2004-01-28 21:53:36', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('6', '1', '40', '80', 'Seat 44A', 'CX251', 'Cathy Pacific', 'Economy', '', '2003-04-27 23:55:00', '2003-04-28 05:45:00', '2004-01-28 21:39:59', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('7', '1', '93', '18', '', 'KL2108', 'KLM', 'Economy', '', '2002-06-14 12:50:00', '2002-06-14 15:10:00', '2004-01-27 23:16:56', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('8', '1', '18', '93', 'Seat 09C, Reading Room', 'UK2107', 'KLM?', 'Economy', '', '2002-06-16 14:10:00', '2002-06-16 14:35:00', '2004-01-28 21:46:36', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('9', '1', '80', '74', '', '', 'British Airways', 'Economy', '', '2003-05-05 00:00:00', '2003-05-05 00:00:00', '2004-01-28 22:24:19', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('10', '1', '74', '72', 'Laguidia to Ohare, Gate D3, Seat 17A', 'AA317', 'American Airlines', 'Economy', '', '2003-05-07 10:00:00', '2003-05-07 00:00:00', '2004-01-27 23:09:04', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('11', '1', '72', '65', 'Gate K12, Seat 9A', 'AA1333', 'American Airlines', 'Economy', '', '2003-05-07 12:17:00', '2003-05-07 00:00:00', '2004-01-27 23:13:26', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('12', '1', '65', '0', '', 'AA1945', 'American Airlines', 'Economy', '', '2003-05-20 17:38:00', '2003-05-20 00:00:00', '2004-01-27 23:10:42', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('13', '1', '59', '61', '', 'AA283', 'American Airlines', 'Economy', '', '2003-05-22 12:45:00', '2003-05-22 15:21:00', '2004-01-27 23:04:28', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('14', '1', '61', '48', 'Seat 44K, G27', 'QF004', 'Qantas', 'Economy', '', '2003-05-26 01:00:00', '2003-05-27 07:40:00', '2004-01-28 21:55:15', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('15', '1', '48', '41', 'Gate 59, Seat 27B', 'JL0772', 'Japan Airlines', 'Economy', '', '2002-06-01 09:05:00', '2002-06-01 09:05:00', '2004-01-28 21:56:41', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('16', '1', '41', '80', 'Seat 51K, Gate E70', 'JL403', 'Japan Airlines', 'Economy', '', '2002-06-06 13:35:00', '2002-06-06 00:00:00', '2004-01-28 21:48:32', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('17', '1', '80', '43', 'Seat 45J', 'JL422', 'Japan Airlines', 'Economy', '', '2002-06-21 18:25:00', '2002-06-22 00:00:00', '2004-01-28 21:44:40', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('18', '1', '43', '48', 'Gate 48, Seat 47K', 'JL777', 'Japan Airlines', 'Economy', '', '2002-06-23 21:05:00', '2002-06-23 00:00:00', '2004-01-28 21:02:10', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('19', '1', '48', '49', 'Seat 40A', 'QF439', 'Qantas', 'Economy', '', '2002-04-11 14:00:00', '2002-04-11 15:00:00', '2004-01-28 21:05:11', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('20', '1', '26', '1', 'Seat 37A', 'EK405', 'Emirates', 'Economy', '', '2002-04-12 00:00:00', '2002-04-12 00:00:00', '2004-01-28 20:58:52', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('21', '1', '1', '2', 'Seat 23A', 'EK862', 'Emirates', 'Economy', '', '2002-04-12 08:00:00', '2002-04-12 00:00:00', '2004-01-28 20:54:42', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('22', '1', '2', '1', 'Seat 29K', 'EK0863', 'Emirates', 'Economy', '', '2002-04-18 11:00:00', '2002-04-18 00:00:00', '2004-01-28 20:50:04', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('23', '1', '49', '26', 'Seat 37A', 'EK405', 'Emirates', 'Economy', '', '2002-04-11 19:20:00', '2002-04-11 00:00:00', '2004-01-28 21:00:17', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('24', '1', '1', '26', 'Gate 27, Seat 31H', '', 'Emirates', 'Economy', '', '2002-04-20 07:25:00', '2002-04-20 07:25:00', '2004-01-28 22:25:55', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('25', '1', '26', '48', 'Gate 27, Seat 31H', '', 'Emirates', 'Economy', '', '2002-04-21 00:00:00', '2002-04-21 00:00:00', '2004-01-28 22:25:15', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('26', '1', '83', '15', 'Not sure of dates?', '', '', '', '', '1989-09-01 00:00:00', '1989-09-01 00:00:00', '2006-06-18 13:13:30', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('27', '1', '15', '83', 'Not sure of dates?', '', '', '', '', '1989-09-07 00:00:00', '1989-09-07 00:00:00', '2006-06-18 13:14:03', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('28', '1', '81', '8', 'Not sure of dates?', '', '', 'Economy', '', '1990-08-01 00:00:00', '1990-08-01 00:00:00', '2006-06-18 13:15:07', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('29', '1', '8', '81', 'Not sure of dates?', '', 'Economy', '', '', '1990-08-14 00:00:00', '1990-08-14 00:00:00', '2006-06-18 13:15:55', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('30', '1', '83', '7', 'Not sure of dates?', '', 'Economy', '', '', '1993-06-01 00:00:00', '1993-06-01 00:00:00', '2006-06-18 13:17:26', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('31', '1', '7', '18', 'Not sure of dates?', '', 'KLM', 'Economy', '', '1993-07-14 00:00:00', '1993-07-14 00:00:00', '2006-06-18 13:18:44', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('32', '1', '18', '81', 'Not sure of dates?', '', 'KLM', 'Economy', '', '1993-08-15 00:00:00', '1993-08-15 00:00:00', '2006-06-18 13:19:41', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('33', '1', '81', '74', '', 'BA183', 'British Airways', 'Economy', '', '1994-06-26 13:00:00', '1994-06-26 15:40:00', '2004-01-27 23:27:02', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('34', '1', '74', '72', 'Laguardia - Midway', '50', 'Mark Air', 'Economy', '', '1995-03-19 17:55:00', '1995-03-19 00:00:00', '2004-01-27 23:31:28', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('35', '1', '72', '74', 'Midway - Laguidia', '502', 'Mark Air', 'Economy', '', '1995-04-25 14:35:00', '1995-04-25 00:00:00', '2004-01-27 23:29:16', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('36', '1', '72', '74', '', '40', 'Mark Air', 'Economy', '', '1995-03-21 20:05:00', '1995-03-21 00:00:00', '2004-01-27 23:32:35', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('37', '1', '74', '72', '', '', 'Mark Air', 'Economy', '', '1995-04-24 00:00:00', '1995-04-24 00:00:00', '2004-02-08 02:45:46', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('38', '1', '74', '76', 'Black chick, Gate 12, Seat 15A', '995', 'United Airlines', 'Economy', '', '1995-02-21 19:20:00', '1995-02-21 22:35:00', '2004-01-28 20:56:37', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('39', '1', '76', '74', 'Newark, Seat 15F, Gate F3', 'UA1048', 'United Airlines', 'Economy', '', '1995-03-02 06:40:00', '1995-03-02 09:39:00', '2004-01-27 22:03:01', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('40', '1', '74', '95', '', '0614', 'Iceland Air', 'Economy', '', '1995-06-02 00:00:00', '1995-06-03 00:00:00', '2004-02-08 03:03:03', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('41', '1', '95', '19', '', '0614', 'Iceland Air', 'Economy', '', '1995-06-03 00:00:00', '1995-06-03 00:00:00', '2004-02-08 03:02:44', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('42', '1', '6', '81', '', '517', 'Olympic Airways', 'Economy', '', '1995-06-26 00:05:00', '1995-06-26 00:00:00', '2004-01-27 22:44:52', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('43', '1', '80', '18', '', '', '', 'Economy', '', '2000-12-14 00:00:00', '2000-12-14 00:00:00', '2004-01-28 22:46:16', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('44', '1', '18', '80', '', '', '', 'Economy', '', '2000-12-16 00:00:00', '2000-12-16 00:00:00', '2004-01-28 22:47:06', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('45', '1', '81', '4', '', 'SWW4564', 'Sunways', 'Economy', '', '1996-12-06 09:05:00', '1996-12-06 00:00:00', '2004-01-27 22:31:06', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('46', '1', '81', '18', '', 'KL2148', 'KLM', 'Economy', '', '1996-11-08 06:35:00', '1996-11-08 08:50:00', '2004-01-27 22:08:59', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('47', '1', '81', '4', 'Seat 3B, Cig smuggling', 'SWW4564', 'Sunways', 'Economy', '', '1997-02-28 09:05:00', '1997-02-28 00:00:00', '2004-01-28 21:43:27', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('48', '1', '4', '81', '', 'SWW4561', 'Sunways', 'Economy', '', '1997-03-03 05:35:00', '1997-03-03 00:00:00', '2004-01-27 22:36:15', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('49', '1', '4', '81', '', 'SWW4561', 'Sunways', 'Economy', '', '1996-12-09 05:35:00', '1996-12-09 00:00:00', '2004-01-27 22:32:09', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('50', '1', '4', '18', '', 'KL0108', 'KLM', 'Economy', '', '1996-11-11 15:30:00', '1996-11-11 18:10:00', '2004-01-27 22:12:08', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('51', '1', '80', '3', '1 week before crash, Airbus A340-300, 6 hours 45 mins', 'GF2', 'Gulf Air', 'Economy', '', '2000-07-06 10:00:00', '2000-07-06 18:45:00', '2004-01-27 23:52:40', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('52', '1', '3', '33', 'Airbus A340-300, 6 hours 55 mins', 'GF150', 'Gulf Air', 'Economy', '', '2000-07-06 22:15:00', '2000-07-07 09:10:00', '2004-01-27 23:55:38', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('53', '1', '36', '2', '', 'GF153', 'Gulf Air', 'Economy', '', '2000-07-21 18:25:00', '2000-07-21 21:20:00', '2004-01-27 23:57:43', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('54', '1', '2', '80', 'Heathrow, Airbus A340-300, 9 hours 55 mins, via bahrain!!', 'GF7', 'Gulf Air', 'Economy', '', '2000-07-21 23:30:00', '2000-07-22 06:25:00', '2004-01-28 22:28:25', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('55', '1', '36', '1', 'Seat 17H, Gate 46', 'EK0087', 'Emirates', 'Economy', '', '1997-07-25 01:30:00', '1997-07-25 01:30:00', '2004-01-28 21:35:09', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('56', '1', '1', '24', 'Seat 22K', 'EK70', 'Emirates', 'Economy', '', '1997-06-03 03:55:00', '1997-06-03 00:00:00', '2004-01-28 21:06:08', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('57', '1', '24', '21', 'Seat 25A, Maldives!', 'EK813', 'Emirates', 'Economy', '', '1997-06-05 07:45:00', '1997-06-05 07:45:00', '2004-01-28 21:52:59', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('58', '1', '21', '26', 'Free Champagne', '', 'Emirates', 'Economy', '', '1997-06-13 00:00:00', '1997-06-13 00:00:00', '2004-01-28 22:18:31', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('60', '1', '1', '81', 'Seat 20D', 'EK0035', 'Emirates', 'Economy', '', '1997-07-25 06:15:00', '1997-07-25 00:00:00', '2004-01-28 21:42:45', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('61', '1', '81', '1', '', '', 'Emirates', 'Economy', '', '1997-06-01 00:00:00', '1997-06-01 00:00:00', '2004-01-28 22:33:19', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('64', '1', '81', '74', '', '', '', 'Economy', '', '1997-12-29 00:00:00', '1997-12-29 00:00:00', '2004-01-28 22:51:45', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('65', '1', '74', '81', '', '', '', 'Economy', '', '1998-01-10 00:00:00', '1998-01-10 00:00:00', '2004-01-28 22:52:28', '2004-01-27 00:00:00', '1');
INSERT INTO `journeys` VALUES ('66', '1', '33', '36', '2000 Bhat,Goodbye kannika, moved from 23 July!', 'TG210', 'Thai Airlines', 'Economy', '', '1997-07-24 12:40:00', '1997-07-24 13:40:00', '2004-01-28 21:50:50', '2004-01-27 22:07:00', '1');
INSERT INTO `journeys` VALUES ('67', '1', '18', '4', '', 'KL0107', 'KLM', 'Economy', '', '1996-11-08 10:15:00', '1996-11-08 14:40:00', '2004-01-27 22:10:14', '2004-01-27 22:10:14', '1');
INSERT INTO `journeys` VALUES ('68', '1', '18', '81', 'Missed this flight! Forgot to change clocks and caught next flight LOL!', 'KL2157', 'KLM', 'Economy', '', '1996-11-11 19:00:00', '1996-11-11 19:25:00', '2004-01-27 22:13:34', '2004-01-27 22:13:34', '1');
INSERT INTO `journeys` VALUES ('69', '1', '106', '105', '3 hours 10 mins, boeing 737 300, Seat 20A', 'RG8646', 'Varig', 'Economy', '', '2001-05-19 16:35:00', '2001-05-19 19:45:00', '2004-01-28 21:32:05', '2004-01-27 22:19:34', '1');
INSERT INTO `journeys` VALUES ('70', '1', '80', '106', 'Heathrow, boeing 777, 14 hours, Gate 18, Seat 26C', 'BA247', 'British Airways', 'Economy', '', '2001-05-11 22:15:00', '2001-05-12 08:15:00', '2004-01-27 23:22:25', '2004-01-27 22:22:00', '1');
INSERT INTO `journeys` VALUES ('71', '1', '105', '48', 'Via Auckland, 17 hours 45 mins, boeing 747 400, Seat 35K', 'QF116', 'Qantas', 'Economy', '', '2001-05-21 01:20:00', '2001-05-22 08:05:00', '2004-01-28 21:30:24', '2004-01-27 22:23:26', '1');
INSERT INTO `journeys` VALUES ('72', '1', '52', '48', 'Gate 39, Seat 21E', 'DJ266', 'Virgin Blue', 'Economy', '', '2004-01-11 18:00:00', '2004-01-11 20:30:00', '2004-02-07 13:45:06', '2004-01-27 22:53:36', '1');
INSERT INTO `journeys` VALUES ('73', '1', '36', '26', 'Fucked Knee', 'TG0409', 'Thai Airlines', 'Economy', '', '2000-02-24 15:05:00', '2000-02-24 16:25:00', '2004-01-27 22:56:23', '2004-01-27 22:56:23', '1');
INSERT INTO `journeys` VALUES ('74', '1', '1', '2', 'Airbus A330, Seat 17K, Gate 11', 'EK862', 'Emirates', 'Economy', '', '2002-10-11 08:00:00', '2002-10-11 09:00:00', '2004-01-28 20:38:45', '2004-01-27 23:36:17', '1');
INSERT INTO `journeys` VALUES ('75', '1', '2', '1', 'Airbus A330, Seat 18K', 'EK863', 'Emirates', 'Economy', '', '2002-10-17 11:00:00', '2002-10-17 11:50:00', '2004-01-28 20:40:53', '2004-01-27 23:36:28', '1');
INSERT INTO `journeys` VALUES ('76', '1', '48', '26', 'Boeing 777, Seat 18A', 'EK411', 'Emirates', 'Economy', '', '2002-10-09 20:15:00', '2002-10-09 00:01:00', '2004-01-28 20:44:27', '2004-01-27 23:40:48', '1');
INSERT INTO `journeys` VALUES ('77', '1', '26', '1', 'Boeing 777, Seat 18A', 'EK411', 'Emirates', 'Economy', '', '2002-10-09 00:01:00', '2002-10-10 06:35:00', '2004-01-28 20:43:54', '2004-01-27 23:40:50', '1');
INSERT INTO `journeys` VALUES ('78', '1', '1', '21', 'Boeing 777, Gate 5, Seat 10k', 'EK344', 'Emirates', 'Economy', '', '2002-10-18 03:30:00', '2002-10-18 00:00:00', '2004-01-28 20:40:00', '2004-01-27 23:44:32', '1');
INSERT INTO `journeys` VALUES ('79', '1', '21', '26', 'Boeing 777', 'EK344', 'Emirates', 'Economy', '', '2002-10-18 00:00:00', '2002-10-18 16:50:00', '2004-01-27 23:44:55', '2004-01-27 23:44:35', '1');
INSERT INTO `journeys` VALUES ('80', '1', '26', '49', 'Seat 19K, Gate C24\r\nOvernight hilton', 'EK404', 'Emirates', 'Economy', '', '2002-10-26 15:20:00', '2002-10-27 00:25:00', '2004-01-28 20:45:29', '2004-01-27 23:47:41', '1');
INSERT INTO `journeys` VALUES ('81', '1', '81', '1', 'I was offered a free return ticket to Asutralia with Emirates if I gave up my seat and fly out to Thailand on Air France. Of course I did this and still arrived at the same time! :-)', '', 'Air France', 'Economy', '', '1999-07-15 00:00:00', '1999-07-16 00:00:00', '2005-10-18 16:16:01', '2004-01-28 09:42:29', '1');
INSERT INTO `journeys` VALUES ('82', '1', '1', '21', '', '', 'Emirates', 'Economy', '', '1999-07-16 00:00:00', '1999-07-16 00:00:00', '2004-02-08 01:56:06', '2004-01-28 09:42:33', '1');
INSERT INTO `journeys` VALUES ('83', '1', '21', '26', '', '', 'Emirates', 'Economy', '', '1999-07-22 00:00:00', '1999-07-22 00:00:00', '2004-02-08 02:05:33', '2004-01-28 09:42:38', '1');
INSERT INTO `journeys` VALUES ('84', '1', '40', '36', 'Seat 52H, Gate 43', '', 'Thai Airlines', 'Economy', '', '1999-08-27 18:10:00', '1999-08-27 18:10:00', '2004-01-28 22:43:15', '2004-01-28 09:42:41', '1');
INSERT INTO `journeys` VALUES ('85', '1', '36', '40', 'Gate 12, Seat 33K', 'TG606', 'Thai Airlines', 'Economy', '', '1999-08-25 15:20:00', '1999-08-25 15:20:00', '2004-01-28 22:44:01', '2004-01-28 09:42:43', '1');
INSERT INTO `journeys` VALUES ('86', '1', '36', '26', '', '', 'Emirates', 'Economy', '', '1999-09-22 00:00:00', '1999-09-22 00:00:00', '2004-01-28 22:57:03', '2004-01-28 09:45:15', '1');
INSERT INTO `journeys` VALUES ('87', '1', '26', '49', '', '', 'Emirates', 'Economy', '', '1999-09-23 00:00:00', '1999-09-23 00:00:00', '2004-01-28 22:59:47', '2004-01-28 09:45:18', '1');
INSERT INTO `journeys` VALUES ('88', '1', '49', '57', '', '', 'Air New Zealand', 'Economy', '', '1999-09-25 00:00:00', '1999-09-25 00:00:00', '2004-01-28 22:32:22', '2004-01-28 09:48:33', '1');
INSERT INTO `journeys` VALUES ('89', '1', '57', '49', '', '', 'Air New Zealand', 'Economy', '', '2000-01-22 00:00:00', '2000-01-22 00:00:00', '2004-01-28 22:30:09', '2004-01-28 10:02:59', '1');
INSERT INTO `journeys` VALUES ('90', '1', '49', '26', 'Seat 18D, Gate 3', 'EK69', 'Emirates', 'Economy', '', '2000-02-03 19:45:00', '2000-02-03 19:45:00', '2004-01-28 21:58:54', '2004-01-28 10:03:05', '1');
INSERT INTO `journeys` VALUES ('91', '1', '26', '1', 'Seat 34C, Gate C26, Via columbo?', 'EK077', 'Emirates', 'Economy', '', '2000-02-25 23:10:00', '2000-02-26 00:01:00', '2004-01-28 21:12:58', '2004-01-28 10:03:23', '1');
INSERT INTO `journeys` VALUES ('93', '1', '1', '81', '', '', 'Emirates', 'Economy', '', '2000-02-26 00:00:00', '2000-02-26 00:00:00', '2004-01-28 22:40:56', '2004-01-28 10:03:29', '1');
INSERT INTO `journeys` VALUES ('94', '1', '81', '36', '', '', '', 'Economy', '', '1998-03-16 00:00:00', '1998-03-16 00:00:00', '2004-01-28 22:50:06', '2004-01-28 10:07:29', '1');
INSERT INTO `journeys` VALUES ('95', '1', '36', '81', '', '', '', 'Economy', '', '1998-04-01 00:00:00', '1998-04-01 00:00:00', '2004-01-28 22:50:30', '2004-01-28 10:07:33', '1');
INSERT INTO `journeys` VALUES ('96', '1', '81', '1', '', 'EK38', 'Emirates', 'Economy', '', '1998-06-11 20:30:00', '1998-06-12 06:35:00', '2004-01-28 19:14:33', '2004-01-28 10:07:41', '1');
INSERT INTO `journeys` VALUES ('97', '1', '1', '36', '', 'EK82', 'Emirates', 'Economy', '', '1998-06-14 03:15:00', '1998-06-14 12:15:00', '2004-01-28 19:17:21', '2004-01-28 10:07:44', '1');
INSERT INTO `journeys` VALUES ('98', '1', '81', '14', '', '', 'Emirates', 'Economy', '', '1998-12-26 12:00:00', '1998-12-26 14:00:00', '2005-10-18 16:16:52', '2004-01-28 10:07:48', '1');
INSERT INTO `journeys` VALUES ('99', '1', '1', '81', 'Seat 22D', 'Ek35', 'Emirates', 'Economy', '', '1999-01-11 06:25:00', '1999-01-11 06:25:00', '2004-01-28 21:18:09', '2004-01-28 10:07:51', '1');
INSERT INTO `journeys` VALUES ('100', '1', '36', '1', '6 hours 10 mins, Airbus A310, Seat 15D, Gate 31', 'EK83', 'Emirates', 'Economy', '', '1998-09-07 02:15:00', '1998-09-07 05:25:00', '2004-01-28 22:11:06', '2004-01-28 19:19:17', '1');
INSERT INTO `journeys` VALUES ('101', '1', '1', '81', '7 hours 55 mins, Boeing 777, Seat 21A', 'EK35', 'Emirates', 'Economy', '', '1998-09-07 07:10:00', '1998-09-07 12:05:00', '2004-01-28 22:13:26', '2004-01-28 19:21:04', '1');
INSERT INTO `journeys` VALUES ('102', '1', '49', '48', 'Seat 24F, Gate 7', 'DJ823', 'Virgin Blue', 'Economy', '', '2002-10-27 11:15:00', '2002-10-27 12:35:00', '2004-01-28 20:36:55', '2004-01-28 20:22:53', '1');
INSERT INTO `journeys` VALUES ('103', '1', '26', '46', 'Airbus A330, Seat 10A', 'GA841', 'Garuda', 'Economy', '', '2002-10-19 18:25:00', '2002-10-19 20:55:00', '2004-01-28 20:41:33', '2004-01-28 20:26:14', '1');
INSERT INTO `journeys` VALUES ('104', '1', '46', '47', 'Boeing 737 400, 1 hour 40 mins, Gate 21', 'GA401', 'Garuda', 'Economy', '', '2002-10-26 06:40:00', '2002-10-26 07:20:00', '2004-01-28 20:47:53', '2004-01-28 20:28:42', '1');
INSERT INTO `journeys` VALUES ('105', '1', '47', '26', 'Airbus A330, 1 hour 35 mins, Seat 22K', 'GA858', 'Garuda', 'Economy', '', '2002-10-26 08:35:00', '2002-10-26 11:10:00', '2004-01-28 20:46:57', '2004-01-28 20:28:45', '1');
INSERT INTO `journeys` VALUES ('106', '1', '48', '50', 'Seat 14D, Gate 4', '209', 'Virgin Blue', 'Economy', '', '2002-12-08 08:00:00', '2002-12-08 08:25:00', '2004-01-28 20:35:40', '2004-01-28 20:33:15', '1');
INSERT INTO `journeys` VALUES ('107', '1', '36', '1', '', '', 'Emirates', 'Economy', '', '1999-01-11 00:00:00', '1999-01-11 00:00:00', '2004-01-28 22:40:26', '2004-01-28 21:17:22', '1');
INSERT INTO `journeys` VALUES ('108', '1', '14', '36', '', '', 'Emirates', 'Economy', '', '1998-12-26 16:00:00', '1998-12-27 07:00:00', '2005-10-18 16:17:43', '2004-01-28 21:20:03', '1');
INSERT INTO `journeys` VALUES ('109', '4', '36', '34', '2 Puppies!', '', '', '1st Class Sleeper', '', '1998-06-01 00:00:00', '1998-06-01 00:00:00', '2004-02-05 21:12:51', '2004-02-05 21:12:51', '1');
INSERT INTO `journeys` VALUES ('110', '4', '74', '76', '', '', '', '', '', '1997-12-20 00:00:00', '1997-12-20 00:00:00', '2004-02-05 21:17:31', '2004-02-05 21:12:56', '1');
INSERT INTO `journeys` VALUES ('111', '4', '76', '77', '', '', '', '', '', '1997-12-31 00:00:00', '1997-12-30 00:00:00', '2004-02-05 21:19:23', '2004-02-05 21:15:15', '1');
INSERT INTO `journeys` VALUES ('112', '4', '74', '77', '', '', '', '', '', '1998-01-01 00:00:00', '1998-01-02 00:00:00', '2004-02-05 21:16:34', '2004-02-05 21:15:20', '1');
INSERT INTO `journeys` VALUES ('113', '2', '65', '103', '', '', '', '', '', '2003-05-01 00:00:00', '2003-05-01 00:00:00', '2004-02-05 21:20:34', '2004-02-05 21:20:34', '1');
INSERT INTO `journeys` VALUES ('114', '2', '103', '65', '', '', '', '', '', '2003-05-01 00:00:00', '2003-05-01 00:00:00', '2004-02-05 21:21:08', '2004-02-05 21:21:08', '1');
INSERT INTO `journeys` VALUES ('115', '5', '30', '104', '', '', '', '', '', '1997-06-01 00:00:00', '1997-06-01 00:00:00', '2004-02-05 21:34:11', '2004-02-05 21:34:11', '1');
INSERT INTO `journeys` VALUES ('116', '5', '104', '30', '', '', '', '', '', '1997-06-01 00:00:00', '1997-06-01 00:00:00', '2004-02-05 21:35:08', '2004-02-05 21:34:55', '1');
INSERT INTO `journeys` VALUES ('117', '3', '80', '20', '', '', '', '', '', '1997-02-01 00:00:00', '1997-02-01 00:00:00', '2004-02-05 21:36:51', '2004-02-05 21:36:51', '1');
INSERT INTO `journeys` VALUES ('118', '3', '20', '80', '', '', '', '', '', '1997-02-01 00:00:00', '1997-02-01 00:00:00', '2004-02-05 21:37:14', '2004-02-05 21:36:55', '1');
INSERT INTO `journeys` VALUES ('119', '4', '43', '42', '', '', 'Bullet Train', '', '', '2002-06-01 00:00:00', '2002-06-01 00:00:00', '2004-02-05 21:38:50', '2004-02-05 21:38:50', '1');
INSERT INTO `journeys` VALUES ('120', '4', '42', '43', '', '', 'Bullet Train', '', '', '2002-06-01 00:00:00', '2002-06-01 00:00:00', '2004-02-05 21:39:07', '2004-02-05 21:38:54', '1');
INSERT INTO `journeys` VALUES ('121', '4', '19', '5', 'via France and Switzerland', '', '', '', '', '1995-06-03 12:00:00', '1995-06-04 00:00:00', '2004-02-08 03:06:29', '2004-02-05 21:40:49', '1');
INSERT INTO `journeys` VALUES ('122', '4', '21', '23', '', '', '', '', '', '1997-05-01 00:00:00', '1997-05-01 00:00:00', '2004-02-05 21:41:50', '2004-02-05 21:41:50', '1');
INSERT INTO `journeys` VALUES ('123', '4', '23', '21', '', '', '', '', '', '1997-05-01 00:00:00', '1997-05-01 00:00:00', '2004-02-05 21:42:18', '2004-02-05 21:41:54', '1');
INSERT INTO `journeys` VALUES ('124', '4', '21', '22', 'It was 35 degrees and the only air conditioning on the train was the glassless windows. I jad no choice but to travel 3rd class, the only one available apart from the roof! Two and a half hours later I arrived in Kandy about 2 kilos lighter, not bad for 19 pence though!', '', '', '3rd Class', '', '1999-07-18 00:00:00', '1999-07-18 00:00:00', '2004-02-08 02:02:09', '2004-02-05 21:43:07', '1');
INSERT INTO `journeys` VALUES ('125', '4', '22', '21', '', '', '', '3rd Class', '', '1999-07-21 00:00:00', '1999-07-21 00:00:00', '2004-02-08 02:04:26', '2004-02-05 21:43:11', '1');
INSERT INTO `journeys` VALUES ('126', '5', '6', '10', '', '', '', '', '', '1995-06-08 00:00:00', '1995-06-08 00:00:00', '2004-02-08 03:16:05', '2004-02-05 21:44:25', '1');
INSERT INTO `journeys` VALUES ('127', '5', '10', '6', '', '', '', '', '', '1995-06-26 00:00:00', '1995-06-26 00:00:00', '2004-02-08 03:16:39', '2004-02-05 21:44:31', '1');
INSERT INTO `journeys` VALUES ('128', '5', '12', '6', '', '', '', '', '', '1995-06-06 12:00:00', '1995-06-06 12:00:00', '2004-02-08 03:14:02', '2004-02-05 21:48:01', '1');
INSERT INTO `journeys` VALUES ('129', '3', '28', '33', '', '', '', '', '', '1997-05-01 00:00:00', '1997-05-01 00:00:00', '2004-02-05 21:49:29', '2004-02-05 21:49:29', '1');
INSERT INTO `journeys` VALUES ('130', '3', '28', '33', '', '', '', '', '', '2000-02-06 00:00:00', '2000-02-06 00:00:00', '2004-02-08 02:34:54', '2004-02-05 21:49:40', '1');
INSERT INTO `journeys` VALUES ('131', '3', '26', '28', '', '', '', '', '', '1997-05-01 00:00:00', '1997-05-01 00:00:00', '2004-02-05 21:50:54', '2004-02-05 21:50:54', '1');
INSERT INTO `journeys` VALUES ('132', '3', '26', '28', '', '', '', '', '', '2000-02-04 00:00:00', '2000-02-04 00:00:00', '2004-02-08 02:27:27', '2004-02-05 21:50:58', '1');
INSERT INTO `journeys` VALUES ('133', '3', '26', '28', '', '', '', '', '', '1999-07-25 00:00:00', '1999-07-25 00:00:00', '2004-02-08 02:07:07', '2004-02-08 02:07:07', '1');
INSERT INTO `journeys` VALUES ('134', '3', '28', '33', '', '', '', '', '', '1999-07-26 00:00:00', '1999-07-27 00:00:00', '2004-02-08 02:08:14', '2004-02-08 02:08:14', '1');
INSERT INTO `journeys` VALUES ('135', '1', '33', '36', '', '', 'Thai Airlines', 'Economy', '', '1999-07-30 00:00:00', '1999-07-30 00:00:00', '2004-02-08 02:12:28', '2004-02-08 02:11:56', '1');
INSERT INTO `journeys` VALUES ('136', '3', '36', '38', '', '', '', '', '', '1999-08-02 00:00:00', '1999-08-02 00:00:00', '2004-02-08 02:13:20', '2004-02-08 02:13:20', '1');
INSERT INTO `journeys` VALUES ('137', '3', '38', '36', '', '', '', '', '', '1999-08-24 00:00:00', '1999-08-24 00:00:00', '2004-02-08 02:13:58', '2004-02-08 02:13:24', '1');
INSERT INTO `journeys` VALUES ('138', '3', '36', '38', '', '', '', '', '', '1999-08-30 00:00:00', '1999-08-30 00:00:00', '2004-02-08 02:15:18', '2004-02-08 02:15:04', '1');
INSERT INTO `journeys` VALUES ('139', '3', '38', '36', '', '', '', '', '', '1999-09-21 00:00:00', '1999-09-21 00:00:00', '2004-02-08 02:16:23', '2004-02-08 02:16:23', '1');
INSERT INTO `journeys` VALUES ('140', '3', '49', '48', '', '', '', '', '', '2000-01-23 00:00:00', '2000-01-24 00:00:00', '2004-02-08 02:19:26', '2004-02-08 02:19:26', '1');
INSERT INTO `journeys` VALUES ('141', '3', '48', '49', '', '', '', '', '', '2000-02-02 00:00:00', '2000-02-02 00:00:00', '2004-02-08 02:25:34', '2004-02-08 02:25:34', '1');
INSERT INTO `journeys` VALUES ('142', '1', '33', '36', '', '', 'Thai Airlines', 'Economy', '', '2000-02-09 00:00:00', '2000-02-09 00:00:00', '2004-02-08 02:37:35', '2004-02-08 02:37:13', '1');
INSERT INTO `journeys` VALUES ('143', '3', '36', '38', '', '', '', '', '', '2000-02-10 00:00:00', '2000-02-10 00:00:00', '2004-02-08 02:39:35', '2004-02-08 02:39:35', '1');
INSERT INTO `journeys` VALUES ('144', '3', '38', '36', '', '', '', '', '', '2000-02-24 00:00:00', '2000-02-24 00:00:00', '2004-02-08 02:40:22', '2004-02-08 02:39:55', '1');
INSERT INTO `journeys` VALUES ('145', '3', '74', '79', '', '', '', '', '', '1994-06-28 00:00:00', '1994-06-29 00:00:00', '2004-02-08 02:50:40', '2004-02-08 02:50:40', '1');
INSERT INTO `journeys` VALUES ('146', '3', '79', '66', '', '', '', '', '', '1994-08-05 00:00:00', '1994-08-06 00:00:00', '2004-02-08 02:51:47', '2004-02-08 02:50:51', '1');
INSERT INTO `journeys` VALUES ('147', '3', '66', '65', 'Via El Passo, Pheonix, Etc..', '', '', '', '', '1994-08-07 00:00:00', '1994-08-08 00:00:00', '2004-02-08 02:53:19', '2004-02-08 02:53:19', '1');
INSERT INTO `journeys` VALUES ('148', '3', '65', '59', '', '', '', '', '', '1994-09-13 00:00:00', '1994-09-14 00:00:00', '2004-02-08 02:54:10', '2004-02-08 02:53:25', '1');
INSERT INTO `journeys` VALUES ('149', '3', '59', '60', '', '', 'Greyhound', '', '', '1994-10-10 00:00:00', '1994-10-11 00:00:00', '2004-02-08 02:55:25', '2004-02-08 02:55:25', '1');
INSERT INTO `journeys` VALUES ('150', '3', '60', '62', 'Via Denver etc..', '', 'Greyhound', '', '', '1994-10-12 00:00:00', '1994-10-14 00:00:00', '2004-02-08 02:56:28', '2004-02-08 02:55:28', '1');
INSERT INTO `journeys` VALUES ('151', '3', '62', '70', '', '', 'Greyhound', '', '', '1994-10-16 00:00:00', '1994-10-17 00:00:00', '2004-02-08 02:57:39', '2004-02-08 02:57:39', '1');
INSERT INTO `journeys` VALUES ('152', '3', '70', '74', '', '', 'Greyhound', '', '', '1994-11-02 00:00:00', '1994-11-03 00:00:00', '2004-02-08 02:58:36', '2004-02-08 02:57:48', '1');
INSERT INTO `journeys` VALUES ('153', '4', '5', '12', '', '', '', '', '', '1995-06-06 00:00:00', '1995-06-06 00:00:00', '2004-02-08 03:12:54', '2004-02-08 03:12:48', '1');
INSERT INTO `journeys` VALUES ('154', '5', '10', '9', '', '', '', '', '', '1995-06-15 00:00:00', '1995-06-15 00:00:00', '2004-02-08 03:17:42', '2004-02-08 03:17:42', '1');
INSERT INTO `journeys` VALUES ('155', '5', '9', '10', '', '', '', '', '', '1995-06-19 00:00:00', '1995-06-19 00:00:00', '2004-02-08 03:18:20', '2004-02-08 03:17:45', '1');
INSERT INTO `journeys` VALUES ('156', '1', '81', '74', '', '', 'Virgin', 'Economy', '', '1996-06-14 00:00:00', '1996-06-14 00:00:00', '2004-02-08 03:34:42', '2004-02-08 03:34:42', '1');
INSERT INTO `journeys` VALUES ('157', '1', '74', '81', '', '', 'Virgin', 'Economy', '', '1996-09-01 00:00:00', '1996-09-01 00:00:00', '2004-02-08 03:35:56', '2004-02-08 03:34:45', '1');
INSERT INTO `journeys` VALUES ('158', '1', '48', '59', '', 'QF11', 'Qantas', 'Economy', '', '2004-05-27 13:25:00', '2004-05-27 09:45:00', '2004-07-04 18:45:58', '2004-07-04 18:00:54', '1');
INSERT INTO `journeys` VALUES ('159', '1', '59', '65', 'Seat 26A, Gate 48A', 'AA1038', 'American Airlines', 'Economy', '', '2004-05-27 10:05:00', '2004-05-27 11:13:00', '2004-07-04 19:03:10', '2004-07-04 18:01:25', '1');
INSERT INTO `journeys` VALUES ('160', '6', '65', '113', 'By car to the town of Rachael via the extraterestrial highway!', '', '', '', '', '2004-06-06 09:30:00', '2004-06-06 13:30:00', '2004-07-04 18:49:11', '2004-07-04 18:06:19', '1');
INSERT INTO `journeys` VALUES ('161', '6', '113', '64', 'By car to the town of Rachael via the extraterestrial highway!', '', '', '', '', '2004-06-06 14:30:00', '2004-06-06 22:00:00', '2004-07-04 18:50:06', '2004-07-04 18:06:47', '1');
INSERT INTO `journeys` VALUES ('162', '1', '64', '63', 'By car to the twon of Rachael via the extraterestrial highway!', '315', 'American West', 'Economy', '', '2004-06-12 06:30:00', '2004-06-12 08:10:00', '2004-07-04 18:52:57', '2004-07-04 18:07:02', '1');
INSERT INTO `journeys` VALUES ('163', '1', '74', '80', 'Exit seat 67c, 6 hours 45 min flight.', 'AI112', 'Air India', 'Economy', '', '2004-06-14 20:10:00', '2004-06-15 07:55:00', '2004-07-04 18:43:32', '2004-07-04 18:10:03', '1');
INSERT INTO `journeys` VALUES ('164', '1', '80', '110', '', 'TP397', 'TAP', 'Economy', '', '2004-06-23 06:40:00', '2004-06-23 09:20:00', '2004-07-04 18:36:25', '2004-07-04 18:11:25', '1');
INSERT INTO `journeys` VALUES ('165', '1', '111', '112', 'Seat 17a', 'TP581', 'TAP', 'Economy', '', '2004-06-25 09:25:00', '2004-06-25 10:25:00', '2004-07-04 18:15:46', '2004-07-04 18:11:53', '1');
INSERT INTO `journeys` VALUES ('166', '1', '112', '80', '', '', 'TAP', 'Economy', '', '2004-06-25 16:00:00', '2004-06-25 18:30:00', '2004-07-04 19:04:43', '2004-07-04 18:12:17', '1');
INSERT INTO `journeys` VALUES ('167', '1', '80', '26', 'Got moved to two great window seats (53b and 53c) from 49f which was in the middle aisle and horrible!', 'BA015', 'BA', 'Economy', '', '2004-06-25 21:50:00', '2004-06-26 20:00:00', '2004-07-04 18:18:14', '2004-07-04 18:12:43', '1');
INSERT INTO `journeys` VALUES ('168', '1', '26', '48', 'Seat 49f, wasn\'t a;;pwed to keep two window seats - gutted!', 'BA15', 'BA', 'Economy', '', '2004-06-26 21:00:00', '2004-06-27 05:15:00', '2004-07-04 19:11:20', '2004-07-04 18:12:59', '1');
INSERT INTO `journeys` VALUES ('169', '3', '110', '111', 'Euro 14:50, 11 am bus was full which meant I would be late arriving in Lisbon!', '', 'Rede Expressos', 'Economy', '', '2004-06-23 12:15:00', '2004-06-23 17:15:00', '2004-07-04 18:39:01', '2004-07-04 18:39:01', '1');
INSERT INTO `journeys` VALUES ('170', '1', '63', '74', 'JFK Airport', '12', 'American West', 'Economy', '', '2004-06-12 09:13:00', '2004-06-12 17:25:00', '2004-07-04 18:57:44', '2004-07-04 18:57:44', '1');
INSERT INTO `journeys` VALUES ('171', '1', '48', '114', '', '', 'Qantas', 'Economy', '', '2004-12-13 12:00:00', '2004-12-13 12:00:00', '2005-03-05 18:21:47', '2005-03-05 18:21:47', '1');
INSERT INTO `journeys` VALUES ('172', '1', '114', '115', '', '', 'Qantas', 'Economy', '', '2004-12-15 12:00:00', '2004-12-15 12:00:00', '2005-03-05 18:22:33', '2005-03-05 18:22:33', '1');
INSERT INTO `journeys` VALUES ('173', '1', '115', '116', '', '', 'Qantas', 'Economy', '', '2004-12-15 12:00:00', '2004-12-15 12:00:00', '2005-03-05 18:23:37', '2005-03-05 18:23:37', '1');
INSERT INTO `journeys` VALUES ('174', '1', '116', '117', '', '', 'Royal Brunei', 'Economy', '', '2004-12-17 12:00:00', '2004-12-17 12:00:00', '2005-03-05 18:24:29', '2005-03-05 18:24:29', '1');
INSERT INTO `journeys` VALUES ('175', '5', '117', '118', '', '', '', '', '', '2004-12-19 12:00:00', '2004-12-19 12:00:00', '2005-03-05 18:25:33', '2005-03-05 18:25:33', '1');
INSERT INTO `journeys` VALUES ('176', '1', '118', '119', '', '', 'Royal Brunei', 'Economy', '', '2004-12-21 12:00:00', '2004-12-21 12:00:00', '2005-03-05 18:26:59', '2005-03-05 18:26:59', '1');
INSERT INTO `journeys` VALUES ('177', '1', '119', '118', '', '', 'Royal Brunei', 'Business', '', '2004-12-21 12:00:00', '2004-12-21 12:00:00', '2005-03-05 18:28:57', '2005-03-05 18:27:33', '1');
INSERT INTO `journeys` VALUES ('178', '1', '118', '117', '', '', 'Royal Brunei', 'Economy', '', '2004-12-23 12:00:00', '2004-12-23 12:00:00', '2005-03-05 18:28:36', '2005-03-05 18:28:36', '1');
INSERT INTO `journeys` VALUES ('179', '1', '117', '36', '', '', 'Royal Brunei', 'Economy', '', '2004-12-23 12:00:00', '2004-12-23 12:00:00', '2005-03-05 18:30:01', '2005-03-05 18:30:01', '1');
INSERT INTO `journeys` VALUES ('180', '1', '36', '40', '', '', 'Cathy Pacific', 'Economy', '', '2005-01-19 12:00:00', '2005-01-19 12:00:00', '2006-05-13 19:10:45', '2005-03-05 18:31:55', '1');
INSERT INTO `journeys` VALUES ('181', '1', '40', '120', '', '', 'Cathy Pacific', 'Economy', '', '2005-01-19 12:00:00', '2005-01-19 12:00:00', '2006-05-13 19:10:24', '2005-03-05 18:32:36', '1');
INSERT INTO `journeys` VALUES ('182', '3', '38', '121', '', '', 'Private Tour Bus', '', '', '2005-03-24 09:00:00', '2005-03-24 18:00:00', '2006-05-13 19:07:14', '2005-08-04 14:48:10', '1');
INSERT INTO `journeys` VALUES ('183', '3', '121', '38', '', '', 'Private Tour Bus', '', '', '2005-03-28 09:00:00', '2005-03-28 18:00:00', '2006-05-13 19:06:54', '2005-08-04 14:48:43', '1');
INSERT INTO `journeys` VALUES ('184', '1', '120', '40', '', '', 'Cathy Pacific', 'Economy', '', '2005-02-11 12:00:00', '2005-02-11 14:00:00', '2006-05-13 19:09:56', '2005-08-04 14:52:50', '1');
INSERT INTO `journeys` VALUES ('185', '1', '40', '36', '', '', 'Cathy Pacific', 'Economy', '', '2005-02-11 15:00:00', '2005-02-11 17:00:00', '2006-05-13 19:07:31', '2005-08-04 14:53:17', '1');
INSERT INTO `journeys` VALUES ('186', '1', '36', '80', 'Gatwick', '', 'Phuket Air?', 'Economy', '', '2005-04-06 22:00:00', '2005-04-07 08:00:00', '2006-05-13 19:06:40', '2005-08-04 14:57:49', '1');
INSERT INTO `journeys` VALUES ('187', '1', '81', '74', 'Newark', '', 'Continental', 'Economy', '', '2005-05-06 12:00:00', '2005-05-06 14:00:00', '2006-06-18 12:01:06', '2005-08-04 14:59:39', '1');
INSERT INTO `journeys` VALUES ('188', '1', '74', '65', '', '', 'Continental', 'Economy', '', '2005-05-11 12:00:00', '2005-05-11 14:00:00', '2006-06-18 12:01:41', '2005-08-04 15:00:47', '1');
INSERT INTO `journeys` VALUES ('189', '6', '65', '64', 'Car Rental with James, Michelle and Mark.', '', '', '', '', '2005-06-05 14:00:00', '2005-06-05 23:00:00', '2006-06-18 12:01:55', '2005-08-04 15:02:45', '1');
INSERT INTO `journeys` VALUES ('190', '3', '64', '122', '', '', 'Greyhound', '', '', '2005-06-13 12:00:00', '2005-06-13 15:00:00', '2006-06-18 12:02:10', '2005-08-04 15:05:21', '1');
INSERT INTO `journeys` VALUES ('191', '6', '122', '60', 'Rental Car with Saun Budd Jenny M, and John Wimms.', '', '', '', '', '2005-06-20 13:00:00', '2005-06-20 15:00:00', '2006-06-18 12:02:24', '2005-08-04 15:09:30', '1');
INSERT INTO `journeys` VALUES ('192', '1', '60', '123', '', '', 'China Airlines', 'Economy', '', '2005-06-22 23:00:00', '2005-06-24 08:00:00', '2006-06-18 12:02:38', '2005-08-04 15:10:50', '1');
INSERT INTO `journeys` VALUES ('193', '1', '123', '124', '', '', 'China Airlines', 'Economy', '', '2005-06-24 10:00:00', '2005-06-24 12:00:00', '2006-06-18 12:03:15', '2005-08-04 15:12:05', '1');
INSERT INTO `journeys` VALUES ('194', '4', '124', '123', 'Delayed by an hour so got into Taipei quite late', '', '', 'Economy', '', '2005-07-10 11:00:00', '2005-07-10 18:00:00', '2006-06-18 13:04:26', '2005-08-04 15:14:03', '1');
INSERT INTO `journeys` VALUES ('195', '1', '123', '125', 'Got times mixed up so didn\'t get picked up by UPA rep, therefore got to hotel very late after waiting at the airport for a while to be picked up. Then found I was sharing a room with Mike Davis!!!', '', 'Asiana', 'Economy', '', '2005-07-11 14:00:00', '2005-07-11 21:00:00', '2006-06-18 13:04:55', '2005-08-04 15:15:48', '1');
INSERT INTO `journeys` VALUES ('196', '1', '125', '126', '', '', 'Asiana', 'Economy', '', '2005-07-22 12:00:00', '2005-07-22 16:00:00', '2006-06-18 13:05:22', '2005-08-04 15:17:49', '1');
INSERT INTO `journeys` VALUES ('197', '1', '126', '127', 'Flight was redirected and had to land in ChunJing 3 hours drive outside Shanghai. Also turbulance was very bad and plane was making some very straange creaking noises! What should have been a 90 min flight took 9 hours! :(', '', 'China Airlines', 'Economy', '', '2005-07-30 13:30:00', '2005-07-30 23:00:00', '2006-06-18 13:05:55', '2005-08-04 15:20:13', '1');
INSERT INTO `journeys` VALUES ('198', '1', '127', '40', '', '', 'China Eastern', 'Economy', '', '2005-08-03 13:00:00', '2005-08-03 15:00:00', '2006-06-18 13:06:21', '2005-08-04 15:21:36', '1');
INSERT INTO `journeys` VALUES ('199', '1', '40', '123', 'Seat 6K Exit, Gate 29 (changed to Gate 23)', 'CI 0680', 'China Airlines', 'Economy', '', '2005-08-04 13:30:00', '2005-08-04 15:00:00', '2006-06-18 13:06:35', '2005-08-04 15:23:07', '1');
INSERT INTO `journeys` VALUES ('200', '1', '123', '60', '', '', 'China Airlines', 'Economy', '', '2005-08-04 18:00:00', '2005-08-04 15:00:00', '2006-06-18 13:06:55', '2005-08-04 15:23:50', '1');
INSERT INTO `journeys` VALUES ('201', '1', '60', '74', '', '', 'Continental', 'Economy', '', '2005-08-04 21:00:00', '2005-08-04 06:00:00', '2006-06-18 13:08:38', '2005-10-17 21:00:09', '1');
INSERT INTO `journeys` VALUES ('202', '1', '74', '81', '', '', '', 'Economy', '', '2005-08-15 21:00:00', '2005-08-16 06:00:00', '2006-06-18 13:08:51', '2005-10-17 21:00:25', '1');
INSERT INTO `journeys` VALUES ('203', '1', '80', '131', '', '', 'Ryan Air', 'Economy', '', '2005-09-07 21:03:00', '2005-09-07 21:03:00', '2006-05-13 19:06:12', '2005-10-17 21:04:47', '1');
INSERT INTO `journeys` VALUES ('204', '1', '131', '80', '', '', 'Ryan Air', 'Economy', '', '2005-09-12 07:30:00', '2005-09-12 07:30:00', '2006-05-13 19:05:50', '2005-10-17 21:06:58', '1');
INSERT INTO `journeys` VALUES ('205', '1', '80', '74', '', '', 'BA', 'Economy', '', '2005-09-12 21:00:00', '2005-09-12 21:00:00', '2006-05-13 19:05:31', '2005-10-17 21:10:18', '1');
INSERT INTO `journeys` VALUES ('207', '6', '74', '132', '', '', '', '', '', '2005-09-16 13:00:00', '2005-09-16 23:00:00', '2006-05-13 19:05:12', '2005-10-17 21:20:09', '1');
INSERT INTO `journeys` VALUES ('208', '6', '132', '133', '', '', '', '', '', '2005-09-18 15:00:00', '2005-09-18 19:00:00', '2006-05-13 19:04:51', '2005-10-17 21:21:04', '1');
INSERT INTO `journeys` VALUES ('209', '4', '133', '134', '', '', 'Amtrak', 'Economy', '', '2005-09-26 07:30:00', '2005-09-26 13:00:00', '2006-05-13 19:04:31', '2005-10-17 21:24:44', '1');
INSERT INTO `journeys` VALUES ('210', '4', '134', '74', '', '', 'Amtrak', 'Economy', '', '2005-09-26 17:30:00', '2005-09-26 21:00:00', '2006-05-13 19:03:58', '2005-10-17 21:25:47', '1');
INSERT INTO `journeys` VALUES ('211', '1', '74', '80', '', '', 'BA', 'Economy', '', '2005-09-28 23:00:00', '2005-09-29 06:30:00', '2006-05-13 19:03:33', '2005-10-17 21:38:44', '1');
INSERT INTO `journeys` VALUES ('212', '1', '88', '135', '', 'EZY6503', 'Easy Jet', 'Economy', '', '2006-01-18 19:00:00', '2006-04-18 22:00:00', '2006-04-17 21:23:47', '2006-04-17 21:23:47', '1');
INSERT INTO `journeys` VALUES ('213', '1', '135', '88', '', 'EZY6504', 'Easy Jet', 'Economy', '', '2006-01-23 21:40:00', '2006-04-23 23:40:00', '2006-04-17 21:24:50', '2006-04-17 21:24:50', '1');
INSERT INTO `journeys` VALUES ('214', '1', '80', '136', '', 'FR168', 'Ryan Air', 'Economy', '', '2006-04-09 11:10:00', '2006-04-09 14:00:00', '2006-04-17 21:27:09', '2006-04-17 21:27:09', '1');
INSERT INTO `journeys` VALUES ('215', '4', '136', '139', '', '', '', 'Economy', '', '2006-04-09 17:50:00', '2006-04-09 17:40:00', '2006-04-17 21:36:04', '2006-04-17 21:36:04', '1');
INSERT INTO `journeys` VALUES ('216', '4', '139', '137', '', '', '', 'Economy', '', '2006-04-12 10:28:00', '2006-04-12 12:57:00', '2006-04-17 21:38:19', '2006-04-17 21:38:19', '1');
INSERT INTO `journeys` VALUES ('217', '4', '137', '138', '', '', '', 'Economy', '', '2006-04-15 11:27:00', '2006-04-15 14:04:00', '2006-04-17 21:42:00', '2006-04-17 21:42:00', '1');
INSERT INTO `journeys` VALUES ('218', '4', '138', '137', '', '', '', 'Economy', '', '2006-04-15 20:40:00', '2006-04-15 22:04:00', '2006-04-17 21:42:59', '2006-04-17 21:42:59', '1');
INSERT INTO `journeys` VALUES ('219', '1', '136', '80', '', 'FR169', 'Ryan Air', 'Economy', '', '2006-04-16 14:35:00', '2006-04-16 17:00:00', '2006-04-17 21:46:42', '2006-04-17 21:46:42', '1');
INSERT INTO `journeys` VALUES ('220', '1', '80', '141', '', 'FR 9774', 'Ryan Air', 'Economy', '', '2006-05-03 16:00:00', '2006-05-03 18:30:00', '2006-05-13 19:18:01', '2006-05-13 19:15:16', '1');
INSERT INTO `journeys` VALUES ('221', '1', '141', '80', '', 'FR 9775', 'Ryan Air', 'Economy', '', '2006-05-07 18:55:00', '2006-05-07 19:20:00', '2006-05-13 19:16:25', '2006-05-13 19:16:25', '1');
INSERT INTO `journeys` VALUES ('222', '4', '141', '142', '', '', 'Die Bahn', 'Economy', '', '2006-05-03 19:30:00', '2006-05-03 22:00:00', '2006-05-13 19:26:17', '2006-05-13 19:20:45', '1');
INSERT INTO `journeys` VALUES ('223', '4', '142', '141', '', '', 'Die Bahn', 'Economy', '', '2006-05-07 15:00:00', '2006-05-07 17:30:00', '2006-05-13 19:25:51', '2006-05-13 19:24:47', '1');
INSERT INTO `journeys` VALUES ('224', '1', '80', '74', 'Heathrow to JFK', '', 'BA', 'Economy', '', '2006-05-27 13:30:00', '2006-05-27 18:00:00', '2006-06-18 13:23:38', '2006-06-18 13:23:38', '1');
INSERT INTO `journeys` VALUES ('225', '1', '74', '80', 'JFK to Heathrow, stayed night in stansted airport Holiday Inn Express Hotel for flight to Austria early next morning.', '', 'BA', 'Economy', '', '2006-06-05 20:30:00', '2006-06-06 05:30:00', '2006-06-18 13:26:36', '2006-06-18 13:25:40', '1');
INSERT INTO `journeys` VALUES ('226', '1', '80', '145', 'From Stansted', '', 'Ryan Air', 'Economy', '', '2006-06-07 07:30:00', '2006-06-07 11:00:00', '2006-06-18 18:22:22', '2006-06-18 18:22:22', '1');
INSERT INTO `journeys` VALUES ('227', '1', '145', '80', 'From Stansted', '', 'Ryan Air', 'Economy', '', '2006-06-11 10:30:00', '2006-06-11 11:15:00', '2006-06-18 18:24:29', '2006-06-18 18:24:29', '1');
INSERT INTO `journeys` VALUES ('228', '6', '145', '143', 'Shared Taxi with other players, only 15 Euros!', '', '', '', '', '2006-06-07 12:00:00', '2006-06-07 13:00:00', '2006-06-18 18:27:44', '2006-06-18 18:27:44', '1');
INSERT INTO `journeys` VALUES ('229', '4', '143', '145', 'Shared Taxi with other players, only 15 Euros!', '', '', 'Economy', '', '2006-06-11 07:15:00', '2006-06-11 09:30:00', '2006-06-18 18:29:01', '2006-06-18 18:29:01', '1');
INSERT INTO `journeys` VALUES ('230', '6', '143', '144', 'No Sho from AZ Billiards drove me over the border to watch England v Paruguay in the 2006 world cup in a pool hall.', '', '', '', '', '2006-06-10 15:00:00', '2006-06-10 15:30:00', '2006-06-18 18:31:40', '2006-06-18 18:31:40', '1');
INSERT INTO `journeys` VALUES ('231', '6', '144', '143', 'No Sho from AZ Billiards drove me over the border to watch England v Paruguay in the 2006 world cup in a pool hall.', '', '', '', '', '2006-06-10 17:30:00', '2006-06-10 18:30:00', '2006-06-18 18:32:33', '2006-06-18 18:32:33', '1');
INSERT INTO `journeys` VALUES ('232', '1', '81', '17', 'Seat 18F', 'LX395', 'Swiss Air', 'Economy', '', '2006-10-04 13:05:00', '2006-10-04 16:30:00', '2006-10-29 19:03:44', '2006-10-26 07:51:45', '1');
INSERT INTO `journeys` VALUES ('233', '1', '17', '81', '', '', 'Swiss Air', 'Economy', '', '2006-10-08 13:00:00', '2006-10-08 14:00:00', '2006-10-26 07:52:13', '2006-10-26 07:52:13', '1');
INSERT INTO `journeys` VALUES ('234', '1', '88', '147', '', '', 'Easy Jet', 'Economy', '', '2006-12-06 15:00:00', '2006-12-06 17:00:00', '2007-01-15 17:38:32', '2007-01-15 17:38:32', '1');
INSERT INTO `journeys` VALUES ('235', '1', '147', '88', '', '', 'Easy Jet', 'Economy', '', '2006-12-10 19:30:00', '2006-12-10 22:30:00', '2007-01-15 17:39:23', '2007-01-15 17:39:23', '1');
INSERT INTO `journeys` VALUES ('236', '1', '88', '146', '', '', 'Ryan Air', 'Economy', '', '2007-01-12 11:20:00', '2007-01-12 15:00:00', '2007-01-15 17:41:44', '2007-01-15 17:41:44', '1');
INSERT INTO `journeys` VALUES ('237', '1', '146', '88', '', '', 'Ryan Air', 'Economy', '', '2007-01-14 15:10:00', '2007-01-14 16:30:00', '2007-01-15 17:42:58', '2007-01-15 17:42:58', '1');
INSERT INTO `journeys` VALUES ('238', '1', '91', '148', '40 quid excess grrrr, plus ROma ultras!', 'FR568', 'Ryan Air', 'Economy', '', '2007-04-11 08:35:00', '2007-04-11 12:10:00', '2007-05-01 00:43:30', '2007-05-01 00:43:30', '1');
INSERT INTO `journeys` VALUES ('239', '4', '148', '149', '', '527', '', '2nd', '', '2007-04-11 17:00:00', '2007-04-11 22:36:00', '2007-05-01 00:45:41', '2007-05-01 00:45:41', '1');
INSERT INTO `journeys` VALUES ('240', '1', '5', '80', '', '5256', 'Easy Jet', 'Economy', '', '2007-04-15 20:40:00', '2007-04-15 22:00:00', '2007-05-01 00:53:35', '2007-05-01 00:53:35', '1');
INSERT INTO `journeys` VALUES ('241', '1', '80', '150', 'delayed by 2 hours! :(', '29', 'Virgin', 'Economy', '', '2007-04-16 10:00:00', '2007-04-16 13:00:00', '2007-05-01 01:04:20', '2007-05-01 01:04:20', '1');
INSERT INTO `journeys` VALUES ('242', '1', '150', '151', '', '', 'LIAT', 'Economy', '', '2007-04-18 08:00:00', '2007-04-18 08:55:00', '2007-05-01 01:09:59', '2007-05-01 01:09:59', '1');
INSERT INTO `journeys` VALUES ('247', '1', '150', '151', '', '', 'Air Jamaica', 'Economy', '', '2007-05-02 14:00:00', '2007-05-02 14:45:00', '2007-05-23 14:48:14', '2007-05-23 14:46:12', '1');
INSERT INTO `journeys` VALUES ('244', '1', '151', '150', '', '', 'LIAT', 'Economy', '', '2007-04-20 20:55:00', '2007-04-20 21:50:00', '2007-05-01 01:17:05', '2007-05-01 01:17:05', '1');
INSERT INTO `journeys` VALUES ('245', '1', '150', '152', '', '768', 'LIAT', 'Economy', '', '2007-04-23 19:40:00', '2007-04-23 20:35:00', '2007-05-01 01:20:25', '2007-05-01 01:20:25', '1');
INSERT INTO `journeys` VALUES ('246', '1', '152', '150', 'delayed until 1pm, put on different flight missed it, put on another to Barbados not via St Vincent. Lost bags again! but turned up in Barbados little later.', '768', 'LIAT', 'Economy', '', '2007-04-27 09:10:00', '2007-04-27 10:15:00', '2007-05-01 01:22:56', '2007-05-01 01:22:56', '1');
INSERT INTO `journeys` VALUES ('248', '1', '151', '154', '', '', 'Air Jamaica', 'Economy', '', '2007-05-02 15:00:00', '2007-05-02 17:00:00', '2007-05-23 14:47:51', '2007-05-23 14:47:51', '1');
INSERT INTO `journeys` VALUES ('249', '6', '154', '156', '', '', '', '', '', '2007-05-02 17:30:00', '2007-05-02 19:00:00', '2007-05-23 14:50:47', '2007-05-23 14:50:47', '1');
INSERT INTO `journeys` VALUES ('250', '3', '156', '162', '', '', '', '', '', '2007-05-09 09:30:00', '2007-05-09 12:00:00', '2007-05-23 14:51:45', '2007-05-23 14:51:45', '1');
INSERT INTO `journeys` VALUES ('251', '3', '162', '156', '', '', '', '', '', '2007-05-09 16:30:00', '2007-05-09 20:00:00', '2007-05-23 14:52:47', '2007-05-23 14:52:47', '1');
INSERT INTO `journeys` VALUES ('252', '3', '156', '154', '', '', '', '', '', '2007-05-11 09:00:00', '2007-05-11 10:30:00', '2007-05-23 14:53:37', '2007-05-23 14:53:37', '1');
INSERT INTO `journeys` VALUES ('253', '1', '154', '155', '', '', 'Air Jamaica', 'Economy', '', '2007-05-11 12:30:00', '2007-05-11 13:30:00', '2007-05-23 14:54:42', '2007-05-23 14:54:42', '1');
INSERT INTO `journeys` VALUES ('254', '1', '155', '76', '', '', 'Air Jamaica', 'Economy', '', '2007-05-11 14:30:00', '2007-05-11 16:30:00', '2007-05-23 14:55:25', '2007-05-23 14:55:25', '1');
INSERT INTO `journeys` VALUES ('255', '1', '76', '65', '', '', 'AA', 'Economy', '', '2007-05-11 19:30:00', '2007-05-11 22:30:00', '2007-05-23 14:56:06', '2007-05-23 14:56:06', '1');
INSERT INTO `journeys` VALUES ('256', '1', '65', '158', '', '', 'US Airways', 'Economy', '', '2007-05-21 23:50:00', '2007-05-22 06:59:00', '2007-05-23 14:57:28', '2007-05-23 14:57:28', '1');
INSERT INTO `journeys` VALUES ('257', '1', '158', '160', '', '', 'US Airways', 'Economy', '', '2007-05-22 08:00:00', '2007-05-22 08:50:00', '2007-05-23 14:58:44', '2007-05-23 14:58:44', '1');
INSERT INTO `journeys` VALUES ('258', '1', '160', '158', '', '', 'US Airways', 'Economy', '', '2007-05-22 19:30:00', '2007-05-22 21:10:00', '2007-06-05 01:21:48', '2007-06-05 01:21:48', '1');
INSERT INTO `journeys` VALUES ('259', '1', '158', '65', '', '', 'US Airways', 'Economy', '', '2007-05-22 21:30:00', '2007-05-22 21:10:00', '2007-06-05 01:22:44', '2007-06-05 01:22:44', '1');
INSERT INTO `journeys` VALUES ('260', '1', '65', '59', '', '', 'US Airways', 'Economy', '', '2007-06-03 11:50:00', '2007-06-03 13:15:00', '2007-06-05 01:23:42', '2007-06-05 01:23:42', '1');
INSERT INTO `journeys` VALUES ('261', '1', '59', '82', '', '', 'Delta', 'Economy', '', '2007-06-03 23:50:00', '2007-06-04 05:10:00', '2007-06-05 01:24:40', '2007-06-05 01:24:40', '2');
INSERT INTO `journeys` VALUES ('262', '1', '59', '167', '', '', '', 'Economy', '', '2007-06-03 23:59:00', '2007-06-04 06:00:00', '2008-01-07 18:31:33', '2008-01-07 18:31:33', '1');
INSERT INTO `journeys` VALUES ('263', '3', '167', '168', '', '', '', 'Economy', '', '2007-06-04 07:00:00', '2007-06-04 08:00:00', '2008-01-07 18:32:36', '2008-01-07 18:32:36', '1');
INSERT INTO `journeys` VALUES ('264', '3', '168', '169', '', '', '', 'Economy', '', '2007-06-11 20:00:00', '2007-06-12 08:00:00', '2008-01-07 18:34:00', '2008-01-07 18:34:00', '1');
INSERT INTO `journeys` VALUES ('265', '3', '169', '170', '', '', '', 'Economy', '', '2007-06-13 09:00:00', '2007-06-13 10:00:00', '2008-01-07 18:37:01', '2008-01-07 18:37:01', '1');
INSERT INTO `journeys` VALUES ('266', '3', '170', '169', '', '', '', 'Economy', '', '2007-06-14 13:00:00', '2007-06-14 14:00:00', '2008-01-07 18:37:39', '2008-01-07 18:37:39', '1');
INSERT INTO `journeys` VALUES ('267', '3', '169', '163', '', '', '', 'Economy', '', '2007-06-15 09:00:00', '2007-06-15 13:00:00', '2008-01-07 18:39:08', '2008-01-07 18:39:08', '1');
INSERT INTO `journeys` VALUES ('268', '5', '163', '164', '', '', '', 'Economy', '', '2007-06-15 14:00:00', '2007-06-15 15:00:00', '2008-01-07 18:39:52', '2008-01-07 18:39:52', '1');
INSERT INTO `journeys` VALUES ('269', '5', '164', '165', '', '', '', 'Economy', '', '2007-06-19 12:00:00', '2007-06-19 13:00:00', '2008-01-07 18:40:55', '2008-01-07 18:40:55', '1');
INSERT INTO `journeys` VALUES ('270', '5', '165', '166', '', '', '', 'Economy', '', '2007-06-21 09:00:00', '2007-06-21 10:00:00', '2008-01-07 18:42:08', '2008-01-07 18:42:08', '1');
INSERT INTO `journeys` VALUES ('271', '3', '166', '174', '', '', '', 'Economy', '', '2007-06-21 11:00:00', '2007-06-21 17:00:00', '2008-01-07 18:43:14', '2008-01-07 18:43:14', '1');
INSERT INTO `journeys` VALUES ('272', '3', '174', '173', '', '', '', 'Economy', '', '2007-06-29 13:00:00', '2007-06-29 14:00:00', '2008-01-07 18:44:40', '2008-01-07 18:44:40', '1');
INSERT INTO `journeys` VALUES ('273', '1', '173', '73', 'missed flight waiting in wrong terminal after it had been delayed! Still caught connection in Philedelphia but they lost bags! :(', '804', 'US Airways', 'Economy', '', '2007-07-01 11:35:00', '2007-07-01 16:15:00', '2008-01-07 18:52:58', '2008-01-07 18:46:51', '1');
INSERT INTO `journeys` VALUES ('274', '1', '73', '178', 'Was delayed got to Toronto very late, passde midnight so had to pay for taxi! :(', '1649', 'US Airways', 'Economy', '', '2007-07-01 20:05:00', '2007-07-01 21:37:00', '2008-01-07 18:53:40', '2008-01-07 18:50:25', '1');
INSERT INTO `journeys` VALUES ('275', '3', '178', '179', 'Massively sprained ankle walking from bus station to Niagra Falls! :(', '', '', '', '', '2007-07-02 10:00:00', '2007-07-02 12:00:00', '2008-01-07 19:08:46', '2008-01-07 18:57:52', '1');
INSERT INTO `journeys` VALUES ('276', '3', '179', '178', 'Massively sprained ankle walking from bus station to Niagra Falls! :(', '', '', '', '', '2007-07-02 17:00:00', '2007-07-02 18:00:00', '2008-01-07 19:09:35', '2008-01-07 18:58:23', '1');
INSERT INTO `journeys` VALUES ('277', '1', '178', '74', '', 'AC720', 'Air Canada', 'Economy', '', '2007-07-03 17:15:00', '2007-07-03 18:43:00', '2008-01-07 19:07:20', '2008-01-07 19:04:26', '1');
INSERT INTO `journeys` VALUES ('278', '1', '74', '80', 'JFk to Heathrow', 'VS46', 'Virgin', 'Economy', '', '2007-07-16 19:50:00', '2007-07-17 07:45:00', '2008-01-07 19:06:36', '2008-01-07 19:06:36', '1');
INSERT INTO `journeys` VALUES ('279', '1', '80', '40', 'Heathrow', 'BA0031', 'BA', 'Economy', '', '2007-12-27 20:25:00', '2007-12-28 16:15:00', '2008-01-07 19:12:04', '2008-01-07 19:12:04', '1');
INSERT INTO `journeys` VALUES ('280', '5', '40', '172', 'Couldnt get boat from airport because already passed through immigration! :(\r\nHad to get taxi to HK ferry terminal instead grrr.', '', 'TurboCat', 'Economy', '', '2007-12-28 18:00:00', '2007-12-28 19:00:00', '2008-01-07 19:13:40', '2008-01-07 19:13:40', '1');
INSERT INTO `journeys` VALUES ('281', '1', '172', '36', 'Flight delayed 2 hours! :(', 'FD3603', 'Air Asia', 'Economy', '', '2007-12-29 14:10:00', '2007-12-29 16:00:00', '2008-01-07 19:15:43', '2008-01-07 19:15:43', '1');
INSERT INTO `journeys` VALUES ('282', '1', '36', '176', '', 'FD3616', 'Air Asia', 'Economy', '', '2007-12-30 15:10:00', '2007-12-30 16:20:00', '2008-01-07 19:17:00', '2008-01-07 19:17:00', '1');
INSERT INTO `journeys` VALUES ('283', '1', '176', '175', '', '', 'Vietnam Air', 'Economy', '', '2008-01-05 18:50:00', '2008-01-05 19:40:00', '2008-01-07 19:18:31', '2008-01-07 19:18:31', '1');
INSERT INTO `mod_gallery` VALUES ('18', 'Shanghai, China, 2005', 'Shanghai, China, 2005', 'small_DSC03485.JPG', 'large_DSC03485.JPG', '118', '0', '0', '0', '1', '1', '2005-07-01 00:00:00', '2006-09-17 02:21:50', '2006-10-10 12:50:28', '1');
INSERT INTO `mod_gallery` VALUES ('16', 'Shanghai, China, 2005', 'Shanghai, China, 2005', 'small_DSC03463.JPG', 'large_DSC03463.JPG', '118', '0', '0', '0', '1', '1', '2005-07-01 00:00:00', '2006-09-17 02:16:28', '2006-10-10 12:49:06', '1');
INSERT INTO `mod_gallery` VALUES ('17', 'Shanghai, China, 2005', 'Me,Colin', 'small_DSC03030.JPG', 'large_DSC03030.JPG', '118', '0', '0', '0', '1', '1', '2005-07-01 00:00:00', '2006-09-17 02:19:26', '2006-10-10 12:50:50', '1');
INSERT INTO `mod_gallery` VALUES ('8', 'bbb', null, 'small_Ebola - 07702388.jpg', 'large_Ebola - 07702388.jpg', '222', '0', '0', '0', '1', '1', '2006-09-13 00:00:00', '2006-09-13 09:31:33', '2006-09-13 09:31:33', '3');
INSERT INTO `mod_gallery` VALUES ('15', 'Shanghai, China, 2005', 'Shanghai, China, 2005', 'small_DSC03089.JPG', 'large_DSC03089.JPG', '118', '0', '0', '1', '1', '1', '2005-07-01 00:00:00', '2006-09-17 02:14:53', '2006-10-10 12:48:51', '1');
INSERT INTO `mod_gallery` VALUES ('19', 'Shanghai, China, 2005', 'Shanghai, China, 2005', 'small_DSC03533.JPG', 'large_DSC03533.JPG', '118', '0', '0', '0', '1', '1', '2005-07-01 00:00:00', '2006-09-17 02:23:47', '2006-10-10 12:49:19', '1');
INSERT INTO `mod_gallery` VALUES ('20', 'Grimsby, 2006', 'Rob', 'small_DSC05019.JPG', 'large_DSC05019.JPG', '235', '0', '0', '0', '1', '1', '2006-09-01 00:00:00', '2006-09-30 14:07:05', '2006-10-10 12:38:40', '1');
INSERT INTO `mod_gallery` VALUES ('21', 'Grimsby, 2006', 'Nat,Becca,Becky', 'small_DSC05006.JPG', 'large_DSC05006.JPG', '235', '0', '0', '0', '1', '1', '2006-09-01 00:00:00', '2006-09-30 14:09:11', '2006-10-10 12:28:25', '1');
INSERT INTO `mod_gallery` VALUES ('22', 'Grimsby, 2006', 'Nat,Becky', 'small_DSC05005.JPG', 'large_DSC05005.JPG', '235', '0', '0', '0', '1', '1', '2006-09-01 00:00:00', '2006-09-30 14:10:23', '2006-10-10 12:37:22', '1');
INSERT INTO `mod_gallery` VALUES ('23', 'Grimsby, 2006', 'Nat, Becky', 'small_DSC05004.JPG', 'large_DSC05004.JPG', '235', '0', '0', '0', '1', '1', '2006-09-01 00:00:00', '2006-09-30 14:11:03', '2006-10-10 12:36:55', '1');
INSERT INTO `mod_gallery` VALUES ('24', 'Grimsby, 2006', '', 'small_DSC05008.JPG', 'large_DSC05008.JPG', '235', '0', '0', '0', '1', '1', '2006-09-30 00:00:00', '2006-09-30 14:11:41', '2006-09-30 16:49:26', '2');
INSERT INTO `mod_gallery` VALUES ('25', 'Grimsby, 2006', 'Becky,Nat,Becca', 'small_DSC05011.JPG', 'large_DSC05011.JPG', '235', '0', '0', '0', '1', '1', '2006-09-01 00:00:00', '2006-09-30 14:12:08', '2006-10-10 12:36:29', '1');
INSERT INTO `mod_gallery` VALUES ('26', 'Grimsby, 2006', 'Nat, Me', 'small_DSC05013.JPG', 'large_DSC05013.JPG', '235', '0', '0', '0', '1', '1', '2006-09-01 00:00:00', '2006-09-30 16:36:50', '2006-10-10 12:19:26', '1');
INSERT INTO `mod_gallery` VALUES ('27', 'Grimsby,2005', 'Jo\'s Friend, Me, Jo', 'small_DSC03785.JPG', 'large_DSC03785.JPG', '235', '0', '0', '0', '1', '1', '2005-10-01 00:00:00', '2006-09-30 16:45:47', '2006-10-10 12:16:06', '1');
INSERT INTO `mod_gallery` VALUES ('30', 'Ben, 2005', 'Ben', 'small_DSC03214.JPG', 'large_DSC03214.JPG', '235', '0', '0', '0', '1', '1', '2005-09-01 00:00:00', '2006-09-30 16:52:32', '2006-10-10 12:14:33', '1');
INSERT INTO `mod_gallery` VALUES ('29', 'Grimsby,2005', 'Becca', 'small_DSC03337.JPG', 'large_DSC03337.JPG', '235', '0', '0', '0', '1', '1', '2005-10-01 00:00:00', '2006-09-30 16:48:15', '2006-10-10 12:21:26', '2');
INSERT INTO `mod_gallery` VALUES ('31', 'Ben, 2005', '', 'small_DSC03233.JPG', 'large_DSC03233.JPG', '235', '0', '0', '0', '1', '1', '2006-09-30 00:00:00', '2006-09-30 16:54:26', '2006-09-30 16:54:26', '2');
INSERT INTO `mod_gallery` VALUES ('32', 'Ben, 2005', '', 'small_DSC03248.JPG', 'large_DSC03248.JPG', '235', '0', '0', '0', '1', '1', '2006-09-30 00:00:00', '2006-09-30 16:54:47', '2006-09-30 16:54:47', '2');
INSERT INTO `mod_gallery` VALUES ('36', 'Taiwan,2005', 'Judy,Yvonne', 'small_DSC02746.JPG', 'large_DSC02746.JPG', '147', '0', '0', '0', '1', '1', '2005-06-01 00:00:00', '2006-09-30 17:16:07', '2006-10-10 12:50:14', '1');
INSERT INTO `mod_gallery` VALUES ('35', 'Taiwan,2005', 'Yvonne,Me', 'small_DSC02747.JPG', 'large_DSC02747.JPG', '147', '0', '0', '0', '1', '1', '2005-06-01 00:00:00', '2006-09-30 17:14:02', '2006-10-10 12:49:52', '1');
INSERT INTO `mod_gallery` VALUES ('42', 'Euro Tour Switzerland, 2006', 'Steve, Barmaid', 'small_DSC00050.JPG', 'large_DSC00050.JPG', '233', '0', '0', '0', '1', '1', '2006-10-09 00:00:00', '2006-10-09 16:10:17', '2006-10-10 12:41:20', '1');
INSERT INTO `mod_gallery` VALUES ('43', 'Euro Tour Switzerland, 2006', 'Me, Eve, Steve, Craig', 'small_DSC00033.JPG', 'large_DSC00033.JPG', '233', '0', '0', '0', '1', '1', '2006-10-09 00:00:00', '2006-10-09 16:11:16', '2006-10-10 12:45:36', '1');
INSERT INTO `mod_gallery` VALUES ('44', 'Euro Tour Switzerland, 2006', 'Me,Eve,Steve', 'small_DSC00035.JPG', 'large_DSC00035.JPG', '233', '0', '0', '0', '1', '1', '2006-10-09 00:00:00', '2006-10-09 16:12:46', '2006-10-10 12:44:26', '1');
INSERT INTO `mod_gallery` VALUES ('41', 'Euro Tour Switzerland, 2006', 'Steve', 'small_DSC00043.JPG', 'large_DSC00043.JPG', '233', '0', '0', '0', '1', '1', '2006-10-09 00:00:00', '2006-10-09 16:08:42', '2006-10-10 12:40:12', '1');
INSERT INTO `mod_gallery` VALUES ('45', 'Euro Tour Switzerland, 2006', 'Eve, Craig, Steve', 'small_DSC00036.JPG', 'large_DSC00036.JPG', '233', '0', '0', '0', '1', '1', '2006-10-09 00:00:00', '2006-10-09 16:14:07', '2006-10-10 12:45:52', '1');
INSERT INTO `mod_gallery` VALUES ('46', 'Euro Tour Switzerland, 2006', 'Barmaids,Craig,Me', 'small_DSC00037.JPG', 'large_DSC00037.JPG', '233', '0', '0', '0', '1', '1', '2006-10-09 00:00:00', '2006-10-09 16:16:02', '2006-10-10 12:18:35', '1');
INSERT INTO `mod_gallery` VALUES ('47', 'Euro Tour Switzerland, 2006', 'Craig,Steve', 'small_DSC00041.JPG', 'large_DSC00041.JPG', '233', '0', '0', '0', '1', '1', '2006-10-09 00:00:00', '2006-10-09 16:18:22', '2006-10-10 12:42:24', '1');
INSERT INTO `mod_gallery` VALUES ('48', 'Euro Tour Switzerland, 2006', 'Steve,Eve', 'small_DSC00044.JPG', 'large_DSC00044.JPG', '233', '0', '0', '0', '1', '1', '2006-10-09 00:00:00', '2006-10-09 16:23:34', '2006-10-10 12:41:44', '1');
INSERT INTO `mod_gallery` VALUES ('49', 'Euro Tour Switzerland, 2006', 'Steve,Barmaid', 'small_DSC00049.JPG', 'large_DSC00049.JPG', '233', '0', '0', '0', '1', '1', '2006-10-09 00:00:00', '2006-10-09 16:25:11', '2006-10-10 12:43:26', '1');
INSERT INTO `mod_gallery` VALUES ('50', 'James Wedding, 2004', 'Kannika and I', 'small_DSC01609.JPG', 'large_DSC01609.JPG', '158', '0', '0', '0', '1', '1', '2004-10-01 00:00:00', '2006-10-09 16:56:31', '2006-10-09 17:07:28', '1');
INSERT INTO `mod_gallery` VALUES ('51', 'World Straight Pool, 2006', 'World Straight Pool Championships, USA', 'small_me_bridge1.jpg', 'large_me_bridge1.jpg', '233', '0', '0', '0', '1', '1', '2006-06-01 00:00:00', '2006-10-09 17:15:11', '2006-10-10 12:29:47', '1');
INSERT INTO `mod_gallery` VALUES ('52', 'World Straight Pool, 2006', 'World Straight Pool Championships, USA', 'small_me_shot1.jpg', 'large_me_shot1.jpg', '106', '0', '0', '0', '1', '1', '2006-06-01 00:00:00', '2006-10-09 17:15:40', '2006-10-10 12:29:25', '1');
INSERT INTO `mod_gallery` VALUES ('53', 'Euro Tour Switzerland, 2006', 'Kevin and I', 'small_F1020009.JPG', 'large_F1020009.JPG', '233', '0', '0', '0', '1', '1', '2006-10-09 00:00:00', '2006-10-09 17:31:43', '2006-10-10 12:46:13', '1');
INSERT INTO `mod_gallery` VALUES ('54', 'Penthouse Billiards, 2006', 'My new pool table in the sky!', 'small_table.jpg', 'large_table.jpg', '235', '0', '0', '0', '1', '1', '2006-09-25 00:00:00', '2006-10-10 11:39:59', '2006-10-10 12:33:28', '1');
INSERT INTO `mod_gallery` VALUES ('55', 'VNEA Championships, 2005', '', 'small_DSC02622.JPG', 'large_DSC02622.JPG', '106', '0', '0', '0', '1', '1', '2005-05-21 00:00:00', '2006-10-17 17:42:16', '2006-10-17 17:42:16', '1');
INSERT INTO `mod_gallery` VALUES ('56', 'VNEA Championships, 2005', 'Mark', 'small_DSC02627.JPG', 'large_DSC02627.JPG', '106', '0', '0', '0', '1', '1', '2005-05-21 00:00:00', '2006-10-17 17:44:54', '2006-10-17 17:44:54', '1');
INSERT INTO `mod_gallery` VALUES ('57', 'VNEA Championships, 2005', 'Mark', 'small_DSC02629.JPG', 'large_DSC02629.JPG', '106', '0', '0', '0', '1', '1', '2005-05-21 00:00:00', '2006-10-17 17:47:54', '2006-10-17 17:47:54', '1');
INSERT INTO `mod_gallery` VALUES ('58', 'VNEA Championships, 2005', 'Mark', 'small_DSC02630.JPG', 'large_DSC02630.JPG', '106', '0', '0', '0', '1', '1', '2005-05-21 00:00:00', '2006-10-17 17:50:01', '2006-10-17 17:50:01', '1');
INSERT INTO `mod_gallery` VALUES ('59', 'VNEA Championships, 2005', 'Crazy Girls and I', 'small_DSC02666.JPG', 'large_DSC02666.JPG', '106', '0', '0', '0', '1', '1', '2005-05-21 00:00:00', '2006-10-17 17:51:27', '2006-10-17 17:51:27', '1');
INSERT INTO `mod_gallery` VALUES ('60', 'BCA Championships, 2005', 'Crazy Girls and I', 'small_DSC02515.JPG', 'large_DSC02515.JPG', '106', '0', '0', '0', '1', '1', '2005-05-14 00:00:00', '2006-10-17 17:54:55', '2006-10-17 17:54:55', '1');
INSERT INTO `mod_gallery` VALUES ('61', 'BCA Championships, 2005', 'Calm before the storm!', 'small_DSC02568.JPG', 'large_DSC02568.JPG', '106', '0', '0', '0', '1', '1', '2005-05-14 00:00:00', '2006-10-17 17:58:01', '2006-10-17 17:58:01', '1');
INSERT INTO `mod_gallery` VALUES ('62', 'BCA Championships, 2005', 'Ugly and I', 'small_DSC02579.JPG', 'large_DSC02579.JPG', '106', '0', '0', '0', '1', '1', '2005-05-14 00:00:00', '2006-10-17 18:01:15', '2006-10-17 18:01:15', '1');
INSERT INTO `mod_gallery` VALUES ('63', 'BCA Championships, 2005', 'Richard, Great Tits, Dave', 'small_DSC02587.JPG', 'large_DSC02587.JPG', '106', '0', '0', '0', '1', '1', '2005-05-14 00:00:00', '2006-10-17 18:03:50', '2006-10-17 18:03:50', '1');
INSERT INTO `mod_gallery` VALUES ('64', 'VNEA Championships, 2005', 'Melissa and I', 'small_DSC02632.JPG', 'large_DSC02632.JPG', '106', '0', '0', '0', '1', '1', '2005-05-21 00:00:00', '2006-10-17 18:06:53', '2006-10-17 18:06:53', '1');
INSERT INTO `mod_gallery` VALUES ('65', 'Hard Times, 2005', 'Me', 'small_Craig Riley.JPG', 'large_Craig Riley.JPG', '106', '0', '0', '0', '1', '1', '2005-06-11 00:00:00', '2006-10-17 18:12:56', '2006-10-17 18:12:56', '1');
INSERT INTO `mod_gallery` VALUES ('66', 'Hard Times, 2005', 'Me and Jon', 'small_Craig Riley and John Wims.JPG', 'large_Craig Riley and John Wims.JPG', '106', '0', '0', '0', '1', '1', '2005-06-11 00:00:00', '2006-10-17 18:23:17', '2006-10-17 18:23:17', '1');
INSERT INTO `mod_gallery` VALUES ('67', 'Hard Times, 2005', 'Chris, Jon, and I', 'small_Aussies John Wims middle Craig Riley right.JPG', 'large_Aussies John Wims middle Craig Riley right.JPG', '106', '0', '0', '0', '1', '1', '2005-06-11 00:00:00', '2006-10-17 18:26:32', '2006-10-17 18:26:32', '1');
INSERT INTO `mod_gallery` VALUES ('68', 'Australian Open,2000', 'Anna Kournikova', 'small_F1270035.JPG', 'large_F1270035.JPG', '158', '0', '0', '0', '1', '1', '2001-01-15 00:00:00', '2006-10-28 19:40:47', '2006-10-28 19:40:47', '1');
INSERT INTO `mod_gallery` VALUES ('69', 'Australian Open,2000', 'Anna Kournikova', 'small_F1430002.JPG', 'large_F1430002.JPG', '158', '0', '0', '0', '1', '1', '2001-01-15 00:00:00', '2006-10-28 19:42:08', '2006-10-28 19:42:08', '1');
INSERT INTO `mod_gallery` VALUES ('70', 'Rio, 2001', 'Me', 'small_F1240039.JPG', 'large_F1240039.JPG', '66', '0', '0', '0', '1', '1', '2001-04-01 00:00:00', '2006-10-28 19:48:39', '2006-10-28 19:48:39', '1');
INSERT INTO `mod_gallery` VALUES ('71', 'Rio, 2001', 'Me', 'small_F1240040.JPG', 'large_F1240040.JPG', '66', '0', '0', '0', '1', '1', '2001-04-01 00:00:00', '2006-10-28 19:51:15', '2006-10-28 19:51:15', '1');
INSERT INTO `mod_gallery` VALUES ('72', 'Brunei, 2004', 'Me!', 'small_DSC00347.JPG', 'large_DSC00347.JPG', '116', '0', '0', '0', '1', '1', '2004-12-21 00:00:00', '2006-10-28 20:08:44', '2006-10-28 20:08:44', '1');
INSERT INTO `mod_gallery` VALUES ('73', 'Halloween, 2006', 'Andy and Mark - Nice teeth!', 'small_DSC00065.JPG', 'large_DSC00065.JPG', '235', '0', '0', '0', '1', '1', '2006-10-31 00:00:00', '2006-11-01 16:03:50', '2006-11-01 16:06:19', '1');
INSERT INTO `mod_gallery` VALUES ('74', 'Halloween, 2006', 'Me', 'small_DSC00060.JPG', 'large_DSC00060.JPG', '235', '0', '0', '0', '1', '1', '2006-10-31 00:00:00', '2006-11-03 11:26:06', '2006-11-03 11:26:06', '1');
INSERT INTO `mod_gallery` VALUES ('75', 'Halloween, 2006', 'Me', 'small_DSC00069.JPG', 'large_DSC00069.JPG', '235', '0', '0', '0', '1', '1', '2006-10-31 00:00:00', '2006-11-03 11:27:24', '2006-11-03 11:27:24', '1');
INSERT INTO `mod_gallery` VALUES ('76', 'Halloween, 2006', 'Andy', 'small_DSC00073.JPG', 'large_DSC00073.JPG', '235', '0', '0', '0', '1', '1', '2006-10-31 00:00:00', '2006-11-03 11:27:57', '2006-11-03 11:27:57', '1');
INSERT INTO `mod_gallery` VALUES ('77', 'Halloween, 2006', 'Andy, Random Polish Girl, I', 'small_DSC00075.JPG', 'large_DSC00075.JPG', '235', '0', '0', '0', '1', '1', '2006-10-31 00:00:00', '2006-11-03 11:28:48', '2006-11-03 11:28:48', '1');
INSERT INTO `mod_gallery` VALUES ('78', 'Lovely Ingrid, NYC', '', 'small_devil.jpg', 'large_devil.jpg', '106', '0', '0', '0', '1', '1', '2006-10-30 00:00:00', '2006-11-28 13:54:13', '2006-11-28 13:54:13', '1');
INSERT INTO `mod_gallery` VALUES ('79', 'Wroclaw, Poland, 2007', '', 'small_IMG_0682.jpg', 'large_IMG_0682.jpg', '224', '0', '0', '0', '1', '1', '2007-01-13 00:00:00', '2007-01-15 18:33:16', '2007-01-15 18:33:16', '1');
INSERT INTO `mod_gallery` VALUES ('80', 'Wroclaw, Poland, 2007', '', 'small_IMG_0689.jpg', 'large_IMG_0689.jpg', '224', '0', '0', '0', '1', '1', '2007-01-13 00:00:00', '2007-01-15 18:37:06', '2007-01-15 18:37:06', '1');
INSERT INTO `mod_gallery` VALUES ('81', 'Wroclaw, Poland, 2007', '', 'small_DSC05182.JPG', 'large_DSC05182.JPG', '224', '0', '0', '0', '1', '1', '2007-01-13 00:00:00', '2007-01-15 18:45:20', '2007-01-15 18:45:20', '1');
INSERT INTO `mod_gallery` VALUES ('82', 'Wroclaw, Poland, 2007', '', 'small_DSC05200.JPG', 'large_DSC05200.JPG', '224', '0', '0', '0', '1', '1', '2007-01-13 00:00:00', '2007-01-15 18:48:09', '2007-01-15 18:48:09', '1');
INSERT INTO `mod_gallery` VALUES ('83', 'Wroclaw, Poland, 2007', '', 'small_DSC05220.JPG', 'large_DSC05220.JPG', '224', '0', '0', '0', '1', '1', '2007-01-13 00:00:00', '2007-01-15 18:50:33', '2007-01-15 18:50:33', '1');
INSERT INTO `mod_gallery` VALUES ('84', 'Wroclaw, Poland, 2007', '', 'small_DSC05237.JPG', 'large_DSC05237.JPG', '224', '0', '0', '0', '1', '1', '2007-01-13 00:00:00', '2007-01-15 18:55:59', '2007-01-15 18:55:59', '1');
INSERT INTO `mod_gallery` VALUES ('85', 'Wroclaw, Poland, 2007', '', 'small_DSC05231.JPG', 'large_DSC05231.JPG', '224', '0', '0', '0', '1', '1', '2007-01-13 00:00:00', '2007-01-15 18:59:12', '2007-01-15 18:59:12', '1');
INSERT INTO `mod_gallery` VALUES ('86', 'SOUK Leaving party', '', 'small_DSC05368.JPG', 'large_DSC05368.JPG', '235', '0', '0', '0', '1', '1', '2007-04-05 00:00:00', '2007-05-01 11:56:41', '2007-05-01 11:56:41', '1');
INSERT INTO `mod_gallery` VALUES ('87', 'SOUK Leaving party', '', 'small_DSC05406.JPG', 'large_DSC05406.JPG', '235', '0', '0', '0', '1', '1', '2007-04-05 00:00:00', '2007-05-01 12:00:32', '2007-05-01 12:00:32', '1');
INSERT INTO `mod_gallery` VALUES ('88', 'SOUK Leaving party', '', 'small_DSC05393.JPG', 'large_DSC05393.JPG', '235', '0', '0', '0', '1', '1', '2007-04-05 00:00:00', '2007-05-01 12:04:15', '2007-05-01 12:04:15', '1');
INSERT INTO `mod_gallery` VALUES ('89', 'SOUK Leaving party', '', 'small_DSC05407.JPG', 'large_DSC05407.JPG', '235', '0', '0', '0', '1', '1', '2007-04-05 00:00:00', '2007-05-01 12:10:55', '2007-05-01 12:10:55', '1');
INSERT INTO `mod_gallery` VALUES ('90', 'SOUK Leaving party', '', 'small_DSC05377.JPG', 'large_DSC05377.JPG', '235', '0', '0', '0', '1', '1', '2007-04-05 00:00:00', '2007-05-01 12:15:43', '2007-05-01 12:15:43', '1');
INSERT INTO `mod_gallery` VALUES ('91', 'Pisa', '', 'small_DSC05118.JPG', 'large_DSC05118.JPG', '215', '0', '0', '0', '1', '1', '2007-04-11 00:00:00', '2007-05-01 12:19:57', '2007-05-01 12:19:57', '1');
INSERT INTO `mod_gallery` VALUES ('92', 'Pisa - horse thief!', '', 'small_DSC05087.JPG', 'large_DSC05087.JPG', '215', '0', '0', '0', '1', '1', '2007-04-11 00:00:00', '2007-05-01 12:22:40', '2007-05-01 12:22:40', '1');
INSERT INTO `mod_gallery` VALUES ('93', 'Pisa', '', 'small_DSC05095.JPG', 'large_DSC05095.JPG', '215', '0', '0', '0', '1', '1', '2007-04-11 00:00:00', '2007-05-01 12:23:21', '2007-05-01 12:23:21', '1');
INSERT INTO `mod_gallery` VALUES ('94', 'St Lucia', '', 'small_DSC05344.JPG', 'large_DSC05344.JPG', '98', '0', '0', '0', '1', '1', '2007-04-26 00:00:00', '2007-05-01 12:25:15', '2007-05-01 12:25:15', '1');
INSERT INTO `mod_gallery` VALUES ('95', 'St Lucia', '', 'small_DSC05418.JPG', 'large_DSC05418.JPG', '98', '0', '0', '0', '1', '1', '2007-04-26 00:00:00', '2007-05-01 12:26:05', '2007-05-01 12:26:05', '1');
INSERT INTO `mod_gallery` VALUES ('96', 'St Lucia', '', 'small_DSC05397.JPG', 'large_DSC05397.JPG', '98', '0', '0', '0', '1', '1', '2007-04-26 00:00:00', '2007-05-01 12:26:40', '2007-05-01 12:26:40', '1');
INSERT INTO `mod_gallery` VALUES ('97', 'St Lucia', '', 'small_DSC05386.JPG', 'large_DSC05386.JPG', '98', '0', '0', '0', '1', '1', '2007-04-26 00:00:00', '2007-05-01 12:27:59', '2007-05-01 12:27:59', '1');
INSERT INTO `mod_gallery` VALUES ('98', 'Barbados', '', 'small_DSC05726.JPG', 'large_DSC05726.JPG', '62', '0', '0', '0', '1', '1', '2007-04-21 00:00:00', '2007-05-01 12:29:16', '2007-05-01 12:29:16', '1');
INSERT INTO `mod_gallery` VALUES ('99', 'Barbados', '', 'small_DSC05723.JPG', 'large_DSC05723.JPG', '62', '0', '0', '0', '1', '1', '2007-04-21 00:00:00', '2007-05-01 12:30:28', '2007-05-01 12:30:28', '1');
INSERT INTO `mod_gallery` VALUES ('100', 'Barbados', '', 'small_DSC05151.JPG', 'large_DSC05151.JPG', '62', '0', '0', '0', '1', '1', '2007-04-21 00:00:00', '2007-05-01 12:31:23', '2007-05-01 12:31:23', '1');
INSERT INTO `mod_gallery` VALUES ('101', 'Barbados', '', 'small_DSC05218.JPG', 'large_DSC05218.JPG', '62', '0', '0', '0', '1', '1', '2007-04-21 00:00:00', '2007-05-01 12:32:04', '2007-05-01 12:32:04', '1');
INSERT INTO `mod_gallery` VALUES ('102', 'Barbados', '', 'small_DSC05706.JPG', 'large_DSC05706.JPG', '62', '0', '0', '0', '1', '1', '2007-04-21 00:00:00', '2007-05-01 12:33:43', '2007-05-01 12:33:43', '1');
INSERT INTO `mod_gallery` VALUES ('103', 'Grenada', '', 'small_DSC05281.JPG', 'large_DSC05281.JPG', '80', '0', '0', '0', '1', '1', '2007-04-19 00:00:00', '2007-05-01 12:35:45', '2007-05-01 12:35:45', '1');
INSERT INTO `mod_gallery` VALUES ('104', 'Grenada', '', 'small_DSC05536.JPG', 'large_DSC05536.JPG', '80', '0', '0', '0', '1', '1', '2007-04-19 00:00:00', '2007-05-01 12:36:51', '2007-05-01 12:36:51', '1');
INSERT INTO `mod_gallery` VALUES ('105', 'Grenada - Hotel', '', 'small_DSC05257.JPG', 'large_DSC05257.JPG', '80', '0', '0', '0', '1', '1', '2007-04-19 00:00:00', '2007-05-01 12:39:36', '2007-05-01 12:39:36', '1');
INSERT INTO `mod_gallery` VALUES ('106', 'Grenada - My plane!', '', 'small_DSC05454.JPG', 'large_DSC05454.JPG', '62', '0', '0', '0', '1', '1', '2007-04-18 00:00:00', '2007-05-01 12:41:27', '2007-05-01 12:41:27', '1');
INSERT INTO `mod_gallery` VALUES ('107', 'SOUK Leaving party', '', 'small_DSC05420.JPG', 'large_DSC05420.JPG', '235', '0', '0', '0', '1', '1', '2007-04-05 00:00:00', '2007-05-01 12:46:28', '2007-05-01 12:46:28', '1');
INSERT INTO `mod_gallery` VALUES ('111', 'Jamaica, Duns River Falls', '', 'small_DSC05961.JPG', 'large_DSC05961.JPG', '84', '0', '0', '0', '1', '1', '2007-05-07 00:00:00', '2007-05-23 16:54:32', '2007-05-23 16:56:34', '1');
INSERT INTO `mod_gallery` VALUES ('109', 'Jamaica, Negril Beach', '', 'small_DSC05907.JPG', 'large_DSC05907.JPG', '84', '0', '0', '0', '1', '1', '2007-05-07 00:00:00', '2007-05-23 16:52:38', '2007-05-23 16:57:31', '1');
INSERT INTO `mod_gallery` VALUES ('110', 'Jamaica, Negril Beach', '', 'small_DSC05921.JPG', 'large_DSC05921.JPG', '84', '0', '0', '0', '1', '1', '2007-05-07 00:00:00', '2007-05-23 16:53:16', '2007-05-23 16:57:18', '1');
INSERT INTO `mod_gallery` VALUES ('112', 'Jamaica, Duns River Falls', '', 'small_DSC05999.JPG', 'large_DSC05999.JPG', '84', '0', '0', '0', '1', '1', '2007-05-07 00:00:00', '2007-05-23 16:55:27', '2007-05-23 16:56:16', '1');
INSERT INTO `mod_gallery` VALUES ('113', 'Jamaica, Duns River Falls', '', 'small_DSC06028.JPG', 'large_DSC06028.JPG', '84', '0', '0', '0', '1', '1', '2007-05-07 00:00:00', '2007-05-23 16:58:20', '2007-05-23 16:58:20', '1');
INSERT INTO `mod_gallery` VALUES ('114', 'Jamaica, Hedonism II', '', 'small_DSC06042.JPG', 'large_DSC06042.JPG', '84', '0', '0', '0', '1', '1', '2007-05-07 00:00:00', '2007-05-23 16:59:13', '2007-05-23 16:59:13', '1');
INSERT INTO `mod_gallery` VALUES ('115', 'Jamaica, Negril Beach', '', 'small_DSC06062.JPG', 'large_DSC06062.JPG', '84', '0', '0', '0', '1', '1', '2007-05-07 00:00:00', '2007-05-23 17:00:29', '2007-05-23 17:00:29', '1');
INSERT INTO `mod_gallery` VALUES ('116', 'Jamaica, Hedonism II', '', 'small_DSC06043.JPG', 'large_DSC06043.JPG', '84', '0', '0', '0', '1', '1', '2007-05-07 00:00:00', '2007-05-23 17:02:35', '2007-05-23 17:02:35', '1');
INSERT INTO `mod_gallery` VALUES ('117', 'Antigua, Guatemala', '', 'small_DSC05481.JPG', 'large_DSC05481.JPG', '171', '0', '0', '0', '1', '1', '2007-06-06 00:00:00', '2007-06-11 17:38:46', '2007-06-11 17:38:46', '1');
INSERT INTO `mod_gallery` VALUES ('118', 'Antigua, Guatemala', '', 'small_DSC05552.JPG', 'large_DSC05552.JPG', '171', '0', '0', '0', '1', '1', '2007-06-06 00:00:00', '2007-06-11 17:40:16', '2007-06-11 17:40:16', '1');
INSERT INTO `mod_gallery` VALUES ('119', 'Antigua, Guatemala', '', 'small_DSC05596.JPG', 'large_DSC05596.JPG', '171', '0', '0', '0', '1', '1', '2007-06-06 00:00:00', '2007-06-11 17:40:58', '2007-06-11 17:40:58', '1');
INSERT INTO `mod_gallery` VALUES ('120', 'Antigua, Guatemala', '', 'small_DSC05513.JPG', 'large_DSC05513.JPG', '171', '0', '0', '0', '1', '1', '2007-06-06 00:00:00', '2007-06-11 17:41:35', '2007-06-11 17:41:35', '1');
INSERT INTO `mod_gallery` VALUES ('121', 'Antigua, Guatemala', '', 'small_DSC05515.JPG', 'large_DSC05515.JPG', '171', '0', '0', '0', '1', '1', '2007-06-06 00:00:00', '2007-06-11 17:42:08', '2007-06-11 17:42:08', '1');
INSERT INTO `mod_gallery` VALUES ('122', 'Antigua, Guatemala', '', 'small_DSC05521.JPG', 'large_DSC05521.JPG', '171', '0', '0', '0', '1', '1', '2007-06-06 00:00:00', '2007-06-11 17:43:03', '2007-06-11 17:43:03', '1');
INSERT INTO `mod_gallery` VALUES ('123', 'Antigua, Guatemala', '', 'small_DSC05488.JPG', 'large_DSC05488.JPG', '171', '0', '0', '0', '1', '1', '2007-06-06 00:00:00', '2007-06-11 17:43:33', '2007-06-11 17:43:33', '1');
INSERT INTO `mod_gallery` VALUES ('124', 'Antigua, Guatemala', '', 'small_DSC05549.JPG', 'large_DSC05549.JPG', '171', '0', '0', '0', '1', '1', '2007-06-06 00:00:00', '2007-06-11 17:44:08', '2007-06-11 17:44:08', '1');
INSERT INTO `mod_gallery` VALUES ('125', 'Antigua, Guatemala', '', 'small_DSC05522.JPG', 'large_DSC05522.JPG', '171', '0', '0', '0', '1', '1', '2007-06-06 00:00:00', '2007-06-11 17:45:03', '2007-06-11 17:45:03', '1');
INSERT INTO `mod_gallery` VALUES ('126', 'Las Vegas, VNEA 2007', '', 'small_DSC06131.JPG', 'large_DSC06131.JPG', '106', '0', '0', '0', '1', '1', '2007-06-01 00:00:00', '2007-06-11 17:47:27', '2007-06-11 17:47:27', '1');
INSERT INTO `mod_gallery` VALUES ('127', 'Las Vegas, VNEA 2007', '', 'small_VNEA 2007 117.jpg', 'large_VNEA 2007 117.jpg', '106', '0', '0', '0', '1', '1', '2007-06-01 00:00:00', '2007-06-11 17:48:19', '2007-06-11 17:48:19', '1');
INSERT INTO `mod_gallery` VALUES ('128', 'Las Vegas, VNEA 2007', '', 'small_DSC06120.JPG', 'large_DSC06120.JPG', '106', '0', '0', '0', '1', '1', '2007-06-01 00:00:00', '2007-06-11 17:48:46', '2007-06-11 17:48:46', '1');
INSERT INTO `mod_gallery` VALUES ('129', 'Las Vegas, VNEA 2007', '', 'small_DSC06116.JPG', 'large_DSC06116.JPG', '106', '0', '0', '0', '1', '1', '2007-06-01 00:00:00', '2007-06-11 17:49:26', '2007-06-11 17:49:26', '1');
INSERT INTO `mod_gallery` VALUES ('130', 'Las Vegas, VNEA 2004', '', 'small_scan0005.jpg', 'large_scan0005.jpg', '106', '0', '0', '0', '1', '1', '2004-06-05 00:00:00', '2007-06-11 17:54:15', '2007-06-11 18:07:51', '1');
INSERT INTO `mod_gallery` VALUES ('131', 'Las Vegas, VNEA 2004', '', 'small_scan0006.jpg', 'large_scan0006.jpg', '106', '0', '0', '0', '1', '1', '2004-06-05 00:00:00', '2007-06-11 17:55:12', '2007-06-11 18:09:55', '1');
INSERT INTO `mod_gallery` VALUES ('132', 'Las Vegas, VNEA 2004', '', 'small_scan0007.jpg', 'large_scan0007.jpg', '106', '0', '0', '0', '1', '1', '2004-06-05 00:00:00', '2007-06-11 17:56:57', '2007-06-11 18:08:55', '1');
INSERT INTO `mod_gallery` VALUES ('133', 'Las Vegas, VNEA 2004', '', 'small_scan0008.jpg', 'large_scan0008.jpg', '106', '0', '0', '0', '1', '1', '2004-06-05 00:00:00', '2007-06-11 17:58:22', '2007-06-11 18:04:25', '1');
INSERT INTO `mod_gallery` VALUES ('134', 'Pacaya Volcano, Guatemala', '', 'small_DSC05618.JPG', 'large_DSC05618.JPG', '171', '0', '0', '0', '1', '1', '2007-06-12 00:00:00', '2007-06-13 11:00:04', '2007-06-13 11:00:04', '1');
INSERT INTO `mod_gallery` VALUES ('135', 'Pacaya, Guatemala', '', 'small_DSC05623.JPG', 'large_DSC05623.JPG', '171', '0', '0', '0', '1', '1', '2007-06-12 00:00:00', '2007-06-13 11:07:00', '2007-06-13 11:07:00', '1');
INSERT INTO `mod_gallery` VALUES ('136', 'Pacaya, Guatemala', '', 'small_DSC05632.JPG', 'large_DSC05632.JPG', '171', '0', '0', '0', '1', '1', '2007-06-12 00:00:00', '2007-06-13 11:07:20', '2007-06-13 11:07:20', '1');
INSERT INTO `mod_gallery` VALUES ('137', 'Pacaya, Guatemala', '', 'small_DSC05633.JPG', 'large_DSC05633.JPG', '171', '0', '0', '0', '1', '1', '2007-06-12 00:00:00', '2007-06-13 11:07:41', '2007-06-13 11:07:41', '1');
INSERT INTO `mod_gallery` VALUES ('138', 'Pacaya, Guatemala', '', 'small_DSC05635.JPG', 'large_DSC05635.JPG', '171', '0', '0', '0', '1', '1', '2007-06-12 00:00:00', '2007-06-13 11:08:00', '2007-06-13 11:08:00', '1');
INSERT INTO `mod_gallery` VALUES ('139', 'Pacaya, Guatemala', '', 'small_DSC05637.JPG', 'large_DSC05637.JPG', '171', '0', '0', '0', '1', '1', '2007-06-12 00:00:00', '2007-06-13 11:09:08', '2007-06-13 11:09:08', '1');
INSERT INTO `mod_gallery` VALUES ('145', 'Antigua, Guatemala', '', 'small_DSC05726.JPG', 'large_DSC05726.JPG', '171', '0', '0', '0', '1', '1', '2007-06-14 00:00:00', '2007-06-14 14:17:08', '2007-06-14 14:17:08', '1');
INSERT INTO `mod_gallery` VALUES ('141', 'Pacaya, Guatemala', '', 'small_DSC05653.JPG', 'large_DSC05653.JPG', '171', '0', '0', '0', '1', '1', '2007-06-12 00:00:00', '2007-06-13 11:10:16', '2007-06-13 11:10:16', '1');
INSERT INTO `mod_gallery` VALUES ('142', 'Pacaya, Guatemala', '', 'small_DSC05655.JPG', 'large_DSC05655.JPG', '171', '0', '0', '0', '1', '1', '2007-06-12 00:00:00', '2007-06-13 11:11:04', '2007-06-13 11:11:04', '1');
INSERT INTO `mod_gallery` VALUES ('143', 'Pacaya, Guatemala', '', 'small_DSC05661.JPG', 'large_DSC05661.JPG', '171', '0', '0', '0', '1', '1', '2007-06-12 00:00:00', '2007-06-13 11:11:34', '2007-06-13 11:11:34', '1');
INSERT INTO `mod_gallery` VALUES ('144', 'Pacaya, Guatemala', '', 'small_DSC05642.JPG', 'large_DSC05642.JPG', '171', '0', '0', '0', '1', '1', '2007-06-12 00:00:00', '2007-06-13 11:16:18', '2007-06-13 11:16:18', '1');
INSERT INTO `mod_gallery` VALUES ('146', 'Antigua, Guatemala', '', 'small_DSC05716.JPG', 'large_DSC05716.JPG', '171', '0', '0', '0', '1', '1', '2007-06-14 00:00:00', '2007-06-14 18:50:15', '2007-06-14 18:50:15', '1');
INSERT INTO `mod_gallery` VALUES ('147', 'Antigua, Guatemala', '', 'small_DSC05728.JPG', 'large_DSC05728.JPG', '171', '0', '0', '0', '1', '1', '2007-06-14 00:00:00', '2007-06-14 18:50:50', '2007-06-14 18:50:50', '1');
INSERT INTO `mod_gallery` VALUES ('148', 'Antigua, Guatemala', '', 'small_DSC05738.JPG', 'large_DSC05738.JPG', '171', '0', '0', '0', '1', '1', '2007-06-14 00:00:00', '2007-06-14 18:52:47', '2007-06-14 18:52:47', '1');
INSERT INTO `mod_gallery` VALUES ('152', 'Flores, Guatemala', '', 'small_DSC06222.JPG', 'large_DSC06222.JPG', '171', '0', '0', '0', '1', '1', '2007-06-15 00:00:00', '2007-06-20 21:35:32', '2007-06-20 21:35:32', '1');
INSERT INTO `mod_gallery` VALUES ('150', 'Antigua, Guatemala', '', 'small_DSC05752.JPG', 'large_DSC05752.JPG', '171', '0', '0', '0', '1', '1', '2007-06-14 00:00:00', '2007-06-14 18:54:10', '2007-06-14 18:54:10', '1');
INSERT INTO `mod_gallery` VALUES ('151', 'Antigua, Guatemala', '', 'small_DSC05747.JPG', 'large_DSC05747.JPG', '171', '0', '0', '0', '1', '1', '2007-06-14 00:00:00', '2007-06-14 18:54:29', '2007-06-14 18:54:29', '1');
INSERT INTO `mod_gallery` VALUES ('153', 'Flores, Guatemala', '', 'small_DSC06238.JPG', 'large_DSC06238.JPG', '171', '0', '0', '0', '1', '1', '2007-06-15 00:00:00', '2007-06-20 21:37:51', '2007-06-20 21:37:51', '1');
INSERT INTO `mod_gallery` VALUES ('154', 'Tikal, Guatemala', '', 'small_DSC05789.JPG', 'large_DSC05789.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:43:18', '2007-06-20 21:43:18', '1');
INSERT INTO `mod_gallery` VALUES ('155', 'Tikal, Guatemala', '', 'small_DSC05773.JPG', 'large_DSC05773.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:43:55', '2007-06-20 21:43:55', '1');
INSERT INTO `mod_gallery` VALUES ('156', 'Tikal, Guatemala', '', 'small_DSC05827.JPG', 'large_DSC05827.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:45:35', '2007-06-20 21:45:35', '1');
INSERT INTO `mod_gallery` VALUES ('157', 'Tikal, Guatemala', '', 'small_DSC05902.JPG', 'large_DSC05902.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:45:58', '2007-06-20 21:45:58', '1');
INSERT INTO `mod_gallery` VALUES ('158', 'Tikal, Guatemala', '', 'small_DSC05926.JPG', 'large_DSC05926.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:46:18', '2007-06-20 21:46:18', '1');
INSERT INTO `mod_gallery` VALUES ('159', 'Tikal, Guatemala', '', 'small_DSC05936.JPG', 'large_DSC05936.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:46:32', '2007-06-20 21:46:32', '1');
INSERT INTO `mod_gallery` VALUES ('160', 'Tikal, Guatemala', '', 'small_DSC05940.JPG', 'large_DSC05940.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:47:04', '2007-06-20 21:47:04', '1');
INSERT INTO `mod_gallery` VALUES ('161', 'Tikal, Guatemala', '', 'small_DSC05948.JPG', 'large_DSC05948.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:47:20', '2007-06-20 21:47:20', '1');
INSERT INTO `mod_gallery` VALUES ('162', 'Tikal, Guatemala', '', 'small_DSC05949.JPG', 'large_DSC05949.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:47:49', '2007-06-20 21:47:49', '1');
INSERT INTO `mod_gallery` VALUES ('163', 'Tikal, Guatemala', '', 'small_DSC05952.JPG', 'large_DSC05952.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:48:40', '2007-06-20 21:48:40', '1');
INSERT INTO `mod_gallery` VALUES ('164', 'Tikal, Guatemala', '', 'small_DSC06319.JPG', 'large_DSC06319.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:49:01', '2007-06-20 21:49:01', '1');
INSERT INTO `mod_gallery` VALUES ('165', 'Tikal, Guatemala', '', 'small_DSC06325.JPG', 'large_DSC06325.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:49:28', '2007-06-20 21:49:28', '1');
INSERT INTO `mod_gallery` VALUES ('166', 'Tikal, Guatemala', '', 'small_DSC06334.JPG', 'large_DSC06334.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:50:07', '2007-06-20 21:50:07', '1');
INSERT INTO `mod_gallery` VALUES ('167', 'Tikal, Guatemala', '', 'small_DSC06346.JPG', 'large_DSC06346.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:50:37', '2007-06-20 21:50:37', '1');
INSERT INTO `mod_gallery` VALUES ('168', 'Tikal, Guatemala', '', 'small_DSC06348.JPG', 'large_DSC06348.JPG', '171', '0', '0', '0', '1', '1', '2007-06-16 00:00:00', '2007-06-20 21:51:01', '2007-06-20 21:51:01', '1');
INSERT INTO `mod_gallery` VALUES ('169', 'Caye Caulker, Belize', '', 'small_DSC06613.JPG', 'large_DSC06613.JPG', '63', '0', '0', '0', '1', '1', '2007-06-20 00:00:00', '2007-06-20 21:55:30', '2007-06-20 22:02:31', '1');
INSERT INTO `mod_gallery` VALUES ('170', 'Caye Caulker, Belize', '', 'small_DSC06408.JPG', 'large_DSC06408.JPG', '63', '0', '0', '0', '1', '1', '2007-06-20 00:00:00', '2007-06-20 22:04:05', '2007-06-20 22:04:05', '1');
INSERT INTO `mod_gallery` VALUES ('171', 'Caye Caulker, Belize', '', 'small_DSC06436.JPG', 'large_DSC06436.JPG', '63', '0', '0', '0', '1', '1', '2007-06-20 00:00:00', '2007-06-20 22:04:52', '2007-06-20 22:04:52', '1');
INSERT INTO `mod_gallery` VALUES ('172', 'Caye Caulker, Belize', '', 'small_DSC06475.JPG', 'large_DSC06475.JPG', '63', '0', '0', '0', '1', '1', '2007-06-20 00:00:00', '2007-06-20 22:05:22', '2007-06-20 22:05:22', '1');
INSERT INTO `mod_gallery` VALUES ('173', 'Caye Caulker, Belize', '', 'small_DSC06534.JPG', 'large_DSC06534.JPG', '63', '0', '0', '0', '1', '1', '2007-06-20 00:00:00', '2007-06-20 22:05:50', '2007-06-20 22:05:50', '1');
INSERT INTO `mod_gallery` VALUES ('174', 'Caye Caulker, Belize', '', 'small_DSC06564.JPG', 'large_DSC06564.JPG', '63', '0', '0', '0', '1', '1', '2007-06-20 00:00:00', '2007-06-20 22:06:13', '2007-06-20 22:06:13', '1');
INSERT INTO `mod_gallery` VALUES ('175', 'Caye Caulker, Belize', '', 'small_DSC06581.JPG', 'large_DSC06581.JPG', '63', '0', '0', '0', '1', '1', '2007-06-20 00:00:00', '2007-06-20 22:06:43', '2007-06-20 22:06:43', '1');
INSERT INTO `mod_gallery` VALUES ('176', 'Caye Caulker, Belize', '', 'small_DSC06598.JPG', 'large_DSC06598.JPG', '63', '0', '0', '0', '1', '1', '2007-06-20 00:00:00', '2007-06-20 22:06:57', '2007-06-20 22:06:57', '1');
INSERT INTO `mod_gallery` VALUES ('177', 'Caye Caulker, Belize', '', 'small_DSC06602.JPG', 'large_DSC06602.JPG', '63', '0', '0', '0', '1', '1', '2007-06-20 00:00:00', '2007-06-20 22:07:16', '2007-06-20 22:07:16', '1');
INSERT INTO `mod_gallery` VALUES ('178', 'Caye Caulker, Belize', '', 'small_DSC06606.JPG', 'large_DSC06606.JPG', '63', '0', '0', '0', '1', '1', '2007-06-20 00:00:00', '2007-06-20 22:07:29', '2007-06-20 22:07:29', '1');
INSERT INTO `mod_gallery` VALUES ('179', 'Nottingham Revolution', 'Emily, Mai and I', 'small_revolution.jpg', 'large_revolution.jpg', '235', '0', '0', '0', '1', '1', '2007-08-10 00:00:00', '2007-08-14 17:28:46', '2007-08-14 17:28:46', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('16', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('17', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('18', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('19', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('20', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('15', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('22', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('21', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('24', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('23', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('25', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('26', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('27', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('30', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('29', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('31', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('32', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('36', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('35', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('42', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('43', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('44', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('41', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('45', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('46', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('47', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('48', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('49', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('50', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('51', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('51', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('52', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('52', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('53', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('53', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('54', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('54', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('55', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('56', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('57', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('58', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('59', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('59', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('60', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('60', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('61', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('61', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('62', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('62', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('63', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('64', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('64', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('65', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('65', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('66', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('66', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('67', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('67', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('68', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('69', '4');
INSERT INTO `mod_gallery_section_lookup` VALUES ('70', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('70', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('71', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('71', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('72', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('72', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('73', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('74', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('75', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('76', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('77', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('79', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('79', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('80', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('80', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('81', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('81', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('82', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('82', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('83', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('83', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('84', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('84', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('85', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('85', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('86', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('87', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('88', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('89', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('90', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('91', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('92', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('93', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('94', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('95', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('96', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('97', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('98', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('99', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('100', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('101', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('102', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('103', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('104', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('104', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('105', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('106', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('107', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('111', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('109', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('110', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('112', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('113', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('114', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('115', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('116', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('117', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('118', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('119', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('120', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('121', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('122', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('123', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('124', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('125', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('126', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('127', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('128', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('129', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('130', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('130', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('131', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('131', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('132', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('132', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('133', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('133', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('134', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('135', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('136', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('137', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('138', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('139', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('145', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('141', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('142', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('143', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('144', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('145', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('146', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('147', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('148', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('152', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('150', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('151', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('153', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('154', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('155', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('155', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('156', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('156', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('157', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('157', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('158', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('158', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('159', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('160', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('161', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('162', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('163', '1');
INSERT INTO `mod_gallery_section_lookup` VALUES ('163', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('164', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('165', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('166', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('167', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('168', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('169', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('170', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('171', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('172', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('173', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('174', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('175', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('176', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('177', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('178', '5');
INSERT INTO `mod_gallery_section_lookup` VALUES ('179', '1');
INSERT INTO `modules` VALUES ('1', 'Image Manager', 'image_uploads.cfm', '0', '1');
INSERT INTO `modules` VALUES ('2', 'Video Manager', 'video_uploads.cfm', '0', '1');
INSERT INTO `modules` VALUES ('3', 'On This Day', 'thisday.cfm', '0', '1');
INSERT INTO `modules` VALUES ('4', 'News & Events', 'news.cfm', '1', '1');
INSERT INTO `modules` VALUES ('5', 'Top Breaks', 'breaks.cfm', '0', '1');
INSERT INTO `modules` VALUES ('6', 'Vacations', 'vacations.cfm', '0', '1');
INSERT INTO `modules` VALUES ('7', 'Journeys', 'journeys.cfm', '0', '1');
INSERT INTO `modules` VALUES ('8', 'Countries', 'countries.cfm', '1', '1');
INSERT INTO `modules` VALUES ('9', 'Web Portfolio', 'portfolio.cfm', '1', '1');
INSERT INTO `modules` VALUES ('10', 'Domains', 'domains.cfm', '0', '1');
INSERT INTO `navigation` VALUES ('1', '0', '1', '0', '1');
INSERT INTO `navigation` VALUES ('2', '1', '2', '1', '1');
INSERT INTO `navigation` VALUES ('3', '1', '3', '1', '2');
INSERT INTO `navigation` VALUES ('4', '2', '4', '2', '1');
INSERT INTO `navigation` VALUES ('5', '1', '5', '1', '4');
INSERT INTO `navigation` VALUES ('6', '1', '6', '1', '3');
INSERT INTO `navigation` VALUES ('7', '1', '7', '1', '1');
INSERT INTO `navigation` VALUES ('8', '1', '8', '1', '5');
INSERT INTO `navigation` VALUES ('9', '1', '9', '1', '9');
INSERT INTO `navigation` VALUES ('10', '1', '10', '1', '6');
INSERT INTO `navigation` VALUES ('11', '1', '11', '1', '8');
INSERT INTO `navigation` VALUES ('145', '6', '16', '2', '1');
INSERT INTO `navigation` VALUES ('151', '4', '22', '3', '1');
INSERT INTO `navigation` VALUES ('153', '2', '24', '2', '2');
INSERT INTO `navigation` VALUES ('156', '2', '27', '2', '3');
INSERT INTO `navigation` VALUES ('157', '10', '31', '2', '1');
INSERT INTO `navigation` VALUES ('159', '2', '33', '2', '4');
INSERT INTO `navigation` VALUES ('162', '2', '36', '2', '5');
INSERT INTO `navigation` VALUES ('164', '7', '38', '2', '1');
INSERT INTO `sections` VALUES ('1', 'RILEY', 'riley/');
INSERT INTO `sections` VALUES ('2', 'EDUCATION', 'education/');
INSERT INTO `sections` VALUES ('3', 'EMPLOYMENT', 'employment/');
INSERT INTO `sections` VALUES ('4', 'SPORT & LEISURE', 'sport/');
INSERT INTO `sections` VALUES ('5', 'TRAVEL', 'travel/');
INSERT INTO `statuses` VALUES ('1', 'APPROVED');
INSERT INTO `statuses` VALUES ('2', 'PENDING APPROVAL');
INSERT INTO `statuses` VALUES ('3', 'DRAFT');
INSERT INTO `statuses` VALUES ('4', 'ARCHIVED');
INSERT INTO `thisday` VALUES ('1', 'I got married to Kannika Sawatnathee in', '65', '0', '2003-05-19 00:00:00', '2004-02-09 21:08:28', '2004-02-08 20:58:36', '1');
INSERT INTO `thisday` VALUES ('2', 'I started work for the Sydney Harbour Foreshore Authority (SHFA)', '48', '0', '2004-01-16 00:00:00', '2004-02-08 21:31:47', '2004-02-08 21:05:10', '1');
INSERT INTO `thisday` VALUES ('3', 'I got engaged to Kannika Sawatnathee', '36', '0', '1999-01-01 00:00:00', '2004-02-08 21:31:22', '2004-02-08 21:06:35', '1');
INSERT INTO `thisday` VALUES ('4', 'I was born in Grimsby maternity hospital at 2:17pm after 5 hours of labour. I weighed 8lbs, I was 21 inches long and had black hair and blue/black eyes. The birth was started by the doctor and my father was not there!', '93', '42', '1974-01-09 00:00:00', '2004-02-10 13:53:15', '2004-02-08 21:11:07', '1');
INSERT INTO `thisday` VALUES ('5', 'I was stopped working for Reading Room', '48', '27', '2003-10-31 00:00:00', '2004-10-31 17:02:02', '2004-02-09 09:14:12', '1');
INSERT INTO `thisday` VALUES ('6', 'I was rescued by a fishing boat after spending an hour in the sea and almost drowning', '23', '0', '1997-06-06 00:00:00', '2004-02-09 09:15:57', '2004-02-09 09:15:57', '1');
INSERT INTO `thisday` VALUES ('7', 'passed my driving test on my 4th attempt!', '82', '0', '1997-11-13 00:00:00', '2005-10-16 18:34:47', '2004-02-09 09:18:01', '1');
INSERT INTO `thisday` VALUES ('8', 'my mother was born at 5:40pm at 17 grafton street. She weighed 7lbs 2ozs and it was a Saturday', '93', '0', '1949-04-05 00:00:00', '2004-02-10 14:00:15', '2004-02-09 10:02:17', '1');
INSERT INTO `thisday` VALUES ('9', 'my sister Debbie Jane Riley was born at 5:45pm. It was a breech birth (feet first) after 5 hours of labour.  She had black hair and blue eys. My father missed the birth because he was in the bookies. However he did eventually make it to the hospital', '93', '0', '1972-02-26 00:00:00', '2004-02-29 15:59:25', '2004-02-09 10:02:39', '1');
INSERT INTO `thisday` VALUES ('10', 'my father was born in Grimsby Maternity Hospital', '93', '0', '1947-03-08 00:00:00', '2004-04-08 10:48:41', '2004-02-09 10:02:43', '1');
INSERT INTO `thisday` VALUES ('11', 'My wife, Kannika was born', '37', '0', '1977-12-24 00:00:00', '2005-03-01 22:01:22', '2004-02-09 10:02:45', '1');
INSERT INTO `thisday` VALUES ('12', 'my dog Max was born', '93', '0', '1988-02-14 00:00:00', '2004-02-09 19:47:06', '2004-02-09 10:02:48', '1');
INSERT INTO `thisday` VALUES ('13', 'I graduated in Electronic & Computer Engineering at Bridgewater Hall', '81', '0', '1999-07-14 00:00:00', '2004-02-09 21:10:49', '2004-02-09 21:10:49', '1');
INSERT INTO `thisday` VALUES ('14', 'My old school friend Richard Dalton started the first full day of his 16 jail sentence for a series of armed robbery\'s!', '93', '0', '2003-12-06 00:00:00', '2004-02-09 21:14:03', '2004-02-09 21:14:03', '1');
INSERT INTO `thisday` VALUES ('15', 'Kannika and I went scuba diving off hook island in the whitsundays', '52', '0', '2004-01-07 00:00:00', '2004-02-09 21:15:20', '2004-02-09 21:15:20', '1');
INSERT INTO `thisday` VALUES ('16', 'I won the U.K Open pool championships', '93', '244', '1999-05-19 00:00:00', '2004-02-09 21:18:10', '2004-02-09 21:18:10', '1');
INSERT INTO `thisday` VALUES ('17', 'I got pulled over for driving over 100 km/h with no lights on. I was driving a Toyota Corolla, Reg YJ 9818 ay 8:50pm', '57', '0', '1999-11-30 00:00:00', '2004-02-09 21:22:14', '2004-02-09 21:22:14', '1');
INSERT INTO `thisday` VALUES ('18', 'my nephew and godson Daniel Paul Jones was baptised', '93', '0', '1995-08-27 00:00:00', '2004-02-09 21:25:06', '2004-02-09 21:25:06', '1');
INSERT INTO `thisday` VALUES ('19', 'My mother sent 300 pounds to me', '49', '0', '1999-09-24 00:00:00', '2004-02-09 21:26:57', '2004-02-09 21:26:57', '1');
INSERT INTO `thisday` VALUES ('20', 'I got pissed out of my face and had one of the best nights of my life in the Hard Rock Cafe', '28', '0', '2000-02-05 00:00:00', '2004-02-09 21:29:18', '2004-02-09 21:29:18', '1');
INSERT INTO `thisday` VALUES ('21', 'my friend Jon Sent me 100 pounds for some hot cd\'s', '33', '0', '1998-04-09 00:00:00', '2004-02-09 21:33:06', '2004-02-09 21:33:06', '1');
INSERT INTO `thisday` VALUES ('22', 'my mam sent me 400 pounds', '38', '0', '2000-02-22 00:00:00', '2004-02-09 21:35:36', '2004-02-09 21:35:36', '1');
INSERT INTO `thisday` VALUES ('23', 'I was christened Craig Alan Riley at the Bishop King Edward Church', '93', '42', '1977-02-13 00:00:00', '2004-02-10 13:51:44', '2004-02-10 13:51:44', '1');
INSERT INTO `thisday` VALUES ('24', 'I lost my first tooth!', '93', '0', '1977-12-25 00:00:00', '2004-02-10 13:54:27', '2004-02-10 13:54:27', '1');
INSERT INTO `thisday` VALUES ('25', 'I got chicken pox', '93', '0', '1979-03-29 00:00:00', '2004-02-10 13:55:11', '2004-02-10 13:55:11', '1');
INSERT INTO `thisday` VALUES ('26', 'I was operated on to fix a damaged ureutha  in Sheffield Childrens Hospital', '130', '0', '1975-02-26 00:00:00', '2005-10-16 18:37:20', '2004-02-10 13:57:17', '1');
INSERT INTO `thisday` VALUES ('27', 'My mother and father met each other at the working mens club (now cassablanca)', '93', '0', '1970-12-24 00:00:00', '2004-02-10 14:05:29', '2004-02-10 14:05:29', '1');
INSERT INTO `thisday` VALUES ('28', 'my parents got married at the registry office', '93', '0', '1974-03-15 00:00:00', '2004-02-10 14:06:57', '2004-02-10 14:06:57', '1');
INSERT INTO `thisday` VALUES ('29', 'my father finally gave my mam an engagement ring, 18 years after they got married', '93', '0', '1992-08-01 00:00:00', '2004-02-10 14:08:03', '2004-02-10 14:08:03', '1');
INSERT INTO `thisday` VALUES ('30', 'my dog Max was very ill and suffering, he was 14 years old and my father had to take him to be put down', '93', '0', '1999-08-14 00:00:00', '2004-02-11 10:29:19', '2004-02-11 10:29:19', '1');
INSERT INTO `thisday` VALUES ('31', 'my Grandad Harold Elliot was born in nottingham, date?', '0', '0', '1927-02-11 00:00:00', '2004-02-11 10:30:43', '2004-02-11 10:30:43', '2');
INSERT INTO `thisday` VALUES ('32', 'my nanna Doreen Elliot was born what date?', '93', '0', '1930-02-11 00:00:00', '2004-02-11 10:31:34', '2004-02-11 10:31:34', '2');
INSERT INTO `thisday` VALUES ('33', 'my nanna, Doreen Elliot was 6 months pregnant with my Mam when she married Harold Elliot at the registry office', '93', '0', '1948-12-27 00:00:00', '2004-02-11 10:34:29', '2004-02-11 10:33:06', '1');
INSERT INTO `thisday` VALUES ('34', 'my grandad Harold Elliot died', '93', '0', '1999-03-03 00:00:00', '2004-02-11 11:08:11', '2004-02-11 11:08:11', '1');
INSERT INTO `thisday` VALUES ('35', 'my nanna Doreen Elliot died', '93', '0', '1999-06-07 00:00:00', '2004-02-11 11:09:33', '2004-02-11 11:09:33', '1');
INSERT INTO `thisday` VALUES ('36', 'I watched England beat France in the semi finals of the rugby world cup', '48', '131', '2003-11-16 00:00:00', '2004-02-11 14:19:25', '2004-02-11 14:19:25', '1');
INSERT INTO `thisday` VALUES ('37', 'I watched England play the first day of the 5th Ashes cricket test against Australia', '48', '286', '2003-01-02 00:00:00', '2004-02-11 14:21:34', '2004-02-11 14:21:34', '1');
INSERT INTO `thisday` VALUES ('38', 'I watched Turkey v Sengal in the quarter finals of the 2002 world cup finals', '41', '151', '2002-06-22 00:00:00', '2004-02-11 15:04:41', '2004-02-11 15:04:41', '1');
INSERT INTO `thisday` VALUES ('39', 'I watched Germany v Rep. of Ireland in the group stage of the 2002 world cup finals', '41', '150', '2002-06-05 00:00:00', '2004-02-11 15:05:54', '2004-02-11 15:05:54', '1');
INSERT INTO `thisday` VALUES ('40', 'I watched England v Sweden in the group stage of the 2002 world cup finals', '41', '148', '2002-06-02 00:00:00', '2004-02-11 15:06:20', '2004-02-11 15:05:59', '1');
INSERT INTO `thisday` VALUES ('41', 'I watched the British lions rugby team play the waratahs', '48', '288', '2001-06-23 00:00:00', '2004-02-11 15:56:58', '2004-02-11 15:56:58', '1');
INSERT INTO `thisday` VALUES ('42', 'I watched Tim Henman and Anna Kornikova amongst others play in the Australian Open tennis tournament', '49', '289', '2000-01-23 00:00:00', '2004-02-11 16:48:15', '2004-02-11 16:48:15', '1');
INSERT INTO `thisday` VALUES ('43', 'I watched the Fifa all stars play the mighty Brazil in at giants stadium', '75', '283', '1996-07-14 00:00:00', '2004-02-11 16:49:52', '2004-02-11 16:49:52', '1');
INSERT INTO `thisday` VALUES ('44', 'I watched Riddock Bowe fight Andrew Golota(and then the resulting riot after Golota was disqualified for low blows) at Madison Square Garden', '74', '285', '1996-07-11 00:00:00', '2004-02-11 16:55:06', '2004-02-11 16:55:06', '1');
INSERT INTO `thisday` VALUES ('45', 'I went to court for concilliation with Reading Room, unfortunately I was the only one willing to settle! (2pm)', '48', '0', '2004-02-17 00:00:00', '2004-02-23 13:55:55', '2004-02-23 13:55:55', '2');
INSERT INTO `thisday` VALUES ('46', 'I went back to court for concilliation with Reading Room, unfortunately I was still the only one willing to settle, so we\'ll have to let the court decide! (11:30am)', '48', '0', '2004-02-19 00:00:00', '2004-02-23 13:56:46', '2004-02-23 13:55:59', '2');
INSERT INTO `thisday` VALUES ('47', 'I started my first day at Crosby First School', '93', '0', '1979-01-09 00:00:00', '2004-03-21 15:44:25', '2004-03-21 15:44:25', '1');
INSERT INTO `thisday` VALUES ('48', 'I climbed about two thirds of the way up Ayers rock with Kannika before thinking better of it and heading back down!', '114', '0', '2004-12-14 00:00:00', '2005-03-05 18:38:25', '2005-03-05 18:38:25', '1');
INSERT INTO `thisday` VALUES ('49', 'I sold my Italjet Dragster 180 motorbike, my first ever vehicle', '48', '0', '2004-12-07 00:00:00', '2005-10-16 18:31:39', '2005-03-05 18:40:31', '1');
INSERT INTO `thisday` VALUES ('50', 'A saw on the news in my hotel room that a massive Tsunami had hit southern Thailand and many other countries after a major earth quake underneath the Indian ocean', '38', '0', '2004-12-26 00:00:00', '2005-03-05 18:43:21', '2005-03-05 18:42:29', '1');
INSERT INTO `thisday` VALUES ('51', 'I resigned from my role as Coldfusion Developer at the Sydney Harbour Foreshore Authority', '48', '0', '2004-12-10 00:00:00', '2005-03-01 22:00:48', '2005-03-01 22:00:48', '2');
INSERT INTO `thisday` VALUES ('53', 'I played Efren \"The Magician\" Reyes for $200 and lost 11 - 9 after leading 7 - 5 off even', '24', '316', '2005-02-05 00:00:00', '2005-03-02 14:46:07', '2005-03-02 14:46:07', '1');
INSERT INTO `users` VALUES ('13', 'Craig', 'Riley', '', 'Web Developer', 'SHFA', '02 ...', '0425 295363', '', 'c.riley@swiftdsl.com.au', 'admin', 'kannika', '0', '4 / 94 - 96 Mount Street', 'Sydney', 'Coogee', 'NSW', '0', '', '2003-10-10', '1');
INSERT INTO `web_techs` VALUES ('1', 'Windows', 'web_windows.gif', '0');
INSERT INTO `web_techs` VALUES ('2', 'Linux', 'web_linux.gif', '0');
INSERT INTO `web_techs` VALUES ('3', 'CF Studio', 'web_cfstudio.gif', '3');
INSERT INTO `web_techs` VALUES ('4', 'DreamweaverMX', 'web_dream.gif', '3');
INSERT INTO `web_techs` VALUES ('5', 'FireworksMX', 'web_fire.gif', '2');
INSERT INTO `web_techs` VALUES ('6', 'ColdfusionMX', 'web_cfmx.gif', '6');
INSERT INTO `web_techs` VALUES ('7', 'FlashMX', 'web_flash.gif', '4');
INSERT INTO `web_techs` VALUES ('8', 'Flash Remoting', 'web_remoting.gif', '5');
INSERT INTO `web_techs` VALUES ('9', 'Excel 2000', 'web_excel2000.gif', '8');
INSERT INTO `web_techs` VALUES ('10', 'Excel 2003', '', '8');
INSERT INTO `web_techs` VALUES ('11', 'Access 2000', 'web_access2000.gif', '9');
INSERT INTO `web_techs` VALUES ('12', 'Access 2003', 'web_access2003.gif', '9');
INSERT INTO `web_techs` VALUES ('13', 'MySQL', 'web_mysql.gif', '10');
INSERT INTO `web_techs` VALUES ('14', 'SQL Server 2000', 'web_sqlserver2000.gif', '11');
INSERT INTO `web_techs` VALUES ('15', 'SQL Server', 'web_sqlserver1.gif', '11');
INSERT INTO `web_techs` VALUES ('16', 'Oracle', 'web_oracle.gif', '12');
INSERT INTO `web_techs` VALUES ('17', 'Shopping Basket', 'web_basket.gif', '13');
INSERT INTO `web_techs` VALUES ('18', 'Intershop', 'web_intershop.gif', '15');
INSERT INTO `web_techs` VALUES ('19', 'World Pay', 'web_worldpay.gif', '14');
INSERT INTO `web_techs` VALUES ('20', 'ASP', 'web_asp1.gif', '7');
INSERT INTO `web_techs` VALUES ('21', 'Adobe Photoshop', 'web_photoshop.gif', '2');
INSERT INTO `web_techs` VALUES ('22', 'Filemaker Pro', 'web_filemakerpro.gif', '12');
INSERT INTO `web_techs` VALUES ('24', 'HomeSite', 'web_home2.gif', '3');
INSERT INTO `web_techs` VALUES ('25', 'Award Winning Site', 'web_award.gif', '16');
