--CREATE DATABASE flipkart_E_Retail_Database
--USE flipkart_E_Retail_Database
--GO

CREATE TABLE departments(
	department_id INT NOT NULL,
	department_name VARCHAR(45)
	PRIMARY KEY (department_id)
	)
GO

CREATE TABLE categories(
	category_id INT NOT NULL PRIMARY KEY,
	category_department_id INT,
	category_name VARCHAR(50)
	FOREIGN KEY (category_department_id) REFERENCES departments(department_id)
	)
GO

SELECT * FROM categories
GO
-- products table is created but data is not loaded yet
CREATE TABLE products(
	product_id INT NOT NULL PRIMARY KEY,
	product_category_id INT,
	product_name VARCHAR(65),
	product_description VARCHAR(255),
	product_price FLOAT
	FOREIGN KEY (product_category_id) REFERENCES categories(category_id)	
	)
GO	

SELECT * FROM products
GO

CREATE TABLE customers(
	customer_id INT NOT NULL PRIMARY KEY,
	customer_fname VARCHAR(45),
	customer_lname VARCHAR(45),
	customer_email VARCHAR(60),
	customer_street VARCHAR(255),
	customer_city VARCHAR(45),
	customer_state VARCHAR(45),
	customer_zipcode VARCHAR(45)
	)
GO	

SELECT * FROM customers
GO

CREATE TABLE orders(
	order_id INT NOT NULL PRIMARY KEY,
	order_date DATE,
	order_customer_id INT,
	order_status VARCHAR(45)
	FOREIGN KEY (order_customer_id) REFERENCES customers(customer_id)
	)
GO

SELECT * FROM orders
GO

CREATE TABLE order_items(
	order_item_id INT NOT NULL PRIMARY KEY,
	order_item_order_id INT,
	order_item_product_id INT,
	order_item_quantity TINYINT,
	order_item_subtotal FLOAT,
	order_item_product_price FLOAT,
	FOREIGN KEY (order_item_order_id) REFERENCES orders(order_id),
	FOREIGN KEY (order_item_product_id) REFERENCES products(product_id)
	)
GO

SELECT * FROM order_items
GO