-- ------------------------------------------------------------------
-- 0). First, How Many Rows are in the Products Table? 45
-- ------------------------------------------------------------------
SELECT COUNT(*) AS Num_Products FROM northwind.products;


-- ------------------------------------------------------------------
-- 1). Product Name and Unit/Quantity
-- ------------------------------------------------------------------

SELECT product_name
	, quantity_per_unit
FROM northwind.products;
-- ------------------------------------------------------------------
-- 2). Product ID and Name of Current Products
-- ------------------------------------------------------------------

SELECT id AS product_id
	, product_name
	FROM northwind.products
    WHERE discontinued <> 1;
-- ------------------------------------------------------------------
-- 3). Product ID and Name of Discontinued Products
-- ------------------------------------------------------------------
SELECT id AS product_id
	, product_name
	FROM northwind.products
    WHERE discontinued <> 0;

-- ------------------------------------------------------------------
-- 4). Name & List Price of Most & Least Expensive Products
-- ------------------------------------------------------------------

SELECT product_name
, list_price 
FROM northwind.products
WHERE list_price = (SELECT MIN(list_price) FROM northwind.products) OR list_price =  (SELECT MAX(list_price) FROM northwind.products);
-- ------------------------------------------------------------------
-- 5). Product ID, Name & List Price Costing Less Than $20
---------------------------------------------------------------------
SELECT id AS product_id, product_name
, list_price
FROM northwind.products
WHERE list_price < 20.0
ORDER BY list_price DESC;

-- ------------------------------------------------------------------
-- 6). Product ID, Name & List Price Costing Between $15 and $20
-- ------------------------------------------------------------------
SELECT id as product_id, product_name
, list_price
FROM northwind.products
WHERE list_price <= 20.0 AND list_price >= 15.0
ORDER BY list_price DESC;


-- ------------------------------------------------------------------
-- 7). Product Name & List Price Costing Above Average List Price
-- ------------------------------------------------------------------
SELECT product_name
, list_price
FROM northwind.products
WHERE list_price > (SELECT AVG(list_price) FROM northwind.products)
ORDER BY list_price DESC;

-- ------------------------------------------------------------------
-- 8). Product Name & List Price of 10 Most Expensive Products 
-- ------------------------------------------------------------------
SELECT product_name
, list_price
FROM northwind.products
ORDER BY list_price DESC
LIMIT 10;

-- ------------------------------------------------------------------ 
-- 9). Count of Current and Discontinued Products 
-- ------------------------------------------------------------------
UPDATE northwind.products SET discontinued = 1 WHERE id = 95;
SELECT COUNT(*) AS Product_Status FROM northwind.products
GROUP BY Discontinued;



-- ------------------------------------------------------------------
-- 10). Product Name, Units on Order and Units in Stock
--      Where Quantity In-Stock is Less Than the Quantity On-Order. 
-- ------------------------------------------------------------------
SELECT product_name, reorder_level AS units_in_stock,
target_level AS units_on_order
FROM northwind.products
WHERE reorder_level < target_level; 

-- ------------------------------------------------------------------
-- EXTRA CREDIT -----------------------------------------------------
-- ------------------------------------------------------------------


-- ------------------------------------------------------------------
-- 11). Products with Supplier Company & Address Info
-- ------------------------------------------------------------------
SELECT P.product_name, S.company, S.address
FROM northwind.products P INNER JOIN northwind.suppliers S
ON P.supplier_ids = S.id;

-- ------------------------------------------------------------------
-- 12). Number of Products per Category With Less Than 5 Units
-- ------------------------------------------------------------------
SELECT category
, COUNT(*) AS units_in_stock
FROM northwind.products
GROUP BY category 
HAVING units_in_stock < 5;

-- ------------------------------------------------------------------
-- 13). Number of Products per Category Priced Less Than $20.00
-- ------------------------------------------------------------------
SELECT category
, COUNT(*) AS units_in_stock
FROM northwind.products
WHERE list_price < 20.00
GROUP BY category 
