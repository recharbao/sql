mysql> CREATE TABLE follow(
    -> followee VARCHAR(100),
    -> follower VARCHAR(100)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8
    -> ;
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO follow VALUES('A', 'B');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO follow VALUES('B', 'C');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO follow VALUES('B', 'D');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO follow VALUES('D', 'F');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM follow;
+----------+----------+
| followee | follower |
+----------+----------+
| A        | B        |
| B        | C        |
| B        | D        |
| D        | F        |
+----------+----------+
4 rows in set (0.00 sec)

mysql> SELECT a.follower FROM 
    -> follower a
    -> INNER JOIN follower b
    -> ON a.follower = b.followee;
ERROR 1146 (42S02): Table 'sqlpr.follower' doesn't exist
mysql> SELECT a.follower FROM follow a INNER JOIN follow b ON a.follower = b.followee;
+----------+
| follower |
+----------+
| B        |
| B        |
| D        |
+----------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM follow a INNER JOIN follow b ON a.follower = b.followee;
+----------+----------+----------+----------+
| followee | follower | followee | follower |
+----------+----------+----------+----------+
| A        | B        | B        | C        |
| A        | B        | B        | D        |
| B        | D        | D        | F        |
+----------+----------+----------+----------+
3 rows in set (0.00 sec)

mysql> SELECT COUNT(b.followee) FROM follow a INNER JOIN follow b ON a.follower = b.followee GROUP BY b.followee;
+-------------------+
| COUNT(b.followee) |
+-------------------+
|                 2 |
|                 1 |
+-------------------+
2 rows in set (0.00 sec)

mysql> SELECT a.follower, COUNT(b.followee) AS num  FROM follow a INNER JOIN follow b ON a.follower = b.followee GROUP BY b.followee ORDER BY a.follower;
+----------+-----+
| follower | num |
+----------+-----+
| B        |   2 |
| D        |   1 |
+----------+-----+
2 rows in set (0.00 sec)

mysql> SELECT a.follower, COUNT(DISTINCT b.followee) AS num  FROM follow a INNER JOIN follow b ON a.follower = b.followee GROUP BY b.followee ORDER BY a.follo
+----------+-----+
| follower | num |
+----------+-----+
| B        |   1 |
| D        |   1 |
+----------+-----+
2 rows in set (0.01 sec)

mysql> SELECT a.follower, COUNT(b.followee) AS num  FROM follow a INNER JOIN follow b ON a.follower = b.followee GROUP BY b.followee ORDER BY a.follower; +----------+-----+
| follower | num |
+----------+-----+
| B        |   2 |
| D        |   1 |
+----------+-----+
2 rows in set (0.00 sec)

mysql> SELECT a.follower, COUNT(b.followee) AS num  FROM follow a INNER JOIN follow b ON a.follower = b.followee GROUP BY a.follower ORDER BY a.follower;
+----------+-----+
| follower | num |
+----------+-----+
| B        |   2 |
| D        |   1 |
+----------+-----+
2 rows in set (0.00 sec)

mysql> SELECT a.follower, COUNT(a.follower) AS num  FROM follow a INNER JOIN follow b ON a.follower = b.followee GROUP BY a.follower ORDER BY a.follower;
+----------+-----+
| follower | num |
+----------+-----+
| B        |   2 |
| D        |   1 |
+----------+-----+
2 rows in set (0.00 sec)

mysql> SELECT a.follower, COUNT(DISTINCT a.follower) AS num  FROM follow a INNER JOIN follow b ON a.follower = b.followee GROUP BY a.follower ORDER BY a.follo
+----------+-----+
| follower | num |
+----------+-----+
| B        |   1 |
| D        |   1 |
+----------+-----+
2 rows in set (0.01 sec)

mysql> SELECT a.follower, COUNT(DISTINCT b.follower) AS num  FROM follow a INNER JOIN follow b ON a.follower = b.followee GROUP BY a.follower ORDER BY a.follower;
+----------+-----+
| follower | num |
+----------+-----+
| B        |   2 |
| D        |   1 |
+----------+-----+
2 rows in set (0.00 sec)

mysql> SELECT a.follower, COUNT(DISTINCT b.follower) AS num  FROM follow a INNER JOIN follow b ON a.follower = b.followee GROUP BY a.follower ORDER BY a.followeR;
+----------+-----+
| follower | num |
+----------+-----+
| B        |   2 |
| D        |   1 |
+----------+-----+
2 rows in set (0.00 sec)

