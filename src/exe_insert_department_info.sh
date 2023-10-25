#!/bin/bash
app_root_dir=/home/hadoop/app
source ${app_root_dir}/func/func_logs.sh || { >&2 echo "${app_root_dir}/func/func_logs.sh function file is missing"; exit 1; }
source ${app_root_dir}/func/func_date.sh || { >&2 echo "${app_root_dir}/func/func_date.sh function file is missing"; exit 1; }

function main {
    inform "[Test ] Logging function is working perfectly";
    
    # Check the Date function
    local _dt=
    if [[ $# -eq 0 ]]; then
      _dt=$(date -d "+%Y-%m-%d");
    elif [[ $# -eq 1 ]]; then
      _dt=$1;
    else
       error "Invalid number of arugments missing date";
       exit 1;
    fi     
}
main
$@

