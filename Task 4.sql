Create Database OLAP_Operations;
USE OLAP_Operations;

### 1. Database and Table Creation


-- Create Database
CREATE DATABASE sales_db;

-- Connect to the database (if using psql or similar tool)

-- Create Table
CREATE TABLE sales_sample (
    Product_Id INTEGER,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);


### 2. Data Insertion

INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(1, 'East', '2024-01-01', 100),
(2, 'West', '2024-01-02', 150),
(1, 'North', '2024-01-03', 200),
(2, 'South', '2024-01-04', 250),
(3, 'East', '2024-01-05', 300),
(3, 'West', '2024-01-06', 350),
(4, 'North', '2024-01-07', 400),
(4, 'South', '2024-01-08', 450),
(1, 'East', '2024-01-09', 500),
(2, 'West', '2024-01-10', 550);


### 3. OLAP Operations

#### a) Drill Down

-- Drill Down from Region to Product Level
SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region, Product_Id;


#### b) Rollup

-- Rollup from Product to Region Level
SELECT Region, COALESCE(Product_Id, 'All Products') AS Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY ROLLUP(Region, Product_Id)
ORDER BY Region, Product_Id;


#### c) Cube

-- Cube to explore sales data from multiple dimensions
SELECT COALESCE(Product_Id, 'All Products') AS Product_Id,
       COALESCE(Region, 'All Regions') AS Region,
       COALESCE(Date, 'All Dates') AS Date,
       SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY (Product_Id, Region, Date)
ORDER BY Product_Id, Region, Date;



-- Slice to view sales for a particular region (e.g., 'East')
SELECT * FROM sales_sample
WHERE Region = 'East';

-- Slice to view sales for a particular date range (e.g., '2024-01-01' to '2024-01-05')
SELECT * FROM sales_sample
WHERE Date BETWEEN '2024-01-01' AND '2024-01-05';


#### e) Dice

-- Dice to view sales for specific combinations (e.g., Product_Id 1 and Region 'East' within a specific date range)
SELECT * FROM sales_sample
WHERE Product_Id = 1
  AND Region = 'East'
  AND Date BETWEEN '2024-01-01' AND '2024-01-10';