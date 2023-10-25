#!/bin/bash

# -------
# arugments 
# $1 = type of log
# $2 = message
# $3 = filename of script
# -------

function __log {
  local _level="$1";
  local _script="$2";
  local _message="$3";

  local _date_time=$(date +"%F %T");
  local _print_msg="[${_level}] [${_date_time}]${_script} ${_message}";
  echo "${_print_msg}"; 
}

# caller returns the context of any active subroutine call
function error {
  local _caller=($(caller));
  __log "ERROR" "[${_caller[1]}](${_caller[0]})" "$@";
}

function warn {
  local _caller=($(caller));
  __log "WARN" "[${_caller[1]}](${_caller[0]})" "$@";
}

function inform {
   local _caller=($(caller));
  __log "INFO" "[${_caller[1]}](${_caller[0]})" "$@"
}



function convert_readable_time {
  local _time_interval=${1}
  local _HH=$(( ${_time_interval} / 3600 ))
  local _time_interval_rem=$(( ${_time_interval} % 3600 ))
  local _MM=$(( ${_time_interval_rem} / 60 ))
  local _SS=$(( ${_time_interval_rem} % 60 ))
  printf "${_HH}:%02d:%02d" "${_MM}" "${_SS}"
}
