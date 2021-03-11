SELECT d.emp_no, salary, from_date, d.to_date, dept_no
FROM dept_manager d
LEFT JOIN salaries s
ON d.emp_no = s.emp_no;
