# Bash file for running Hive Scripts.

var=$(hdfs getconf -confKey fs.defaultFS)    #localhost of hdfs

hive -f $1/HiveScripts/HiveScript_Initial.hql -hiveconf var=$1/Jars/HiveJar -hiveconf var_opp=$var/JsonData1/sbx-frb1-dell-onep-opportunity -hiveconf var_acc=$var/JsonData1/sbx-frb1-dell-onep-account -hiveconf var_ssr=$var/JsonData1/sbx-frb1-dell-onep-servicesource1__ren_renews_to__c

hive -f $1/HiveScripts/Opp_Stage_Analysis.hql -hiveconf var=$1/Jars/HiveJar
hive -f $1/HiveScripts/Renew_Status_Analysis.hql -hiveconf var=$1/Jars/HiveJar
hive -f $1/HiveScripts/Type_All_Analysis.hql -hiveconf var=$1/Jars/HiveJar

