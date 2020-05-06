#!/bin/bash

curl -X POST --basic -u admin:admin -H "Content-type:application/json" -d '{"container_name":"test", "container_type":"COLLECTION", "rowkey":true, "columns":[{"name":"col1", "type":"STRING", "index":["TREE"]}, {"name":"col2", "type":"INTEGER"}, {"name":"col3", "type":"BOOL"}]}' http://127.0.0.1:8080/griddb/v2/dockerGridDB/dbs/public/containers

curl -X PUT --basic -u admin:admin -H "Content-type:application/json" -d '[["value", 1, true]]' http://127.0.0.1:8080/griddb/v2/dockerGridDB/dbs/public/containers/test/rows 

curl -X POST --basic -u admin:admin -H "Content-type:application/json" -d '{"limit":1000}' http://127.0.0.1:8080/griddb/v2/dockerGridDB/dbs/public/containers/test/rows 

curl -X POST --basic -u admin:admin -H "Content-type:application/json" -d '[{"name":"test", "stmt":"select *", "columns":[]}]' http://127.0.0.1:8080/griddb/v2/dockerGridDB/dbs/public/tql 