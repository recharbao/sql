SELECT de.dept_no, de.dept_name, COUNT(*)
FROM salaries s
RIGHT JOIN dept_emp d
ON s.emp_no = d.emp_no
RIGHT JOIN departments de
ON d.dept_no = de.dept_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- 这里不可以 LEFT JOIN 
