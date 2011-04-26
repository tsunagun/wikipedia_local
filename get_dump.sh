mkdir dump
cd dump

wget http://download.wikimedia.org/jawiki/latest/jawiki-latest-categorylinks.sql.gz
gunzip jawiki-latest-categorylinks.sql.gz
gsed -i 's/TYPE=InnoDB/TYPE=MyISAM/' jawiki-latest-categorylinks.sql
gsed -i '/KEY `cl_sortkey`/ c \ \ KEY `cl_to` \(`cl_to`\)' jawiki-latest-categorylinks.sql
gsed -i '/KEY `cl_timestamp`/ d' jawiki-latest-categorylinks.sql

wget http://download.wikimedia.org/jawiki/latest/jawiki-latest-pages-articles.xml.bz2
bunzip2 jawiki-latest-pages-articles.xml.bz2
grep -v '<redirect />' jawiki-latest-pages-articles.xml | ../xml2sql-0.5/xml2sql

wget http://download.wikimedia.org/jawiki/latest/jawiki-latest-redirect.sql.gz
gunzip jawiki-latest-redirect.sql.gz
gsed -i 's/TYPE=InnoDB/TYPE=MyISAM/' jawiki-latest-redirect.sql
gsed -i '/PRIMARY KEY/ a \ \ KEY `rd_title` \(`rd_title`\),' jawiki-latest-redirect.sql

wget http://download.wikimedia.org/jawiki/latest/jawiki-latest-category.sql.gz
gunzip jawiki-latest-category.sql.gz
gsed -i 's/TYPE=InnoDB/TYPE=MyISAM/' jawiki-latest-category.sql

wget http://download.wikimedia.org/jawiki/latest/jawiki-latest-externallinks.sql.gz
gunzip jawiki-latest-externallinks.sql.gz
gsed -i 's/TYPE=InnoDB/TYPE=MyISAM/' jawiki-latest-externallinks.sql

wget http://download.wikimedia.org/jawiki/latest/jawiki-latest-pagelinks.sql.gz
gunzip jawiki-latest-pagelinks.sql.gz
gsed -i 's/TYPE=InnoDB/TYPE=MyISAM/' jawiki-latest-pagelinks.sql
gsed -i '/UNIQUE KEY/ a \ \ KEY `pl_title` \(`pl_title`\),' jawiki-latest-pagelinks.sql

wget http://download.wikimedia.org/jawiki/latest/jawiki-latest-langlinks.sql.gz
gunzip jawiki-latest-langlinks.sql.gz
gsed -i 's/TYPE=InnoDB/TYPE=MyISAM/' jawiki-latest-pagelinks.sql
