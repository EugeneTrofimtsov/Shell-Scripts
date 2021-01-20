#!/bin/bash

# Get information about all tables in the specified database

for i in `hive --database='default' -e 'show tables;'`;
do
	echo "${i}" | tee -a info.txt;
	hive --database='default' -hivevar tab=$i -e 'desc ${tab};' | tee -a info.txt;
done;