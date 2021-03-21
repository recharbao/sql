SELECT ddd.dept_no, b.emp_no, b.salary
FROM
(
SELECT e.emp_no emp_no, s.salary salary 
FROM employees e
INNER JOIN salaries s
ON e.emp_no = s.emp_no
WHERE e.emp_no NOT IN
(
    SELECT de.emp_no
    FROM dept_manager de
)   
) b    
INNER JOIN dept_emp ddd
ON ddd.emp_no = b.emp_no;
