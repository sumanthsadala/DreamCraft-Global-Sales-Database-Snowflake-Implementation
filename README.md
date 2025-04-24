# DreamCraft Global Sales Database – Snowflake Implementation

## 📊 Overview  
This project is a comprehensive Sales Database Solution built for DreamCraft, a global retailer of collectible car models. 
The database is developed in Snowflake to address their distributed sales operations, enabling centralized data management 
and seamless integration with Power BI for business intelligence.

## 📁 Project Structure  
The database implementation is organized into the following four SQL files:
- `Create_Tables_Statements.sql` – Contains the CREATE TABLE statements for all schema objects.
- `Insert_Statements.sql` – Populates the database tables with sample records.
- `Update and Manipulate the Data.sql` – Handles NULL value treatments and adds calculated columns.
- `VIEWS and STORED PROCEDURES.sql` – Defines SQL views and stored procedures to derive insights and enable user-defined logic.


## ER Diagram
![screenshot](https://github.com/sumanthsadala/DreamCraft-Global-Sales-Database-Snowflake-Implementation/blob/119b2b7fa859765e792072fff037471748f8c1fc/Er-diagram.png)

## 🛠️ Tools & Technologies  
- **Snowflake** (for data storage & processing)  
- **MySQL** (for querying data) 
 
## 🗃️ Database Overview
- The Snowflake database is named: DreamCraft
- Schema used: DreamCraft

## 📦 Tables Created:
- Offices
- Employees
- Customers
- ProductLines
- Products
- Orders
- OrderDetails
- Payments

## 🛠️ Key Operations Performed:
- Established all required primary and foreign key relationships as per the ER diagram.
- Created and populated all base tables with representative data.
- Replaced NULL values with appropriate defaults:
  - "NA" for state in Offices and Customers, and comments in Orders.
  -  0 for shippedDate in Orders, reportsTo in Employees, and salesRepEmployeeNumber in Customers.
- Added new columns:
- markup_percentage in Products (calculated as (MSRP - buyPrice) / buyPrice)
- total_cost in OrderDetails (calculated as quantityOrdered * priceEach)
- Created SQL views:
  - sale_details
  - high_value_customers
- Implemented stored procedures:
  - GET_MARKUP_HIGHER – Lists products with markup above a threshold.
  - get_highCredit_customer – Fetches customers with credit limits above a threshold.

## 📈 ETL and Power BI Integration
This Snowflake database was used as the data source for Power BI, utilizing a direct ETL (Extract, Transform, Load) 
pipeline from Snowflake to Power BI, enabling efficient data visualization and business reporting.


## How to Use
1. Login to Your Snowflake Account
   - Use the Snowflake web interface (Classic Console or Snowsight).
2. Create a New Database
   - Create a DreamCraft database and use the provided SQL files in the following order.
3. Run the SQL Files in Sequence
 - `Create_Tables_Statements.sql` – Set up all necessary tables
 - `Insert_Statements.sql` – Insert sample data into the tables
 - `Update and Manipulate the Data.sql` – Perform data cleaning and add calculated fields
 - `VIEWS and STORED PROCEDURES.sql` – Create views and stored procedures
4. Explore the Data
  - Once everything is set up, you can start analyzing the database using views or stored procedures, or connect to BI tools.
5. Connect to Power BI (Optional)
  - Use Snowflake’s native connector in Power BI to load the data and build visual dashboards.


Feel free to modify it further as needed!
