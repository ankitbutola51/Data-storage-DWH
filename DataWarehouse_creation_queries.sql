--CREATE DATABASE CA_Online_Retail_DataWarehouse
--GO

USE CA_Online_Retail_DataWarehouse
Go

CREATE TABLE Calendar_Dim
(
	calendar_key INT NOT NULL IDENTITY,
	full_date DATE,
	day_of_week CHAR(15),
	day_type CHAR(20),
	day_of_month INT,
	month	CHAR(10),
	quarter CHAR(2),
	year INT,
	PRIMARY KEY (calendar_key)
	)
GO
 SELECT * FROM Calendar_Dim


CREATE TABLE Customer_Dim
(
	customer_key INT NOT NUll IDENTITY,
	customer_id INT,
	customer_fname VARCHAR(45),
	customer_lname VARCHAR(45),
	customer_email VARCHAR(60),
	customer_street VARCHAR(255),
	customer_city VARCHAR(45),
	customer_state VARCHAR(45),
	customer_zipcode VARCHAR(45)
	PRIMARY KEY (customer_key)
	)
GO

SELECT * FROM Customer_Dim
GO

CREATE TABLE Product_Dim
	(
	product_key INT NOT NULL IDENTITY,
	product_id INT,
	product_name VARCHAR(45),
	product_price FLOAT,
	category_name VARCHAR(45),
	department_name VARCHAR(45)
	PRIMARY KEY (product_key))
GO

SELECT * FROM Product_Dim
GO

CREATE TABLE Order_Dim
(
order_key INT NOT NULL IDENTITY,
order_id INT,
order_status VARCHAR(45)
PRIMARY KEY (order_key)
)
GO	
SELECT * FROM Order_Dim
GO

CREATE TABLE Online_Retail_Fact1
(
	product_key INT,
	order_key INT,
	calendar_key INT,
	customer_key INT,
	order_item_quantity INT,
	order_item_subtotal FLOAT
	FOREIGN KEY (calendar_key) REFERENCES Calendar_Dim(calendar_key),
	FOREIGN KEY (order_key) REFERENCES Order_Dim (order_key),
	FOREIGN KEY (product_key) REFERENCES Product_Dim (product_key),
	FOREIGN KEY (customer_key) REFERENCES Customer_Dim(customer_key)
    )
GO
SELECT * FROM Online_Retail_Fact1
GO
--delete from Online_Retail_Fact1
-------------------------------------



----CREATE TABLE T1
----(    C1 INT IDENTITY(1,1)    NOT NULL
--,    C2 VARCHAR(30)                NULL
--)
--WITH
--(   DISTRIBUTION = HASH(C2)
--,   CLUSTERED COLUMNSTORE INDEX
--)
--;

----INSERT INTO dbo.T1
----VALUES (NULL);

----INSERT INTO dbo.T1
----VALUES (NULL);

--SELECT *
--FROM dbo.T1;

--DBCC PDW_SHOWSPACEUSED('dbo.T1');