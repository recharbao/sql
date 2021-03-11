SELECT emp_no, birth_date, first_name, last_name, gender, hire_date
FROM employees
WHERE emp_no mod 2 = 1
AND last_name != 'Mary'
ORDER BY hire_date DESC;
