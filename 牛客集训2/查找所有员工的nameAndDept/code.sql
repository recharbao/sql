SELECT e.last_name, e.first_name, de.dept_name
FROM employees e
LEFT JOIN dept_emp d
ON e.emp_no = d.emp_no
LEFT JOIN departments de
ON d.dept_no = de.dept_no
