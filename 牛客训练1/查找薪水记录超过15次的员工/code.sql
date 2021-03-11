SELECT emp_no, s.c t
FROM
(
SELECT emp_no, COUNT(*) c
FROM salaries
GROUP BY emp_no
)s
WHERE s.c > 15;
