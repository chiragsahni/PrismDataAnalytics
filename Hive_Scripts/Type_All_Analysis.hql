--This is a Hive Script for counting different types of data.


add jar ${hiveconf:var}/bson-3.4.2.jar;
add jar ${hiveconf:var}/hive-hcatalog-core-1.2.1.jar;
add jar ${hiveconf:var}/hive-hcatalog-server-extensions-1.2.1.jar;
add jar ${hiveconf:var}/hive-hcatalog-streaming-1.2.1.jar;           
add jar ${hiveconf:var}/mongo-hadoop-core.jar;
add jar ${hiveconf:var}/mongo-hadoop-hive.jar;
add jar ${hiveconf:var}/mongo-java-driver.jar;
add jar ${hiveconf:var}/hive-json-serde.jar;


drop table type_all;


CREATE EXTERNAL TABLE type_all
(x STRING, y STRING)
STORED BY 'com.mongodb.hadoop.hive.MongoStorageHandler'
WITH SERDEPROPERTIES('mongo.columns.mapping'='{"x":"X","y":"Y"}')
TBLPROPERTIES('mongo.uri'='mongodb://localhost:27017/PrismData.Type_All');


insert into type_all select type as x, count(type) as y from opportunity
group by type;


insert into type_all select type as x, count(type) as y from accounts
group by type;


insert into type_all select type as x, count(type) as y from ssrenew
group by type;




