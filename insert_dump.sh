USER="root"
PASSWORD=""
DATABASE="wikipedia_ja"
mysql5 -u ${USER} -p${PASSWORD} < create_tables.sql
mysqlimport5 -u ${USER} -p${PASSWORD} --local ${DATABASE} --fields-terminated-by='\t' --default-character-set=utf8 dump/{page,revision,text}.txt
mysql5 -u ${USER} -p${PASSWORD} ${DATABASE} < dump/jawiki-latest-redirect.sql
mysql5 -u ${USER} -p${PASSWORD} ${DATABASE} < dump/jawiki-latest-categorylinks.sql
mysql5 -u ${USER} -p${PASSWORD} ${DATABASE} < dump/jawiki-latest-category.sql
mysql5 -u ${USER} -p${PASSWORD} ${DATABASE} < dump/jawiki-latest-langlinks.sql
mysql5 -u ${USER} -p${PASSWORD} ${DATABASE} < dump/jawiki-latest-pagelinks.sql
mysql5 -u ${USER} -p${PASSWORD} < after.sql
