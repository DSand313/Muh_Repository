-- 1. Joins

USE sql_store;
SELECT *
FROM orders o
JOIN customers c
    USING (customer_id)
JOIN order_statuses os
    ON o.status = os.order_status_id;

-- 2. Subqueries

USE sql_invoicing;
SELECT * 
FROM clients
WHERE client_id IN (
    SELECT client_id
    FROM invoices
    GROUP BY client_id
    HAVING COUNT(*) > 2
);

-- 3. Correlated subqueries
USE sql_hr;
SELECT * 
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE office_id = e.office_id
);

-- 4. Unions
USE sql_store;
SELECT 
    order_id,
    order_date,
    "Active" AS status
FROM orders
WHERE order_date >= "2019-01-01"
UNION
SELECT 
    order_id,
    order_date,
    "Archived" AS status
FROM orders
WHERE order_date < "2019-01-01"


