# Dockerfile samples for GridDB

GridDB Dockerfile sample has been confirmed to work in the following environments:
- Docker: Docker Toolbox on Windows
- Base image: centos:7, java:8
- GridDB Server: Single-node cluster

|IMAGE|Description|
|-|-|
|griddb-nosql| Install and start GridDB server|
|java-client| Install GridDB Java client and build, run a sample program|
|c-client| Install GridDB C client and build, run a sample program|
|python-client| Install GridDB Python client and run a sample program|
|nodejs-client| Install GridDB Node.JS client and run a sample program|
|go-client| Install GridDB Go client and run a sample program|
|php-client| Install GridDB PHP client and run a sample program|
|webapi| Install and start GridDB WebAPI daemon|

# Usage

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
    > docker run --rm docker.pkg.github.com/knonomura/griddb-docker/webapi:0.1
    > docker exec -it <CONTAINER ID for webapi IMAGE> bash
    # curl  https://raw.githubusercontent.com/knonomura/griddb-docker/master/webapi/sample.sh -o sample.sh
    # ./sample.sh
    {"count":1}{"columns":[...
    > docker stop <CONTAINER ID for webapi IMAGE>
    > docker stop <CONTAINER ID for griddb-nosql IMAGE>

