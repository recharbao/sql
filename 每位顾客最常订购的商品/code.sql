
CREATE TABLE Customers(
    customer_id INT,
    name VARCHAR(100),
    PRIMARY KEY(customer_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Orders(
    order_id INT,
    order_date DATE,
    customer_id INT,
    product_id INT,
    PRIMARY KEY(order_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Products(
    product_id INT,
    product_name VARCHAR(100),
    price INT,
    PRIMARY KEY(product_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO Customers VALUES(1, 'Alice');
INSERT INTO Customers VALUES(2, 'Bob');
INSERT INTO Customers VALUES(3, 'Tom');
INSERT INTO Customers VALUES(4, 'Jerry');
INSERT INTO Customers VALUES(5, 'John');

INSERT INTO Orders VALUES(1, '2020-07-31', 1, 1);
INSERT INTO Orders VALUES(2, '2020-07-30', 2, 2);
INSERT INTO Orders VALUES(3, '2020-08-29', 3, 3);
INSERT INTO Orders VALUES(4, '2020-07-29', 4, 1);
INSERT INTO Orders VALUES(5, '2020-06-10', 1, 2);
INSERT INTO Orders VALUES(6, '2020-08-01', 2, 1);
INSERT INTO Orders VALUES(7, '2020-08-01', 3, 3);
INSERT INTO Orders VALUES(8, '2020-08-03', 1, 2);
INSERT INTO Orders VALUES(9, '2020-08-07', 2, 3);
INSERT INTO Orders VALUES(10,'2020-07-15', 1, 2);

INSERT INTO Products VALUES(1, 'keyboard', 120);
INSERT INTO Products VALUES(2, 'mouse', 80);
INSERT INTO Products VALUES(3, 'screen', 600);
INSERT INTO Products VALUES(4, 'hard disk', 450);

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Products;


select customer_id, product_id,count(*) as cnt
from Orders
group by customer_id, product_id;


select customer_id, product_id,rank()over(partition by customer_id order by cnt desc) as rk
from
(
    select customer_id, product_id,count(*) as cnt
    from Orders
    group by customer_id, product_id
)a


select a.customer_id, a.product_id, b.product_name
from 
(
    select customer_id, product_id,rank()over(partition by customer_id order by cnt desc) as rk
    from
    (
        select customer_id, product_id,count(*) as cnt
        from Orders
        group by customer_id, product_id
    )a
)a
join Products b
on a.product_id = b.product_id
where a.rk = 1
order by customer_id, product_id
