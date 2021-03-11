SELECT last_name, first_name, dept_no
FROM dept_emp d
LEFT JOIN employees e
ON d.emp_no = e.emp_no;
