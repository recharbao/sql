mysql> DROP DATABASE Customers;
ERROR 1008 (HY000): Can't drop database 'Customers'; database doesn't exist
mysql> DROP DATABASE Customer;
ERROR 1008 (HY000): Can't drop database 'Customer'; database doesn't exist
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sqlpr              |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

mysql> USE sqlpr;
Database changed
mysql> DROP TABLE Customers;
Query OK, 0 rows affected (0.03 sec)

mysql> DROP TABLE Orders;
\Query OK, 0 rows affected (0.02 sec)

mysql> DROP TABLE Orders;
ERROR 1051 (42S02): Unknown table 'sqlpr.Orders'
mysql> CREATE TABLE Customers(
    -> customer_id INT PRIMARY KEY,
    -> name VARCHAR(100)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Orders(
    -> order_id INT,
    -> order_date DATE,
    -> customer_id INT,
    -> cost INT,
    -> PRIMARY KEY(order_id)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO Customers(1,'Winston');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '1,'Winston')' at line 1
mysql> INSERT INTO Customers VALUES(1,'Winston');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Customers VALUES(2, 'Jonathan');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Customers VALUES(3, 'Annabelle');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Customers VALUES(4, 'Marwan');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Customers VALUES(5, 'Khaled');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Orders VALUES(1, '2020-07-31', 1, 30);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Orders VALUES(2, '2020-07-30', 2, 40);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Orders VALUES(3, '2020-07-31', 3, 70);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Orders VALUES(4, '2020-07-29', 4, 100);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Orders VALUES(5, '2020-06-10', 1, 1010);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Orders VALUES(6, '2020-08-01', 2, 102);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Orders VALUES(7, '2020-08-01', 3, 111);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Orders VALUES(8, '2020-08-03', 1, 99);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Orders VALUES(9, '2020-08-07', 2, 32);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Orders VALUES(10, '2020-07-15', 1, 2);
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM Orders;
+----------+------------+-------------+------+
| order_id | order_date | customer_id | cost |
+----------+------------+-------------+------+
|        1 | 2020-07-31 |           1 |   30 |
|        2 | 2020-07-30 |           2 |   40 |
|        3 | 2020-07-31 |           3 |   70 |
|        4 | 2020-07-29 |           4 |  100 |
|        5 | 2020-06-10 |           1 | 1010 |
|        6 | 2020-08-01 |           2 |  102 |
|        7 | 2020-08-01 |           3 |  111 |
|        8 | 2020-08-03 |           1 |   99 |
|        9 | 2020-08-07 |           2 |   32 |
|       10 | 2020-07-15 |           1 |    2 |
+----------+------------+-------------+------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM Customers;
+-------------+-----------+
| customer_id | name      |
+-------------+-----------+
|           1 | Winston   |
|           2 | Jonathan  |
|           3 | Annabelle |
|           4 | Marwan    |
|           5 | Khaled    |
+-------------+-----------+
5 rows in set (0.00 sec)

mysql> 
mysql> 
mysql> select b.name as customer_name, a.customer_id, a.order_id, a.order_date
    -> from 
    -> (
    ->     select order_id, customer_id, row_number()over(partition by customer_id order by order_date desc) as rn, order_date
    ->     from Orders
    -> )a
    -> join customers b
    -> on a.customer_id = b.customer_id
    -> where a.rn < 4
    -> order by customer_name, customer_id, order_date desc;

