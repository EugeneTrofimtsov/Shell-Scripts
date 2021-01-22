#!/bin/bash

# Get information about all tables in the specified database

for i in `hive --database='default' -e 'show tables;' | grep -v 'WARN'`;
do
	echo "${i}" | tee -a info.txt;
	hive --database='default' -hivevar tab=$i -e 'desc ${tab};' | grep -v 'WARN' | tee -a info.txt;
done;

# Get number of columns of tables in the specified database

for i in `hive --database='default' -e 'show tables;' | grep -v 'WARN'`;
do
	echo -n "${i} " | tee -a info.txt;
	hive -hivevar tab=$i -e 'show columns in ${tab} from default;' | grep -v 'WARN' | wc -l | tee -a info.txt;
done;
