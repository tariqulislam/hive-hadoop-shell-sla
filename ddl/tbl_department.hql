CREATE TABLE IF NOT EXISTS ${TBL_DEPARTMENT} (
    department_id INT,
    department_name STRING
)
PARTITIONED BY (dt STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
TBLPROPERTIES ("transactional" = 'false');