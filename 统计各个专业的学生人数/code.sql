mysql> CREATE TABLE student( student_id INT, student_name VARCHAR(100), gender VARCHAR(100), dept_id INT )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.04 sec)

mysql> INSERT INTO student VALUES(1,'Jack', 'M', 1);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO student VALUES(2, 'Jane', 'F', 1);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO student VALUES(3, 'Mark', 'M', 2);
Query OK, 1 row affected (0.01 sec)

mysql> CREATE TABLE department(
    -> dept_name VARCHAR(100),
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> CREATE TABLE department( dept_name INT, dept_name VARCHAR(100))ENGINE=InnoDB DEFAULT CHARSET=utf8;
ERROR 1060 (42S21): Duplicate column name 'dept_name'
mysql> mysql> CREATE TABLE department( dept_ideINT, dept_name VARCHAR(100))ENGoDB DEFAULT CHARSET=utf8;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'INidept_name VARCHAR(100))ENGINE=InnoDB DEFAULT CHARSET=utf8' at line 1
mysql> mysql> CREATE TABLE department(dept_id INT, dept_name VARCHAR(100))ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO department VALUES(1,'Engineering');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO department VALUES(2, 'Science');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO department VALUES(3, 'Law');
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM department;
+---------+-------------+
| dept_id | dept_name   |
+---------+-------------+
|       1 | Engineering |
|       2 | Science     |
|       3 | Law         |
+---------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM student;
+------------+--------------+--------+---------+
| student_id | student_name | gender | dept_id |
+------------+--------------+--------+---------+
|          1 | Jack         | M      |       1 |
|          2 | Jane         | F      |       1 |
|          3 | Mark         | M      |       2 |
+------------+--------------+--------+---------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM department d LEFT JOIN 
    -> student s;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> SELECT * FROM department d LEFT JOIN  student s 
    -> ON d.dept_id = s.dept_id;
+---------+-------------+------------+--------------+--------+---------+
| dept_id | dept_name   | student_id | student_name | gender | dept_id |
+---------+-------------+------------+--------------+--------+---------+
|       1 | Engineering |          1 | Jack         | M      |       1 |
|       1 | Engineering |          2 | Jane         | F      |       1 |
|       2 | Science     |          3 | Mark         | M      |       2 |
|       3 | Law         |       NULL | NULL         | NULL   |    NULL |
+---------+-------------+------------+--------------+--------+---------+
4 rows in set (0.01 sec)

mysql> SELECT * FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id;mysql> SELECT * FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_
mysql> 
mysql> 
mysql> 
mysql> 
mysql> SELECT COUNT(student_id) FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY dept_id;
ERROR 1052 (23000): Column 'dept_id' in group statement is ambiguous
mysql> SELECT d.dept_name,  COUNT(s.student_id) FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_id;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'sqlpr.d.dept_name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT d.dept_name,  COUNT(s.student_id) FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_name;
+-------------+---------------------+
| dept_name   | COUNT(s.student_id) |
+-------------+---------------------+
| Engineering |                   2 |
| Law         |                   0 |
| Science     |                   1 |
+-------------+---------------------+
3 rows in set (0.01 sec)

mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_name; 
+-------------+----------------+
| dept_name   | student_number |
+-------------+----------------+
| Engineering |              2 |
| Law         |              0 |
| Science     |              1 |
+-------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_name;mysql> SELECT d.dept_name,  COUNT(s.student
mysql> 
mysql> 
mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_name ORDER BY d.dept_name;
+-------------+----------------+
| dept_name   | student_number |
+-------------+----------------+
| Engineering |              2 |
| Law         |              0 |
| Science     |              1 |
+-------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_name ORDER BY d.dept_name desc;
+-------------+----------------+
| dept_name   | student_number |
+-------------+----------------+
| Science     |              1 |
| Law         |              0 |
| Engineering |              2 |
+-------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_name ORDER BY d.dept_name;
+-------------+----------------+
| dept_name   | student_number |
+-------------+----------------+
| Engineering |              2 |
| Law         |              0 |
| Science     |              1 |
+-------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_name ORDER BY student_number;
+-------------+----------------+
| dept_name   | student_number |
+-------------+----------------+
| Law         |              0 |
| Science     |              1 |
| Engineering |              2 |
+-------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_name ORDER BY student_number DESC;
+-------------+----------------+
| dept_name   | student_number |
+-------------+----------------+
| Engineering |              2 |
| Science     |              1 |
| Law         |              0 |
+-------------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_id ORDER BY student_number DESC;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'sqlpr.d.dept_name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT d.dept_id,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_id ORDER BY student_number DESC;
+---------+----------------+
| dept_id | student_number |
+---------+----------------+
|       1 |              2 |
|       2 |              1 |
|       3 |              0 |
+---------+----------------+
3 rows in set (0.00 sec)

mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_id 
    -> GROUP BY student_number DESC, dept_name ASC;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'GROUP BY student_number DESC, dept_name ASC' at line 2
mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_id  ORDER BY student_number DESC, dept_name ASC;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'sqlpr.d.dept_name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT d.dept_name,  COUNT(s.student_id) AS student_number FROM department d LEFT JOIN  student s  ON d.dept_id = s.dept_id GROUP BY d.dept_name  ORDER BY student_number DESC, dept_name ASC;
+-------------+----------------+
| dept_name   | student_number |
+-------------+----------------+
| Engineering |              2 |
| Science     |              1 |
| Law         |              0 |
+-------------+----------------+
3 rows in set (0.00 sec)

