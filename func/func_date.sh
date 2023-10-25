#!/bin/bash

function check_date_yyyy_mm_dd_format {
    local _check_date_format=$1

    # if condition to check the date format
    if [[ "$(date +'%Y-%m-%d' -d ${_check_date_format} 2> /dev/null)" == "${_check_date_format}" ]]; then
      true
    else
      false
    fi
}