--1. Liệt kê tên (last_name) và lương (salary) của những nhân viên có lương lớn hơn 12000$.
SELECT Employee.first_name,
    Employee.salary
FROM Employee
WHERE salary > 12000;
--2. Liệt kê tên và lương của những nhân viên có lương thấp hơn 5000$ hoặc lớn hơn 12.000.000
SELECT Employee.first_name,
    Employee.salary
FROM Employee
WHERE salary > 12000000
    OR salary < 5000;
-- 3. Cho biết thông tin tên nhân viên (last_name), mã công việc (job_id) , ngày thuê (hire_date) của những nhân viên được thuê từ ngày 20/02/1998 đến ngày 1/05/1998. Thông tin được hiển thị tăng dần theo ngày thuê.
SELECT last_name,
    job_id,
    hire_date
FROM Employee
WHERE hire_date BETWEEN '1998-02-20' AND '1998-05-01'
ORDER BY hire_date ASC;
-- 4. Liệt kê danh sách nhân viên làm việc cho phòng 20 và 50. Thông tin hiển thị gồm:  last_name, department_id , trong đó tên nhân viên được sắp xếp theo thứ tự alphabe
SELECT Employee.last_name,
    Employee.department_id
FROM Employee
where department_id between 20 and 50
order by last_name ASC;
--5. Liệt kê danh sách nhân viên được thuê năm 1994.
select last_name,
    hire_date
from Employee
where YEAR(hire_date) = 1994;
--6. Liệt kê tên nhân viên (last_name), mã công việc (job_id) của những nhân viên không có người quản lý.
select Employee.last_name,
    Employee.job_id
from Employee
where manager_id is null;
--7.  Cho biết thông tin tất cả nhân viên được hưởng hoa hồng (commission_pct), kết quả được sắp xếp giảm dần theo lương và hoa hồng
select last_name,
    first_name,
    email,
    phone,
    salary,
    commission_pct
from Employee
where commission_pct > 0
order by salary DESC,
    commission_pct DESC;
--8.  Liệt kê danh sách nhân viên mà có kí tự thứ 3 trong tên là „a‟.
select Employee.first_name
from Employee
where SUBSTRING(first_name, 3, 1) = 'a';
--9.  Liệt kê danh sách nhân viên mà trong tên có chứa một chữ „a‟ và một chữ „e‟.
SELECT Employee.last_name
FROM Employee
WHERE last_name LIKE '%a%'
    AND last_name LIKE '%e%';
--10. Cho biết tên (last_name), mã công việc (job_id), lương (salary) của những nhân viên  làm „Sales representative‟ hoặc „Stock clert‟ và có mức lương khác 5.000.000, 7000000.
SELECT last_name,
    job_id,
    salary
FROM Employee
    JOIN Job ON Employee.job_id = Job.id
WHERE (
        Job.title = 'Sales representative'
        OR Job.title = 'Stock clert'
    )
    AND salary NOT IN (5000000.00, 7000000.00);
--11. Cho biết mã nhân viên (employee_id), tên nhân viên (last_name), lương sau khi tăng  thêm 15% so với lương ban đầu, được làm tròn đến hàng đơn vị và đặt lại tên cột là  “new_salary”.
SELECT id,
    last_name,
    ROUND(salary * 1.15, 0) AS new_salary
FROM Employee;
--12. Liệt kê danh sách nhân viên, khoảng thời gian (tính theo tháng) mà nhân viên đã làm việc trong công ty cho đến nay. Kết quả sắp xếp tăng dần theo số lượng tháng làm việc.
SELECT last_name,
    TIMESTAMPDIFF(MONTH, hire_date, CURDATE()) AS months_worked
FROM Employee
ORDER BY months_worked ASC;
-- 13. Dream Salaries
SELECT CONCAT(
        last_name,
        ' earns ',
        salary,
        ' monthly but wants ',
        salary * 3
    ) AS Dream_Salaries
FROM Employee;
-- 14. Liệt kê tên nhân viên, mức hoa hồng nhân viên đó nhận được. Trường hợp nhân viên nào không được hưởng hoa hồng thì hiển thị „no_commission‟
SELECT last_name,
    COALESCE(commission_pct, 'no_commission') AS commission
FROM Employee;
-- 15. Cho biết tên nhân viên, mã phòng, tên phòng của những nhân viên làm việc ở thành phố
SELECT e.last_name,
    d.id AS department_id,
    d.name AS department_name
FROM Employee e
    JOIN Department d ON e.department_id = d.id
    JOIN Locations l ON d.location_id = l.id;
-- 16. Nhân viên và người quản lý của họ
SELECT e.id AS employee_id,
    e.last_name AS employee_name,
    m.id AS manager_id,
    m.last_name AS manager_name
FROM Employee e
    LEFT JOIN Employee m ON e.manager_id = m.id;
-- 17. Liệt kê danh sách những nhân viên làm việc cùng phòng.
SELECT E1.id AS emp1_id,
    E1.last_name AS emp1_name,
    E2.id AS emp2_id,
    E2.last_name AS emp2_name,
    E1.department_id
FROM Employee E1
    JOIN Employee E2 ON E1.department_id = E2.department_id
    AND E1.id < E2.id
ORDER BY E1.department_id;
-- 18. Liệt kê danh sách nhân viên được thuê vào làm trước người quản lý của họ.
SELECT e1.last_name AS employee_name,
    e1.hire_date AS employee_hire_date,
    e2.last_name AS manager_name,
    e2.hire_date AS manager_hire_date
FROM Employee e1
    JOIN Employee e2 ON e1.manager_id = e2.id
WHERE e1.hire_date < e2.hire_date;
-- 19. Cho biết lương thấp nhất, lương cao nhất, lương trung bình, tổng lương của từng loại công việc
SELECT j.title,
    MIN(e.salary) AS min_salary,
    MAX(e.salary) AS max_salary,
    AVG(e.salary) AS avg_salary,
    SUM(e.salary) AS total_salary
FROM Job j
    LEFT JOIN Employee e ON j.id = e.job_id
GROUP BY j.title;
-- 20. Cho biết mã phòng, tên phòng, số lượng nhân viên của từng phòng ban.
SELECT d.id AS department_id,
    d.name AS department_name,
    COUNT(e.id) AS employee_count
FROM Department d
    LEFT JOIN Employee e ON d.id = e.department_id
GROUP BY d.id,
    d.name;
-- 21. Cho biết tổng số nhân viên, tổng nhân viên được thuê từng năm 1995, 1996, 1997, 1998.
SELECT YEAR(hire_date) AS hire_year,
    COUNT(*) AS employee_count
FROM Employee
WHERE YEAR(hire_date) IN (1995, 1996, 1997, 1998)
GROUP BY hire_year;
-- 22. Liệt kê tên, ngày thuê của những nhân viên làm việc cùng phòng với nhân viên „normal”.
SELECT e.last_name,
    e.hire_date
FROM Employee e
    JOIN Employee e2 ON e.department_id = e2.department_id
WHERE e2.last_name = 'normal'
    AND e.id != e2.id;
-- 23. Liệt kê danh sách nhân viên có lương cao hơn mức lương trung bình và làm việc cùng phòng với nhân viên có tên kết thúc bởi „n”.
SELECT e1.first_name,
    e1.salary
FROM Employee e1
    JOIN Employee e2 ON e1.department_id = e2.department_id
    AND e1.id != e2.id
WHERE e2.first_name LIKE '%n'
    AND e1.salary > (
        SELECT AVG(salary)
        FROM Employee
    );
-- 24. Liệt kê danh sách mã phòng ban, tên phòng ban có ít hơn 3 nhân viên.
SELECT d.id AS department_id,
    d.name AS department_name,
    COUNT(e.id) AS employee_count
FROM Department d
    LEFT JOIN Employee e ON d.id = e.department_id
GROUP BY d.id,
    d.name
HAVING COUNT(e.id) < 3;
-- 25. Cho biết phòng ban nào có đông nhân viên nhất, phòng ban nào có ít nhân viên nhất.
SELECT d.id AS department_id,
    d.name AS department_name,
    COUNT(e.id) AS employee_count,
    CASE
        WHEN COUNT(e.id) = (
            SELECT MAX(emp_count)
            FROM (
                    SELECT COUNT(id) AS emp_count
                    FROM Employee
                    GROUP BY department_id
                ) AS counts
        ) THEN 'Most Employees'
        WHEN COUNT(e.id) = (
            SELECT MIN(emp_count)
            FROM (
                    SELECT COUNT(id) AS emp_count
                    FROM Employee
                    GROUP BY department_id
                ) AS counts
        ) THEN 'Least Employees'
        ELSE NULL
    END AS employee_status
FROM Department d
    LEFT JOIN Employee e ON d.id = e.department_id
GROUP BY d.id,
    d.name;
-- 26. Liệt kê thông tin 3 nhân viên có lương cao nhất.
SELECT last_name,
    salary
FROM Employee
ORDER BY salary DESC
LIMIT 3;
-- 27. Liệt kê danh sách nhân viên có mức lương thấp hơn mức lương trung bình của phòng ban.
SELECT e.last_name,
    e.salary,
    d.name AS department_name
FROM Employee e
    JOIN Department d ON e.department_id = d.id
WHERE e.salary < (
        SELECT AVG(salary)
        FROM Employee e2
        WHERE e2.department_id = e.department_id
    );
-- 28. Tăng thêm 1.000.000 cho những nhân viên có lương nhỏ hơn 9.000.00.
UPDATE Employee
SET salary = salary + 1000000.00
WHERE salary < 9000.00;
-- 29. Xóa phòng ban nào chưa có nhân viên.
DELETE d
FROM Department d
    LEFT JOIN Employee e ON d.id = e.department_id
WHERE e.id IS NULL;
-- 30. Tìm các nhân viên có lương nằm trong top 10% lương cao nhất của công ty.
SELECT *
FROM (
        SELECT *,
            PERCENT_RANK() OVER (
                ORDER BY salary DESC
            ) AS rank_percent
        FROM Employee
    ) AS ranked
WHERE rank_percent <= 0.10;
-- 31. Tìm các công việc có mức lương tối thiểu bằng hoặc lớn hơn mức lương trung bình của tất cả các công việc.
SELECT j.id,
    j.title,
    j.min_salary
FROM Job j
WHERE j.min_salary >= (
        SELECT AVG(min_salary)
        FROM Job
    );
-- 32. Liệt kê các nhân viên có lương bằng với mức lương tối đa của công việc của họ.
SELECT e.last_name,
    e.salary
FROM Employee e
    JOIN Job j ON e.job_id = j.id
WHERE e.salary = j.max_salary;
-- 33. Liệt kê các nhân viên có lương cao hơn mức lương trung bình của công ty và làm việc ở phòng ban có ít hơn 5 nhân viên.
SELECT e.last_name,
    e.salary
FROM Employee e
    JOIN Department d ON e.department_id = d.id
WHERE e.salary > (
        SELECT AVG(salary)
        FROM Employee
    )
    AND (
        SELECT COUNT(*)
        FROM Employee e2
        WHERE e2.department_id = e.department_id
    ) < 5;
-- 34. Liệt kê tên nhân viên và độ dài của họ tên (tổng số ký tự trong first_name + last_name).
SELECT last_name,
    first_name,
    LENGTH(CONCAT(first_name, last_name)) AS name_length
FROM Employee;
-- 35. Liệt kê các thành phố có ít nhất 2 phòng ban trở lên.
SELECT l.city,
    COUNT(d.id) AS department_count
FROM Locations l
    JOIN Department d ON l.id = d.location_id
GROUP BY l.city
HAVING COUNT(d.id) >= 2;
-- 36.. Liệt kê danh sách các công việc (job_id, title) có khoảng lương tối thiểu và tối đa chênh lệch từ 5000000 trở lên.
SELECT id,
    title,
    (max_salary - min_salary) AS salary_range
FROM Job
WHERE (max_salary - min_salary) >= 5000000.00;
-- 37. Cho biết danh sách nhân viên (last_name, hire_date) được thuê vào các ngày thứ Hai (Monday).
SELECT last_name,
    hire_date
FROM Employee
WHERE DAYOFWEEK(hire_date) = 2;
-- 38. Liệt kê mã và tên các quốc gia có nhiều hơn 2 địa điểm làm việc
SELECT c.id,
    c.name,
    COUNT(l.id) AS location_count
FROM Countries c
    JOIN Locations l ON c.id = l.country_id
GROUP BY c.id,
    c.name
HAVING COUNT(l.id) > 2;
-- 39.Liệt kê nhân viên có mức lương thuộc top 3 cao nhất trong từng phòng ban.
SELECT e.last_name,
    e.salary,
    e.department_id
FROM Employee e
WHERE (
        SELECT COUNT(*)
        FROM Employee e2
        WHERE e2.department_id = e.department_id
            AND e2.salary >= e.salary
    ) <= 3
ORDER BY e.department_id,
    e.salary DESC;
-- 40. Liệt kê các nhân viên đã trải qua ít nhất 2 công việc khác nhau (dựa vào JobHistory).
SELECT e.last_name
FROM Employee e
    JOIN JobHistory jh ON e.id = jh.employee_id
GROUP BY e.id,
    e.last_name
HAVING COUNT(DISTINCT jh.job_id) >= 2;
-- 41. Tìm nhân viên là quản lý của ít nhất 3 nhân viên khác.
SELECT e1.id AS manager_id,
    e1.last_name AS manager_name,
    COUNT(e2.id) AS managed_count
FROM Employee e1
    JOIN Employee e2 ON e1.id = e2.manager_id
GROUP BY e1.id,
    e1.last_name
HAVING COUNT(e2.id) >= 3;
-- 42. Tìm các nhân viên làm việc ở một quốc gia nhưng lại có người quản lý làm việc ở quốc gia khác.
SELECT e1.last_name AS employee_name,
    l1.city AS employee_city,
    c1.name AS employee_country,
    e2.last_name AS manager_name,
    l2.city AS manager_city,
    c2.name AS manager_country
FROM Employee e1
    JOIN Department d1 ON e1.department_id = d1.id
    JOIN Locations l1 ON d1.location_id = l1.id
    JOIN Countries c1 ON l1.country_id = c1.id
    JOIN Employee e2 ON e1.manager_id = e2.id
    JOIN Department d2 ON e2.department_id = d2.id
    JOIN Locations l2 ON d2.location_id = l2.id
    JOIN Countries c2 ON l2.country_id = c2.id
WHERE c1.id != c2.id;
-- 43. Cho biết các vùng (region) có tổng lương của nhân viên vượt quá 50.000.000.
SELECT r.name AS region_name,
    SUM(e.salary) AS total_salary
FROM Regions r
    JOIN Countries c ON r.id = c.region_id
    JOIN Locations l ON c.id = l.country_id
    JOIN Department d ON l.id = d.location_id
    JOIN Employee e ON d.id = e.department_id
GROUP BY r.name
HAVING SUM(e.salary) > 50000000.00;
-- 44. Liệt kê những nhân viên đã từng làm việc tại nhiều thành phố khác nhau (dựa vào location trong JobHistory).
SELECT e.last_name
FROM Employee e
    JOIN JobHistory jh ON e.id = jh.employee_id
    JOIN Employee e2 ON e.id = e2.id
    JOIN Department d ON e2.department_id = d.id
    JOIN Locations l ON d.location_id = l.id
GROUP BY e.id,
    e.last_name
HAVING COUNT(DISTINCT l.city) > 1;
-- 45. Tìm nhân viên có lương cao nhất trong mỗi phòng ban, và hiển thị thêm thông tin về người quản lý của họ.
SELECT e.last_name,
    e.salary,
    e.department_id,
    m.last_name AS manager_name
FROM Employee e
    LEFT JOIN Employee m ON e.manager_id = m.id
WHERE e.salary = (
        SELECT MAX(e2.salary)
        FROM Employee e2
        WHERE e2.department_id = e.department_id
    )
ORDER BY e.department_id;
-- 46. Liệt kê nhân viên có công việc hiện tại giống với công việc đầu tiên trong JobHistory của họ.
SELECT e.last_name,
    e.job_id AS current_job,
    jh.job_id AS first_job
FROM Employee e
    JOIN JobHistory jh ON e.id = jh.employee_id
WHERE e.job_id = (
        SELECT job_id
        FROM JobHistory jh2
        WHERE jh2.employee_id = e.id
        ORDER BY start_date
        LIMIT 1
    )
GROUP BY e.last_name,
    e.job_id,
    jh.job_id;