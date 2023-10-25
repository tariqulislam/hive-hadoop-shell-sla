CREATE TABLE IF NOT EXISTS hive_shell_sample.sales_info (
    employee_id INT,
    product_name STRING,
    sales_count INT,
    sales_price DOUBLE
)
PARTITIONED BY(dt STRING)
COMMENT "EMPLOYEE TABLE"
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;


-- To support ACID, Hive tables should be created with TRANSACTIONAL table property.
-- Currently, Hive supports ACID transactions on tables that store ORC file format.
-- LOAD is not supported on ACID transactional Tables. hence use INSERT INTO.
-- External tables cannot be created to support ACID since the changes on external tables are beyond Hive control.