use combinetowtable;

create table PersonEmail(
  id int primary key auto_increment,
  Email varchar(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



insert into PersonEmail values(0,'john@example.com');
insert into PersonEmail values(0,'bao@example.com');
insert into PersonEmail values(0,'li@example.com');
insert into PersonEmail values(0,'wang@example.com');
insert into PersonEmail values(0,'huang@example.com');
insert into PersonEmail values(0,'fei@example.com');
insert into PersonEmail values(0,'lv@example.com');
insert into PersonEmail values(0,'zhang@example.com');
insert into PersonEmail values(0,'zhao@example.com');
insert into PersonEmail values(0,'fei@example.com');
insert into PersonEmail values(0,'fei@example.com');
insert into PersonEmail values(0,'fei@example.com');
insert into PersonEmail values(0,'fei@example.com');
insert into PersonEmail values(0,'fei@example.com');
insert into PersonEmail values(0,'fei@example.com');
insert into PersonEmail values(0,'fei@example.com');
insert into PersonEmail values(0,'fei@example.com');
insert into PersonEmail values(0,'fei@example.com');
insert into PersonEmail values(0,'fei@example.com');

select * from PersonEmail;

delete p1 from PersonEmail p1,
PersonEmail p2 where p1.Email = p2.Email and p1.id > p2.id;





