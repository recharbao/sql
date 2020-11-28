mysql> CREATE TABLE Product(
    -> product_key INT PRIMARY KEY
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.02 sec)


mysql> CREATE TABLE Customer( customer_id INT, product_key INT, CONSTRAINT fk_emp_Product FOREIGN KEY(product_key) REFERENCES Product(product_key) )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.04 sec)



mysql> INSERT INTO Product VALUES(5);
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Product VALUES(6);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Customer VALUES(1, 5);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Customer VALUES(2, 6);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Customer VALUES(3, 5);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Customer VALUES(3, 6);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Customer VALUES(1, 6);
Query OK, 1 row affected (0.03 sec)


mysql> SELECT COUNT(DISTINCT product_key) FROM Customer GROUP BY customer_id;

mysql> SELECT customer, COUNT(DISTINCT product_key) FROM Customer GROUP BY customer_id;


-- 结果

mysql> SELECT customer_id FROM Customer GROUP BY customer_id  HAVING COUNT(DISTINCT product_key)
    -> = (SELECT COUNT(DISTINCT product_key) FROM Product);




