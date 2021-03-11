SELECT last_name, first_name, dept_no
FROM employees e
LEFT JOIN dept_emp d
ON e.emp_no = d.emp_no;
