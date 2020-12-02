Database changed
mysql> CREATE TABLE Queue(
    -> person_id INT,
    -> person_name VARCHAR(100),
    -> weight INT,
    -> turn INT,
    -> PRIMARY KEY(person_id)
    -> )ENGINE=InnoDB DEDFAULT CHARSET=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DEDFAULT CHARSET=utf8' at line 7
mysql> CREATE TABLE Queue( person_id INT, person_name VARCHAR(100), weight INT, turn INT, PRIMARY KEY(person_id) )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO Queue VALUES(5, 'George Washington', 250, 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Queue VALUES(3, 'John Adams', 350, 2);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Queue VALUES(6, 'Thomas Jefferson', 400, 3);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Queue VALUES(2, 'Will Johnliams', 200, 4);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Queue VALUES(4, 'Thomas Jefferson', 175, 5);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Queue VALUES(1, 'James Elephant', 500, 6);
Query OK, 1 row affected (0.03 sec)

mysql> SELECT * FROM Queue;
+-----------+-------------------+--------+------+
| person_id | person_name       | weight | turn |
+-----------+-------------------+--------+------+
|         1 | James Elephant    |    500 |    6 |
|         2 | Will Johnliams    |    200 |    4 |
|         3 | John Adams        |    350 |    2 |
|         4 | Thomas Jefferson  |    175 |    5 |
|         5 | George Washington |    250 |    1 |
|         6 | Thomas Jefferson  |    400 |    3 |
+-----------+-------------------+--------+------+
6 rows in set (0.00 sec)

mysql> SELECT a.person 
    -> FROM person a, person b
    -> WHERE a.turn >= b.turn
    -> GROUP BY a.person HAVING SUM(b.weight) <= 1000
    -> ORDER BY a.turn DESC LIMIT 1;
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    11
Current database: sqlpr

ERROR 1146 (42S02): Table 'sqlpr.person' doesn't exist
mysql> SELECT a.person FROM Queue a, Queue b WHERE a.turn >= b.turn GROUP BY a.person HAVING SUM(b.weight) <= 1000 ORDER BY a.turn DESC LIMIT 1;
ERROR 1054 (42S22): Unknown column 'a.person' in 'field list'
mysql> SELECT a.person_name FROM Queue a, Queue b WHERE a.turn >= b.turn GROUP BY a.person_id HAVING SUM(b.weight) <= 1000 ORDER BY a.turn DESC LIMIT 1;
+------------------+
| person_name      |
+------------------+
| Thomas Jefferson |
+------------------+
1 row in set (0.01 sec)
