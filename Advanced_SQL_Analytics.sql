-- views
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
    
-- stored procedures
USE sql_invoicing;
DELIMITER $$

CREATE PROCEDURE get_clients()
BEGIN
	SELECT * 
	FROM clients;
END$$

DELIMITER ; 

-- triggers
USE sql_invoicing
DELIMITER $$

CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
END$$

DELIMITER ; 

-- events
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
