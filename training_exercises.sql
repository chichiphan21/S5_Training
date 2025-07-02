-- 4. Thứ tự thực hiện query (ví dụ với GROUP BY và HAVING)
SELECT department,
    COUNT(*) AS total_employees
FROM employees
WHERE salary > 5000
GROUP BY department
HAVING COUNT(*) > 3
ORDER BY total_employees DESC;
--

-- 5. Khóa chính, khóa ngoại (tạo bảng với chuẩn đặt tên)
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    -- pk_departments
    name VARCHAR(100)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    -- pk_employees
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) -- fk_employees_department_id
);
-- 6. Index 
CREATE INDEX idx_employees_salary ON employees(salary);
-- 7. Các quan hệ giữa bảng
-- 7.1 One to One: users - user_profiles
CREATE TABLE users (id INT PRIMARY KEY, name VARCHAR(100));
CREATE TABLE user_profiles (
    user_id INT PRIMARY KEY,
    dob DATE,
    avatar VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
-- 7.2 One to Many: customers - orders
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- 7.3 Many to Many: students - courses - student_course
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(100)
);
CREATE TABLE student_course (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
-- 8. GROUP BY và ORDER BY
SELECT department_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY avg_salary DESC;
-- 9. Merge dữ liệu
-- 9.1 UNION vs UNION ALL
SELECT name
FROM employees
UNION
SELECT name
FROM customers;
SELECT name
FROM employees
UNION ALL
SELECT name
FROM customers;
-- 9.2 JOIN
SELECT e.name AS employee_name,
    d.name AS department_name
FROM employees e
    JOIN departments d ON e.department_id = d.department_id;
-- 9.3 Subquery
SELECT name,
    salary
FROM employees
WHERE salary > (
        SELECT AVG(salary)
        FROM employees
    );
-- 9.4 CTE
WITH HighEarners AS (
    SELECT name,
        salary
    FROM employees
    WHERE salary > 10000
)
SELECT *
FROM HighEarners;
--10. Biểu thức trong SELECT
-- Biểu thức truy vấn cột
SELECT name,
    price
FROM products;
--Biểu thức hằng số
SELECT name,
    'Available' AS status
FROM products;
--Biểu thức số học
SELECT product_id,
    item,
    price * item AS total
FROM order;
--Biểu thức chuỗi
--Ghép chuỗi
SELECT name || ' - ' || category AS full_name
FROM products;
--Cắt chuỗi
SELECT SUBSTRING(
        name
        FROM 1 FOR 5
    ) AS short_name
FROM products;
--Thay thế chuỗi
SELECT REPLACE(name, 'Old', 'New') AS updated_name
FROM products;
--Hàm tổng hợp
SELECT category,
    COUNT(*) AS total_products,
    SUM(price) AS total_price,
    AVG(price) AS avg_price
FROM products
GROUP BY category;
--Biểu thức điều kiện
SELECT name,
    price,
    CASE
        WHEN price >= 1000 THEN 'Expensive'
        WHEN price >= 500 THEN 'Medium'
        ELSE 'Cheap'
    END AS price_range
FROM products;
--Biểu thức ngày giờ
-- Lấy ngày hiện tại
SELECT CURRENT_DATE AS today;
-- Tính tuổi
SELECT name,
    dob,
    EXTRACT(
        YEAR
        FROM CURRENT_DATE
    ) - EXTRACT(
        YEAR
        FROM dob
    ) AS age
FROM users;
-- Tính số ngày giữa hai mốc
SELECT order_id,
    delivery_date - order_date AS shipping_days
FROM orders;