SET hivevar:TBL_NAME=${DATABASE_NAME}.${TABLE_NAME};
LOAD DATA LOCAL INPATH '${DATA_SOURCE_FILE_PATH}'
OVERWRITE INTO TABLE ${TBL_NAME}
PARTITION(${PARTITION_NAME}='${PARTIITON_VALUE}');