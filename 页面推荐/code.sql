mysql> CREATE TABLE Friendship(
    -> user1_id INT,
    -> user2_id INT,
    -> PRIMARY KEY(user1_id, user2_id)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Likes(
    -> user_id INT,
    -> page_id INT,
    -> PRIMARY KEY(user_id, page_id)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.03 sec)


mysql> INSERT INTO Friendship VALUES(1, 2);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Friendship VALUES(1, 3);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Friendship VALUES(1, 4);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Friendship VALUES(2, 3);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Friendship VALUES(2, 4);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Friendship VALUES(2, 5);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Friendship VALUES(6, 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Likes VALUES(1, 88);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Likes VALUES(2, 23);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Likes VALUES(3, 24);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Likes VALUES(4, 56);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Likes VALUES(5, 11);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Likes VALUES(6, 33);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Likes VALUES(2, 77);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Likes VALUES(3, 77);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Likes VALUES(6, 88);
Query OK, 1 row affected (0.00 sec)


mysql> SELECT * FROM Likes;
mysql> SELECT * FROM Friendship;

SELECT user1_id, user2_id FROM Friendship WHERE user1_id = 1 OR user2_id = 1;

SELECT DISTINCT user1_id, user2_id FROM Friendship WHERE user1_id = 1 OR user2_id = 1;

SELECT user1_id FROM (SELECT user1_id, user2_id FROM Friendship WHERE user1_id = 1 OR user2_id = 1) a;

SELECT user2_id FROM Friendship WHERE user1_id = 1 UNION ALL SELECT user1_id FROM Friendship WHERE user2_id = 1;


mysql> SELECT DISTINCT page_id FROM Likes WHERE user_id IN (SELECT user2_id FROM Friendship WHERE user1_id = 1 UNION ALL SELECT user1_id FROM Friendship WHERE user2_id = 1);



mysql> SELECT DISTINCT page_id FROM Likes WHERE user_id IN (SELECT user2_id FROM Friendship WHERE user1_id = 1 UNION ALL SELECT user1_id FROM Friendship WHERE user2_id = 1) AND user_id != 1;


-- 结果
mysql> SELECT DISTINCT page_id FROM Likes WHERE user_id IN (SELECT user2_id FROM Friendship WHERE user1_id = 1 UNION ALL SELECT user1_id FROM Friendship WHERE user2_id = 1) AND page_id NOT IN
    -> (SELECT page_id FROM Likes WHERE user_id = 1);











