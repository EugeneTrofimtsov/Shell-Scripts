#!/bin/bash

PARAM1="value1"
PARAM2="value2_1 value2_2"
PARAM3_1="value3_1"
PARAM3_2="value3_2"

echo Start $(date '+%H:%M:%S')

spark-submit \
--class path.to.Main \
--master yarn \
--deploy-mode [client|cluster] \
--keytab /path/to/keytab \
--principal name@DOMEN \
--queue name \
--jars /path/to/jar \
--driver-cores X \
--driver-memory XG \
--num-executors X \
--executor-cores X \
--executor-memory XG \
--conf spark.app.name=Project_name \
--conf spark.hadoop.hive.exec.dynamic.partition=true \
--conf spark.hadoop.hive.exec.dynamic.partition.mode=nonstrict \
--conf spark.sql.legacy.allowCreatingManagedTableUsingNonemptyLocation=true \
/path/to/project/jar \
PARAM1==${PARAM1} \
PARAM2=="${PARAM2}" \
PARAM3==${PARAM3_1}_${PARAM3_2} \

echo Start $(date '+%H:%M:%S')
