
mysql> DROP ALL TABLES;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ALL TABLES' at line 1
mysql> CREATE TABLE Activity(
    -> player_id INT,
    -> device_id INT,
    -> event_date DATE,
    -> games_played INT
    -> , PRIMARY KEY(player_id, event_date)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO Activity VALUES(1, 2, '2016-03-01', 5);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Activity VALUES(1, 2, '2016-03-02', 6);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Activity VALUES(2, 3, '2017-06-25', 1);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Activity VALUES(3, 1, '2016-03-02', 0);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Activity VALUES(3, 4, '2018-07-03', 5);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM Activity;
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
|         1 |         2 | 2016-03-01 |            5 |
|         1 |         2 | 2016-03-02 |            6 |
|         2 |         3 | 2017-06-25 |            1 |
|         3 |         1 | 2016-03-02 |            0 |
|         3 |         4 | 2018-07-03 |            5 |
+-----------+-----------+------------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT player_id, min(event_date) 
    -> FROM Activity
    -> GROUP BY player_id;
+-----------+-----------------+
| player_id | min(event_date) |
+-----------+-----------------+
|         1 | 2016-03-01      |
|         2 | 2017-06-25      |
|         3 | 2016-03-02      |
+-----------+-----------------+
3 rows in set (0.02 sec)

mysql> SELECT *  FROM (SELECT player_id, min(event_date) FROM Activity GROUP BY player_id) LEFT JOIN
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> SELECT *  FROM (SELECT player_id, min(event_date) FROM Activity GROUP BY player_id) a LEFT JOIN
    -> Activity b ON a.player_id = b.player_id;
+-----------+-----------------+-----------+-----------+------------+--------------+
| player_id | min(event_date) | player_id | device_id | event_date | games_played |
+-----------+-----------------+-----------+-----------+------------+--------------+
|         1 | 2016-03-01      |         1 |         2 | 2016-03-01 |            5 |
|         1 | 2016-03-01      |         1 |         2 | 2016-03-02 |            6 |
|         2 | 2017-06-25      |         2 |         3 | 2017-06-25 |            1 |
|         3 | 2016-03-02      |         3 |         1 | 2016-03-02 |            0 |
|         3 | 2016-03-02      |         3 |         4 | 2018-07-03 |            5 |
+-----------+-----------------+-----------+-----------+------------+--------------+
5 rows in set (0.00 sec)

mysql> SELECT DATEDIFF(b.event_date, a.event_date), (SELECT COUNT(DISTINCT player_id) FROM Activity)  FROM (SELECT player_id, min(event_date) event_date FROM Activity GROUP BY player_id) a LEFT JOIN Activity b ON a.player_id = b.player_id;
+--------------------------------------+--------------------------------------------------+
| DATEDIFF(b.event_date, a.event_date) | (SELECT COUNT(DISTINCT player_id) FROM Activity) |
+--------------------------------------+--------------------------------------------------+
|                                    0 |                                                3 |
|                                    1 |                                                3 |
|                                    0 |                                                3 |
|                                    0 |                                                3 |
|                                  853 |                                                3 |
+--------------------------------------+--------------------------------------------------+
5 rows in set (0.01 sec)

mysql> SELECT ROUND(SUM(CASE WHEN DATEDIFF(b.event_date, a.event_date)=1 THEN 1 ELSE 0 END) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2)  FROM (SELECT player_id, min(event_date) event_date FROM Activity GROUP BY player_id) a LEFT JOIN Activity b ON a.player_id = b.player_id;
+--------------------------------------------------------------------------------------------------------------------------------------+
| ROUND(SUM(CASE WHEN DATEDIFF(b.event_date, a.event_date)=1 THEN 1 ELSE 0 END) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) |
+--------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                                                                 0.33 |
+--------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.03 sec)

mysql> SELECT ROUND(SUM(CASE WHEN DATEDIFF(b.event_date, a.event_date)=1 THEN 1 ELSE 0 END) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction  FROM (SELECT player_id, min(event_date) event_date FROM Activity GROUP BY player_id) a LEFT JOIN Activity b ON a.player_id = b.player_id;
+----------+
| fraction |
+----------+
|     0.33 |
+----------+
1 row in set (0.01 sec)

