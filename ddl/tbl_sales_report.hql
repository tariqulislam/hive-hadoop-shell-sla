 CREATE TABLE IF NOT EXISTS ${TBL_SEALS_REPORT} (
    employee_id INT,
    employee_name STRING,
    department_id INT,
    department_name STRING,
    product_name STRING,
    sales_count INT,
    sales_price DOUBLE,
    total_sales DOUBLE
)
PARTITIONED BY (dt STRING)
TBLPROPERTIES ("transactional" = 'false');

