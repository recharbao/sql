mysql> CREATE TABLE Enrollments(
    ->   student_id INT,
    ->   course_id INT,
    ->   grade INT,
    ->   PRIMARY KEY(student_id, course_id)
    -> )ENGINE=InnoDB DEFAULT CHARSET=utf8;
Query OK, 0 rows affected (0.02 sec)


SELECT student_id, min(course_id), grade 
FROM Enrollments 
WHERE (student_id, grade) 
IN (
	SELECT student_id, max(grade) FROM Enrollments GROUP BY student_id

   ) 
GROUP BY student_id, grade;
