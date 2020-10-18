# GridDB向けDockerfileサンプル集

以下の環境で動作を確認しています。
- Docker: Docker Toolbox on Windows
- GridDB Server: シングル構成
- クラスタ名: dockerGridDB
- GridDb管理者のアカウント: admin/admin

|Dockerイメージ名|概要|
|-|-|
|griddb| GridDB V4.5CEサーバのインストール＆起動 (CentOS用)|
|griddb-bionic| GridDB V4.5CEサーバのインストール＆起動 (Ubuntu:bionic用)|
|griddb-opensuse-15| GridDB V4.5CEサーバのインストール＆起動 (openSUSE leap 15用)|
|python-db-api| GridDB JDBCとJayDeBeApi(DB-API)のインストール (Java＆Python環境)|
|webapi| GridDB WebAPIのインストール＆デーモン起動|
|java-client| GridDB Javaクライアントライブラリのインストールとサンプルコードのビルド＆実行|
|c-client| GridDB Cクライアントライブラリのインストールとサンプルコードのビルド＆実行|
|python-client| GridDB Pythonクライアントライブラリのインストールとサンプルコードの実行|
|nodejs-client| GridDB Node.JSクライアントライブラリのインストールとサンプルコードの実行|
|go-client| GridDB Goクライアントライブラリのインストールとサンプルコードの実行|
|php-client| GridDB PHPクライアントライブラリのインストールとサンプルコードの実行|
|griddb-nosql| GridDB V4.3CEサーバ(NoSQL)のインストール＆起動 (CentOS用))|

# GridDB V4.5CEによるSQLインタフェースの利用

## 1. GridDB Server
好みのOSのGridDBサーバをインストール＆起動してください。

### (CentOS7)
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb:0.2
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb:0.2
### (Ubuntu:bionic)
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-bionic:0.2
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-bionic:0.2
### (openSUSE leap 15)
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-opensuse-15:0.2
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-opensuse-15:0.2

## 2. SQLWorkbench/J (Java環境)
予めGridDBサーバを起動してください。

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/python-db-api:0.2
    > docker run -it docker.pkg.github.com/knonomura/griddb-docker/python-db-api:0.2 bash

以下の手順でSQL Workbench/Jをインストールしてください。  
※特定の国の政府機関は利用できませんが、日本は利用制限に含まれていません。  
"This software is licensed under a modified version of the Apache License, Version 2.0 http://sql-workbench.eu/manual/license.html that restricts the use of the software for certain organizations."

    # wget https://www.sql-workbench.eu/Workbench-Build125.zip
    # mkdir sqlworkbench
    # cd sqlworkbench
    # unzip ../Workbench-Build125.zip
    # chmod +x *.sh
    # ./sqlwbconsole.sh
    
    > WbConnect -driver=com.toshiba.mwcloud.gs.sql.Driver -driverJar=../gridstore-jdbc.jar 
      -url=jdbc:gs://239.0.0.1:41999/dockerGridDB/public -username=admin -password=admin;
    > CREATE TABLE myTable (id INTEGER PRIMARY KEY, val INTERGER);

[SQLサンプル](SQLSamples.md)を参照してください。

## 3. JayDeBeApi(DB-API) (Python環境)
予めGridDBサーバを起動してください。

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/python-db-api:0.2
    > docker run -it docker.pkg.github.com/knonomura/griddb-docker/python-db-api:0.2 bash
    # python DBAPISample.py

DBAPISample.pyは[こちら](https://github.com/knonomura/griddb-docker/blob/master/python-db-api/4.5/DBAPISample.py)を参照してください。

## 4. WebAPI
予めGridDBサーバを起動してください。

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/webapi:0.2
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/webapi:0.2
    > docker exec -it <CONTAINER ID for webapi IMAGE> bash
    # ./sample.sh
    {"count":1}{"columns":[...
    > docker stop <CONTAINER ID for webapi IMAGE>
    
sample.shは[こちら](https://github.com/knonomura/griddb-docker/blob/master/webapi/4.5/sample.sh)を参照してください。

# GridDB V4.5CEによるNoSQLインタフェースの利用

## Java Client
予めGridDBサーバを起動してください。

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/java-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/java-client:0.1
    ...
    Person:  name=name02 status=false count=2 lob=[65, 66, 67, 68, 69, 70, 71, 72, 73, 74]
    ...

## C Client
予めGridDBサーバを起動してください。

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/c-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/c-client:0.1
    Person: name=name02 status=false count=2 lob=[65, 66, 67, 68, 69, 70, 71, 72, 73, 74]

## Python Client
予めGridDBサーバを起動してください。

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/python-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/python-client:0.1
    Person: name=name02 status=False count=2 lob=[65, 66, 67, 68, 69, 70, 71, 72, 73, 74]

## Node.JS Client
予めGridDBサーバを起動してください。

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/nodejs-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/nodejs-client:0.1
    [ 'name01', false, 1, <Buffer 41 42 43 44 45 46 47 48 49 4a> ]

## Go Client
予めGridDBサーバを起動してください。

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/go-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/go-client:0.1
    Person: name= name02  status= false  count= 2  lob= [65 66 67 68 69 70 71 72 73 74]

## PHP Client
予めGridDBサーバを起動してください。

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/php-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/php-client:0.1
    Person: name=name02 status=false count=2 lob=ABCDEFGHIJ


# GridDB V4.3CEによるNoSQLインタフェースの利用

## Java Client
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/java-client:0.1
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/java-client:0.1
    ...
    Person:  name=name02 status=false count=2 lob=[65, 66, 67, 68, 69, 70, 71, 72, 73, 74]
    ...
    > docker stop <CONTAINER ID for griddb-nosql IMAGE>

## C Client
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/c-client:0.1
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/c-client:0.1
    Person: name=name02 status=false count=2 lob=[65, 66, 67, 68, 69, 70, 71, 72, 73, 74]
    > docker stop <CONTAINER ID for griddb-nosql IMAGE>

## Python Client
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/python-client:0.1
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/python-client:0.1
    Person: name=name02 status=False count=2 lob=[65, 66, 67, 68, 69, 70, 71, 72, 73, 74]
    > docker stop <CONTAINER ID for griddb-nosql IMAGE>

## Node.JS Client
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/nodejs-client:0.1
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/nodejs-client:0.1
    [ 'name01', false, 1, <Buffer 41 42 43 44 45 46 47 48 49 4a> ]
    > docker stop <CONTAINER ID for griddb-nosql IMAGE>

## Go Client
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/go-client:0.1
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/go-client:0.1
    Person: name= name02  status= false  count= 2  lob= [65 66 67 68 69 70 71 72 73 74]
    > docker stop <CONTAINER ID for griddb-nosql IMAGE>

## PHP Client
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/php-client:0.1
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/php-client:0.1
    Person: name=name02 status=false count=2 lob=ABCDEFGHIJ
    > docker stop <CONTAINER ID for griddb-nosql IMAGE>

## WebAPI
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/webapi:0.1
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-nosql:0.1
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/webapi:0.1
    > docker exec -it <CONTAINER ID for webapi IMAGE> bash
    # curl  https://raw.githubusercontent.com/knonomura/griddb-docker/master/webapi/sample.sh -o sample.sh
    # ./sample.sh
    {"count":1}{"columns":[...
    > docker stop <CONTAINER ID for webapi IMAGE>
    > docker stop <CONTAINER ID for griddb-nosql IMAGE>

