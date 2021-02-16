# Bash file for MongoDB operations.

mongo PrismData --eval 'db.'Opp_Stage_Name'.drop()'
mongo PrismData --eval 'db.'Renew_Status'.drop()'
mongo PrismData --eval 'db.'Type_All'.drop()'
mongo PrismData --eval 'db.'Revision_Id'.drop()'

mongo PrismData --eval 'db.createCollection("Opp_Stage_Name")'
mongo PrismData --eval 'db.createCollection("Renew_Status")'
mongo PrismData --eval 'db.createCollection("Type_All")'

