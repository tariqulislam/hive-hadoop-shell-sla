LOAD DATA INPATH '${DATA_SOURCE_FILE_PATH}' OVERWRITE TABLE
PARTITION(${PARITION_NAME}='$PARITION_INFO')