CREATE TABLE Scores(
  id int primary key,
  score FLOAT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

show tables;

INSERT INTO Scores VALUES(1, 3.50);
INSERT INTO Scores VALUES(2, 3.65);
INSERT INTO Scores VALUES(3, 4.00);
INSERT INTO Scores VALUES(4, 3.85);
INSERT INTO Scores VALUES(5, 4.00);
INSERT INTO Scores VALUES(6, 3.65);



show tables;

SELECT * FROM Scores;

SELECT *,
    rank() OVER (ORDER BY Score DESC) AS 'RANK1',
    dense_rank() OVER (ORDER BY Score DESC) AS 'RANK2',
    row_number() OVER (ORDER BY Score DESC) AS 'RANK3'
FROM Scores;

-- 结果
SELECT Score,
    dense_rank() OVER (ORDER BY Score DESC) AS 'Rank'
FROM Scores;

