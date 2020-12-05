mysql> CREATE TABLE tree(
    -> id INT,
    -> p_id INT
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO tree VALUES(1, null);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO tree VALUES(2, 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO tree VALUES(3, 1);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO tree VALUES(4, 2);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO tree VALUES(5, 2);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM tree;
+------+------+
| id   | p_id |
+------+------+
|    1 | NULL |
|    2 |    1 |
|    3 |    1 |
|    4 |    2 |
|    5 |    2 |
+------+------+
5 rows in set (0.00 sec)

mysql> SELECT id, 
    -> (CASE WHEN p_id IS NULL THEN 'Root'
    -> WHEN id IN (SELECT p_id FROM tree) THEN 'Inner'
    -> ELSE 'Leaf'
    -> END)
    -> FROM tree
    -> ORDER BY id;
+------+------------------------------------------------------------------------------------------------------+
| id   | (CASE WHEN p_id IS NULL THEN 'Root'
WHEN id IN (SELECT p_id FROM tree) THEN 'Inner'
ELSE 'Leaf'
END) |
+------+------------------------------------------------------------------------------------------------------+
|    1 | Root                                                                                                 |
|    2 | Inner                                                                                                |
|    3 | Leaf                                                                                                 |
|    4 | Leaf                                                                                                 |
|    5 | Leaf                                                                                                 |
+------+------------------------------------------------------------------------------------------------------+
5 rows in set (0.00 sec)

mysql> SELECT id,  (CASE WHEN p_id IS NULL THEN 'Root' WHEN id IN (SELECT p_id FROM tree) THEN 'Inner' ELSE 'Leaf' END) FROM tree ORDER BY id;
mysql> 
mysql> 
mysql> SELECT id,  (CASE WHEN p_id IS NULL THEN 'Root' WHEN id IN (SELECT p_id FROM tree) THEN 'Inner' ELSE 'Leaf' END) AS tree FROM tree ORDER BY id;
+------+-------+
| id   | tree  |
+------+-------+
|    1 | Root  |
|    2 | Inner |
|    3 | Leaf  |
|    4 | Leaf  |
|    5 | Leaf  |
+------+-------+
5 rows in set (0.00 sec)

mysql> SELECT id,  (CASE WHEN p_id IS NULL THEN 'Root' WHEN id IN (SELECT p_id FROM tree) THEN 'Inner' ELSE 'Leaf' END) AS Type FROM tree ORDER BY id;
+------+-------+
| id   | Type  |
+------+-------+
|    1 | Root  |
|    2 | Inner |
|    3 | Leaf  |
|    4 | Leaf  |
|    5 | Leaf  |
+------+-------+
5 rows in set (0.00 sec)

mysql> SELECT id Id,  (CASE WHEN p_id IS NULL THEN 'Root' WHEN id IN (SELECT p_id FROM tree) THEN 'Inner' ELSE 'Leaf' END) AS Type FROM tree ORDER BY id;
+------+-------+
| Id   | Type  |
+------+-------+
|    1 | Root  |
|    2 | Inner |
|    3 | Leaf  |
|    4 | Leaf  |
|    5 | Leaf  |
+------+-------+
5 rows in set (0.00 sec)

