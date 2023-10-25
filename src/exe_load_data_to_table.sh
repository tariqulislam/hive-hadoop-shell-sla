#!/bin/bash
set -e
app_root_dir=/home/hadoop/app
hdfs_hive_warehouse_location =/user/hive/warehouse/sample_data
source ${app_root_dir}/func/func_logs.sh || { >&2 echo "${app_root_dir}/func/func_logs.sh function file is missing"; exit 1; }
source ${app_root_dir}/func/func_date.sh || { >&2 echo "${app_root_dir}/func/func_date.sh function file is missing"; exit 1; }
_hive_config_file=${app_root_dir}/conf/hive.conf.ini.hql

function main {
    inform "[OP ] START";

    # Check 
    local _hql_file_path=${app_root_dir}/dml/load_data_into_table.hql

    local _DATA_SOURCE_FILE_PATH=
    if [[ $# -eq 0 ]]; then
      error "Please Insert File Name Of Data"
    elif [[ $# -eq 1 ]]; then
      _DATA_SOURCE_FILE_PATH="${hdfs_hive_warehouse_location}/$1";
    else
       error "Invalid number of arugments missing file information";
       exit 1;
    fi

    local _PARITION_NAME=
    if [[ $# -eq 0 ]]; then
      error "Please Insert File Name Of Data"
    elif [[ $# -eq 2 ]]; then
      _PARITION_NAME=$2;
    else
       error "Invalid number of arugments missing Partition Name";
       exit 1;
    fi

   local _PARITION_INFO=
    if [[ $# -eq 0 ]]; then
      error "Please Insert File Name Of Data"
    elif [[ $# -eq 3 ]]; then
      _PARITION_INFO=$3;
    else
       error "Invalid number of arugments Partion Info";
       exit 1;
    fi


    hive -i ${_hive_config_file} \
          -hivevar  DATA_SOURCE_FILE_PATH=${_DATA_SOURCE_FILE_PATH} \
          -hivevar  PARITION_NAME=${_PARITION_NAME} \
          -hivevar  PARITION_INFO=${_PARTITION_INFO} \
          -f ${_hql_file_path} || {
        error "Putting file into HDFS is failed. Or HDFS service is not running"
        exit 1;
    }

    inform "Data Insert Into Database table....";
    inform "[OP ] END"
}

main "${@}"
