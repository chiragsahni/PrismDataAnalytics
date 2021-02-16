--This is a Hive Script for doing Analysis on Opportunity StageName.
add jar ${hiveconf:var}/bson-3.4.2.jar;
add jar ${hiveconf:var}/hive-hcatalog-core-1.2.1.jar;
add jar ${hiveconf:var}/hive-hcatalog-server-extensions-1.2.1.jar;
add jar ${hiveconf:var}/hive-hcatalog-streaming-1.2.1.jar;           
add jar ${hiveconf:var}/mongo-hadoop-core.jar;
add jar ${hiveconf:var}/mongo-hadoop-hive.jar;
add jar ${hiveconf:var}/mongo-java-driver.jar;
add jar ${hiveconf:var}/hive-json-serde.jar;


drop table opp_stage_name;


CREATE EXTERNAL TABLE opp_stage_name
(x STRING, y STRING)
STORED BY 'com.mongodb.hadoop.hive.MongoStorageHandler'
WITH SERDEPROPERTIES('mongo.columns.mapping'='{"x":"X","y":"Y"}')
TBLPROPERTIES('mongo.uri'='mongodb://localhost:27017/PrismData.Opp_Stage_Name');

insert into opp_stage_name select StageName as x, count(StageName) as y from opportunity
group by StageName having count(StageName)>10;
