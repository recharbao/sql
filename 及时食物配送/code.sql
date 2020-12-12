mysql> CREATE TABLE Delivery(
    -> delivery_id INT,
    -> customer_id INT,
    -> order_date DATE,
    -> customer_pref_delivery_date DATE,
    -> PRIMARY KEY(delivery_id)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO Delivery VALUES(1, 1, '2019-08-01', '2019-08-02');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Delivery VALUES(2, 2, '2019-08-02', '2019-08-02');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Delivery VALUES(3, 1, '2019-08-11', '2019-08-12');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Delivery VALUES(4, 3, '2019-08-24', '2019-08-24');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Delivery VALUES(5, 3, '2019-08-21', '2019-08-22');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Delivery VALUES(6, 2, '2019-08-11', '2019-08-13');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Delivery VALUES(7, 4, '2019-08-09', '2019-08-09');
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM Delivery;
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
|           1 |           1 | 2019-08-01 | 2019-08-02                  |
|           2 |           2 | 2019-08-02 | 2019-08-02                  |
|           3 |           1 | 2019-08-11 | 2019-08-12                  |
|           4 |           3 | 2019-08-24 | 2019-08-24                  |
|           5 |           3 | 2019-08-21 | 2019-08-22                  |
|           6 |           2 | 2019-08-11 | 2019-08-13                  |
|           7 |           4 | 2019-08-09 | 2019-08-09                  |
+-------------+-------------+------------+-----------------------------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Delivery WHERE order_date = customer_pref_delivery_date;
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
|           2 |           2 | 2019-08-02 | 2019-08-02                  |
|           4 |           3 | 2019-08-24 | 2019-08-24                  |
|           7 |           4 | 2019-08-09 | 2019-08-09                  |
+-------------+-------------+------------+-----------------------------+
3 rows in set (0.00 sec)

mysql> SELECT customer_id, MIN(order_date)
    -> FROM Delivery
    -> GROUP BY customer_id;
+-------------+-----------------+
| customer_id | MIN(order_date) |
+-------------+-----------------+
|           1 | 2019-08-01      |
|           2 | 2019-08-02      |
|           3 | 2019-08-21      |
|           4 | 2019-08-09      |
+-------------+-----------------+
4 rows in set (0.01 sec)

mysql> SELECT * 
    -> FROM Derivery
    -> WHERE(customer_id, order_date)
    -> IN
    -> ()
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 5
mysql> SELECT * FROM Derivery WHERE(customer_id, order_date) IN (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id);
ERROR 1146 (42S02): Table 'sqlpr.Derivery' doesn't exist
mysql> mysql> SELECT * FROM Delivery WHERE(customer_id, order_date) IN (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id);
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
|           1 |           1 | 2019-08-01 | 2019-08-02                  |
|           2 |           2 | 2019-08-02 | 2019-08-02                  |
|           5 |           3 | 2019-08-21 | 2019-08-22                  |
|           7 |           4 | 2019-08-09 | 2019-08-09                  |
+-------------+-------------+------------+-----------------------------+
4 rows in set (0.01 sec)

mysql> SELECT SUM(order_id = customer_pref_delivery_date) FROM Delivery WHERE(customer_id, order_date) IN (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id);
ERROR 1054 (42S22): Unknown column 'order_id' in 'field list'
mysql> SELECT SUM(order_date = customer_pref_delivery_date) FROM Delivery WHERE(customer_id, order_date) IN (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id);
+-----------------------------------------------+
| SUM(order_date = customer_pref_delivery_date) |
+-----------------------------------------------+
|                                             2 |
+-----------------------------------------------+
1 row in set (0.00 sec)

mysql> SELECT ROUND(SUM(order_date = customer_pref_delivery_date) * 100mysql> SELECT ROUND(SUM(order_date = customer_pref_delivery_date) * 100  FROM Delivery WHERE(customer_id, order_date) IN (SELECT customer_id
mysql> 
mysql> 
mysql> 
mysql> SELECT ROUND(SUM(order_date = customer_pref_delivery_date) * 100 / COUNT(*), 2) FROM Delivery WHERE(customer_id, order_date) IN (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id);
+--------------------------------------------------------------------------+
| ROUND(SUM(order_date = customer_pref_delivery_date) * 100 / COUNT(*), 2) |
+--------------------------------------------------------------------------+
|                                                                    50.00 |
+--------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> mysql> SELECT ROUND(SUM(order_date = customer_pref_delivery_date) * 100 / COUNT(*), 2)  immediate_percentage eFROM DeliERE(customer_id, order_date) IN (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'elivery WHERE(customer_id, order_date) IN (SELECT customer_id, MIN(order_date) F' at line 1
mysql> SELECT ROUND(SUM(order_date = customer_pref_delivery_date) * 100 / COUNT(*), 2)  immediate_percentage FROM Delivery WHERE(customer_id, order_date) IN (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id);
+----------------------+
| immediate_percentage |
+----------------------+
|                50.00 |
+----------------------+
1 row in set (0.00 sec)

