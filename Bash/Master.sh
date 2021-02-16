# Master Bash File which controls all other bash files.

if [ $# -eq 1 ]
then
	bash /home/IMPETUS/chirag.sahni/Desktop/PrismDataAnalytics/bash/mongo.sh  
	bash /home/IMPETUS/chirag.sahni/Desktop/PrismDataAnalytics/bash/hadoop.sh $1	
	bash /home/IMPETUS/chirag.sahni/Desktop/PrismDataAnalytics/bash/hive.sh $1 
	bash /home/IMPETUS/chirag.sahni/Desktop/PrismDataAnalytics/bash/r.sh $1
else 
	echo 'This command requires an argument
              containing the path to the location
              where the PrismDataAnalytics.tar.gz
	      file is uncompressed.
	      eg:- /home/IMPETUS/chirag.sahni/Desktop/PrismDataAnalytics' 
fi
