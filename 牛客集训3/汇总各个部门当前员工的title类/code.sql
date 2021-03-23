SELECT s.dept_no, dep.dept_name, s.title, s.num
FROM 
(
SELECT de1.dept_no dept_no,  t1.title title, COUNT(de1.emp_no) num
FROM dept_emp de1
INNER JOIN titles t1
ON de1.emp_no = t1.emp_no        
GROUP BY de1.dept_no, t1.title
) s
LEFT JOIN departments dep
ON dep.dept_no = s.dept_no
ORDER BY s.dept_no , s.num DESC;
