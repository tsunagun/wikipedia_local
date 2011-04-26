USE `wikipedia_ja`;

ALTER TABLE categorylinks DROP cl_sortkey, DROP cl_timestamp;
ALTER TABLE categorylinks CHANGE cl_from article_id int(8) unsigned NOT NULL DEFAULT '0';
ALTER TABLE categorylinks CHANGE cl_to category varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `page_id` int(10) unsigned NOT NULL,
  `page_title` varchar(255) NOT NULL,
  KEY `page_id` (`page_id`),
  KEY `page_title` (`page_title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

INSERT INTO pages SELECT page_id, page_title FROM page;

UPDATE pages AS p1 INNER JOIN (
  redirect AS r INNER JOIN pages AS p2 ON r.rd_title = p2.page_title
) ON p1.page_id = r.rd_from
SET p1.page_id = p2.page_id;
