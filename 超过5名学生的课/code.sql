
use combinetowtable;

create table courses(
  student varchar(100) primary key,
  class varchar(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into courses values('A','Math');
insert into courses values('B','English');
insert into courses values('M','Computer');
insert into courses values('C','Math');
insert into courses values('D','Biology');
insert into courses values('N','Computer');
insert into courses values('E','Math');
insert into courses values('F','Computer');
insert into courses values('G','Math');
insert into courses values('H','Math');
insert into courses values('I','Computer');
insert into courses values('J','Math');
insert into courses values('K','Computer');
insert into courses values('L','Math');
insert into courses values('O','Computer');

select * from courses;

select * from courses GROUP BY class;

select class, count(student)
from courses
GROUP BY class;

select class, count(student) as num
from courses
GROUP BY class;



select class 
from(
  select class, count(distinct student) as num
  from courses
  GROUP BY class
  )as a                        -- 派生表必须有别名
where num > 5;



