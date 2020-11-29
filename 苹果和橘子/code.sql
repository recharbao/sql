mysql> CREATE TABLE Sales(
    -> sale_date date,
    -> fruit enum,
    -> sold_num INT,
    -> PRIMARY KEY(sale_date, fruit)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '
sold_num INT,
PRIMARY KEY(sale_date, fruit)
)ENGINE=InnoDB DEFAULT CHARSET=utf8' at line 3
mysql> CREATE TABLE Sales( sale_date date, fruit enum(apples, oranges), sold_num INT, PRIMARY KEY(sale_date, fruit) )ENGINE=InnoDB DEFAULT CHARSET=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'apples, oranges), sold_num INT, PRIMARY KEY(sale_date, fruit) )ENGINE=InnoDB DEF' at line 1
mysql> mysql> CREATE TABLE Sales( sale_date date, fruit enum('apples', 'oranges'), sold_num INT, PRIMARY KEY(sale_date, fruit) )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.04 sec)

mysql> SELECT s1.sale_date, (s1.sold_num - s2.sold_num) AS diff 
    -> FROM Sales s1, Sales s2
    -> WHERE s1.sale_date = s2.sale_date
    -> AND s1.fruit != s2.fruit;
Empty set (0.01 sec)

mysql> SELECT s1.sale_date, (s1.sold_num - s2.sold_num) AS diff  FROM Sales s1, Sales s2 WHERE s1.sale_date = s2.sale_date AND s1.fruit = 'apples' AND 
    -> s2.fruit = 'oranges';
Empty set (0.00 sec)

mysql> INSERT INTO Sales VALUES('2020-05-01', 'apples', 10);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Sales VALUES('2020-05-01', 'oranges', 8);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Sales VALUES('2020-05-01', 'apples', 15);
ERROR 1062 (23000): Duplicate entry '2020-05-01-apples' for key 'PRIMARY'
mysql> INSERT INTO Sales VALUES('2020-05-02', 'apples', 15);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Sales VALUES('2020-05-02', 'oranges', 15);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Sales VALUES('2020-05-03', 'apples', 20);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Sales VALUES('2020-05-03', 'oranges', 0);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Sales VALUES('2020-05-04', 'apples', 15);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Sales VALUES('2020-05-04', 'oranges', 16);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Sales;
+------------+---------+----------+
| sale_date  | fruit   | sold_num |
+------------+---------+----------+
| 2020-05-01 | apples  |       10 |
| 2020-05-01 | oranges |        8 |
| 2020-05-02 | apples  |       15 |
| 2020-05-02 | oranges |       15 |
| 2020-05-03 | apples  |       20 |
| 2020-05-03 | oranges |        0 |
| 2020-05-04 | apples  |       15 |
| 2020-05-04 | oranges |       16 |
+------------+---------+----------+
8 rows in set (0.00 sec)

mysql> SELECT s1.sale_date, (s1.sold_num - s2.sold_num) AS diff  FROM Sales s1, Sales s2 WHERE s1.sale_date = s2.sale_date AND s1.fruit = 'apples' AND  s2.fruit = 'oranges';
+------------+------+
| sale_date  | diff |
+------------+------+
| 2020-05-01 |    2 |
| 2020-05-02 |    0 |
| 2020-05-03 |   20 |
| 2020-05-04 |   -1 |
+------------+------+
4 rows in set (0.00 sec)

mysql> SELECT s1.sale_date, (s1.sold_num - s2.sold_num) AS diff  FROM Sales s1, Sales s2 WHERE s1.sale_date = s2.sale_date AND s1.fruit = 'apples' AND  s2.fruit = 'oranges';

