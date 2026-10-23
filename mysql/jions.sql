CREATE DATABASE join_practice;
USE join_practice;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    course_id INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO students VALUES
(1, 'Rahul', 101),
(2, 'Priya', 102),
(3, 'Amit', NULL);

INSERT INTO courses VALUES
(101, 'JavaScript'),
(102, 'React'),
(103, 'Python');
-- 1. INNER JOIN
SELECT students.name, courses.course_name
FROM students
INNER JOIN courses
ON students.course_id = courses.course_id;


-- 2. LEFT JOIN

SELECT students.name, courses.course_name
FROM students
LEFT JOIN courses
ON students.course_id = courses.course_id;

-- 3. RIGHT JOIN

SELECT students.name, courses.course_name
FROM students
RIGHT JOIN courses
ON students.course_id = courses.course_id;


-- 4. CROSS JOIN

SELECT students.name, courses.course_name
FROM students
CROSS JOIN courses;







-- 1. Departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Finance');

-- 2. Employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Rahul', 50000, 1, NULL),
(2, 'Priya', 45000, 1, 1),
(3, 'Amit', 35000, 2, 1),
(4, 'Neha', 40000, 3, 1),
(5, 'Karan', 30000, NULL, 2);

-- 3. Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1, 'Aman', 'Delhi'),
(2, 'Simran', 'Mumbai'),
(3, 'Rohit', 'Delhi'),
(4, 'Pooja', 'Jaipur');

-- 4. Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(101, 1, 2000),
(102, 2, 3500),
(103, 1, 1500),
(104, 3, 4000);

-- 5. Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 50000),
(2, 'Mouse', 500),
(3, 'Keyboard', 1500),
(4, 'Monitor', 12000);

-- 6. Order items
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO order_items VALUES
(1, 101, 1, 1),
(2, 101, 2, 2),
(3, 102, 3, 1),
(4, 103, 2, 1),
(5, 104, 4, 1);


SELECT columns
FROM table1
INNER JOIN table2
    ON table1.common_id = table2.common_id;

    SELECT
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;



    SELECT
    o.order_id,
    p.product_name,
    oi.quantity
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id;



    SELECT
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;



    SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;



SELECT
    d.department_name
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;



SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name;



    SELECT
    c.customer_name,
    COALESCE(SUM(o.amount), 0) AS total_amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;





    SELECT
    e.employee_name,
    e.salary,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
WHERE e.salary > 40000;





SELECT
    c.customer_name,
    SUM(o.amount) AS total_amount
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > 3000;




SELECT
    e.employee_name AS employee,
    m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.employee_id;




    SELECT
    e.employee_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;