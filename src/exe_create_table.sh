#!/bin/bash
set -e
app_root_dir=/home/hadoop/app
source ${app_root_dir}/func/func_logs.sh || { >&2 echo "${app_root_dir}/func/func_logs.sh function file is missing"; exit 1; }
source ${app_root_dir}/func/func_date.sh || { >&2 echo "${app_root_dir}/func/func_date.sh function file is missing"; exit 1; }

function main {
    inform "[OP] Start ";
    local _table_name=
    if [[ "$#" -eq "0" ]]; then
        error "Please provide the table name to create table info Database";
        exit 1;
    elif [[ "$#" -eq "1" ]];then
       _table_name=$1
    else
       error "Error happend during provide the table name";
       exit 1;
    fi

    local _hive_ini_file=${app_root_dir}/conf/hive.conf.ini.hql
    local _create_table_hql=${app_root_dir}/ddl/tbl_${_table_name}.hql
    # Check the Date function
    
    SECONDS=0

    hive -i ${_hive_ini_file} -f ${_create_table_hql} || {
        error "Creating Table is failed.";
        exit 1;
    }

    inform "Table is Created Successfully";
    inform "Execution Time: $(convert_readable_time ${SECONDS})";
    inform "[OP] End";
}
main "${@}"