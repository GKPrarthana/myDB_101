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
SELECT * FROM employees;