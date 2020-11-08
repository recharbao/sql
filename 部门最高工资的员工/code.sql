create table Employee(
  Id int primary key,
  Name varchar(100),
  Salary varchar(100),
  DepartmentId varchar(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Department(
  Id int primary key,
  Name varchar(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Employee VALUES(1, 'Joe', 70000, 1);
INSERT INTO Employee VALUES(2, 'Jim', 90000, 1);
INSERT INTO Employee VALUES(3, 'Henry', 80000, 2);
INSERT INTO Employee VALUES(4, 'Sam', 60000, 2);
INSERT INTO Employee VALUES(5, 'Max', 90000, 1);

INSERT INTO Department VALUES(1, 'IT');
INSERT INTO Department VALUES(2, 'Sales');




SELECT * FROM Employee;
SELECT * FROM Department;

SELECT * FROM Employee as a
left join Department as b
on a.DepartmentId = b.Id;

SELECT DepartmentId, max(Salary) FROM Employee
GROUP BY DepartmentId;


-- 结果
SELECT b.Name as Department, a.Name as Employee, a.Salary FROM Employee as a 
JOIN Department as b
ON a.DepartmentId = b.Id
WHERE (a.DepartmentId, a.Salary) IN
(
  SELECT DepartmentId, max(Salary) FROM Employee
  GROUP BY DepartmentId
);


-- 结果
SELECT b.Name as Department, a.Name as Employee, a.Salary FROM Employee as a 
LEFT JOIN Department as b
ON a.DepartmentId = b.Id
WHERE (a.DepartmentId, a.Salary) IN
(
  SELECT DepartmentId, max(Salary) FROM Employee
  GROUP BY DepartmentId
);

