SELECT t.title, avg(s.salary)
FROM titles t
LEFT JOIN salaries s
ON t.emp_no = s. emp_no
GROUP BY t.title;
