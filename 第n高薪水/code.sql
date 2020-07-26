use combineTowTable;

create table Employee(
  Id int primary key auto_increment,
  Salary int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into Employee values(0,100);
insert into Employee values(0,200);
insert into Employee values(0,300);
insert into Employee values(0,400);
insert into Employee values(0,400);
insert into Employee values(0,500);
insert into Employee values(0,600);

select * from Employee;


-- 查找第n高薪水

select distinct Salary from Employee
order by Salary desc limit 1 offset 3;

select Salary from Employee
order by Salary desc limit 1 offset 3;







