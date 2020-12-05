mysql> CREATE TABLE point_2d(
    -> x INT,
    -> y INT 
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO point_2d VALUES (-1, -1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO point_2d VALUES (0, 0);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO point_2d VALUES (-1, -2);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM point_2d;
+------+------+
| x    | y    |
+------+------+
|   -1 |   -1 |
|    0 |    0 |
|   -1 |   -2 |
+------+------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM point_2d p1, point_2d p2;
+------+------+------+------+
| x    | y    | x    | y    |
+------+------+------+------+
|   -1 |   -1 |   -1 |   -1 |
|    0 |    0 |   -1 |   -1 |
|   -1 |   -2 |   -1 |   -1 |
|   -1 |   -1 |    0 |    0 |
|    0 |    0 |    0 |    0 |
|   -1 |   -2 |    0 |    0 |
|   -1 |   -1 |   -1 |   -2 |
|    0 |    0 |   -1 |   -2 |
|   -1 |   -2 |   -1 |   -2 |
+------+------+------+------+
9 rows in set (0.00 sec)

mysql> SELECT * FROM point_2d p1 INNNER JOIN  point_2d p2 ON p1.x != p2.x AND p1.y != p2.y;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'INNNER JOIN  point_2d p2 ON p1.x != p2.x AND p1.y != p2.y' at line 1
mysql> SELECT * FROM point_2d p1 INNER JOIN  point_2d p2 ON p1.x != p2.x AND p1.y != p2.y;
+------+------+------+------+
| x    | y    | x    | y    |
+------+------+------+------+
|    0 |    0 |   -1 |   -1 |
|   -1 |   -1 |    0 |    0 |
|   -1 |   -2 |    0 |    0 |
|    0 |    0 |   -1 |   -2 |
+------+------+------+------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM point_2d p1 INNER JOIN  point_2d p2 ON p1.x != p2.x OR p1.y != p2.y;
+------+------+------+------+
| x    | y    | x    | y    |
+------+------+------+------+
|    0 |    0 |   -1 |   -1 |
|   -1 |   -2 |   -1 |   -1 |
|   -1 |   -1 |    0 |    0 |
|   -1 |   -2 |    0 |    0 |
|   -1 |   -1 |   -1 |   -2 |
|    0 |    0 |   -1 |   -2 |
+------+------+------+------+
6 rows in set (0.00 sec)

mysql> mysql> SELECT ROUND(SQRT(MIN(POW(p1.x - p2.x, 2) + POW(p1.y - p2.y, 2))), 2) FROM point_2d p1 INNER JOIN  point_2d p2 ON p1.x != p2.x OR p1.y != p2.y;
+----------------------------------------------------------------+
| ROUND(SQRT(MIN(POW(p1.x - p2.x, 2) + POW(p1.y - p2.y, 2))), 2) |
+----------------------------------------------------------------+
|                                                           1.00 |
+----------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT ROUND(SQRT(MIN(POW(p1.x - p2.x, 2) + POW(p1.y - p2.y, 2))), 2) AS shortest FROM point_2d p1 INNER JOIN  point_2d p2 ON p1.x != p2.x OR p1.y != p2.y;
+----------+
| shortest |
+----------+
|     1.00 |
+----------+
1 row in set (0.00 sec)

