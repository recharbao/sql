mysql> CREATE TABLE Variables(
    -> name VARCHAR(100),
    -> value INT,
    -> PRIMARY KEY(name)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE Expressions(
    -> left_operand VARCAHR(100),
    -> operator ENUM('>', '<', '='),
    -> right_operand VARCHAR(100),
    -> PRIMARY KEY(left_operand, operator, right_operand)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'VARCAHR(100),
operator ENUM('>', '<', '='),
right_operand VARCHAR(100),
PRIMARY ' at line 2
mysql> CREATE TABLE Expressions( left_operand VARCAHR(100), operator ENUM('>', '<', '='), right_operand VARCHAR(100), PRIMARY KEY(left_operand, operator, right_operand) )ENGINE=InnoDB DEFAULT CHARSET=utf8mysql>                                                                                                                                                                                                      mysql> 
mysql> 
mysql> CREATE TABLE Expressions( left_operand VARCAHR(100), operator ENUM('>''<' '='), right_operand VARCHAR(100), PRIMARY KEY(left_operand, operator, right_operand) )ENGINE=InnoDB DEFAULT CHARSET=utf8; 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'VARCAHR(100), operator ENUM('>''<' '='), right_operand VARCHAR(100), PRIMARY KEY' at line 1
mysql> CREATE TABLE Expressions( left_operand VARCAHR(100), operator ENUM('>', '<', '='), right_operand VARCHAR(100), PRIMARY KEY(left_operand, operator, right_operand) )ENGINE=InnoDB DEFAULT CHARSET=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'VARCAHR(100), operator ENUM('>', '<', '='), right_operand VARCHAR(100), PRIMARY ' at line 1
mysql> CREATE TABLE Expressions( left_operand VARCAHR(100), operat ENUM('>', '<', '='), right_operand VARCHAR(100), PRIMARY KEY(left_operand, operator, right_operand) )ENGINE=InnoDB DEFAULT CHARSET=utf8; ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'VARCAHR(100), operat ENUM('>', '<', '='), right_operand VARCHAR(100), PRIMARY KE' at line 1
mysql> CREATE TABLE Expressions( left_operand VARCHAR(100), operator ENUM('>', '<', '='), right_operand VARCHAR(100), PRIMARY KEY(left_operand, operator, right_operand) )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> 
mysql> 
mysql> INSERT INTO Variables VALUES('x', 66);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Variables VALUES('y', 77);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Expressions VALUES('x', '>', 'y');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Expressions VALUES('x', '<', 'y');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Expressions VALUES('x', '=', 'y');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Expressions VALUES('y', '>', 'x');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Expressions VALUES('y', '<', 'x');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Expressions VALUES('y', '=', 'x');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM Variables;
+------+-------+
| name | value |
+------+-------+
| x    |    66 |
| y    |    77 |
+------+-------+
2 rows in set (0.03 sec)

mysql> SELECT * FROM Expressions;
+--------------+----------+---------------+
| left_operand | operator | right_operand |
+--------------+----------+---------------+
| x            | >        | y             |
| x            | <        | y             |
| x            | =        | y             |
| y            | >        | x             |
| y            | <        | x             |
| y            | =        | x             |
+--------------+----------+---------------+
6 rows in set (0.00 sec)

mysql> 
mysql> SELECT * FROM Variables WHERE value = 66;
+------+-------+
| name | value |
+------+-------+
| x    |    66 |
+------+-------+
1 row in set (0.01 sec)

mysql> SELECT * FROM Variables a 
    -> INNER JOIN ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> SELECT * FROM Expressions a
    -> INNER JOIN Variables b
    -> INNER JOIN Variables c
    -> ON a.left_oprand = b.name AND a.right_oprand = c.name;
ERROR 1054 (42S22): Unknown column 'a.left_oprand' in 'on clause'
mysql> SELECT * FROM Expressions a INNER JOIN Variables b INNER JOIN Variables c ON a.left_operand = b.name AND a.right_operand = c.name;
+--------------+----------+---------------+------+-------+------+-------+
| left_operand | operator | right_operand | name | value | name | value |
+--------------+----------+---------------+------+-------+------+-------+
| y            | >        | x             | y    |    77 | x    |    66 |
| y            | <        | x             | y    |    77 | x    |    66 |
| y            | =        | x             | y    |    77 | x    |    66 |
| x            | >        | y             | x    |    66 | y    |    77 |
| x            | <        | y             | x    |    66 | y    |    77 |
| x            | =        | y             | x    |    66 | y    |    77 |
+--------------+----------+---------------+------+-------+------+-------+
6 rows in set (0.01 sec)

mysql> 
mysql> SELECT * FROM Expressions a INNER JOIN Variables b INNER JOIN Variables c ON a.left_operand = b.name AND a.right_operand = c.na                                                  mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> SELECT left_operand, operator, right_operand,
    -> CASE
    -> (
    ->     WHEN b.value = c.value AND operator = '=' THEN true
    ->     WHEN b.value > c.value AND operator = '>' THEN true
    ->     WHEN b.value < c.value AND operator = '<' THEN true
    ->     ELSE false
    -> )AS value
    -> FROM Expressions a 
    -> INNER JOIN Variables b INNER JOIN Variables c 
    -> ON a.left_operand = b.name AND a.right_operand = c.name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHEN b.value = c.value AND operator = '=' THEN true
    WHEN b.value > c.value A' at line 4
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> SELECT left_operand, operator, right_operand,
    -> CASE
    -> (
    ->     WHEN b.value = c.value AND operator = '=' THEN 'true'
    ->     WHEN b.value > c.value AND operator = '>' THEN 'true'
    ->     WHEN b.value < c.value AND operator = '<' THEN 'true'
    ->     ELSE 'false'
    -> )AS value
    -> FROM Expressions a 
    -> INNER JOIN Variables b INNER JOIN Variables c 
    -> ON a.left_operand = b.name AND a.right_operand = c.name;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHEN b.value = c.value AND operator = '=' THEN 'true'
    WHEN b.value > c.value' at line 4
mysql> SELECT left_operand, operator, right_operand,
    -> CASE
    ->     WHEN b.value = c.value AND operator = '=' THEN 'true'
    ->     WHEN b.value > c.value AND operator = '>' THEN 'true'
    ->     WHEN b.value < c.value AND operator = '<' THEN 'true'
    ->     ELSE 'false'
    -> END
    -> AS value
    -> FROM Expressions a 
    -> INNER JOIN Variables b INNER JOIN Variables c 
    -> ON a.left_operand = b.name AND a.right_operand = c.name;
+--------------+----------+---------------+-------+
| left_operand | operator | right_operand | value |
+--------------+----------+---------------+-------+
| y            | >        | x             | true  |
| y            | <        | x             | false |
| y            | =        | x             | false |
| x            | >        | y             | false |
| x            | <        | y             | true  |
| x            | =        | y             | false |
+--------------+----------+---------------+-------+
6 rows in set (0.00 sec)

