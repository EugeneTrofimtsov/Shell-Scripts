#!/bin/bash

db_name="default"

# Get information about all tables in the specified database
for i in `hive --database=${db_name} -e 'show tables;' | grep -v 'INFO' | grep -v 'WARN'`;
do
	echo "${i}" | tee -a info.txt;
	hive --database=${db_name} -hivevar tab=$i -e 'desc ${tab};' | grep -v 'INFO' | grep -v 'WARN' | tee -a info.txt;
done;

# Get number of columns of tables in the specified database
for i in `hive --database=${db_name} -e 'show tables;' | grep -v 'INFO' | grep -v 'WARN'`;
do
	echo -n "${i} " | tee -a info.txt;
	hive --database=${db_name} -hivevar tab=$i -e 'show columns in ${tab};' | grep -v 'INFO' | grep -v 'WARN' | wc -l | tee -a info.txt;
done;

# Create hql file with views body for all tables in the specified database
for i in `hive --database=${db_name} -e 'show tables;' | grep -v 'INFO' | grep -v 'WARN'`;
do
	echo "drop view if exists ${db_name}.${i}_v;" | tee -a create_views.hql;
	{ echo "create view ${db_name}.${i}_v as select"; hive --database=${db_name} -hivevar tab=$i -e 'show columns in ${tab};' | grep -v 'INFO' | grep -v 'WARN' | tr '\n' ',' | sed 's/,$/\n/' | tr -d ' '; echo "from ${db_name}.${i};"; } | tr '\n' ' ' | sed 's/ $/\n/' | tee -a create_views.hql
done;
