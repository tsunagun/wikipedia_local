実行手順

1. ./get_xml2sql.sh
  xml2sqlをダウンロードして，実行ファイルを作成します．

2. ./get_dump.sh
  Wikipedia日本語版から最新版のダンプファイルを取得し，各種処理を行います．
  取得するダンプファイルは以下のもの
    ・jawiki-latest-pages-articles.xml.bz2
    ・jawiki-latest-redirect.sql
    ・jawiki-latest-categorylinks.sql
  ダンプファイルに対して行う処理は以下のもの
    ・jawiki-latest-pages-articles.xml.bz2を展開し，jawiki-latest-pages-articles.xmlを生成．
    ・xml2sqlを使って，jawiki-latest-pages-articles.xmlからpage.txt，revision.txt，text.txtを生成．
    ・jawiki-latest-redirect.sqlとjawiki-latest-categorylinks.sqlの"TYPE=InnoDB"を"TYPE=MyISAM"に変更．

3. vi insert_dump.sh
  変数PASSWORDにMySQLのパスワードを設定します

4. ./insert_dump.sh
  1.で取得，加工したダンプファイルをMySQLデータベースに格納します．
