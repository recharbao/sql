CREATE TABLE seat(
  id int primary key,
  student varchar(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO seat VALUES(1,'about');
INSERT INTO seat VALUES(2,'Doris');
INSERT INTO seat VALUES(3,'Emerson');
INSERT INTO seat VALUES(4,'Green');
INSERT INTO seat VALUES(5,'Jeames');


show tables;

-- 计算是奇数还是偶数
SELECT COUNT(*) FROM seat;


SELECT
   (CASE
      WHEN MOD(id, 2) != 0 AND id != total THEN id + 1
      WHEN MOD(id, 2) != 0 AND id = total THEN id
      ELSE id - 1
   END) AS id, student
FROM
  seat, (SELECT COUNT(*) AS total FROM seat) AS b;


-- 结果

SELECT
   (CASE
      WHEN MOD(id, 2) != 0 AND id != total THEN id + 1
      WHEN MOD(id, 2) != 0 AND id = total THEN id
      ELSE id - 1
   END) AS id, student
FROM
  seat, (SELECT COUNT(*) AS total FROM seat) AS b
ORDER BY id;



