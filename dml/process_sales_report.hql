INSERT OVERWRITE TABLE ${TBL_SALES_REPORT} 
PARTITION (dt='${dt}')
SELECT * FROM (
WITH emp AS (
SELECT
     emp.employee_id,
     emp.employee_name,
     emp.department_id
   FROM
    ${TBL_EMPLOYEE} as emp
   WHERE
     dt='2023-10-10'
),
dept AS (
   SELECT
     dept.department_id,
     dept.department_name
   FROM
    ${TBL_DEPARTMENT} as dept
   WHERE
     dt='2023-10-10'
)
SELECT 
   emp.employee_id,
   emp.employee_name,
   dept.department_id,
   dept.department_name,
   sales.product_name,
   SUM(sales.sales_count) as sales_count,
   sales.sales_price,
   SUM(sales.sales_count * sales.sales_price) as total_sales
FROM 
   emp
JOIN
   dept ON emp.department_id = dept.department_id
JOIN 
   ${TBL_SALES_INFO} as sales ON sales.employee_id = emp.employee_id
WHERE
   sales.dt='${dt}'
GROUP BY
   emp.employee_id,
   employee_name,
   dept.department_id,
   department_name,
   product_name,
   sales_count,
   sales_price,
   sales.dt
) AS SALES_INFO;