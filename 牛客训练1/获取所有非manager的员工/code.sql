SELECT emp_no
FROM employees
WHERE emp_no NOT IN
(
SELECT d.emp_no 
FROM dept_manager d
LEFT JOIN employees e
ON d.emp_no = e.emp_no
)
