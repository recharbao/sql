mysql> SHOW TABELS;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'TABELS' at line 1
mysql> SHOW TABLES;
+-----------------+
| Tables_in_sqlpr |
+-----------------+
| Calls           |
| Country         |
| Customer        |
| Customers       |
| Enrollments     |
| Friendship      |
| Likes           |
| Orders          |
| Person          |
| Product         |
| Sales           |
| Stocks          |
+-----------------+
12 rows in set (0.01 sec)

mysql> CREATE TABLE Employees(
    -> employee_id INT,
    -> employee_name VARCHAR(100),
    -> manger_id INT,
    -> PRIMARY KEY(employee_id)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO Employees VALUES(1, 'Boss', 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Employees VALUES(3, 'Alice', 3);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Employees VALUES(2, 'Bob', 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Employees VALUES(4, 'Daniel', 2);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Employees VALUES(7, 'Luis', 4);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Employees VALUES(8, 'Jhon', 3);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Employees VALUES(9, 'Angela', 8);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Employees VALUES(77, 'Robert', 1);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Employees;
+-------------+---------------+-----------+
| employee_id | employee_name | manger_id |
+-------------+---------------+-----------+
|           1 | Boss          |         1 |
|           2 | Bob           |         1 |
|           3 | Alice         |         3 |
|           4 | Daniel        |         2 |
|           7 | Luis          |         4 |
|           8 | Jhon          |         3 |
|           9 | Angela        |         8 |
|          77 | Robert        |         1 |
+-------------+---------------+-----------+
8 rows in set (0.00 sec)

mysql> SELECT employee_id FROM Employees WHERE manager_id=1;
ERROR 1054 (42S22): Unknown column 'manager_id' in 'where clause'
mysql> SELECT employee_id FROM Employees WHERE manger_id=1;
+-------------+
| employee_id |
+-------------+
|           1 |
|           2 |
|          77 |
+-------------+
3 rows in set (0.00 sec)

mysql> mysql> SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1);
+-------------+
| employee_id |
+-------------+
|           1 |
|           2 |
|           4 |
|          77 |
+-------------+
4 rows in set (0.00 sec)

mysql> SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1));
+-------------+
| employee_id |
+-------------+
|           1 |
|           2 |
|           4 |
|           7 |
|          77 |
+-------------+
5 rows in set (0.01 sec)

mysql> SELECT employee_id FROM Employees WHERE manger_id=1 UNION ALL (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)) UNION ALL(SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)));
+-------------+
| employee_id |
+-------------+
|           1 |
|           2 |
|          77 |
|           1 |
|           2 |
|           4 |
|          77 |
|           1 |
|           2 |
|           4 |
|           7 |
|          77 |
+-------------+
12 rows in set (0.01 sec)

mysql> SELECT DISTINCT employee FROM (SELECT employee_id FROM Employees WHERE manger_id=1 UNION ALL (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)) 
ERROR 1248 (42000): Every derived table must have its own alias
mysql> SELECT DISTINCT employee FROM (
    -> SELECT employee_id FROM Employees WHERE manger_id=1 UNION ALL (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)) UNION ALL(SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)))
    -> );
ERROR 1248 (42000): Every derived table must have its own alias
mysql> SELECT DISTINCT employee FROM ( SELECT employee_id FROM Employees WHERE manger_id=1 UNION ALL (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)) UNION ALL(SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1))) ) a ;
ERROR 1054 (42S22): Unknown column 'employee' in 'field list'
mysql> SELECT DISTINCT employee_id FROM (                                                                                                                                                                       -> SELECT employee_id FROM Employees WHERE manger_id=1 UNION ALL (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)) UNION ALL(SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)))
    -> );
ERROR 1248 (42000): Every derived table must have its own alias
mysql> SELECT DISTINCT employee_id FROM ( SELECT employee_id FROM Employees WHERE manger_id=1 UNION ALL (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)) UNION ALL(SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1))) ) a;
+-------------+
| employee_id |
+-------------+
|           1 |
|           2 |
|          77 |
|           4 |
|           7 |
+-------------+
5 rows in set (0.00 sec)

mysql> SELECT DISTINCT employee_id FROM ( SELECT employee_id FROM Employees WHERE manger_id=1 UNION ALL (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)) UNION ALL(SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1))) ) a 
    -> WHERE employee_id != 1;
+-------------+
| employee_id |
+-------------+
|           2 |
|          77 |
|           4 |
|           7 |
+-------------+
4 rows in set (0.01 sec)

mysql> SELECT DISTINCT employee_id FROM ( SELECT employee_id FROM Employees WHERE manger_id=1 UNION ALL (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1)) UNION ALL(SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id IN (SELECT employee_id FROM Employees WHERE manger_id=1))) ) a  WHERE employee_id != 1;
+-------------+
| employee_id |
+-------------+
|           2 |
|          77 |
|           4 |
|           7 |
+-------------+
4 rows in set (0.00 sec)

