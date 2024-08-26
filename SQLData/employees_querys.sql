SELECT titles.emp_no, titles.title, salaries.salary
FROM titles
LEFT JOIN salaries ON titles.emp_no = salaries.emp_no;