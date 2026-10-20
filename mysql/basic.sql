/*
===============================================================================
MYSQL COMPLETE TEACHING COURSE — VERY BASIC TO ADVANCED
===============================================================================
Audience: Absolute beginners, classroom teaching, self-study, interview prep
Version: MySQL 8.0+
File: mysql_complete_teaching_course.sql

HOW TO USE:
1. Open this file in MySQL Workbench.
2. Read each lesson's comments before executing its queries.
3. Run lessons in order.
4. Try the exercises before checking the solutions at the end.
5. This course creates and uses a separate database named mysql_teaching_course.

SAFETY:
- The cleanup section drops only the course tables in this course database.
- Do not use this file with a production database.
===============================================================================
*/

-- ============================================================================
-- MODULE 0: GETTING STARTED
-- ============================================================================
-- What is a database?
-- A database is an organized collection of data.
--
-- What is SQL?
-- SQL means Structured Query Language. It is used to create, read, update,
-- and delete data in relational databases.
--
-- MySQL is a relational database management system (RDBMS).
--
-- SQL command families:
-- DDL: CREATE, ALTER, DROP, TRUNCATE
-- DML: INSERT, UPDATE, DELETE
-- DQL: SELECT
-- DCL: GRANT, REVOKE
-- TCL: START TRANSACTION, COMMIT, ROLLBACK
--
-- A SQL statement normally ends with a semicolon (;).

SELECT VERSION() AS mysql_version;
SELECT CURRENT_DATE() AS today;
SELECT CURRENT_USER() AS connected_user;

-- SQL comments:
-- This is a one-line comment.
# This is also a one-line comment.
/* This is a
   multi-line comment. */

-- ============================================================================
-- MODULE 1: CREATE A PRACTICE DATABASE
-- ============================================================================
CREATE DATABASE IF NOT EXISTS mysql_teaching_course;
SHOW DATABASES;
USE mysql_teaching_course;
SELECT DATABASE() AS current_database;

-- Remove old practice tables so the course can be rerun.
-- These commands affect only the course tables in this database.
SET FOREIGN_KEY_CHECKS = 0;
DROP VIEW IF EXISTS v_employee_department;
DROP VIEW IF EXISTS v_product_category;
DROP PROCEDURE IF EXISTS GetEmployeesByDepartment;
DROP PROCEDURE IF EXISTS GetProductsByMinPrice;
DROP FUNCTION IF EXISTS CalculateLineTotal;
DROP TABLE IF EXISTS audit_log;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================================
-- MODULE 2: DATABASE AND TABLE BASICS
-- ============================================================================
-- Common data types:
-- INT: whole numbers
-- DECIMAL(10,2): exact decimal values, useful for money
-- VARCHAR(n): variable-length text
-- TEXT: longer text
-- DATE: date only
-- DATETIME: date and time
-- TIMESTAMP: timestamp value
-- BOOLEAN: true/false style value (stored as 1/0 in MySQL)
--
-- Common constraints:
-- PRIMARY KEY: uniquely identifies each row
-- AUTO_INCREMENT: generates a number automatically
-- NOT NULL: value is required
-- UNIQUE: prevents duplicate values
-- DEFAULT: supplies a default value
-- CHECK: validates a condition
-- FOREIGN KEY: links rows between tables

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(80) DEFAULT 'Unknown',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(120) NOT NULL,
    category_id INT,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    order_status ENUM('Pending','Paid','Shipped','Cancelled') DEFAULT 'Pending',
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    CONSTRAINT fk_items_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_items_product FOREIGN KEY (product_id) REFERENCES products(product_id),
    UNIQUE (order_id, product_id)
);

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0,
    department_id INT,
    manager_id INT NULL,
    hire_date DATE,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id),
    CONSTRAINT fk_employee_manager
        FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(120) NOT NULL,
    course_fee DECIMAL(10,2) NOT NULL DEFAULT 0,
    duration_weeks INT NOT NULL DEFAULT 1
);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    city VARCHAR(80),
    course_id INT,
    marks DECIMAL(5,2),
    enrolled_on DATE,
    CONSTRAINT fk_student_course
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE audit_log (
    log_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    action_name VARCHAR(50) NOT NULL,
    table_name VARCHAR(64) NOT NULL,
    record_id BIGINT,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inspect structure and tables.
SHOW TABLES;
DESCRIBE customers;
SHOW CREATE TABLE products;

-- ============================================================================
-- MODULE 3: INSERT DATA
-- ============================================================================
-- INSERT adds new rows.
-- Always specify column names for clarity.

INSERT INTO customers (full_name, email, phone, city) VALUES
('Aarav Sharma', 'aarav@example.com', '9000000001', 'Delhi'),
('Priya Verma', 'priya@example.com', '9000000002', 'Noida'),
('Kabir Singh', 'kabir@example.com', '9000000003', 'Gurugram'),
('Meera Gupta', 'meera@example.com', '9000000004', 'Delhi'),
('Rohan Das', 'rohan@example.com', '9000000005', 'Jaipur'),
('Simran Joshi', 'simran@example.com', '9000000006', 'Faridabad'),
('Ishaan Roy', 'ishaan@example.com', '9000000007', 'Noida');

INSERT INTO categories (category_name) VALUES
('Electronics'), ('Books'), ('Office'), ('Furniture');

INSERT INTO products (product_name, category_id, price, stock, is_active) VALUES
('Keyboard', 1, 1200.00, 25, TRUE),
('Mouse', 1, 650.00, 40, TRUE),
('SQL Fundamentals Book', 2, 499.00, 100, TRUE),
('Desk Organizer', 3, 350.00, 15, TRUE),
('Monitor', 1, 8500.00, 8, TRUE),
('Office Chair', 4, 6500.00, 12, TRUE),
('Old Printer', 1, 4000.00, 0, FALSE),
('Notebook', 2, 80.00, 200, TRUE);

INSERT INTO departments (department_name) VALUES
('IT'), ('HR'), ('Sales'), ('Finance'), ('Support');

INSERT INTO employees
(employee_name, email, salary, department_id, manager_id, hire_date) VALUES
('Neha Kapoor', 'neha@example.com', 75000, 1, NULL, '2021-04-12'),
('Arjun Mehta', 'arjun@example.com', 60000, 1, 1, '2022-06-01'),
('Sara Khan', 'sara@example.com', 52000, 2, NULL, '2020-09-15'),
('Dev Patel', 'dev@example.com', 48000, 3, NULL, '2023-01-10'),
('Isha Roy', 'isha@example.com', 68000, 3, 4, '2021-11-20'),
('Manav Jain', 'manav@example.com', 82000, 4, NULL, '2019-02-05'),
('Tara Bose', 'tara@example.com', 42000, 5, NULL, '2024-07-08');

INSERT INTO courses (course_name, course_fee, duration_weeks) VALUES
('MySQL Basics', 0, 2),
('SQL Querying', 999, 4),
('Database Design', 1499, 5),
('Advanced SQL', 1999, 6);

INSERT INTO students (student_name, email, city, course_id, marks) VALUES
('Anaya', 'anaya.student@example.com', 'Delhi', 1, 88, '2026-01-10'),
('Vivaan', 'vivaan.student@example.com', 'Noida', 2, 76, '2026-01-11'),
('Diya', 'diya.student@example.com', 'Delhi', 2, 92, '2026-01-12'),
('Advik', 'advik.student@example.com', 'Jaipur', 3, 67, '2026-01-13'),
('Myra', 'myra.student@example.com', 'Gurugram', 4, 95, '2026-01-14'),
('Reyansh', 'reyansh.student@example.com', 'Delhi', 1, 58, '2026-01-15');

INSERT INTO orders (customer_id, order_date, order_status) VALUES
(1, '2026-01-10 10:00:00', 'Paid'),
(2, '2026-01-12 14:30:00', 'Shipped'),
(1, '2026-02-02 09:15:00', 'Pending'),
(4, '2026-02-05 16:45:00', 'Cancelled'),
(3, '2026-03-01 11:20:00', 'Paid'),
(5, '2026-03-10 12:00:00', 'Pending');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 2, 650.00),
(2, 3, 1, 499.00),
(3, 4, 3, 350.00),
(5, 1, 2, 1200.00),
(6, 6, 1, 6500.00);

-- ============================================================================
-- MODULE 4: SELECT — READ DATA
-- ============================================================================
-- SELECT * returns all columns. Prefer specific columns in real applications.
SELECT * FROM customers;
SELECT full_name, city FROM customers;
SELECT full_name AS customer_name, city AS home_city FROM customers;

-- DISTINCT removes duplicate result values.
SELECT DISTINCT city FROM customers;

-- Calculations can be performed in SELECT.
SELECT product_name, price, price * 2 AS double_price FROM products;
SELECT product_name, price, stock, price * stock AS stock_value FROM products;

-- ============================================================================
-- MODULE 5: WHERE — FILTER ROWS
-- ============================================================================
SELECT * FROM customers WHERE city = 'Delhi';
SELECT * FROM products WHERE price > 500;
SELECT * FROM products WHERE price >= 500 AND stock > 0;
SELECT * FROM customers WHERE city = 'Delhi' OR city = 'Noida';
SELECT * FROM products WHERE NOT is_active;
SELECT * FROM products WHERE price BETWEEN 500 AND 1500;
SELECT * FROM customers WHERE city IN ('Delhi', 'Noida');
SELECT * FROM customers WHERE city NOT IN ('Delhi', 'Noida');
SELECT * FROM customers WHERE full_name LIKE 'A%';  -- starts with A
SELECT * FROM customers WHERE full_name LIKE '%a';  -- ends with a
SELECT * FROM customers WHERE full_name LIKE '%ar%'; -- contains ar
SELECT * FROM employees WHERE manager_id IS NULL;
SELECT * FROM employees WHERE manager_id IS NOT NULL;

-- Remember: use IS NULL, not = NULL.

-- ============================================================================
-- MODULE 6: ORDER BY AND LIMIT
-- ============================================================================
SELECT * FROM products ORDER BY price ASC;
SELECT * FROM products ORDER BY price DESC;
SELECT * FROM employees ORDER BY department_id ASC, salary DESC;
SELECT * FROM customers ORDER BY full_name LIMIT 3;
SELECT * FROM products ORDER BY product_id LIMIT 3 OFFSET 3;

-- ============================================================================
-- MODULE 7: UPDATE, DELETE, ALTER, TRUNCATE, DROP
-- ============================================================================
-- UPDATE changes existing rows. Always test the WHERE clause with SELECT first.
SELECT * FROM products WHERE product_name = 'Mouse';
UPDATE products SET price = 675.00 WHERE product_name = 'Mouse';

-- Update multiple columns.
UPDATE products SET price = 90.00, stock = 180 WHERE product_name = 'Notebook';

-- DELETE removes matching rows. Example is intentionally commented out.
-- SELECT * FROM customers WHERE email = 'simran@example.com';
-- DELETE FROM customers WHERE email = 'simran@example.com';

-- ALTER TABLE changes a table structure.
ALTER TABLE customers ADD COLUMN notes VARCHAR(255) NULL;
ALTER TABLE customers MODIFY COLUMN notes VARCHAR(500) NULL;
ALTER TABLE customers DROP COLUMN notes;

-- TRUNCATE removes all rows from a table. Do not run casually.
-- TRUNCATE TABLE some_table;

-- DROP removes a table or database. Do not run casually.
-- DROP TABLE some_table;
-- DROP DATABASE some_database;

-- ============================================================================
-- MODULE 8: OPERATORS AND LOGICAL CONDITIONS
-- ============================================================================
SELECT * FROM products WHERE price <> 499;
SELECT * FROM employees WHERE salary >= 50000;
SELECT * FROM employees WHERE salary >= 50000 AND department_id = 1;
SELECT * FROM employees WHERE department_id = 2 OR department_id = 3;
SELECT * FROM products WHERE (price > 500 AND stock > 0) OR product_name = 'Notebook';

-- ============================================================================
-- MODULE 9: BUILT-IN FUNCTIONS
-- ============================================================================
-- Text functions
SELECT full_name, UPPER(full_name), LOWER(full_name) FROM customers;
SELECT full_name, CHAR_LENGTH(full_name) AS name_length FROM customers;
SELECT CONCAT(full_name, ' lives in ', city) AS customer_info FROM customers;
SELECT TRIM('   MySQL Course   ') AS trimmed_text;
SELECT SUBSTRING('DATABASE', 1, 4) AS first_four_letters;
SELECT REPLACE('Learn SQL', 'SQL', 'MySQL') AS replaced_text;

-- Numeric functions
SELECT ROUND(123.4567, 2) AS rounded_value;
SELECT CEIL(12.1) AS ceiling_value, FLOOR(12.9) AS floor_value;
SELECT ABS(-25) AS absolute_value, MOD(10, 3) AS remainder;

-- NULL handling
SELECT full_name, COALESCE(city, 'Not provided') AS city_name FROM customers;
SELECT NULLIF(10, 10) AS null_if_equal;

-- CASE expression
SELECT product_name, stock,
       CASE
           WHEN stock = 0 THEN 'Out of stock'
           WHEN stock < 20 THEN 'Low stock'
           ELSE 'In stock'
       END AS stock_status
FROM products;

-- Date/time functions
SELECT CURRENT_DATE() AS today, NOW() AS current_datetime;
SELECT order_id, DATE(order_date) AS order_day,
       YEAR(order_date) AS order_year,
       MONTH(order_date) AS order_month
FROM orders;
SELECT DATE_ADD('2026-01-01', INTERVAL 7 DAY) AS one_week_later;
SELECT DATEDIFF('2026-02-01', '2026-01-01') AS days_between;

-- ============================================================================
-- MODULE 10: AGGREGATE FUNCTIONS, GROUP BY, HAVING
-- ============================================================================
-- COUNT counts rows, SUM totals values, AVG calculates averages, MIN/MAX extremes.
SELECT COUNT(*) AS total_customers FROM customers;
SELECT SUM(stock) AS total_stock FROM products;
SELECT AVG(price) AS average_price FROM products;
SELECT MIN(salary) AS lowest_salary, MAX(salary) AS highest_salary FROM employees;

-- GROUP BY creates one result row per group.
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city;

SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

-- HAVING filters groups after aggregation; WHERE filters rows before grouping.
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
HAVING COUNT(*) >= 2;

-- Count employees by department, including department names.
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- ============================================================================
-- MODULE 11: JOINS
-- ============================================================================
-- INNER JOIN: only matching rows.
SELECT o.order_id, c.full_name, o.order_date, o.order_status
FROM orders o
INNER JOIN customers c ON c.customer_id = o.customer_id;

-- LEFT JOIN: every row from the left table, even without a match.
SELECT c.full_name, o.order_id
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
ORDER BY c.full_name;

-- RIGHT JOIN: every row from the right table.
SELECT p.product_name, c.category_name
FROM products p
RIGHT JOIN categories c ON c.category_id = p.category_id;

-- Multiple joins: order details and line totals.
SELECT o.order_id, c.full_name, p.product_name,
       oi.quantity, oi.unit_price,
       oi.quantity * oi.unit_price AS line_total
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
ORDER BY o.order_id;

-- Self join: employees and their managers.
SELECT e.employee_name AS employee, m.employee_name AS manager
FROM employees e
LEFT JOIN employees m ON m.employee_id = e.manager_id;

-- Cross join: all possible combinations. Use carefully.
SELECT c.category_name, d.department_name
FROM categories c CROSS JOIN departments d
LIMIT 10;

-- ============================================================================
-- MODULE 12: SUBQUERIES
-- ============================================================================
-- Products priced above the average price.
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- Employees earning more than the average salary.
SELECT employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Customers who have at least one order.
SELECT full_name
FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- Customers who have never ordered.
SELECT full_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- ============================================================================
-- MODULE 13: SET OPERATIONS
-- ============================================================================
-- UNION combines results and removes duplicates.
SELECT city AS location FROM customers
UNION
SELECT city AS location FROM students;

-- UNION ALL keeps duplicates.
SELECT city AS location FROM customers
UNION ALL
SELECT city AS location FROM students;

-- MySQL does not provide a direct INTERSECT/EXCEPT operator in all versions.
-- Use joins or EXISTS patterns for intersections and differences when needed.

-- ============================================================================
-- MODULE 14: COMMON TABLE EXPRESSIONS (CTEs)
-- ============================================================================
-- A CTE is a named temporary result used by the query that follows it.
WITH customer_order_counts AS (
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT c.full_name, COALESCE(x.order_count, 0) AS order_count
FROM customers c
LEFT JOIN customer_order_counts x ON x.customer_id = c.customer_id;

-- Recursive CTE: build an employee hierarchy from top-level managers.
WITH RECURSIVE employee_hierarchy AS (
    SELECT employee_id, employee_name, manager_id, 0 AS hierarchy_level
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, h.hierarchy_level + 1
    FROM employees e
    JOIN employee_hierarchy h ON e.manager_id = h.employee_id
)
SELECT * FROM employee_hierarchy
ORDER BY hierarchy_level, employee_name;

-- ============================================================================
-- MODULE 15: WINDOW FUNCTIONS
-- ============================================================================
-- Unlike GROUP BY, window functions keep each row and add calculated values.
SELECT employee_name, department_id, salary,
       ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num,
       RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank,
       DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rank_value
FROM employees;

-- Running total of order line values by order.
SELECT o.order_id, oi.order_item_id, oi.quantity * oi.unit_price AS line_total,
       SUM(oi.quantity * oi.unit_price) OVER (
           PARTITION BY o.order_id ORDER BY oi.order_item_id
       ) AS running_order_total
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id;

-- LAG reads a previous row; LEAD reads a following row.
SELECT order_id, order_date,
       LAG(order_date) OVER (ORDER BY order_date) AS previous_order_date,
       LEAD(order_date) OVER (ORDER BY order_date) AS next_order_date
FROM orders;

-- ============================================================================
-- MODULE 16: VIEWS
-- ============================================================================
-- A view stores a query definition and behaves like a virtual table.
CREATE OR REPLACE VIEW v_product_category AS
SELECT p.product_id, p.product_name, c.category_name, p.price, p.stock
FROM products p
LEFT JOIN categories c ON c.category_id = p.category_id;

SELECT * FROM v_product_category;

CREATE OR REPLACE VIEW v_employee_department AS
SELECT e.employee_id, e.employee_name, e.salary, d.department_name
FROM employees e
LEFT JOIN departments d ON d.department_id = e.department_id;

SELECT * FROM v_employee_department;

-- ============================================================================
-- MODULE 17: INDEXES AND QUERY PERFORMANCE
-- ============================================================================
-- Indexes can speed up lookups but use disk space and add write overhead.
CREATE INDEX idx_products_product_name ON products(product_name);
CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date);

-- EXPLAIN shows the optimizer's query plan.
EXPLAIN SELECT * FROM orders WHERE customer_id = 1 ORDER BY order_date DESC;

-- Composite index order matters: (customer_id, order_date) is most useful when
-- the query filters by customer_id, optionally then sorts/filters by order_date.

-- ============================================================================
-- MODULE 18: TRANSACTIONS
-- ============================================================================
-- A transaction groups operations. COMMIT saves; ROLLBACK cancels.
-- This example intentionally rolls back its stock change.
START TRANSACTION;
UPDATE products SET stock = stock - 1
WHERE product_id = 1 AND stock > 0;
SELECT product_id, product_name, stock FROM products WHERE product_id = 1;
ROLLBACK;

-- Example transaction pattern (kept commented so it doesn't change data):
-- START TRANSACTION;
-- UPDATE products SET stock = stock - 1 WHERE product_id = 1 AND stock > 0;
-- INSERT INTO audit_log (action_name, table_name, record_id)
-- VALUES ('SALE', 'products', 1);
-- COMMIT;

-- ============================================================================
-- MODULE 19: STORED PROCEDURES
-- ============================================================================
DELIMITER //
CREATE PROCEDURE GetProductsByMinPrice(IN min_price DECIMAL(10,2))
BEGIN
    SELECT product_id, product_name, price, stock
    FROM products
    WHERE price >= min_price
    ORDER BY price;
END //

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT employee_id, employee_name, salary
    FROM employees
    WHERE department_id = dept_id
    ORDER BY salary DESC;
END //
DELIMITER ;

CALL GetProductsByMinPrice(500);
CALL GetEmployeesByDepartment(1);

-- ============================================================================
-- MODULE 20: STORED FUNCTIONS
-- ============================================================================
DELIMITER //
CREATE FUNCTION CalculateLineTotal(qty INT, unit_price DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
NO SQL
BEGIN
    RETURN qty * unit_price;
END //
DELIMITER ;

SELECT CalculateLineTotal(3, 199.99) AS line_total;

-- ============================================================================
-- MODULE 21: TRIGGERS AND AUDIT LOGGING
-- ============================================================================
DELIMITER //
CREATE TRIGGER trg_products_after_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    IF NOT (OLD.price <=> NEW.price) OR NOT (OLD.stock <=> NEW.stock) THEN
        INSERT INTO audit_log (action_name, table_name, record_id)
        VALUES ('UPDATE', 'products', NEW.product_id);
    END IF;
END //
DELIMITER ;

-- This update fires the trigger and adds an audit record.
UPDATE products SET stock = stock + 1 WHERE product_id = 1;
SELECT * FROM audit_log;

-- ============================================================================
-- MODULE 22: ADVANCED QUERY PATTERNS
-- ============================================================================
-- Conditional aggregation.
SELECT c.full_name,
       SUM(CASE WHEN o.order_status = 'Paid' THEN 1 ELSE 0 END) AS paid_orders,
       SUM(CASE WHEN o.order_status = 'Pending' THEN 1 ELSE 0 END) AS pending_orders
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name;

-- Products never ordered (anti-join).
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_items oi ON oi.product_id = p.product_id
WHERE oi.product_id IS NULL;

-- Top 3 highest-paid employees per department.
WITH ranked_employees AS (
    SELECT employee_name, department_id, salary,
           ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn
    FROM employees
)
SELECT * FROM ranked_employees WHERE rn <= 3;

-- Monthly sales totals (only months represented in the sample orders).
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
       SUM(oi.quantity * oi.unit_price) AS gross_order_value
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.order_status IN ('Paid', 'Shipped')
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month;

-- ============================================================================
-- MODULE 23: NORMALIZATION AND DATABASE DESIGN — STUDY NOTES
-- ============================================================================
-- 1NF: store one value per cell; avoid repeating groups.
-- 2NF: 1NF plus no partial dependency on part of a composite key.
-- 3NF: 2NF plus no inappropriate transitive dependency on a key.
--
-- Design principles:
-- - Give each table a primary key.
-- - Use foreign keys to preserve relationships.
-- - Choose data types based on the values being stored.
-- - Avoid storing multiple values in one column.
-- - Avoid duplicate facts across tables.
-- - Use DECIMAL rather than FLOAT for exact money amounts.
-- - Add indexes based on real query patterns, then measure performance.
-- - Use least-privilege database accounts for applications.

-- ============================================================================
-- MODULE 24: SECURITY AND USERS — OPTIONAL ADMIN LESSON
-- ============================================================================
-- Run these only if you have permission to manage MySQL accounts.
-- Replace the example password with a strong, unique password.
-- CREATE USER 'course_reader'@'localhost' IDENTIFIED BY 'ReplaceWithStrongPassword!';
-- GRANT SELECT ON mysql_teaching_course.* TO 'course_reader'@'localhost';
-- SHOW GRANTS FOR 'course_reader'@'localhost';
-- REVOKE SELECT ON mysql_teaching_course.* FROM 'course_reader'@'localhost';
-- DROP USER 'course_reader'@'localhost';

-- ============================================================================
-- MODULE 25: PRACTICE EXERCISES
-- ============================================================================
-- BEGINNER
-- 1. Show every customer.
-- 2. Show only product names and prices.
-- 3. Find customers from Delhi.
-- 4. Find products costing more than 1000.
-- 5. Find products with stock equal to zero.
-- 6. Sort employees by salary from highest to lowest.
-- 7. Show the first three products.
-- 8. Add a new customer with your own sample details.
-- 9. Update the price of one product.
-- 10. Explain PRIMARY KEY and NOT NULL in your own words.
--
-- INTERMEDIATE
-- 11. Count customers in each city.
-- 12. Find average salary by department.
-- 13. Show orders with customer names.
-- 14. Show each order line with product name and line total.
-- 15. Find customers who have never placed an order.
-- 16. Find products priced above the average product price.
-- 17. Show departments with more than one employee.
-- 18. Create a view that displays product name, category and price.
-- 19. Explain the difference between WHERE and HAVING.
-- 20. Explain INNER JOIN versus LEFT JOIN.
--
-- ADVANCED
-- 21. Rank employees by salary within each department.
-- 22. Use a CTE to calculate order counts per customer.
-- 23. Use a recursive CTE to display the manager hierarchy.
-- 24. Find the top two paid employees in each department.
-- 25. Use EXPLAIN to inspect a query and explain the output.
-- 26. Demonstrate COMMIT and ROLLBACK with a test update.
-- 27. Create a procedure that lists employees by department.
-- 28. Create a trigger that records product price changes.
-- 29. Calculate monthly sales totals.
-- 30. Design a normalized database for a library or school.

-- ============================================================================
-- MODULE 26: EXERCISE ANSWERS
-- Try the exercises before running these solutions.
-- ============================================================================
-- 1.
SELECT * FROM customers;

-- 2.
SELECT product_name, price FROM products;

-- 3.
SELECT * FROM customers WHERE city = 'Delhi';

-- 4.
SELECT * FROM products WHERE price > 1000;

-- 5.
SELECT * FROM products WHERE stock = 0;

-- 6.
SELECT * FROM employees ORDER BY salary DESC;

-- 7.
SELECT * FROM products ORDER BY product_id LIMIT 3;

-- 11.
SELECT city, COUNT(*) AS total_customers
FROM customers
GROUP BY city;

-- 12.
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- 13.
SELECT o.order_id, c.full_name, o.order_date, o.order_status
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id;

-- 14.
SELECT o.order_id, p.product_name, oi.quantity, oi.unit_price,
       oi.quantity * oi.unit_price AS line_total
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id;

-- 15.
SELECT c.full_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- 16.
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 17.
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) > 1;

-- 18. The view is already created in Module 16.
SELECT * FROM v_product_category;

-- 21.
SELECT employee_name, department_id, salary,
       RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 22.
WITH counts AS (
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT c.full_name, COALESCE(counts.order_count, 0) AS order_count
FROM customers c
LEFT JOIN counts ON counts.customer_id = c.customer_id;

-- 24.
WITH ranked AS (
    SELECT employee_name, department_id, salary,
           ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rn
    FROM employees
)
SELECT * FROM ranked WHERE rn <= 2;

-- ============================================================================
-- END OF COMPLETE MYSQL TEACHING COURSE
-- ============================================================================
