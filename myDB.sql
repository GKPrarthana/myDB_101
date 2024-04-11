CREATE DATABASE myDB;
USE myDB;

CREATE TABLE employees(
	employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5,2),
    hire_date DATE
);

RENAME TABLE employees TO workers;
RENAME TABLE workers TO employees;

ALTER TABLE employees
ADD phone_number VARCHAR(15);
SELECT * FROM employees;

ALTER TABLE employees
RENAME COLUMN phone_number TO email;
SELECT * FROM employees;

ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100);
SELECT * FROM employees;

ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100) AFTER last_name;
SELECT * FROM employees;

ALTER TABLE employees
DROP email;
SELECT * FROM employees;

INSERT INTO employees
VALUES	(1,"Eugene","Krabs",25.50,"2024-01-01"),
		(2,"Squidward","Tentacles",15.00,"2024-01-02"),
        (3,"Spongebob","Squarepants",12.50,"2024-01-03"),
        (4,"Patric","Star",12.50,"2024-01-04"),
        (5,"Sandy","Cheeks",17.25,"2024-01-05");
SELECT * FROM employees;

SELECT *
FROM employees
WHERE hourly_pay <= 15 ;

INSERT INTO employees (employee_id, first_name, last_name)
VALUES (6, "Sheldon", "Plankton");
SELECT * FROM employees;

SELECT *
FROM employees
WHERE hire_date IS NULL;

UPDATE employees
SET hourly_pay = 10.25
WHERE employee_id = 6;

UPDATE employees
SET hire_date = "2024-01-06"
WHERE employee_id = 6;
SELECT * FROM employees;

SET AUTOCOMMIT = OFF;
COMMIT;

DELETE FROM employees;
SELECT * FROM employees;

ROLLBACK;
SELECT * FROM employees;
COMMIT;

CREATE TABLE test(
	my_date DATE,
	my_time TIME,
    my_datetime DATETIME
    );
SELECT * FROM test;
INSERT INTO test
VALUES (CURRENT_DATE(),CURRENT_TIME(),NOW());
SELECT * FROM test;
DROP TABLE test;

CREATE TABLE products(
	product_id INT,
    product_name VARCHAR(50) UNIQUE,
    price DECIMAL(4,2)
    );
INSERT INTO products
VALUES 	(100, "hamburger", 3.99),
		(101, "fries", 1.89),
        (102, "soda", 1.00),
        (103, "ice cream", 1.49);
SELECT * FROM products;

DELETE FROM products
WHERE product_id = 1;
SELECT * FROM products;

COMMIT;

INSERT INTO products
VALUES (104, "ice cream", 5.60);
SELECT * FROM products; #commit an error

ALTER TABLE products
MODIFY price DECIMAL(4,2) NOT NULL;
SELECT * FROM products;
INSERT INTO products
VALUES (104, "beer", NULL);
SELECT * FROM products;

ALTER TABLE employees
ADD CONSTRAINT chk_hrly_pay CHECK (hourly_pay <=10);
INSERT INTO employees
VALUES (6, "Sheldon","Cooper",5.20, "2024-01-06");
SELECT * FROM employees;

SELECT * FROM products;

ALTER TABLE products
ALTER price SET DEFAULT 0;
INSERT INTO products(product_id,product_name)
VALUES	(104,"Straw"),
		(104,"Napkin"),
        (104,"Fork"),
        (104,"Spoon");
SELECT * FROM products;

CREATE TABLE transactions(
	transaction_id INT,
    amount DECIMAL(4,2),
    transaction_date DATETIME DEFAULT NOW()
    );
INSERT INTO transactions(transaction_id,amount)
VALUES (3,6.00);
SELECT * FROM transactions;
DROP TABLE transactions;

CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY,
    amount DECIMAL(4,2),
    transaction_date DATETIME DEFAULT NOW()
    );
INSERT INTO transactions(transaction_id,amount)
VALUES 	(1000,4.99),
		(1001,2.89),
        (1002,3.38),
        (1002,5.00);
SELECT * FROM transactions;
DROP TABLE transactions;

CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(4,2),
    transaction_date DATETIME DEFAULT NOW()
    );
INSERT INTO transactions(amount)
VALUES (5.00);
SELECT * FROM transactions;
DELETE FROM transactions;
SELECT * FROM transactions;
ALTER TABLE transactions
AUTO_INCREMENT = 1000;
INSERT INTO transactions(amount)
VALUES (8.88);
SELECT * FROM transactions;

#foreign key
CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
    );
INSERT INTO customers (first_name, last_name)
VALUES 	("Fred","Fish"),
		("Larry","Lobster"),
        ("Bubble","Bath");
SELECT * FROM customers;

DROP TABLE transactions;

CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
SELECT * FROM transactions;
