SELECT e.emp_no, v.sl - s.salary growth
FROM employees e
RIGHT JOIN
(
SELECT s1.emp_no se, s1.salary sl
FROM salaries s1
LEFT JOIN employees e
ON s1.emp_no = e.emp_no
WHERE s1.to_date = '9999-01-01'
) v
ON e.emp_no = v.se
LEFT JOIN salaries s
ON e.hire_date = s.from_date
ORDER BY growth;
