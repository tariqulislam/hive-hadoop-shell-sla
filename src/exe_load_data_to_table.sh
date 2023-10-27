#!/bin/bash
set -e
app_root_dir=/home/hadoop/app
hdfs_app_sample_data_location=/user/hive/warehouse/sample_data
source ${app_root_dir}/func/func_logs.sh || { >&2 echo "${app_root_dir}/func/func_logs.sh function file is missing"; exit 1; }
source ${app_root_dir}/func/func_date.sh || { >&2 echo "${app_root_dir}/func/func_date.sh function file is missing"; exit 1; }
_hive_config_file=${app_root_dir}/conf/hive.conf.ini.hql

function main {
    inform "[OP ] START";

    # Check 
    local _hql_file_path=${app_root_dir}/dml/load_data_into_table.hql
    
    if [[ $# -lt 4 ]]; then
      error "Please Insert the currect Argument"
      exit 1;
    fi

  
    local _DATA_SOURCE_FILE_PATH="${app_root_dir}/data/$1.csv";
    local _TABLE_NAME=$2;
    local _PARTITION_NAME=$3;
    local _PARTIITON_VALUE=$4;
    
    inform "DataSource: ${_DATA_SOURCE_FILE_PATH}.csv"
    inform "Table Name: ${_TABLE_NAME}"
    inform "Partition Name: ${_PARTITION_NAME}"
    inform "Parition Value: ${_PARTIITON_VALUE}"

    hive -i ${_hive_config_file} \
          -hivevar  DATA_SOURCE_FILE_PATH=${_DATA_SOURCE_FILE_PATH} \
          -hivevar  PARTITION_NAME=${_PARTITION_NAME} \
          -hivevar  PARTIITON_VALUE=${_PARTIITON_VALUE} \
          -hivevar  TABLE_NAME=${_TABLE_NAME} \
          -f ${_hql_file_path} || {
        error "Putting file into HDFS is failed. Or HDFS service is not running"
        exit 1;
    }

    inform "Data Insert Into Database table....";
    inform "[OP ] END"
}

main "${@}"
