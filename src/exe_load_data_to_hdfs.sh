#!/bin/bash
set -e
app_root_dir=/home/hadoop/app;
hdfs_hive_warehouse_location=/user/hive/warehouse/sample_data;
source ${app_root_dir}/func/func_logs.sh || { >&2 echo "${app_root_dir}/func/func_logs.sh function file is missing"; exit 1; }
#source ${app_root_dir}/func/func_date.sh || { >&2 echo "${app_root_dir}/func/func_date.sh function file is missing"; exit 1; }


function main {
    inform "[OP ] START";
    
    # Check the Date function
    local _file_name=
    if [[ "$#" -eq "0" ]]; then
       error "Please Insert File Name as first argument"
       exit 1;
    elif [[ "$#" -eq "1" ]]; then
       _file_name=$1;
    else
        error "Invalid number of arugments missing file information";
        exit 1;
    fi

    hdfs dfs -put "${app_root_dir}/data/${_file_name}" "${hdfs_hive_warehouse_location}/" || {
        error "Error Happend when puting file";
        exit 1;
    }
    
    inform "File is successfully insert into HDFS directory";
    inform "[OP ] END"
}

main "${@}"


