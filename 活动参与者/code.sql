rechar@rechar-Inspiron-7560:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 5.7.32-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use sqlpr;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> WITH tmp AS(
    -> SELECT activity, COUNT(*) 
    -> FROM Friends
    -> GROUP BY activity;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'tmp AS(
SELECT activity, COUNT(*)
FROM Friends
GROUP BY activity' at line 1
mysql> SELECT activity, COUNT(*) 
    ->     -> FROM Friends
    ->     -> GROUP BY activity;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> FROM Friends
    -> GROUP BY activity' at line 2
mysql> SELECT activity, COUNT(*) FROM Friends GROUP BY activity;
+--------------+----------+
| activity     | COUNT(*) |
+--------------+----------+
| Eating       |        3 |
| Horse Riding |        1 |
| Singing      |        2 |
+--------------+----------+
3 rows in set (0.00 sec)

mysql> 
mysql> 
mysql> 
mysql> SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity;
+--------------+-------+
| activity     | a_cnt |
+--------------+-------+
| Eating       |     3 |
| Horse Riding |     1 |
| Singing      |     2 |
+--------------+-------+
3 rows in set (0.00 sec)

mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) WHERE a_cnt NOT IN MAX(SELECT COUNT(*) AS a_cnt FROM Friends GROUP BY activity);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'MAX(SELECT COUNT(*) AS a_cnt FROM Friends GROUP BY activity)' at line 1
mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) WHERE a_cnt NOT IN MAX(SELECT COUNT(*) AS a_cnt FROM Friends GROUP BY activity);ty);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'MAX(SELECT COUNT(*) AS a_cnt FROM Friends GROUP BY activity)' at line 1
mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) WHERE a_cnt NOT IN MAX(SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'MAX(SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity)' at line 1
mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) A WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity) B;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'B' at line 1
mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) A WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity);
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT A.activity FROM (SELECT A.activity, COUNT(*) AS a_cnt FROM Friends GROUP BY A.activity) A WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity);
ERROR 1054 (42S22): Unknown column 'A.activity' in 'field list'
mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) a WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity);
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY a.activity) a WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity);
ERROR 1054 (42S22): Unknown column 'a.activity' in 'group statement'
mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) a WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity) b;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'b' at line 1
mysql> SELECT activity FROM (SELECT c.activity, COUNT(*) AS a_cnt FROM Friends c GROUP BY c.activity) a WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends b GROUP BY activity);
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT activity FROM (SELECT c.activity, COUNT(*) AS a_cnt FROM Friends c GROUP BY c.activity) a WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends b GROUP BY b.activity);
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT a.activity FROM (SELECT c.activity, COUNT(*) AS a_cnt FROM Friends c GROUP BY c.activity) a WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends b GROUP BY b.activity);
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> mysql> SELECT activity FROM (SELECT activity, COUNT(*) AS a_cnt FROM Friends GROUP BY activity) WHERE a_cnt NOT IN (SELECT MAX(COUNT(*)) AS a_cnt FROM Friends GROUP BY activity 
    -> UNION SELECT MIN(COUNT(*)) AS a_cnt FROM Friends);
ERROR 1248 (42000): Every derived table must have its own alias
mysql>  SELECT activity                                                                               ->  FROM 
    ->     (SELECT 
    ->     activity, COUNT(*) AS a_cnt 
    ->     FROM Friends 
    ->     GROUP BY activity) as a
    ->  WHERE a_cnt NOT IN 
    ->     (SELECT MAX(COUNT(*)) AS a_cnt 
    ->     FROM Friends GROUP BY activity 
    ->     UNION 
    ->     SELECT MIN(COUNT(*)) AS a_cnt 
    ->     FROM Friends) as b;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as b' at line 12
mysql>  SELECT activity 
    ->  FROM 
    ->     (SELECT 
    ->     activity, COUNT(*) AS a_cnt 
    ->     FROM Friends 
    ->     GROUP BY activity) as a
    ->  WHERE a_cnt NOT IN 
    ->     (SELECT MAX(COUNT(*)) AS a_cnt 
    ->     FROM Friends GROUP BY activity 
    ->     UNION 
    ->     SELECT MIN(COUNT(*)) AS a_cnt 
    ->     FROM Friends);
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT activity, COUNT(*) FROM Friends GROUP BY activity;
+--------------+----------+
| activity     | COUNT(*) |
+--------------+----------+
| Eating       |        3 |
| Horse Riding |        1 |
| Singing      |        2 |
+--------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT activity, MAX(COUNT(*)) FROM Friends GROUP BY activity;
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT activity, MAX(COUNT(*)) AS B FROM Friends GROUP BY activity,B;
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT activity, MAX(COUNT(*)as b) FROM Friends GROUP BY activity,b;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as b) FROM Friends GROUP BY activity,b' at line 1
mysql> SELECT activity, COUNT(*) FROM Friends GROUP BY activity,b;
ERROR 1054 (42S22): Unknown column 'b' in 'group statement'
mysql> SELECT activity, COUNT(*) FROM Friends GROUP BY activity;
+--------------+----------+
| activity     | COUNT(*) |
+--------------+----------+
| Eating       |        3 |
| Horse Riding |        1 |
| Singing      |        2 |
+--------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT activity, COUNT(*) a_cnt FROM Friends GROUP BY activity ORDEDR BY a_cnt LIMIT 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ORDEDR BY a_cnt LIMIT 1' at line 1
mysql> SELECT activity, COUNT(*) a_cnt FROM Friends GROUP BY activity ORDEDR BY a_cnt;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ORDEDR BY a_cnt' at line 1
mysql> SELECT activity, COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER BY a_cnt;
+--------------+-------+
| activity     | a_cnt |
+--------------+-------+
| Horse Riding |     1 |
| Singing      |     2 |
| Eating       |     3 |
+--------------+-------+
3 rows in set (0.00 sec)

mysql> SELECT activity, COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER BY DESC a_cnt;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESC a_cnt' at line 1
mysql> SELECT activity, COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER BY a_cnt DESC;
+--------------+-------+
| activity     | a_cnt |
+--------------+-------+
| Eating       |     3 |
| Singing      |     2 |
| Horse Riding |     1 |
+--------------+-------+
3 rows in set (0.00 sec)

mysql> SELECT activity, COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER BY a_cnt DESC LIMIT 1;
+----------+-------+
| activity | a_cnt |
+----------+-------+
| Eating   |     3 |
+----------+-------+
1 row in set (0.00 sec)

mysql>  SELECT activity 
    ->  FROM 
    ->     (SELECT 
    ->     activity, COUNT(*) AS a_cnt 
    ->     FROM Friends 
    ->     GROUP BY activity) as a
    ->  WHERE a_cnt NOT IN 
    ->     (SELECT COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER BY a_cnt DESC LIMIT 1
    ->     UNION 
    ->     SELECT activity, COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER BY a_cnt DESC LIMIT 1);
ERROR 1221 (HY000): Incorrect usage of UNION and ORDER BY
mysql>                                                                           mysql> 
mysql> 
mysql> SELECT activity   FROM      (SELECT      activity, COUNT(*) AS a_cnt      FROM Friends      GROUP BY activity) as a  WHERE a_cnt NOT IN      (SELECT COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER BY a_cnt DESC LIMIT 1     UNION      SELECT activity, COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER BY a_cnt DESC LIMIT 1);
ERROR 1221 (HY000): Incorrect usage of UNION and ORDER BY
mysql>  SELECT activity 
    ->  FROM 
    ->     (SELECT 
    ->     activity, COUNT(*) AS a_cnt 
    ->     FROM Friends 
    ->     GROUP BY activity) as a
    ->  WHERE a_cnt NOT IN 
    ->     (SELECT COUNT(*) a_cnt FROM Friends f1 GROUP BY f1.activity ORDER BY f1.a_cnt DESC LIMIT 1
    ->     UNION
    ->     SELECT activity, COUNT(*) a_cnt FROM Friends f2 GROUP BY f2.activity ORDER BY f2.a_cnt ASC LIMIT 1);
ERROR 1221 (HY000): Incorrect usage of UNION and ORDER BY
mysql> SELECT COUNT(*) a_cnt FROM Friends f1 GROUP BY f1.activity ORDER BY f1.a_cnt DESC LIMIT 1
    -> ;
ERROR 1054 (42S22): Unknown column 'f1.a_cnt' in 'order clause'
mysql> SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity ORDER BY a_cnt DESC LIMIT 1
    -> ;
+-------+
| a_cnt |
+-------+
|     3 |
+-------+
1 row in set (0.01 sec)

mysql>  SELECT activity 
    ->  FROM 
    ->     (SELECT 
    ->     activity, COUNT(*) AS a_cnt 
    ->     FROM Friends 
    ->     GROUP BY activity) as a
    ->  WHERE a_cnt NOT IN 
    ->     ((SELECT COUNT(*) a_cnt FROM Friends f1 GROUP BY f1.activity ORDER BY f1.a_cnt DESC LIMIT) 1
    ->     UNION
    ->     (SELECT activity, COUNT(*) a_cnt FROM Friends f2 GROUP BY f2.activity ORDER BY f2.a_cnt ASC LIMIT 1));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') 1
    UNION
    (SELECT activity, COUNT(*) a_cnt FROM Friends f2 GROUP BY f2.a' at line 8
mysql>  SELECT activity 
    ->  FROM 
    ->     (SELECT 
    ->     activity, COUNT(*) AS a_cnt 
    ->     FROM Friends 
    ->     GROUP BY activity) as a
    ->  WHERE a_cnt NOT IN 
    ->     ((SELECT COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER BY a_cnt DESC LIMIT 1)
    ->     UNION
    ->     (SELECT activity, COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER BY a_cnt ASC LIMIT 1));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'UNION
    (SELECT activity, COUNT(*) a_cnt FROM Friends GROUP BY activity ORDER ' at line 9
mysql> SELECT MAX(SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity)' at line 1
mysql> SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) a;
+------------+
| MAX(a_cnt) |
+------------+
|          3 |
+------------+
1 row in set (0.00 sec)

mysql> (SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) a UNION (SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) B
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'UNION (SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY acti' at line 1
mysql> (SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) a UNION (SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) b;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'UNION (SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY acti' at line 1
mysql> SELECT * FROM ((SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) a UNION (SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) b);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql>                                                                                                                            mysql> 
mysql> 
mysql> 
mysql> 
mysql> SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity)
    -> ;
ERROR 2006 (HY000): MySQL server has gone away
No connection. Trying to reconnect...
Connection id:    11
Current database: sqlpr

ERROR 1248 (42000): Every derived table must have its own alias
mysql> 
[1]+  已停止               mysql -u root -p
rechar@rechar-Inspiron-7560:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 5.7.32-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use sqlpr;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity);
ERROR 1248 (42000): Every derived table must have its own alias
mysql> SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) a;
+------------+
| MAX(a_cnt) |
+------------+
|          3 |
+------------+
1 row in set (0.02 sec)

mysql> SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) a UNION  SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) b;
+------------+
| MAX(a_cnt) |
+------------+
|          3 |
+------------+
1 row in set (0.01 sec)

mysql> SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) a UNION  SELECT MIN(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) b;
+------------+
| MAX(a_cnt) |
+------------+
|          3 |
|          1 |
+------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Friends;
+----+-------------+--------------+
| id | name        | activity     |
+----+-------------+--------------+
|  1 | Jonathan D. | Eating       |
|  2 | Jade W.     | Singing      |
|  3 | Victor J.   | Singing      |
|  4 | Elvis Q.    | Eating       |
|  5 | Daniel A.   | Eating       |
|  6 | Bob B.      | Horse Riding |
+----+-------------+--------------+
6 rows in set (0.00 sec)

mysql>  SELECT activity 
    ->  FROM 
    ->     (SELECT 
    ->     activity, COUNT(*) AS a_cnt 
    ->     FROM Friends 
    ->     GROUP BY activity) as a
    ->  WHERE a_cnt NOT IN (
    ->     SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) a UNION 
    ->     SELECT MIN(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) b;);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 9
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql>                                                                                                                            mysql> 
mysql>  SELECT activity 
    ->  FROM 
    ->     (SELECT 
    ->     activity, COUNT(*) AS a_cnt 
    ->     FROM Friends 
    ->     GROUP BY activity) as a
    ->  WHERE a_cnt NOT IN (
    ->     SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) b UNION 
    ->     SELECT MIN(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) c);
+----------+
| activity |
+----------+
| Singing  |
+----------+
1 row in set (0.01 sec)

mysql>  SELECT activity 
    ->  FROM 
    ->     (SELECT 
    ->     a.activity, COUNT(*) AS a_cnt 
    ->     FROM Friends 
    ->     GROUP BY a.activity) as a
    ->  WHERE a_cnt NOT IN (
    ->     SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) b UNION 
    ->     SELECT MIN(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) c);
ERROR 1054 (42S22): Unknown column 'a.activity' in 'field list'
mysql>  SELECT activity 
    ->  FROM 
    ->     (SELECT 
    ->     activity, COUNT(*) AS a_cnt 
    ->     FROM Friends 
    ->     GROUP BY activity) as a
    ->  WHERE a_cnt NOT IN (
    ->     SELECT MAX(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) b UNION 
    ->     SELECT MIN(a_cnt) FROM (SELECT COUNT(*) a_cnt FROM Friends  GROUP BY activity) c);
+----------+
| activity |
+----------+
| Singing  |
+----------+
1 row in set (0.00 sec)

