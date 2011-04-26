DROP DATABASE IF EXISTS `wikipedia_ja`;
CREATE DATABASE `wikipedia_ja` CHARACTER SET utf8;

USE `wikipedia_ja`;

DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL auto_increment,
  `page_namespace` int(11) NOT NULL,
  `page_title` varchar(255) character set utf8 collate utf8_bin NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_counter` bigint(20) unsigned NOT NULL default '0',
  `page_is_redirect` tinyint(3) unsigned NOT NULL default '0',
  `page_is_new` tinyint(3) unsigned NOT NULL default '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`page_id`),
  KEY `page_title` (`page_title`),
  KEY `page_is_redirect` (`page_is_redirect`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `text`;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL auto_increment,
  `old_text` longtext NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY  (`old_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `revision`;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL auto_increment,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` text NOT NULL,
  `rev_user` int(10) unsigned NOT NULL default '0',
  `rev_user_text` varchar(255) character set utf8 collate utf8_bin NOT NULL default '',
  `rev_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL default '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rev_len` int(10) unsigned default NULL,
  `rev_parent_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`rev_id`),
  KEY `rev_page` (`rev_page`),
  KEY `rev_text_id` (`rev_text_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
