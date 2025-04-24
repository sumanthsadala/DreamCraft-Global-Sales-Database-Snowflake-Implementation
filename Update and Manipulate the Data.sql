-- Updating and manipulating the data 

-- Updating customers table
UPDATE customers
SET state = 'NA'
WHERE state IS NULL;

UPDATE customers
SET salesRepEmployeeNumber = 0
WHERE salesRepEmployeeNumber IS NULL;

-- Updating offices table
UPDATE offices
SET state = 'NA'
WHERE state IS NULL;


-- Updating orders table
UPDATE orders
SET comments = 'NA'
WHERE comments IS NULL;


-- Updating employees table
UPDATE employees
SET reportsTo = 0
WHERE reportsTo IS NULL;


-- Adding a column in products table
ALTER TABLE products
ADD MarkUp_Percentage DOUBLE;

-- Adding data in MarkUp_Percentage in Products table
UPDATE products
SET MarkUp_Percentage = ROUND((MSRP - buyPrice) / buyPrice * 100, 2);

-- Adding a column in orderdetails table
ALTER TABLE orderdetails
ADD Total_Cost INT;

-- Adding data in Total_Cost in Orderdetails table
UPDATE orderdetails
SET Total_Cost = ROUND(quantityOrdered * priceEach, 2);



