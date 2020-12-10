mysql> CREATE TABLE Project(
    -> project_id INT,
    -> employee_id INT,
    -> PRIMARY KEY(project_id, employee_id)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE Employee(
    -> employee_id INT,
    -> name VARCHAR(100),
    -> experience_years INT,
    -> PRIMARY KEY(employee_id)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO Project VALUES(1, 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Project VALUES(1, 2);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Project VALUES(1, 3);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Project VALUES(2, 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Project VALUES(2, 4);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Employee VALUES(1, 'Khaled', 3);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Employee VALUES(2, 'Ali', 2);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Employee VALUES(3, 'John', 3);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Employee VALUES(4, 'Doe', 2);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Project;
+------------+-------------+
| project_id | employee_id |
+------------+-------------+
|          1 |           1 |
|          1 |           2 |
|          1 |           3 |
|          2 |           1 |
|          2 |           4 |
+------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Employee;
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
|           1 | Khaled |                3 |
|           2 | Ali    |                2 |
|           3 | John   |                3 |
|           4 | Doe    |                2 |
+-------------+--------+------------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM Project p LEFT JOIN Employee e ON p.employee_id = e.employee_id;
+------------+-------------+-------------+--------+------------------+
| project_id | employee_id | employee_id | name   | experience_years |
+------------+-------------+-------------+--------+------------------+
|          1 |           1 |           1 | Khaled |                3 |
|          2 |           1 |           1 | Khaled |                3 |
|          1 |           2 |           2 | Ali    |                2 |
|          1 |           3 |           3 | John   |                3 |
|          2 |           4 |           4 | Doe    |                2 |
+------------+-------------+-------------+--------+------------------+
5 rows in set (0.01 sec)

mysql> SELECT p.project_id, MAX(e.experience_years)  FROM Project p LEFT JOIN Employee e ON p.employee_id = e.employee_id GROUP BY p.project;
ERROR 1054 (42S22): Unknown column 'p.project' in 'group statement'
mysql> SELECT p.project_id, MAX(e.experience_years)  FROM Project p LEFT JOIN Employee e ON p.employee_id = e.employee_id GROUP BY p.project_id;
+------------+-------------------------+
| project_id | MAX(e.experience_years) |
+------------+-------------------------+
|          1 |                       3 |
|          2 |                       3 |
+------------+-------------------------+
2 rows in set (0.00 sec)

mysql>                                                                                                                            mysql> 
mysql> 
mysql> 
mysql> 
mysql> SELECT p1.project_id, p1.employee_id
    -> FROM Project p LEFT JOIN Employee e 
    -> ON p1.employee_id = e1.employee_id 
    -> WHERE (p.project_id, e.experience_years)
    -> IN
    -> (
    ->     SELECT p.project_id, MAX(e.experience_years) 
    ->     FROM Project p LEFT JOIN Employee e 
    ->     ON p.employee_id = e.employee_id 
    ->     GROUP BY p.project_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 10
mysql> 
mysql> SELECT p1.project_id, p1.employee_id
    -> FROM Project p LEFT JOIN Employee e 
    -> ON p1.employee_id = e1.employee_id 
    -> WHERE (p.project_id, e.experience_years)
    -> IN
    -> (
    ->     SELECT p.project_id, MAX(e.experience_years) experience_years
    ->     FROM Project p LEFT JOIN Employee e 
    ->     ON p.employee_id = e.employee_id 
    ->     GROUP BY p.project_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 10
mysql> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> 
mysql> SELECT p1.project_id, p1.employee_id
    -> FROM Project p1 LEFT JOIN Employee e1 
    -> ON p1.employee_id = e1.employee_id 
    -> WHERE (p.project_id, e.experience_years)
    -> IN
    -> (
    ->     SELECT p.project_id, MAX(e.experience_years) experience_years
    ->     FROM Project p LEFT JOIN Employee e 
    ->     ON p.employee_id = e.employee_id 
    ->     GROUP BY p.project_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 10
mysql> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> 
mysql> 
mysql> SELECT p1.project_id, p1.employee_id
    -> FROM Project p1 LEFT JOIN Employee e1 
    -> ON p1.employee_id = e1.employee_id ;
+------------+-------------+
| project_id | employee_id |
+------------+-------------+
|          1 |           1 |
|          1 |           2 |
|          1 |           3 |
|          2 |           1 |
|          2 |           4 |
+------------+-------------+
5 rows in set (0.00 sec)

mysql> 
mysql> SELECT p1.project_id, p1.employee_id
    -> FROM Project p1 LEFT JOIN Employee e1 
    -> ON p1.employee_id = e1.employee_id 
    -> WHERE (p1.project_id, e1.experience_years)
    -> IN
    -> (
    ->     SELECT p.project_id, MAX(e.experience_years) experience_years
    ->     FROM Project p LEFT JOIN Employee e 
    ->     ON p.employee_id = e.employee_id 
    ->     GROUP BY p.project_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 10
mysql> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> 
mysql> 
mysql> 
mysql> 
mysql> SELECT p.project_id, MAX(e.experience_years) experience_years
    ->     FROM Project p LEFT JOIN Employee e 
    ->     ON p.employee_id = e.employee_id 
    ->     GROUP BY p.project_id;
+------------+------------------+
| project_id | experience_years |
+------------+------------------+
|          1 |                3 |
|          2 |                3 |
+------------+------------------+
2 rows in set (0.00 sec)

mysql> SELECT p1.project_id, p1.employee_id
    -> FROM Project p1 LEFT JOIN Employee e1 
    -> ON p1.employee_id = e1.employee_id 
    -> WHERE (p1.project_id, e1.experience_years)
    -> IN
    -> (
    ->     SELECT p.project_id, MAX(e.experience_years)
    ->     FROM Project p LEFT JOIN Employee e 
    ->     ON p.employee_id = e.employee_id 
    ->     GROUP BY p.project_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 10
mysql> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> 
mysql> SELECT p1.project_id, p1.employee_id
    -> FROM Project p1 LEFT JOIN Employee e1 
    -> ON p1.employee_id = e1.employee_id 
    -> WHERE (p1.project_id, e1.experience_years)
    -> IN
    -> (
    ->     SELECT p.project_id, MAX(e.experience_years)
    ->     FROM Project p LEFT JOIN Employee e 
    ->     ON p.employee_id = e.employee_id 
    ->     GROUP BY p.project_id
    -> );
+------------+-------------+
| project_id | employee_id |
+------------+-------------+
|          1 |           1 |
|          1 |           3 |
|          2 |           1 |
+------------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT p.project_id, p1.employee_id
    -> FROM Project p LEFT JOIN Employee e 
    -> ON p.employee_id = e.employee_id 
    -> WHERE (p.project_id, e.experience_years)
    -> IN
    -> (
    ->     SELECT p.project_id, MAX(e.experience_years)
    ->     FROM Project p LEFT JOIN Employee e 
    ->     ON p.employee_id = e.employee_id 
    ->     GROUP BY p.project_id
    -> );
ERROR 1054 (42S22): Unknown column 'p1.employee_id' in 'field list'
mysql> SELECT p.project_id, p.employee_id
    -> FROM Project p LEFT JOIN Employee e 
    -> ON p.employee_id = e.employee_id 
    -> WHERE (p.project_id, e.experience_years)
    -> IN
    -> (
    ->     SELECT p.project_id, MAX(e.experience_years)
    ->     FROM Project p LEFT JOIN Employee e 
    ->     ON p.employee_id = e.employee_id 
    ->     GROUP BY p.project_id
    -> );
+------------+-------------+
| project_id | employee_id |
+------------+-------------+
|          1 |           1 |
|          1 |           3 |
|          2 |           1 |
+------------+-------------+
3 rows in set (0.00 sec)

