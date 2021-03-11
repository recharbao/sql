SELECT e.emp_no, m.emp_no manager
FROM dept_emp e
LEFT JOIN dept_manager m
ON e.dept_no = m.dept_no
WHERE e.emp_no != m.emp_no;
