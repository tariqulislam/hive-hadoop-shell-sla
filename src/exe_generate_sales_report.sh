#!/bin/bash
app_root_dir=/home/hadoop/app
source ${app_root_dir}/func/func_logs.sh || { >&2 echo "${app_root_dir}/func/func_logs.sh function file is missing"; exit 1; }
source ${app_root_dir}/func/func_date.sh || { >&2 echo "${app_root_dir}/func/func_date.sh function file is missing"; exit 1; }
_hive_config_file=${app_root_dir}/conf/hive.conf.ini.hql

function main {
    inform "[Test ] Logging function is working perfectly";
    
    local _dt=
    if [[ $# -eq 0 ]]; then
       error "Please provie date information";
       exit 1;
    elif [[ $# -eq 1 ]]; then
       _dt=$1
    else
       error "Error occured during provide arguments";
       exit 1;
    fi
    local _IP=$(hostname -I)
    local _HOST_IP="10.0.2.15:10000/default"
    local _HIVE_USER_NAME=hadoop
    local _HIVE_PASSWORD=ronnie01
    local _OUTPUT_FORMAT=csv2
    local _HQL_FILE_PATH=${app_root_dir}/dml/generate_sales_report.hql
    local _EXPORT_TO=${app_root_dir}/reports
    local _EXPORT_FILE=${_EXPORT_TO}/generate_report_${dt}.csv

    beeline -u jdbc:hive2://${_HOST_IP} -n ${_HIVE_USER_NAME} \
     -p ${_HIVE_PASSWORD} --outputformat=csv2 \
     -f ${_HQL_FILE_PATH} > ${_EXPORT_FILE} || {
        error "Something Went Wrong During Generating Report Please see the logs";
        exit 1;
      }
    
    # Check the Date function
    inform "Report Generated Successfully.";
    inform "[OP ] END"
    
}
main "${@}"

