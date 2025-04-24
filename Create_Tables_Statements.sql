-- Create Statements

-- Offices Table
CREATE TABLE Offices (
  officeCode VARCHAR(10) NOT NULL,
  city VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  addressLine1 VARCHAR(50) NOT NULL,
  addressLine2 VARCHAR(50) NULL DEFAULT NULL,
  state VARCHAR(50) NULL DEFAULT NULL,
  country VARCHAR(50) NOT NULL,
  postalCode VARCHAR(15) NOT NULL,
  territory VARCHAR(10) NOT NULL,
  PRIMARY KEY (officeCode));

-- Employees Table
CREATE TABLE employees (
  employeeNumber int NOT NULL,
  lastName varchar(50) NOT NULL,
  firstName varchar(50) NOT NULL,
  extension varchar(10) NOT NULL,
  email varchar(100) NOT NULL,
  officeCode varchar(10) NOT NULL,
  reportsTo int DEFAULT NULL,
  jobTitle varchar(50) NOT NULL,
  PRIMARY KEY (employeeNumber),
  FOREIGN KEY (reportsTo) REFERENCES employees (employeeNumber),
  FOREIGN KEY (officeCode) REFERENCES offices (officeCode)
);

-- Customers Table
CREATE TABLE customers (
  customerNumber INT NOT NULL,
  customerName VARCHAR(50) NOT NULL,
  contactLastName VARCHAR(50) NOT NULL,
  contactFirstName VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  addressLine1 VARCHAR(50) NOT NULL,
  addressLine2 VARCHAR(50) NULL DEFAULT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NULL DEFAULT NULL,
  postalCode VARCHAR(15) NULL DEFAULT NULL,
  country VARCHAR(50) NOT NULL,
  salesRepEmployeeNumber INT NULL,
  creditLimit DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (customerNumber),
  FOREIGN KEY (salesRepEmployeeNumber) REFERENCES employees (employeeNumber));


-- ProductLines Table
CREATE TABLE productlines (
  productLine varchar(50) NOT NULL,
  textDescription varchar(4000) DEFAULT NULL,
  htmlDescription varchar(500),
  image binary,
  PRIMARY KEY (productLine)
);

-- Products Table
CREATE TABLE Products (
  productCode VARCHAR(15) NOT NULL,
  productName VARCHAR(70) NOT NULL,
  productScale VARCHAR(10) NOT NULL,
  productVendor VARCHAR(50) NOT NULL,
  productDescription TEXT NOT NULL,
  quantityInStock SMALLINT NOT NULL,
  buyPrice DOUBLE NOT NULL,
  MSRP DOUBLE NOT NULL,
  productLine VARCHAR(50) NULL,
  PRIMARY KEY (productCode),
  CONSTRAINT fk_Products_ProductLines
    FOREIGN KEY (productLine)
    REFERENCES productlines (productLine)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Orders Table
CREATE TABLE Orders (
  orderNumber INT NOT NULL,
  orderDate DATETIME NOT NULL,
  requiredDate DATETIME NOT NULL,
  shippedDate DATETIME NULL DEFAULT NULL,
  status VARCHAR(15) NOT NULL,
  comments TEXT NULL DEFAULT NULL,
  customerNumber INT NOT NULL,
  PRIMARY KEY (orderNumber),
  CONSTRAINT fk_Orders_Customers
    FOREIGN KEY (customerNumber)
    REFERENCES  customers (customerNumber)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- OrderDetails Table
CREATE TABLE OrderDetails (
  orderNumber INT NOT NULL,
  productCode VARCHAR(15) NOT NULL,
  quantityOrdered INT NOT NULL,
  priceEach DOUBLE NOT NULL,
  orderLineNumber SMALLINT NOT NULL,
  PRIMARY KEY (productCode, orderNumber),
  CONSTRAINT fk_OrderDetails_Products
    FOREIGN KEY (productCode)
    REFERENCES  Products (productCode)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_OrderDetails_Orders
    FOREIGN KEY (orderNumber)
    REFERENCES  Orders (orderNumber)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- Payments Table
CREATE TABLE Payments (
  checkNumber VARCHAR(50) NOT NULL,
  paymentDate DATETIME NOT NULL,
  amount DOUBLE NOT NULL,
  customerNumber INT NOT NULL,
  PRIMARY KEY (checkNumber),
  CONSTRAINT fk_Payments_Customers
    FOREIGN KEY (customerNumber)
    REFERENCES  customers (customerNumber)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
