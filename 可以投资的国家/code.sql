CREATE TABLE Person(
  id int primary key,
  name varchar(100),
  phone_number varchar(100) 
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Country(
  name varchar(100),
  country_code varchar(100)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Calls(
  caller_id int,
  callee_id int,
  duration int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Person VALUES(3, 'Jonathan', '051-1234567');
INSERT INTO Person VALUES(12,'Elvis', '051-7654321');
INSERT INTO Person VALUES(1, 'Moncef', '212-1234567');
INSERT INTO Person VALUES(2, 'Maroua', '212-6523657');
INSERT INTO Person VALUES(7, 'Meir', '972-1234567');
INSERT INTO Person VALUES(9, 'Rachel','972-0011100');


INSERT INTO Country VALUES('Peru', '051');
INSERT INTO Country VALUES('Israel', '972');
INSERT INTO Country VALUES('Morocco', '212');
INSERT INTO Country VALUES('Germany', '049');
INSERT INTO Country VALUES('Ethiopia', '251');


INSERT INTO Calls VALUES(1, 9, 33);
INSERT INTO Calls VALUES(2, 9, 4);
INSERT INTO Calls VALUES(1, 2, 59);
INSERT INTO Calls VALUES(3, 12, 102);
INSERT INTO Calls VALUES(3, 12, 330);
INSERT INTO Calls VALUES(12, 3, 5);
INSERT INTO Calls VALUES(7, 9, 13);
INSERT INTO Calls VALUES(7, 1, 3);
INSERT INTO Calls VALUES(9, 7, 1);
INSERT INTO Calls VALUES(1, 7, 7);



SELECT * FROM Person;
SELECT * FROM Country;
SELECT * FROM Calls;



SELECT * FROM Calls, Country, Person;

 SELECT * FROM Calls, Country, Person
     WHERE caller_id = id OR callee_id = id;
     
SELECT * FROM Calls, Country, Person 
WHERE (caller_id = id OR callee_id = id) 
AND LEFT(phone_number, 3) = country_code; 


SELECT * FROM Calls, Country, Person 
WHERE (caller_id = id OR callee_id = id) 
AND LEFT(phone_number, 3) = country_code
GROUP BY country_code;

SELECT * FROM Calls, Country, Person 
WHERE (caller_id = id OR callee_id = id) 
AND LEFT(phone_number, 3) = country_code
GROUP BY country_code
HAVING AVG(duration) > (SELECT AVG(duration) FROM Calls);

-- result

SELECT Country.name country FROM Calls, Country, Person 
WHERE (caller_id = id OR callee_id = id)
AND LEFT(phone_number, 3) = country_code
GROUP BY country_code
HAVING AVG(duration) > (SELECT AVG(duration) FROM Calls);



