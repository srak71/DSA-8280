USE employees_mod;


# QUERY 1
# CREATE VIEW top_ten_cur_sal_desc AS
SELECT 
	emp.first_name AS 'First Name',
	emp.last_name AS 'Last Name',
    emp.emp_no AS 'Employee Number',
    sal.salary AS 'Salary'
FROM t_employees emp
INNER JOIN t_salaries sal ON emp.emp_no = sal.emp_no
WHERE sal.to_date = '9999-01-01'
ORDER BY sal.salary DESC
LIMIT 10;
# SELECT * FROM top_ten_cur_sal_desc;


# QUERY 2
SELECT 
    COUNT(DISTINCT emp.emp_no) AS Num_Current_Employees,
    FORMAT(AVG(sal.salary), 2) AS Average_Current_Salary
FROM t_employees emp
INNER JOIN t_salaries sal ON emp.emp_no = sal.emp_no
WHERE sal.to_date = '9999-01-01';