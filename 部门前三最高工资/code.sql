mysql> USE sql2;
Database changed
mysql> SHOW TABLES;
Empty set (0.00 sec)

mysql> CREATE TABLE Employee (
    -> Id INT,
    -> Name VARCHAR(100),
    -> Salary VARCHAR(100),
    -> Departmentld VARCHAR(100)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Department(
    -> Id INT,
    -> Name VARCHAR(100)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.02 sec)

mysql> SHOW TABLES;
+----------------+
| Tables_in_sql2 |
+----------------+
| Department     |
| Employee       |
+----------------+
2 rows in set (0.00 sec)

mysql> INSERT INTO Employee VALUES(1, 'Joe', 85000, 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Employee VALUES(2, 'Henry', 80000, 2);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Employee VALUES(3, 'Sam', 60000, 2);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Employee VALUES(4, 'Max', 90000, 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Employee VALUES(5, 'Janet', 69000, 1);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Employee VALUES(6, 'Randy', 85000, 1);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Employee VALUES(7, 'Will', 70000, 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Department VALUES(1, 'IT');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Department VALUES(2, 'Sales');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM Employee;
+------+-------+--------+--------------+
| Id   | Name  | Salary | Departmentld |
+------+-------+--------+--------------+
|    1 | Joe   | 85000  | 1            |
|    2 | Henry | 80000  | 2            |
|    3 | Sam   | 60000  | 2            |
|    4 | Max   | 90000  | 1            |
|    5 | Janet | 69000  | 1            |
|    6 | Randy | 85000  | 1            |
|    7 | Will  | 70000  | 1            |
+------+-------+--------+--------------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Department;
+------+-------+
| Id   | Name  |
+------+-------+
|    1 | IT    |
|    2 | Sales |
+------+-------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Department d LEFT JOIN Employee e ON d.Departmentld = e.Id;
ERROR 1054 (42S22): Unknown column 'd.Departmentld' in 'on clause'
mysql> SELECT * FROM Department AS d LEFT JOIN Employee e ON d.Departmentld = e.Id;
ERROR 1054 (42S22): Unknown column 'd.Departmentld' in 'on clause'
mysql> SELECT d.Id FROM Department d;
+------+
| Id   |
+------+
|    1 |
|    2 |
+------+
2 rows in set (0.00 sec)

mysql> SELECT d.Departmentld FROM Department d;
ERROR 1054 (42S22): Unknown column 'd.Departmentld' in 'field list'
mysql> SELECT d.Departmentid FROM Department d;
ERROR 1054 (42S22): Unknown column 'd.Departmentid' in 'field list'
mysql> SELECT d.DepartmentId FROM Department d;
ERROR 1054 (42S22): Unknown column 'd.DepartmentId' in 'field list'
mysql> mysql> SELECT d.Name FROM Department d;
+-------+
| Name  |
+-------+
| IT    |
| Sales |
+-------+
2 rows in set (0.01 sec)

mysql> SELECT d.Departmentld FROM Department d;
ERROR 1054 (42S22): Unknown column 'd.Departmentld' in 'field list'
mysql> SELECT d.Departmentld FROM Department d;^[[B                

^C
mysql> 
mysql> SELECT d.| 7  | Will  | 70000  | 1            | FROM Department d;
[13]+  已停止               mysql -u root -p
rechar@rechar-Inspiron-7560:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.7.32-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use sql2;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+----------------+
| Tables_in_sql2 |
+----------------+
| Department     |
| Employee       |
+----------------+
2 rows in set (0.00 sec)

mysql> SHOW COLUMNS FROM Employee;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| Id           | int(11)      | YES  |     | NULL    |       |
| Name         | varchar(100) | YES  |     | NULL    |       |
| Salary       | varchar(100) | YES  |     | NULL    |       |
| Departmentld | varchar(100) | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> SELECT d.Departmentld FROM Departmentld d;
ERROR 1146 (42S02): Table 'sql2.Departmentld' doesn't exist
mysql> SELECT d.Departmentld FROM Departmentld d;
ERROR 1146 (42S02): Table 'sql2.Departmentld' doesn't exist
mysql> SELECT d.Departmentld FROM Employee d;
+--------------+
| Departmentld |
+--------------+
| 1            |
| 2            |
| 2            |
| 1            |
| 1            |
| 1            |
| 1            |
+--------------+
7 rows in set (0.01 sec)

mysql> SELECT * FROM Employee;
+------+-------+--------+--------------+
| Id   | Name  | Salary | Departmentld |
+------+-------+--------+--------------+
|    1 | Joe   | 85000  | 1            |
|    2 | Henry | 80000  | 2            |
|    3 | Sam   | 60000  | 2            |
|    4 | Max   | 90000  | 1            |
|    5 | Janet | 69000  | 1            |
|    6 | Randy | 85000  | 1            |
|    7 | Will  | 70000  | 1            |
+------+-------+--------+--------------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Department;
+------+-------+
| Id   | Name  |
+------+-------+
|    1 | IT    |
|    2 | Sales |
+------+-------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Employee e LEFT JOIN Department d ON e.Deparmentld = d.Id;
ERROR 1054 (42S22): Unknown column 'e.Deparmentld' in 'on clause'
mysql> SELECT * FROM Employee e LEFT JOIN Department d ON e.Departmentld = d.Id;
+------+-------+--------+--------------+------+-------+
| Id   | Name  | Salary | Departmentld | Id   | Name  |
+------+-------+--------+--------------+------+-------+
|    1 | Joe   | 85000  | 1            |    1 | IT    |
|    4 | Max   | 90000  | 1            |    1 | IT    |
|    5 | Janet | 69000  | 1            |    1 | IT    |
|    6 | Randy | 85000  | 1            |    1 | IT    |
|    7 | Will  | 70000  | 1            |    1 | IT    |
|    2 | Henry | 80000  | 2            |    2 | Sales |
|    3 | Sam   | 60000  | 2            |    2 | Sales |
+------+-------+--------+--------------+------+-------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Employee e1 e2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'e2' at line 1
mysql> SELECT * FROM Employee e1 WHERE 3 > (
    -> SELECT COUNT(DISTINCT e2.Salary) FROM 
    -> Employee e2 WHERE e1.Salary < e2.Salary);
+------+-------+--------+--------------+
| Id   | Name  | Salary | Departmentld |
+------+-------+--------+--------------+
|    1 | Joe   | 85000  | 1            |
|    2 | Henry | 80000  | 2            |
|    4 | Max   | 90000  | 1            |
|    6 | Randy | 85000  | 1            |
+------+-------+--------+--------------+
4 rows in set (0.01 sec)

mysql> SELECT d.Department, e.Employee, e.Salary FROM(
    -> SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary)
    -> );
ERROR 1248 (42000): Every derived table must have its own alias
mysql> SELECT d.Department, e.Employee, e.Salary FROM 
    -> Department LEFT JOIN (
    -> SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary)        -> ) e ON
    -> d.Id = e.Id;
ERROR 1054 (42S22): Unknown column 'd.Department' in 'field list'
mysql> SELECT d.Department, e.Employee, e.Salary FROM Department d LEFT JOIN ( SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary) ) e ON d.Id = e.Id;
ERROR 1054 (42S22): Unknown column 'd.Department' in 'field list'
mysql> SELECT d.Name, e.Employee, e.Salary FROM Department d LEFT JOIN ( SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary) ) e ON d.Id = e.Id;
ERROR 1054 (42S22): Unknown column 'e.Employee' in 'field list'
mysql>  SELECT d.Name, e。Name, e.Salary FROM Department d LEFT JOIN ( SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary) ) e ON d.Id = e.Id;
ERROR 1054 (42S22): Unknown column 'e。Name' in 'field list'
mysql>  SELECT d.Name, e.Name, e.Salary FROM Department d LEFT JOIN ( SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary) ) e ON d.Id = e.Id;
+-------+-------+--------+
| Name  | Name  | Salary |
+-------+-------+--------+
| IT    | Joe   | 85000  |
| Sales | Henry | 80000  |
+-------+-------+--------+
2 rows in set (0.01 sec)

mysql>  SELECT d.Name, e.Name, e.Salary FROM ( SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary) ) LEFT JOIN Department d e ON d.Id = e.Id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'e ON d.Id = e.Id' at line 1
mysql>  SELECT d.Name, e.Name, e.Salary FROM ( SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary) ) e LEFT JOIN Department d  ON d.Id = e.Id;
+-------+-------+--------+
| Name  | Name  | Salary |
+-------+-------+--------+
| IT    | Joe   | 85000  |
| Sales | Henry | 80000  |
| NULL  | Max   | 90000  |
| NULL  | Randy | 85000  |
+-------+-------+--------+
4 rows in set (0.00 sec)

mysql>  SELECT d.Name, e.Name, e.Salary FROM ( SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary) ) e LEFT JOIN Department d  ON d.Departmentld = e.Id;
ERROR 1054 (42S22): Unknown column 'd.Departmentld' in 'on clause'
mysql>  SELECT d.Name, e.Name, e.Salary FROM ( SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary) ) e LEFT JOIN Department d  ON d.Id = e.Departmentld;
+-------+-------+--------+
| Name  | Name  | Salary |
+-------+-------+--------+
| IT    | Joe   | 85000  |
| IT    | Max   | 90000  |
| IT    | Randy | 85000  |
| Sales | Henry | 80000  |
+-------+-------+--------+
4 rows in set (0.00 sec)

mysql>  SELECT d.Name, e.Name, e.Salary FROM Department d LEFT JOIN   ( SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary) ) e  ON d.Id = e.Departmentld;
+-------+-------+--------+
| Name  | Name  | Salary |
+-------+-------+--------+
| IT    | Joe   | 85000  |
| Sales | Henry | 80000  |
| IT    | Max   | 90000  |
| IT    | Randy | 85000  |
+-------+-------+--------+
4 rows in set (0.01 sec)

mysql>  SELECT d.Name Department, e.Name  Employee, e.Salary FROM Department d LEFT JOIN   ( SELECT * FROM Employee e1 WHERE 3 > ( SELECT COUNT(DISTINCT e2.Salary) FROM  Employee e2 WHERE e1.Salary < e2.Salary AND e1.Departmentld=e2.Departmentld) ) e  ON d.Id = e.Departmentld;
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Joe      | 85000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
| IT         | Max      | 90000  |
| IT         | Randy    | 85000  |
| IT         | Will     | 70000  |
+------------+----------+--------+
6 rows in set (0.00 sec)

mysql> 

