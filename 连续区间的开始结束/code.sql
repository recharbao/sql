CREATE TABLE Logs(
  log_id int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Logs VALUES(1);
INSERT INTO Logs VALUES(2);
INSERT INTO Logs VALUES(3);
INSERT INTO Logs VALUES(7);
INSERT INTO Logs VALUES(8);
INSERT INTO Logs VALUES(9);


show tables;

SELECT * FROM Logs;

SELECT 
    log_id a, 
    ROW_NUMBER() OVER ( ORDER BY log_id ASC ) b,
    log_id - ROW_NUMBER() OVER ( ORDER BY log_id ASC ) c
FROM 
    Logs
    
    
    

SELECT 
  MIN(a) START_ID,
  MAX(a) END_ID
FROM 
  (
    SELECT 
      log_id a, 
      ROW_NUMBER() OVER ( ORDER BY log_id ASC ) b,
      log_id - ROW_NUMBER() OVER ( ORDER BY log_id ASC ) c
    FROM 
      Logs
  ) d
GROUP BY
  c
ORDER BY 
  START_ID;

