SELECT 
    employee_id as `employe ID`,
    employee_name as `employee Name`,
    department_id as `Department ID`,
    department_name as `Department Name`,
    product_name as `Product Name`,
    sales_count as `Sales Count`,
    sales_price as `Sales Price`,
    total_sales as  `Total Sales`
FROM 
   ${TBL_SALES_REPORT}
WHERE dt='${dt}'
