use combinetowtable;

create table weather(
  Id int primary key auto_increment,
  RrecordDate date,
  Temperature int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into weather values(0,'2015-01-01',10);
insert into weather values(0,'2015-01-02',25);
insert into weather values(0,'2015-01-03',20);
insert into weather values(0,'2015-01-04',30);

select * from weather;

select * from weather as a
cross join weather as b;

select * from weather as a
cross join weather as b
on a.RrecordDate - b.RrecordDate = 1;



select * from weather as a
cross join weather as b
on a.RrecordDate - b.RrecordDate = 1
and a.Temperature > b.Temperature;


select a.Id from weather as a
cross join weather as b
on a.RrecordDate - b.RrecordDate = 1
and a.Temperature > b.Temperature;