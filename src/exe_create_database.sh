#!/bin/bash
set -e
app_root_dir=/home/hadoop/app
source ${app_root_dir}/func/func_logs.sh || { >&2 echo "${app_root_dir}/func/func_logs.sh function file is missing"; exit 1; }
source ${app_root_dir}/func/func_date.sh || { >&2 echo "${app_root_dir}/func/func_date.sh function file is missing"; exit 1; }

function main {
    inform "[OP] Start ";
    
    local _create_db_hql=${app_root_dir}/ddl/create_database.hql
    # Check the Date function
    
    SECONDS=0

    hive -f ${_create_db_hql} || {
        error "Creating Database failed";
        exit 1;
    }

    inform "Database is Created Successfully";
    inform "Execution Time: $(convert_readable_time ${SECONDS})";
    inform "[OP] End";
}
main "${@}"