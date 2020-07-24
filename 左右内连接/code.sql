
drop database combineTowTable;
CREATE DATABASE combineTowTable default character set utf8 collate utf8_bin;
use combineTowTable;
create table Person (
  PersonId int primary key,
  FirstName varchar(100),
  LastName varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Address(
  AddressId int primary key,
  PersonId int,
  City varchar(100),
  State varchar(100)
  -- constraint FK_Address_PersonId foreign key(PersonId) references Person(PersonId)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into Person values(1,'Wang','yankun');
insert into Person values(2,'Li','xuan');
insert into Person values(3,'bai','xin');
insert into Person values(4,'Bao','runchao');
insert into Person values(5,'Li','qi');
insert into Person values(6,'Ma','yun');

select * from Person;

insert into Address values(3,6,'北京市','北京');
insert into Address values(4,5,'上海市','上海');
insert into Address values(5,4,'济南市','济南');
insert into Address values(6,3,'青岛市','青岛');
insert into Address values(7,12,'莱芜市','莱芜');
insert into Address values(8,13,'泰安市','泰安');

select * from Address;

-- 想查找所有Person地址信息

select Firstname, LastName, City, state from Person left join 
Address on Person.PersonId = Address.PersonId;

-- 只有上面的查询才是正确的结果

select Firstname, LastName, City, state from Person inner join 
Address on Person.PersonId = Address.PersonId;

select Firstname, LastName, City, state from Person right join 
Address on Person.PersonId = Address.PersonId;