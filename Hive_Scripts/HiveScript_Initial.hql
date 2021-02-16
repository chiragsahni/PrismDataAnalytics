--This is a Hive Script for getting data onto Hive.


add jar ${hiveconf:var}/bson-3.4.2.jar;
add jar ${hiveconf:var}/hive-hcatalog-core-1.2.1.jar;
add jar ${hiveconf:var}/hive-hcatalog-server-extensions-1.2.1.jar;
add jar ${hiveconf:var}/hive-hcatalog-streaming-1.2.1.jar;           
add jar ${hiveconf:var}/mongo-hadoop-core.jar;
add jar ${hiveconf:var}/mongo-hadoop-hive.jar;
add jar ${hiveconf:var}/mongo-java-driver.jar;
add jar ${hiveconf:var}/hive-json-serde.jar;




CREATE EXTERNAL TABLE opportunity(
 type string,
 StageName string,
 Name string,
 systemproperties struct<revisionId:string,createdOn:string,expiredOn:string>
)
PARTITIONED BY (ds string)
ROW FORMAT SERDE
 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS INPUTFORMAT
 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
 '${hiveconf:var_opp}';


msck repair table opportunity;

CREATE EXTERNAL TABLE accounts(
 type string,
 Name string,
 systemproperties struct<revisionId:string,createdOn:string,expiredOn:string>
)
PARTITIONED BY (ds string)
ROW FORMAT SERDE
 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS INPUTFORMAT
 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
 '${hiveconf:var_acc}';

msck repair table accounts;



CREATE EXTERNAL TABLE ssrenew(
 type string,
 Name string,
 systemproperties struct<revisionId:string,createdOn:string,expiredOn:string>,
 ServiceSource1__REN_Renewal_Status__c string
)
PARTITIONED BY (ds string)
ROW FORMAT SERDE
 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS INPUTFORMAT
 'org.apache.hadoop.mapred.TextInputFormat'
OUTPUTFORMAT
 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION
 '${hiveconf:var_ssr}' ;

msck repair table ssrenew;


