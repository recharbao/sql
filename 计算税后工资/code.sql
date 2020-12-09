mysql> CREATE TABLE Salaries(
    -> company_id INT,
    -> employee_id INT,
    -> employee_name VARCHAR(100),
    -> salary INT,
    -> PRIMARY KEY(company_id, employee_id)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO Salaries VALUES(1          | 1           | Tony          | 2000   |mysql> INSERT INTO Salaries VALUES(1          | 1                                                                   mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> INSERT INTO Salaries VALUES(1, 1, 'Tony', 2000);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Salaries VALUES(1, 2, 'Pronub', 21300);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Salaries VALUES(1, 3, 'Tyrrox', 10800) 
    -> ;
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Salaries VALUES(2, 1, 'Pam', 300);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Salaries;
+------------+-------------+---------------+--------+
| company_id | employee_id | employee_name | salary |
+------------+-------------+---------------+--------+
|          1 |           1 | Tony          |   2000 |
|          1 |           2 | Pronub        |  21300 |
|          1 |           3 | Tyrrox        |  10800 |
|          2 |           1 | Pam           |    300 |
+------------+-------------+---------------+--------+
4 rows in set (0.00 sec)

mysql> SELECT
    -> company_id, CASE WHEN ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> SELECT company_id, CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN 0.24
    -> WHEN MAX (salary) >= 1000 THEN 0.49
    -> ELSE 0
    -> FROM Salaries;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'FROM Salaries' at line 4
mysql> SELECT company_id, (CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN 0.24 WHEN MAX (salary) >= 1000 THEN 0.49 ELSE 0) AS rate FROM Salaries;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') AS rate FROM Salaries' at line 1
mysql> SELECT company_id, (CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN 0.24 WHEN MAX (salary) >= 1000 THEN 0.49 ELSE 0END) AS rate FROM Salaries;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') AS rate FROM Salaries' at line 1
mysql> 
mysql> 
mysql> 
mysql> SELECT company_id, (CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN 0.24 WHEN MAX (salary) >= 1000 THEN 0.49 ELSE 0 END) AS rate FROM Salaries;
ERROR 1630 (42000): FUNCTION sqlpr.MAX does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT company_id, (CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN 0.24 WHEN MAX (salary) >= 1000 THEN 0.49 ELSE 0 END) AS rate FROM Salaries GROUP BY employee_id;
ERROR 1630 (42000): FUNCTION sqlpr.MAX does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT company_id, (CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN 0.24 WHEN MAX (salary) >= 1000 THEN 0.49 ELSE 0 END) AS rate FROM Salaries GROUP BY employee_i;
ERROR 1630 (42000): FUNCTION sqlpr.MAX does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT company_id, (CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN 0.24 WHEN MAX (salary) >= 1000 THEN 0.49 ELSE 0 END) AS rate FROM Salaries GROUP BY employee_id;
ERROR 1630 (42000): FUNCTION sqlpr.MAX does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT company_id, (CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN 0.24 WHEN MAX (salary) >= 1000 THEN 0.49 ELSE 0 END) AS rate FROM Salaries GROUP BY company_id;
ERROR 1630 (42000): FUNCTION sqlpr.MAX does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> select company_id,
    -> case 
    ->      when max(salary)>=1000 and  max(salary)<10000 then (24/100)
    ->      when max(salary)>=10000 then (49/100)
    -> else 0
    -> end as rate
    -> from salaries
    -> group by company_id;
ERROR 1146 (42S02): Table 'sqlpr.salaries' doesn't exist
mysql> select company_id, case       when max(salary)>=1000 and  max(salary)<10000 then (24/100)      when max(salary)>=10000 then (49/100) else 0 end as rate from Salaries group by company_id;
+------------+--------+
| company_id | rate   |
+------------+--------+
|          1 | 0.4900 |
|          2 |      0 |
+------------+--------+
2 rows in set (0.03 sec)

mysql> SELECT company_id, (CASE WHEN max(salary) >= 1000 AND max(salary) < 10000 THEN 0.24 WHEN max (salary) >= 1000 THEN 0.49 ELSE 0 END) AS rate FROM Salaries GROUP BY company_id;
ERROR 1630 (42000): FUNCTION sqlpr.max does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT company_id, (CASE WHEN max(salary) >= 1000 AND max(salary) < 10000 THEN 0.24 WHEN max (salary) >= 10000 THEN 0.49 ELSE 0 END) AS rate FROM Salaries GROUP BY company_id;
ERROR 1630 (42000): FUNCTION sqlpr.max does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT company_id, CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN 0.24 WHEN MAX (salary) >= 1000 THEN 0.49 ELSE 0 END AS rate FROM Salaries GROUP BY company_id;
ERROR 1630 (42000): FUNCTION sqlpr.MAX does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT company_id, CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN 0.24 WHEN MAX (salary) >= 10000 THEN 0.49 ELSE 0 END AS rate FROM Salaries GROUP BY company_id;
ERROR 1630 (42000): FUNCTION sqlpr.MAX does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT company_id, CASE WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN (24/100) WHEN MAX (salary) >= 10000 THEN (49/100) ELSE 0 END AS rate FROM Salaries GROUP BY company_id;
ERROR 1630 (42000): FUNCTION sqlpr.MAX does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> SELECT company_id, CASE  WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN (24/100)  WHEN MAX (salary) >= 10000 THEN (49/100) ELSE 0 END AS rate FROM Salaries GROUP BY company_id;
ERROR 1630 (42000): FUNCTION sqlpr.MAX does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> select company_id, case  when max(salary) >= 1000 and max(salary) < 10000 then (24/100)  when max (salary)>=10000 then (49/100) else 0 end as rate from Salaries group by company_id;
ERROR 1630 (42000): FUNCTION sqlpr.max does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> select company_id, case  when max(salary) >= 1000 and max(salary) < 10000 then (24/100)  when max(salary)>=10000 then (49/100) else 0 end as rate from Salaries group by company_id;
+------------+--------+
| company_id | rate   |
+------------+--------+
|          1 | 0.4900 |
|          2 |      0 |
+------------+--------+
2 rows in set (0.00 sec)

mysql> SELECT company_id, CASE  WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN (24/100)  WHEN MAX(salary) >= 10000 THEN (49/100) ELSE 0 END AS rate FROM Salaries GROUP BY company_id;
+------------+--------+
| company_id | rate   |
+------------+--------+
|          1 | 0.4900 |
|          2 |      0 |
+------------+--------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Salaries LEFT JOIN (SELECT company_id, CASE  WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN (24/100)  WHEN MAX(salary) >= 10000 THEN (49/100) ELSE 0 END AS rate FROM Salaries GROUP BY company_id) a;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT * FROM Salaries s1 LEFT JOIN (SELECT company_id, CASE  WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN (24/100)  WHEN MAX(salary) >= 10000 THEN (49/100) ELSE 0 END AS rate FROM Salaries GROUP BY company_id) a;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT * FROM Salaries s1 LEFT JOIN (SELECT company_id, CASE  WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN (24/100)  WHEN MAX(salary) >= 10000 THEN (49/100) ELSE 0 END AS rate FROM Salaries GROUP BY company_id) s2 ON s1.company_id = s2.company_id;
+------------+-------------+---------------+--------+------------+--------+
| company_id | employee_id | employee_name | salary | company_id | rate   |
+------------+-------------+---------------+--------+------------+--------+
|          1 |           1 | Tony          |   2000 |          1 | 0.4900 |
|          1 |           2 | Pronub        |  21300 |          1 | 0.4900 |
|          1 |           3 | Tyrrox        |  10800 |          1 | 0.4900 |
|          2 |           1 | Pam           |    300 |          2 | 0.0000 |
+------------+-------------+---------------+--------+------------+--------+
4 rows in set (0.00 sec)

mysql> SELECT s1.company_id, s1.employee_id, s1.employee_name, s1.salary * s2.rate FROM Salaries s1 LEFT JOIN (SELECT company_id, CASE  WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN (24/100)  WHEN MAX(salary) >= 10000 THEN (49/100) ELSE 0 END AS rate FROM Salaries GROUP BY company_id) s2 ON s1.company_id = s2.company_id;
+------------+-------------+---------------+---------------------+
| company_id | employee_id | employee_name | s1.salary * s2.rate |
+------------+-------------+---------------+---------------------+
|          1 |           1 | Tony          |            980.0000 |
|          1 |           2 | Pronub        |          10437.0000 |
|          1 |           3 | Tyrrox        |           5292.0000 |
|          2 |           1 | Pam           |              0.0000 |
+------------+-------------+---------------+---------------------+
4 rows in set (0.01 sec)

mysql> SELECT s1.company_id, s1.employee_id, s1.employee_name, s1.salary * (1 - s2.rate) FROM Salaries s1 LEFT JOIN (SELECT company_id, CASE  WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN (24/100)  WHEN MAX(salary) >= 10000 THEN (49/100) ELSE 0 END AS rate FROM Salaries GROUP BY company_id) s2 ON s1.company_id = s2.company_id;
+------------+-------------+---------------+---------------------------+
| company_id | employee_id | employee_name | s1.salary * (1 - s2.rate) |
+------------+-------------+---------------+---------------------------+
|          1 |           1 | Tony          |                 1020.0000 |
|          1 |           2 | Pronub        |                10863.0000 |
|          1 |           3 | Tyrrox        |                 5508.0000 |
|          2 |           1 | Pam           |                  300.0000 |
+------------+-------------+---------------+---------------------------+
4 rows in set (0.00 sec)

mysql> SELECT s1.company_id, s1.employee_id, s1.employee_name, s1.salary * (1 - s2.rate) AS salary FROM Salaries s1 LEFT JOIN (SELECT company_id, CASE  WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN (24/100)  WHEN MAX(salary) >= 10000 THEN (49/100) ELSE 0 END AS rate FROM Salaries GROUP BY company_id) s2 ON s1.company_id = s2.company_id;
+------------+-------------+---------------+------------+
| company_id | employee_id | employee_name | salary     |
+------------+-------------+---------------+------------+
|          1 |           1 | Tony          |  1020.0000 |
|          1 |           2 | Pronub        | 10863.0000 |
|          1 |           3 | Tyrrox        |  5508.0000 |
|          2 |           1 | Pam           |   300.0000 |
+------------+-------------+---------------+------------+
4 rows in set (0.00 sec)

mysql> SELECT s1.company_id, s1.employee_id, s1.employee_name, ROUND(s1.salary * (1 - s2.rate), 0) AS salary FROM Salaries s1 LEFT JOIN (SELECT company_id, CASE  WHEN MAX(salary) >= 1000 AND MAX(salary) < 10000 THEN (24/100)  WHEN MAX(salary) >= 10000 THEN (49/100) ELSE 0 END AS rate FROM Salaries GROUP BY company_id) s2 ON s1.company_id = s2.company_id;
+------------+-------------+---------------+--------+
| company_id | employee_id | employee_name | salary |
+------------+-------------+---------------+--------+
|          1 |           1 | Tony          |   1020 |
|          1 |           2 | Pronub        |  10863 |
|          1 |           3 | Tyrrox        |   5508 |
|          2 |           1 | Pam           |    300 |
+------------+-------------+---------------+--------+
4 rows in set (0.00 sec)

