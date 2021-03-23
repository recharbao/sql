SELECT de.emp_no, dm.emp_no, s.salary, s1.salary
FROM dept_emp de
LEFT JOIN salaries s
ON de.emp_no = s.emp_no
LEFT JOIN dept_manager dm
ON de.dept_no = dm.dept_no
LEFT JOIN salaries s1
ON dm.emp_no = s1.emp_no
WHERE s.salary > s1.salary
AND dm.emp_no != de.emp_no;

-- 注意 where要放在连接后面， 注意多重连接方式
