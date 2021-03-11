SELECT ee.emp_no, sss.salary, ee.last_name, ee.first_name
FROM employees ee
LEFT JOIN salaries sss
ON ee.emp_no = sss.emp_no
WHERE sss.salary IN
(
SELECT MAX(ss.salary)
FROM employees e
LEFT JOIN salaries ss
ON e.emp_no = ss.emp_no
WHERE ss.salary NOT IN
(
SELECT MAX(s.salary)
FROM salaries s
)
);
