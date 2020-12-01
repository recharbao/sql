mysql> mysql> CREATE TABLE Stocks( stock_name VARCHAR(100), operation ENUM('Buy','Sell'), operation_day INT, price INT, PRIMARY KEY (stock_name, operation_day) )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO Stocks VALUES('Leetcode', 'Buy', 1, 1000);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Stocks VALUES('Corona Masks', 'Buy', 2, 10);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Stocks VALUES('Leetcode', 'Sell', 5, 9000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Stocks VALUES('Handbags', 'Buy', 17, 30000);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Stocks VALUES('Corona Masks', 'Sell', 3, 1010);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Stocks VALUES('Corona Masks', 'Buy', 4, 1000); 
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Stocks VALUES('Corona Masks', 'Sell', 5, 500);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Stocks VALUES('Corona Masks', 'Buy', 6, 1000);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Stocks VALUES('Handbags', 'Sell', 29, 7000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Stocks VALUES('Corona Masks', 'Sell', 10, 10000);
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM Stocks;
+--------------+-----------+---------------+-------+
| stock_name   | operation | operation_day | price |
+--------------+-----------+---------------+-------+
| Corona Masks | Buy       |             2 |    10 |
| Corona Masks | Sell      |             3 |  1010 |
| Corona Masks | Buy       |             4 |  1000 |
| Corona Masks | Sell      |             5 |   500 |
| Corona Masks | Buy       |             6 |  1000 |
| Corona Masks | Sell      |            10 | 10000 |
| Handbags     | Buy       |            17 | 30000 |
| Handbags     | Sell      |            29 |  7000 |
| Leetcode     | Buy       |             1 |  1000 |
| Leetcode     | Sell      |             5 |  9000 |
+--------------+-----------+---------------+-------+
10 rows in set (0.01 sec)

mysql> SELECT * FROM Stocks;
+--------------+-----------+---------------+-------+
| stock_name   | operation | operation_day | price |
+--------------+-----------+---------------+-------+
| Corona Masks | Buy       |             2 |    10 |
| Corona Masks | Sell      |             3 |  1010 |
| Corona Masks | Buy       |             4 |  1000 |
| Corona Masks | Sell      |             5 |   500 |
| Corona Masks | Buy       |             6 |  1000 |
| Corona Masks | Sell      |            10 | 10000 |
| Handbags     | Buy       |            17 | 30000 |
| Handbags     | Sell      |            29 |  7000 |
| Leetcode     | Buy       |             1 |  1000 |
| Leetcode     | Sell      |             5 |  9000 |
+--------------+-----------+---------------+-------+
10 rows in set (0.00 sec)

mysql> SELECT stock_name, SUM( if(operation = 'Buy', -price, price) ) AS capital_gain_loss
    -> FROM Stocks
    -> GROUP BY stock_name;
+--------------+-------------------+
| stock_name   | capital_gain_loss |
+--------------+-------------------+
| Corona Masks |              9500 |
| Handbags     |            -23000 |
| Leetcode     |              8000 |
+--------------+-------------------+
3 rows in set (0.00 sec)

mysql> SELECT stock_name, SUM(CASE WHEN operation='Buy' THEN -price WHEN operation='Sell' THEN price END ) AS capital_gain_loss FROM Stocks GROUP BY stock_name;
+--------------+-------------------+
| stock_name   | capital_gain_loss |
+--------------+-------------------+
| Corona Masks |              9500 |
| Handbags     |            -23000 |
| Leetcode     |              8000 |
+--------------+-------------------+
3 rows in set (0.00 sec)

