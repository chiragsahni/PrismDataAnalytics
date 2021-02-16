--This is a Hive Script for doing Analysis on Renewal Status.


add jar ${hiveconf:var}/bson-3.4.2.jar;
add jar ${hiveconf:var}/hive-hcatalog-core-1.2.1.jar;
add jar ${hiveconf:var}/hive-hcatalog-server-extensions-1.2.1.jar;
add jar ${hiveconf:var}/hive-hcatalog-streaming-1.2.1.jar;           
add jar ${hiveconf:var}/mongo-hadoop-core.jar;
add jar ${hiveconf:var}/mongo-hadoop-hive.jar;
add jar ${hiveconf:var}/mongo-java-driver.jar;
add jar ${hiveconf:var}/hive-json-serde.jar;



drop table renew_status;


CREATE EXTERNAL TABLE renew_status
(x STRING, y STRING)
STORED BY 'com.mongodb.hadoop.hive.MongoStorageHandler'
WITH SERDEPROPERTIES('mongo.columns.mapping'='{"x":"X","y":"Y"}')
TBLPROPERTIES('mongo.uri'='mongodb://localhost:27017/PrismData.Renew_Status');

insert into renew_status select ServiceSource1__REN_Renewal_Status__c as x, count(ServiceSource1__REN_Renewal_Status__c) as y from ssrenew
group by ServiceSource1__REN_Renewal_Status__c;

