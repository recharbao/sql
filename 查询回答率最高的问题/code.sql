Database changed
mysql> CREATE TABLE survey_log(
    -> id INT,
    -> action VARCHAR(100),
    -> question_id INT,
    -> answer_id INT,
    -> q_num INT,
    -> timestamp INT
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO survey_log VALUES(5, 'show', 285, null, 1, 123);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO survey_log VALUES(5, 'answer', 285, 124124, 1, 124);      
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO survey_log VALUES(5, 'show', 369, null, 2, 125);      
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO survey_log VALUES(5, 'skip', 369, null, 2, 126);      
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM survey_log;
+------+--------+-------------+-----------+-------+-----------+
| id   | action | question_id | answer_id | q_num | timestamp |
+------+--------+-------------+-----------+-------+-----------+
|    5 | show   |         285 |      NULL |     1 |       123 |
|    5 | answer |         285 |    124124 |     1 |       124 |
|    5 | show   |         369 |      NULL |     2 |       125 |
|    5 | skip   |         369 |      NULL |     2 |       126 |
+------+--------+-------------+-----------+-------+-----------+
4 rows in set (0.00 sec)

mysql>  select       question_id,       sum(if(action = 'answer', 1, 0)) as AnswerCnt,       sum(if(action = 'show', 1, 0)) as ShowCnt   from       survey_log   group by question_id;
+-------------+-----------+---------+
| question_id | AnswerCnt | ShowCnt |
+-------------+-----------+---------+
|         285 |         1 |       1 |
|         369 |         0 |       1 |
+-------------+-----------+---------+
2 rows in set (0.00 sec)

mysql> SELECT question_id, SUM(IF(action = 'answer', 1, 0)) AS a, SUM(IF(action = 'show', 1, 0)) AS s FROM survey_log  GROUP BY question_id;
+-------------+------+------+
| question_id | a    | s    |
+-------------+------+------+
|         285 |    1 |    1 |
|         369 |    0 |    1 |
+-------------+------+------+
2 rows in set (0.01 sec)

mysql> SELECT question_id FROM(SELECT question_id, SUM(IF(action = 'answer', 1, 0)) AS a, SUM(IF(action = 'show', 1, 0)) AS s FROM survey_log  GROUP BY question_id)) ORDER BY (A / S) DESC;
ERROR 1248 (42000): Every derived table must have its own alias
mysql> SELECT question_id FROM(SELECT question_id, SUM(IF(action = 'answer', 1, 0)) AS a, SUM(IF(action = 'show', 1, 0)) AS s FROM survey_log  GROUP BY question_id) F) ORDER BY (A / S) DESC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') ORDER BY (A / S) DESC' at line 1
mysql> SELECT question_id FROM(SELECT question_id, SUM(IF(action = 'answer', 1, 0)) AS a, SUM(IF(action = 'show', 1, 0)) AS s FROM survey_log  GROUP BY question_id) g ORDER BY (A / S) DESC;
+-------------+
| question_id |
+-------------+
|         285 |
|         369 |
+-------------+
2 rows in set (0.00 sec)

mysql> SELECT question_id FROM(SELECT question_id, SUM(IF(action = 'answer', 1, 0)) AS a, SUM(IF(action = 'show', 1, 0)) AS s FROM survey_log  GROUP BY question_id) g ORDER BY (A / S) DESC LIMIT 1;
+-------------+
| question_id |
+-------------+
|         285 |
+-------------+
1 row in set (0.00 sec)


