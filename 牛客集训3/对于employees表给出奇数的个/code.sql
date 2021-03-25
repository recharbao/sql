SELECT e1.first_name
FROM employees e1
WHERE
(
    SELECT COUNT(*)
    FROM employees e2
    WHERE e2.first_name <= e1.first_name
)
% 2 = 1;
