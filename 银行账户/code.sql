CREATE TABLE Users(
  user_id INT PRIMARY KEY,
  user_name VARCHAR(100),
  credit INT
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Transactions(
  trans_id INT PRIMARY KEY,
  paid_by INT,
  paid_to INT,
  amount INT,
  transacted_on DATE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

SHOW TABLES;

INSERT INTO Users VALUES(1, 'Moustafa', 100);
INSERT INTO Users VALUES(2, 'Jonathan', 200);
INSERT INTO Users VALUES(3, 'Winston', 10000);
INSERT INTO Users VALUES(4, 'Luis', 800);



INSERT INTO Transactions VALUES(1, 1, 3, 400, '2020-08-01');
INSERT INTO Transactions VALUES(2, 3, 2, 500, '2020-08-02');
INSERT INTO Transactions VALUES(3, 2, 1, 200, '2020-08-03');


SHOW TABLES;

SELECT * FROM Users;

SELECT * FROM Transactions;

SELECT user_id, user_name, IFNULL((a.credit - b.amount), a.credit) AS credit
FROM Users a
LEFT JOIN 
(
  (SELECT paid_by, SUM(amount) AS amount FROM Transactions  GROUP BY paid_by) b
)
ON a.user_id = b.paid_by



SELECT user_id, user_name, IFNULL((a.credit + b.amount), a.credit) AS credit
FROM
(
  SELECT user_id, user_name, IFNULL((a.credit - b.amount), a.credit) AS credit
  FROM Users a
  LEFT JOIN 
  (
    (SELECT paid_by, SUM(amount) AS amount FROM Transactions  GROUP BY paid_by) b
  )
  ON a.user_id = b.paid_by
) a

LEFT JOIN
(
  (SELECT paid_to, SUM(amount) AS amount FROM Transactions  GROUP BY paid_to) b
)
ON a.user_id = b.paid_to


-- 结果
SELECT user_id, user_name, credit, 
CASE WHEN credit < 0 THEN 'Yes'
ELSE 'No'
END AS  credit_limit_breached
FROM (
  SELECT user_id, user_name, IFNULL((a.credit + b.amount), a.credit) AS credit
  FROM
  (
    SELECT user_id, user_name, IFNULL((a.credit - b.amount), a.credit) AS credit
    FROM Users a
    LEFT JOIN 
      (SELECT paid_by, SUM(amount) AS amount FROM Transactions  GROUP BY paid_by) b
    ON a.user_id = b.paid_by
  ) a
  LEFT JOIN
    (SELECT paid_to, SUM(amount) AS amount FROM Transactions  GROUP BY paid_to) b
  ON a.user_id = b.paid_to
) a










