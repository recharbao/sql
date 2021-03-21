SELECT emp_no, salary, 
DENSE_RANK() OVER (ORDER BY salary DESC) t_rank
FROM salaries
ORDER BY t_rank, emp_no;
