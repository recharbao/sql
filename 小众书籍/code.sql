use combinetowtable;

-- drop table Books;
-- drop table Orders;

create table Books(
  book_id int primary key,
  name varchar(100),
  available_from date
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Orders(
  order_id int primary key,
  book_id int,
  quantity int,
  dispatch_date date,
  constraint FK_Orders foreign key(book_id) references Books(book_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into Books values(1,'kalila','2010-01-01');
insert into Books values(2,'26-letters','2012-05-12');
insert into Books values(3,'Hobbit','2019-06-10');
insert into Books values(4,'reasons why','2019-06-01');
insert into Books values(5,'hunger game','2008-09-21');


insert into Orders values(1,1,2,'2018-07-26');
insert into Orders values(2,1,1,'2018-11-05');
insert into Orders values(3,3,8,'2018-06-11');
insert into Orders values(4,4,6,'2018-06-20');
insert into Orders values(5,4,5,'2018-06-05');
insert into Orders values(6,5,9,'2018-02-02');
insert into Orders values(7,5,8,'2018-04-13');


select * from Books;
select * from Orders;

select * from Books as b left join Orders as o
on b.book_id = o.book_id;

select * from Books as b 
left join Orders as o
on b.book_id = o.book_id
group by b.book_id;

select * from Books as b 
left join Orders as o
on b.book_id = o.book_id
group by b.book_id
having ifnull(sum(quantity),0) > 10;




select b.book_id, name
from books b left join orders o
on b.book_id = o.book_id and dispatch_date >= '2018-06-23'
where available_from < '2019-05-23'
group by b.book_id
having ifnull(sum(quantity),0) < 10;




