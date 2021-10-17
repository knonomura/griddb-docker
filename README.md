# Dockerfile samples for GridDB

GridDB Dockerfile sample has been confirmed to work in the following environments:
- Docker: Docker Toolbox on Windows
- GridDB Server: Single-node cluster
- Cluster name: dockerGridDB
- Administrator account: admin/admin

|IMAGE|Description|
|-|-|
|griddb| Install and start GridDB V4.6CE server for CentOS|
|griddb-bionic| Install and start GridDB V4.6CE server for Ubuntu:bionic|
|griddb-opensuse-15| Install and start GridDB V4.6CE server for openSUSE leap 15|
|python-db-api| Install GridDB JDBC, JayDeBeApi(DB-API) for Java and Python env.|
|webapi| Install and start GridDB WebAPI daemon|
|java-client| Install GridDB Java client and build, run a sample program|
|c-client| Install GridDB C client and build, run a sample program|
|python-client| Install GridDB Python client and run a sample program|
|nodejs-client| Install GridDB Node.JS client and run a sample program|
|go-client| Install GridDB Go client and run a sample program|
|php-client| Install GridDB PHP client and run a sample program|
|griddb-nosql| Install and start GridDB NoSQL server (V4.3CE)|

# Using SQL Interface with GridDB V4.6CE

## 1. GridDB Server

### (CentOS7)
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb:0.3
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb:0.3
### (Ubuntu:bionic)
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-bionic:0.3
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-bionic:0.3
### (openSUSE leap 15)
    > docker pull docker.pkg.github.com/knonomura/griddb-docker/griddb-opensuse-15:0.3
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/griddb-opensuse-15:0.3

## 2. SQLWorkbench/J on Java Env.
Please run GridDB Server in advance.

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/python-db-api:0.2
    > docker run -it docker.pkg.github.com/knonomura/griddb-docker/python-db-api:0.2 bash

Note. Please download after confirming the license of SQL Workbench/J.  
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

Please refer to [SQL Samples](SQLSamples.md).

## 3. JayDeBeApi(DB-API) on Python Env.
Please run GridDB Server in advance.

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/python-db-api:0.2
    > docker run -it docker.pkg.github.com/knonomura/griddb-docker/python-db-api:0.2 bash
    # python DBAPISample.py

## 4. WebAPI
Please run GridDB Server in advance.

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/webapi:0.2
    > docker run --rm -d docker.pkg.github.com/knonomura/griddb-docker/webapi:0.2
    > docker exec -it <CONTAINER ID for webapi IMAGE> bash
    # ./sample.sh
    {"count":1}{"columns":[...
    > docker stop <CONTAINER ID for webapi IMAGE>
    
# Using NoSQL Interface with GridDB V4.6CE

## Java Client
Please run GridDB Server in advance.

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/java-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/java-client:0.1
    ...
    Person:  name=name02 status=false count=2 lob=[65, 66, 67, 68, 69, 70, 71, 72, 73, 74]
    ...

## C Client
Please run GridDB Server in advance.

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/c-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/c-client:0.1
    Person: name=name02 status=false count=2 lob=[65, 66, 67, 68, 69, 70, 71, 72, 73, 74]

## Python Client
Please run GridDB Server in advance.

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/python-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/python-client:0.1
    Person: name=name02 status=False count=2 lob=[65, 66, 67, 68, 69, 70, 71, 72, 73, 74]

## Node.JS Client
Please run GridDB Server in advance.

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/nodejs-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/nodejs-client:0.1
    [ 'name01', false, 1, <Buffer 41 42 43 44 45 46 47 48 49 4a> ]

## Go Client
Please run GridDB Server in advance.

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/go-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/go-client:0.1
    Person: name= name02  status= false  count= 2  lob= [65 66 67 68 69 70 71 72 73 74]

## PHP Client
Please run GridDB Server in advance.

    > docker pull docker.pkg.github.com/knonomura/griddb-docker/php-client:0.1
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/php-client:0.1
    Person: name=name02 status=false count=2 lob=ABCDEFGHIJ


# Using NoSQL Interface with GridDB V4.3CE

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
