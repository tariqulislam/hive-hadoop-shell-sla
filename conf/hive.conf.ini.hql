SET hive.exec.dynamic.partition = true;
SET hive.exec.dynamic.partition.mode = nonstrict;

SET hivevar:DATABASE_NAME=hive_shell_sample;
SET hivevar:TBL_EMPLOYEE=${DATABASE_NAME}.employees;
SET hivevar:TBL_DEPARTMENT=${DATABASE_NAME}.departments;
SET hivevar:TBL_SALES_INFO=${DATABASE_NAME}.sales_info;