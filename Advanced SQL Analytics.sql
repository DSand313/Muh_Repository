*****************************************

Analytics performed with sample databases

*****************************************

-- 1. Views
-- Just some simple views that can be queried off of later

USE sql_invoicing;
CREATE VIEW sales_by_client AS 
SELECT
	c.client_id,
    c.name,
    SUM(invoice_total) AS total_sales
FROM clients c
JOIN invoices i 
	USING (client_id)
GROUP BY 
	client_id,
    name;
    
USE sql_invoicing;
CREATE VIEW clients_balance AS
SELECT 
	c.client_id,
    c.name,
    SUM(invoice_total - payment_total) AS balance
FROM clients c
JOIN invoices i
	USING (client_id)
GROUP BY
	client_id,
    name;
    
-- 2. Stored procedures
-- Some simple stored procedures that retrieve basic information about clients and invoices

USE sql_invoicing;
DELIMITER $$

CREATE PROCEDURE get_clients()
BEGIN
	SELECT * 
	FROM clients;
END$$

DELIMITER ; 

USE sql_invoicing;
DELIMITER $$

CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT *
    FROM invoices_with_balance
    WHERE balance > 0;
END$$

DELIMITER ;

-- 3. Triggers 
-- This is a regular trigger for an automated change whenever a payment is inserted

USE sql_invoicing;
DELIMITER $$

DROP TRIGGER IF EXISTS payment_after_insert;

CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
END$$

DELIMITER ; 

-- This is the same trigger that creates an audit table to see changes in data

USE sql_invoicing;
DELIMITER $$

CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
	FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE  invoice_id = NEW.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (
		NEW.client_id,
		NEW.date,
        NEW.amount,
        "Insert",
        NOW()
    );
END$$

DELIMTIER ;

-- 4. Events
-- This event deletes old audit data from the above trigger

USE sql_invoicing;
DELIMITER $$

CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE
	-- AT "2019-05-01"
    EVERY 1 YEAR STARTS "2019-01-01" ENDS "2029-01-01"
DO BEGIN 
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END$$

DELIMITER ;

-- 5. Transactions

USE sql_store;

START TRANSACTION;

INSERT INTO orders (
	customer_id,
    order_date,
    status
)
VALUES (
	1,
    "2019-01-01",
    1
);

INSERT INTO order_items
VALUES (
	last_insert_id(),
    1,
    1,
    1
);

COMMIT;
