-- Views and Stored Procedures 

-- View Sales_details
CREATE OR REPLACE VIEW Sales_details AS 
SELECT c.customerNumber, o.orderNumber, c.country, od.quantityOrdered, od.priceEach
FROM orders o
JOIN customers c on o.customerNumber = c.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
ORDER BY od.quantityOrdered DESC;


SELECT * FROM Sales_details;

-- View High_Value_Customers
CREATE OR REPLACE VIEW High_Value_Customers AS
SELECT c.customerNumber, c.customerName, c.country, p.checkNumber, p.amount
FROM customers c 
JOIN payments p ON c.customerNumber = p.customerNumber;

SELECT * FROM High_Value_Customers
ORDER BY amount DESC;


-- stored procedure for Get_markup_higher
DELIMITER $$
CREATE PROCEDURE Get_MarkUp_Higher (number_1 INT)
BEGIN
	SELECT COUNT(*) AS markup_count
    FROM products
    WHERE MarkUp_Percentage > number_1;
END $$
DELIMITER ;

-- calling the procedure 
CALL Get_MarkUp_Higher (50);


-- stored procedure for Get_HighCredit_Customer
DELIMITER $$
CREATE PROCEDURE Get_HighCredit_Customer (cl FLOAT)
BEGIN
	SELECT customerName, creditLimit AS Credit
    FROM customers
	WHERE creditLimit > cl;
END $$
DELIMITER ;


-- calling the procedure 
CALL Get_HighCredit_Customer(100000);
