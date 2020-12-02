mysql> CREATE TABLE Customer(
    -> customer;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> CREATE TABLE Customer1(
    -> customer_id INT,
    -> name VARCHAR(100),
    -> visited_on DATE,
    -> amount INT,
    -> PRIMARY KEY(customer_id, visited_on)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO Customer1 VALUES(1, 'Jhon', '2019-01-01', 100);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Customer1 VALUES(2, 'Daniel', '2019-01-02', 110);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Customer1 VALUES(3, 'Jade', '2019-01-03', 120);       
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Customer1 VALUES(4, 'Khaled', '2019-01-04', 130);       
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Customer1 VALUES(5, 'Winston', '2019-01-05', 110);       
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Customer1 VALUES(6, 'Elvis', '2019-01-06', 140);       
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Customer1 VALUES(7, 'Anna', '2019-01-07', 150);       
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Customer1 VALUES(8, 'Maria', '2019-01-08', 80);
\Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Customer1 VALUES(9, 'Jaze', '2019-01-09', 110);       
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Customer1 VALUES(1, 'Jhon', '2019-01-10', 130);       
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Customer1 VALUES(3, 'Jade', '2019-01-10', 150);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Customer1;
+-------------+---------+------------+--------+
| customer_id | name    | visited_on | amount |
+-------------+---------+------------+--------+
|           1 | Jhon    | 2019-01-01 |    100 |
|           1 | Jhon    | 2019-01-10 |    130 |
|           2 | Daniel  | 2019-01-02 |    110 |
|           3 | Jade    | 2019-01-03 |    120 |
|           3 | Jade    | 2019-01-10 |    150 |
|           4 | Khaled  | 2019-01-04 |    130 |
|           5 | Winston | 2019-01-05 |    110 |
|           6 | Elvis   | 2019-01-06 |    140 |
|           7 | Anna    | 2019-01-07 |    150 |
|           8 | Maria   | 2019-01-08 |     80 |
|           9 | Jaze    | 2019-01-09 |    110 |
+-------------+---------+------------+--------+
11 rows in set (0.00 sec)

mysql> SELECT DISTINCT visited_on 
    -> FROM Customer1 c1
    -> INNER JOIN
    -> (
    -> SELECT ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 5
mysql> SELECT DISTINCT visited_on
    -> FROM Customer1 c1
    -> WHERE visited_on >= (
    -> SELECT DISTINCT visited_on 
    -> FROM Customer1
    -> ORDER BY visited_on ASC
    -> LIMIT 1 OFFSET 6);
+------------+
| visited_on |
+------------+
| 2019-01-10 |
| 2019-01-07 |
| 2019-01-08 |
| 2019-01-09 |
+------------+
4 rows in set (0.00 sec)

mysql> SELECT visited_on, SUM(amount)
    -> FROM Customer1 c
    -> INNER JOIN
    -> (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) c2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'c2' at line 4
mysql> SELECT visited_on FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) c2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'c2' at line 1
mysql> SELECT visited_on FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6)) c2;
ERROR 1052 (23000): Column 'visited_on' in field list is ambiguous
mysql> SELECT visited_on FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2
    -> ON DATEDIFF(c2.visited_on, c.visited_on) >= 0;
ERROR 1052 (23000): Column 'visited_on' in field list is ambiguous
mysql> SELECT c.visited_on FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0;
+------------+
| visited_on |
+------------+
| 2019-01-01 |
| 2019-01-01 |
| 2019-01-01 |
| 2019-01-01 |
| 2019-01-10 |
| 2019-01-02 |
| 2019-01-02 |
| 2019-01-02 |
| 2019-01-02 |
| 2019-01-03 |
| 2019-01-03 |
| 2019-01-03 |
| 2019-01-03 |
| 2019-01-10 |
| 2019-01-04 |
| 2019-01-04 |
| 2019-01-04 |
| 2019-01-04 |
| 2019-01-05 |
| 2019-01-05 |
| 2019-01-05 |
| 2019-01-05 |
| 2019-01-06 |
| 2019-01-06 |
| 2019-01-06 |
| 2019-01-06 |
| 2019-01-07 |
| 2019-01-07 |
| 2019-01-07 |
| 2019-01-07 |
| 2019-01-08 |
| 2019-01-08 |
| 2019-01-08 |
| 2019-01-09 |
| 2019-01-09 |
+------------+
35 rows in set (0.01 sec)

mysql> SELECT * FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0;
+-------------+---------+------------+--------+------------+
| customer_id | name    | visited_on | amount | visited_on |
+-------------+---------+------------+--------+------------+
|           1 | Jhon    | 2019-01-01 |    100 | 2019-01-10 |
|           1 | Jhon    | 2019-01-01 |    100 | 2019-01-07 |
|           1 | Jhon    | 2019-01-01 |    100 | 2019-01-08 |
|           1 | Jhon    | 2019-01-01 |    100 | 2019-01-09 |
|           1 | Jhon    | 2019-01-10 |    130 | 2019-01-10 |
|           2 | Daniel  | 2019-01-02 |    110 | 2019-01-10 |
|           2 | Daniel  | 2019-01-02 |    110 | 2019-01-07 |
|           2 | Daniel  | 2019-01-02 |    110 | 2019-01-08 |
|           2 | Daniel  | 2019-01-02 |    110 | 2019-01-09 |
|           3 | Jade    | 2019-01-03 |    120 | 2019-01-10 |
|           3 | Jade    | 2019-01-03 |    120 | 2019-01-07 |
|           3 | Jade    | 2019-01-03 |    120 | 2019-01-08 |
|           3 | Jade    | 2019-01-03 |    120 | 2019-01-09 |
|           3 | Jade    | 2019-01-10 |    150 | 2019-01-10 |
|           4 | Khaled  | 2019-01-04 |    130 | 2019-01-10 |
|           4 | Khaled  | 2019-01-04 |    130 | 2019-01-07 |
|           4 | Khaled  | 2019-01-04 |    130 | 2019-01-08 |
|           4 | Khaled  | 2019-01-04 |    130 | 2019-01-09 |
|           5 | Winston | 2019-01-05 |    110 | 2019-01-10 |
|           5 | Winston | 2019-01-05 |    110 | 2019-01-07 |
|           5 | Winston | 2019-01-05 |    110 | 2019-01-08 |
|           5 | Winston | 2019-01-05 |    110 | 2019-01-09 |
|           6 | Elvis   | 2019-01-06 |    140 | 2019-01-10 |
|           6 | Elvis   | 2019-01-06 |    140 | 2019-01-07 |
|           6 | Elvis   | 2019-01-06 |    140 | 2019-01-08 |
|           6 | Elvis   | 2019-01-06 |    140 | 2019-01-09 |
|           7 | Anna    | 2019-01-07 |    150 | 2019-01-10 |
|           7 | Anna    | 2019-01-07 |    150 | 2019-01-07 |
|           7 | Anna    | 2019-01-07 |    150 | 2019-01-08 |
|           7 | Anna    | 2019-01-07 |    150 | 2019-01-09 |
|           8 | Maria   | 2019-01-08 |     80 | 2019-01-10 |
|           8 | Maria   | 2019-01-08 |     80 | 2019-01-08 |
|           8 | Maria   | 2019-01-08 |     80 | 2019-01-09 |
|           9 | Jaze    | 2019-01-09 |    110 | 2019-01-10 |
|           9 | Jaze    | 2019-01-09 |    110 | 2019-01-09 |
+-------------+---------+------------+--------+------------+
35 rows in set (0.01 sec)

mysql> SELECT * FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0 AND DATEDIFF(c2.visited_on, c.visited_on) < 7;
+-------------+---------+------------+--------+------------+
| customer_id | name    | visited_on | amount | visited_on |
+-------------+---------+------------+--------+------------+
|           1 | Jhon    | 2019-01-01 |    100 | 2019-01-07 |
|           1 | Jhon    | 2019-01-10 |    130 | 2019-01-10 |
|           2 | Daniel  | 2019-01-02 |    110 | 2019-01-07 |
|           2 | Daniel  | 2019-01-02 |    110 | 2019-01-08 |
|           3 | Jade    | 2019-01-03 |    120 | 2019-01-07 |
|           3 | Jade    | 2019-01-03 |    120 | 2019-01-08 |
|           3 | Jade    | 2019-01-03 |    120 | 2019-01-09 |
|           3 | Jade    | 2019-01-10 |    150 | 2019-01-10 |
|           4 | Khaled  | 2019-01-04 |    130 | 2019-01-10 |
|           4 | Khaled  | 2019-01-04 |    130 | 2019-01-07 |
|           4 | Khaled  | 2019-01-04 |    130 | 2019-01-08 |
|           4 | Khaled  | 2019-01-04 |    130 | 2019-01-09 |
|           5 | Winston | 2019-01-05 |    110 | 2019-01-10 |
|           5 | Winston | 2019-01-05 |    110 | 2019-01-07 |
|           5 | Winston | 2019-01-05 |    110 | 2019-01-08 |
|           5 | Winston | 2019-01-05 |    110 | 2019-01-09 |
|           6 | Elvis   | 2019-01-06 |    140 | 2019-01-10 |
|           6 | Elvis   | 2019-01-06 |    140 | 2019-01-07 |
|           6 | Elvis   | 2019-01-06 |    140 | 2019-01-08 |
|           6 | Elvis   | 2019-01-06 |    140 | 2019-01-09 |
|           7 | Anna    | 2019-01-07 |    150 | 2019-01-10 |
|           7 | Anna    | 2019-01-07 |    150 | 2019-01-07 |
|           7 | Anna    | 2019-01-07 |    150 | 2019-01-08 |
|           7 | Anna    | 2019-01-07 |    150 | 2019-01-09 |
|           8 | Maria   | 2019-01-08 |     80 | 2019-01-10 |
|           8 | Maria   | 2019-01-08 |     80 | 2019-01-08 |
|           8 | Maria   | 2019-01-08 |     80 | 2019-01-09 |
|           9 | Jaze    | 2019-01-09 |    110 | 2019-01-10 |
|           9 | Jaze    | 2019-01-09 |    110 | 2019-01-09 |
+-------------+---------+------------+--------+------------+
29 rows in set (0.00 sec)

mysql> SELECT * FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0 AND DATEDIFF(c2.visited_on, c.visited_on) < 7 GROUP BY c2.visited_on;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'sqlpr.c.customer_id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT c.visited_on, SUM(c.amount) AS 'amount' ROUND(SUM(c.amount / 7), 2)  FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0 AND DATEDIFF(c2.visited_on, c.visited_on) < 7 GROUP BY c2.visited_on;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ROUND(SUM(c.amount / 7), 2)  FROM Customer1 c INNER JOIN (SELECT DISTINCT visite' at line 1
mysql> SELECT c.visited_on, SUM(c.amount) AS 'amount' ROUND(SUM(c.amount / 7), 2) AS 'average_amount'  FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0 AND DATEDIFF(
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ROUND(SUM(c.amount / 7), 2) AS 'average_amount'  FROM Customer1 c INNER JOIN (SE' at line 1
mysql> SELECT c.visited_on, SUM(c.amount) AS 'amount' ROUND(SUM(c.amount ) / 7, 2) AS 'average_amount'  FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0 AND DATEDIFF(c2.visited_on, c.visited_on) < 7 GROUP BY c2.visited_on;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ROUND(SUM(c.amount ) / 7, 2) AS 'average_amount'  FROM Customer1 c INNER JOIN (S' at line 1
mysql> SELECT c.visited_on, SUM(c.amount) AS amount ROUND(SUM(c.amount ) / 7, 2) AS average_amount  FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0 AND DATEDIFF(c2.visited_on, c.visited_on) < 7 GROUP BY c2.visited_on;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ROUND(SUM(c.amount ) / 7, 2) AS average_amount  FROM Customer1 c INNER JOIN (SEL' at line 1
mysql> SELECT c.visited_on, SUM(c.amount) AS amount ROUND(SUM(c.amount ) / 7, 2) AS average_amount  FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0 AND DATEDIFF(c2.visited_on, c.visited_on) < 7 GROUP BY c2.visited_on;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ROUND(SUM(c.amount ) / 7, 2) AS average_amount  FROM Customer1 c INNER JOIN (SEL' at line 1
mysql> SELECT c.visited_on, SUM(c.amount) AS amount , ROUND(SUM(c.amount ) / 7, 2) AS average_amount  FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0 AND DATEDIFF(c2.visited_on, c.visited_on) < 7 GROUP BY c2.visited_on;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'sqlpr.c.visited_on' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT s.visited_on, SUM(c.amount) AS amount , ROUND(SUM(c.amount ) / 7, 2) AS average_amount  FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0 AND DATEDIFF(c2.visited_on, c.visited_on) < 7 GROUP BY c2.visited_on;
ERROR 1054 (42S22): Unknown column 's.visited_on' in 'field list'
mysql> SELECT c2.visited_on, SUM(c.amount) AS amount , ROUND(SUM(c.amount ) / 7, 2) AS average_amount  FROM Customer1 c INNER JOIN (SELECT DISTINCT visited_on FROM Customer1 c1 WHERE visited_on >= (SELECT DISTINCT visited_on FROM Customer1 ORDER BY visited_on ASC LIMIT 1 OFFSET 6) ) c2 ON DATEDIFF(c2.visited_on, c.visited_on) >= 0 AND DATEDIFF(c2.visited_on, c.visited_on) < 7 GROUP BY c2.visited_on;
+------------+--------+----------------+
| visited_on | amount | average_amount |
+------------+--------+----------------+
| 2019-01-07 |    860 |         122.86 |
| 2019-01-08 |    840 |         120.00 |
| 2019-01-09 |    840 |         120.00 |
| 2019-01-10 |   1000 |         142.86 |
+------------+--------+----------------+
4 rows in set (0.00 sec)


