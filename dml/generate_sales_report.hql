SELECT 
   emp.employee_id,
   emp.employee_name,
   dept.department_id,
   dept.department_name,
   sales.product_name,
   sales.sales_count,
   sales.sales_price,
   SUM(sales.sales_count, sales.sales_price)
FROM 
   ${TBL_EMPLOYEE}   as emp
JOIN
   ${TBL_DEPARTMENT} as dept ON emp.department_id = dept.department_id
JOIN 
   ${TBL_SALES_INFO} as sales ON sales.employee_id = emp.employee_id
WHERE
   dt='${dt}'
GROUP BY
  employee_id,
  employee_name,
  department_id,
  department_name,
  product_name,
  sales_count,
  sales_price
SORT BY
   department_id