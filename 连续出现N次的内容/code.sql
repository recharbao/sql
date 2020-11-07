create table score(
  id int primary key,
  scores int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into score values(0001, 89);
insert into score values(0002, 76);
insert into score values(0003, 76);
insert into score values(0004, 84);
insert into score values(0005, 84);
insert into score values(0006, 84);
insert into score values(0007, 76);
insert into score values(0008, 91);
insert into score values(0009, 88);
insert into score values(00010, 86);

select * from score as a,
score as b;


select * from score as a,
score as b,
score as c
where a.id = b.id - 1
and b.id = c.id - 1
and a.scores = b.scores
and b.scores = c.scores;

select a.scores
from score as a,
score as b,
score as c
where a.id = b.id - 1
and b.id = c.id - 1
and a.scores = b.scores
and b.scores = c.scores;
