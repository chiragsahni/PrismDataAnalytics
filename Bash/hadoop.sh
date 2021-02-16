# Bash file for running map reduce code for Id Analysis.

hadoop dfs -rm -R prism*

hadoop jar $1/Jars/MainJar/PrismDataAnalytics-0.0.1-SNAPSHOT.jar prismdataanalytics.IdAnalysis /JsonData1/sbx-frb1-dell-onep-account/ds=2018-02-08-14 prism1
hadoop jar $1/Jars/MainJar/PrismDataAnalytics-0.0.1-SNAPSHOT.jar prismdataanalytics.IdAnalysis /JsonData1/sbx-frb1-dell-onep-servicesource1__ren_renews_to__c/ds=2018-02-08-18 prism2
hadoop jar $1/Jars/MainJar/PrismDataAnalytics-0.0.1-SNAPSHOT.jar prismdataanalytics.IdAnalysis /JsonData1/sbx-frb1-dell-onep-opportunity/ds=2018-03-01-08 prism3

hadoop jar $1/Jars/MainJar/PrismDataAnalytics-0.0.1-SNAPSHOT.jar prismdataanalytics.CreatedByAnalysis /JsonData1/sbx-frb1-dell-onep-account/ds=2018-02-08-14 prism4
hadoop jar $1/Jars/MainJar/PrismDataAnalytics-0.0.1-SNAPSHOT.jar prismdataanalytics.CreatedByAnalysis /JsonData1/sbx-frb1-dell-onep-servicesource1__ren_renews_to__c/ds=2018-02-08-18 prism5
hadoop jar $1/Jars/MainJar/PrismDataAnalytics-0.0.1-SNAPSHOT.jar prismdataanalytics.CreatedByAnalysis /JsonData1/sbx-frb1-dell-onep-opportunity/ds=2018-03-01-08 prism6

