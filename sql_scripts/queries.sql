# QUERY SECTIONS

-- SIMPLE QUERIES

SET AUTOCOMMIT = 0; -- AUTO COMMIT = 0 SECTION
COMMIT; -- COMMITING SECTION

-- Insert 3 Tuples to different tables:

-- Customer Table 3 Tuples Insertion

INSERT INTO CUSTOMER (first_name, last_name, phone, e_mail, city, registiration_date) VALUES
('Emre', 'Deliaci', '05385620436', '220408008@st.biruni.edu.tr', 'İstanbul', '2024-06-27'),
('Arda', 'Eray', '05322082379', '230408051@st.biruni.edu.tr', 'İstanbul', '2024-10-12'),
('Yusuf', 'Soylu', '05518861046', '230408945@st.biruni.edu.tr', 'Konya', DEFAULT);



-- Employee Table 3 Tuples Insertion

INSERT INTO EMPLOYEE (first_name, last_name, role, is_active, employment_date, store_id) VALUES
('Kadir', 'Gül', 'Sales Consultant', TRUE, DEFAULT, 9), -- Izmir Bornova Employee Insertion
('Kader', 'Güzel', 'Interior Designer', TRUE, '2024-04-17', 6),
('Mohammad', 'Aknaz', 'Sales Consultant', FALSE, '2021-09-07', 27);
SELECT * FROM EMPLOYEE WHERE first_name = 'Kadir' OR first_name = 'Kader' OR first_name = 'Mohammad';

-- Stock Table 3 Tuples Insertion

INSERT INTO STOCK (store_id, product_id, color_id, aisle, shelf, quantity_on_hand) VALUES
(20, 11, 23, 'Z-01', 'Shelf-02', 20), -- STORE IKEA - Eregli | product_name: Vision Ergonomic Chair | Midnight Blue(23) | aisle: Z-01 | shelf: Shelf-02 | quantity_on_hand = 20
(21, 59, 9, 'S-05', 'Shelf-07', 35), -- STORE IKEA - Devrek Franchise | product_name: Folding Deck Chair | Cream(9) | aisle: S-05 | shelf: Shelf-07 | quantity_on_hand = 35
(23, 17, 2, 'D-03', 'Shelf-04', 15); -- STORE IKEA - Ataşehir | product_name: Vienna Sideboard | Walnut(2) | aisle: D-03 | shelf: Shelf-04 | quantity_on_hand = 15
SELECT * FROM STOCK 
WHERE (store_id = 20 AND product_id = 11 AND color_id = 23)
   OR (store_id = 21 AND product_id = 59 AND color_id = 9)
   OR (store_id = 23 AND product_id = 17 AND color_id = 2);


-- Insert 5 Tuples to same table:

INSERT INTO COLOR (color_name) VALUES 
('Charcoal Grey'),   -- ID: 32 Kömür Grisi
('Olive Green'),     -- ID: 33 Zeytin Yeşili
('Champagne'),       -- ID: 34 Şampanya
('Steel Blue'),      -- ID: 35 Çelik Mavisi
('Mocha');           -- ID: 36 Mocha Kahve
SELECT * FROM COLOR WHERE color_id = 32 OR color_id = 33 OR color_id = 34 OR color_id = 35 OR color_id = 36;

-- Update 3 Tuples in different tables:
-- STORE Phone Update:

UPDATE STORE SET phone = "02123740908" WHERE store_id = 1;
UPDATE STORE SET phone = "02124551217" WHERE store_id = 2;
UPDATE STORE SET phone = "02127168325" WHERE store_id = 3;
SELECT store_id, phone, store_name 
FROM STORE 
WHERE store_id IN (1, 2, 3);


-- PRODUCT Price Update:

UPDATE PRODUCT SET unit_price = 12499.99 WHERE product_id = 25; -- Crystal Waterfall Chandelier price = 12499.99
UPDATE PRODUCT SET unit_price = 999.99 WHERE product_id = 13; -- Legno Wall Shelf Unit price = 999.99
UPDATE PRODUCT SET unit_price = 3249.99 WHERE product_id = 3; -- Netha Coffee Table price = 3249.99
SELECT product_id, product_name, unit_price 
FROM PRODUCT 
WHERE product_id IN (3, 13, 25);

-- STOCK Quantity on Hand Update:

UPDATE STOCK SET quantity_on_hand = 32 WHERE store_id = 9 AND product_id = 35 AND color_id = 13; -- Hand-Woven Bamboo Rug | Gold | IKEA - İzmir Bornova | Quantity on Hand = 32
UPDATE STOCK SET quantity_on_hand = 23 WHERE store_id = 25 AND product_id = 1 AND color_id = 6; -- Pavia Fabric Sofa 3-Seater | Terracotta | IKEA - Ankara Kızılay | Quantity on Hand = 23
UPDATE STOCK SET quantity_on_hand = 35 WHERE store_id = 30 AND product_id = 31 AND color_id = 7; -- LED Reading Lamp USB | Mustard | IKEA - İstanbul Kadıköy | Quantity on Hand = 35
SELECT store_id, product_id, color_id, quantity_on_hand 
FROM STOCK 
WHERE (store_id = 9 AND product_id = 35 AND color_id = 13)
   OR (store_id = 25 AND product_id = 1 AND color_id = 6)
   OR (store_id = 30 AND product_id = 31 AND color_id = 7);

-- DELETE 3 Tuples in different tables:

DELETE FROM CUSTOMER WHERE customer_id = 34;
DELETE FROM CUSTOMER WHERE customer_id = 41;
DELETE FROM CUSTOMER WHERE customer_id = 47;

-- Deleting employee

DELETE FROM EMPLOYEE WHERE employee_id = 66;
DELETE FROM EMPLOYEE WHERE employee_id = 67;
DELETE FROM EMPLOYEE WHERE employee_id = 68;

-- Deleting Stock

DELETE FROM STOCK WHERE store_id = 1 AND product_id = 2 AND color_id = 9;
DELETE FROM STOCK WHERE store_id = 10 AND product_id = 4 AND color_id = 11;
DELETE FROM STOCK WHERE store_id = 31 AND product_id = 1 AND color_id = 4;


-- Create 3 queries with WHERE clause and comparison operators

SELECT * FROM CUSTOMER_ORDER WHERE YEAR(order_date) > "2024";

SELECT * FROM STOCK WHERE store_id = 10;

SELECT city, store_name FROM STORE WHERE city IN ("İstanbul", "Bursa", "Zonguldak");


-- Create 3 queries with WHERE clause and arithmetic operators

SELECT (YEAR(CURRENT_DATE) - YEAR(employment_date)) AS years_of_service FROM EMPLOYEE WHERE (YEAR(CURRENT_DATE) - YEAR(employment_date)) > 3;

SELECT unit_price FROM PRODUCT;
SELECT product_name, (unit_price / 2) AS "50% Discounted Price" FROM PRODUCT WHERE unit_price > 7000;

SELECT product_name, (unit_price * 1.7) AS "%70 Increased Price " FROM PRODUCT WHERE unit_price < 7000;


-- Create 3 queries with WHERE clause and logical operators

SELECT CONCAT(first_name, " ", last_name) AS "FULL NAME", phone, e_mail FROM CUSTOMER WHERE phone LIKE '05%' AND e_mail IS NOT NULL;

SELECT * FROM CUSTOMER_ORDER WHERE order_date < "2024-06-05" AND order_date > "2023-06-05";

SELECT * FROM STOCK WHERE (store_id = 1 OR store_id = 2) AND quantity_on_hand >= 8;


-- Create 3 queries with special operators (BETWEEN, IS NULL, LIKE, IN, EXISTS)

SELECT * FROM CUSTOMER_ORDER WHERE order_date BETWEEN "2024-03-20" AND CURRENT_DATE ORDER BY order_date DESC;

SELECT * FROM CUSTOMER WHERE e_mail IS NULL;

SELECT * FROM PRODUCT WHERE category_id IN (7, 20, 32);

SELECT * FROM CUSTOMER WHERE e_mail LIKE "%biruni%";

SELECT * FROM CUSTOMER c WHERE NOT EXISTS (
	SELECT 1 FROM CUSTOMER_ORDER co WHERE co.customer_id = c.customer_id
);

-- Create 3 queries with ORDER BY clause

SELECT * FROM PRODUCT ORDER BY unit_price ASC, product_id DESC;

SELECT * FROM EMPLOYEE 
ORDER BY employment_date ASC, employee_id DESC;

SELECT * FROM CUSTOMER 
ORDER BY first_name 
ASC, last_name ASC, customer_id DESC;


-- Create 3 queries with DISTINCT clause

SELECT DISTINCT(city) FROM STORE;

SELECT DISTINCT(full_name) FROM all_orders 
ORDER BY full_name ASC;

SELECT DISTINCT(role) FROM EMPLOYEE;


-- Create 7 queries with String Functions

SELECT UPPER(full_name) FROM all_orders;

SELECT CONCAT(first_name, " ", last_name)
 AS full_name FROM CUSTOMER;

SELECT LOWER(CONCAT(first_name, " ", last_name))
 AS full_name FROM EMPLOYEE;

SELECT REPLACE(e_mail, "mail", "outloook") 
FROM CUSTOMER WHERE e_mail IS NOT NULL;

SELECT CONCAT_WS(" | ", last_name, first_name, phone, e_mail) 
AS full_info FROM CUSTOMER;

SELECT CONCAT(first_name, " ", SUBSTRING(last_name, 1,1), ".") 
AS shortened_full_name FROM EMPLOYEE;

SELECT SUBSTRING(e_mail, 1, INSTR(e_mail, '@') - 1) 
FROM CUSTOMER WHERE e_mail IS NOT NULL;


-- Create 7 queries with Numeric Functions

SELECT product_name, ROUND(unit_price, 0) 
AS rounded_unit_price FROM PRODUCT;

SELECT AVG(unit_price) FROM PRODUCT;


SELECT SUM(amount) AS total_payment_transacted FROM PAYMENT;


SELECT product_id, quantity_on_hand FROM STOCK 
WHERE quantity_on_hand = (SELECT MAX(quantity_on_hand) FROM STOCK);


SELECT product_id, unit_price FROM PRODUCT 
WHERE unit_price = (SELECT MIN(unit_price) FROM PRODUCT);


SELECT product_id, FLOOR(unit_price) FROM PRODUCT;


SELECT COUNT(*) AS total_order_count FROM CUSTOMER_ORDER;


-- Create 10 queries with Date Functions

SELECT * FROM CUSTOMER_ORDER WHERE YEAR(order_date) < "2025";


SELECT * FROM CUSTOMER_ORDER WHERE MONTHNAME(order_date) = "MAY";


SELECT * FROM CUSTOMER_ORDER WHERE DAY(order_date) = "12";


SELECT employee_id, CONCAT(first_name, " ", last_name) AS full_name, 
DATEDIFF(CURRENT_DATE, employment_date) AS days_of_service FROM EMPLOYEE;


SELECT * FROM EMPLOYEE WHERE DAYNAME(employment_date) = "MONDAY";


SELECT * FROM CUSTOMER_ORDER WHERE WEEK(order_date) > 26;


SELECT * FROM CUSTOMER_ORDER WHERE QUARTER(order_date) <= 3;


SELECT * FROM CUSTOMER_ORDER WHERE order_date < LAST_DAY("2024-02-10");	


SELECT * FROM CUSTOMER_ORDER WHERE order_date < MAKEDATE(2024, 60);


SELECT delivery_id, DATE_ADD(planned_delivery_date, INTERVAL 10 DAY) 
AS estimated_latest_delivery_date FROM DELIVERY;


-- Create 3 queries with aggregate functions(COUNT, MIN, MAX, SUM, AVG)

SELECT COUNT(*) AS total_order_count FROM CUSTOMER_ORDER;


SELECT AVG(unit_price) FROM PRODUCT;


SELECT SUM(amount) AS total_payment_transacted FROM PAYMENT;


SELECT product_id, quantity_on_hand FROM STOCK WHERE quantity_on_hand = (SELECT MAX(quantity_on_hand) FROM STOCK);

SELECT product_id, unit_price FROM PRODUCT WHERE unit_price = (SELECT MIN(unit_price) FROM PRODUCT);


-- Use LIMIT clause

SELECT * FROM PAYMENT ORDER BY amount 
DESC, payment_id ASC LIMIT 15;


-- Use ROLLUP

SELECT payment_method, payment_date, SUM(amount) FROM PAYMENT 
GROUP BY payment_method, payment_date WITH ROLLUP;


-- Create 3 queries with GROUP BY clause 

SELECT s.store_id,st.store_name, s.product_id, p.product_name, COUNT(*) 
AS product_count FROM STOCK s INNER JOIN PRODUCT p 
ON p.product_id = s.product_id INNER JOIN STORE st 
ON st.store_id = s.store_id GROUP BY store_id, product_id;


SELECT pc.product_id,p.product_name,count(*) 
FROM PRODUCT_COLOR pc INNER JOIN PRODUCT p 
ON p.product_id = pc.product_id GROUP BY product_id;


SELECT payment_method, SUM(amount) AS total_amount FROM PAYMENT 
GROUP BY payment_method;


-- Create 3 queries with HAVING clause 

SELECT store_name, sum(product_amount) AS total_sales FROM all_orders 
GROUP BY store_name
HAVING total_sales >= (SELECT AVG(total_sales) 
FROM ( SELECT sum(product_amount) AS total_sales FROM all_orders 
GROUP BY store_name) t);

SELECT YEAR(order_date) AS 'year_order_date' ,
QUARTER(order_date) AS 'quarter_order_date', count(DISTINCT order_id) 
AS "different_order_count",sum(product_amount) AS "total_amount"
FROM all_orders GROUP BY  YEAR(order_date), QUARTER(order_date)
HAVING SUM(product_amount) >= (SELECT AVG(total_amount) 
FROM (SELECT sum(product_amount) AS "total_amount" 
FROM all_orders GROUP BY YEAR(order_date), QUARTER(order_date)) t);

SELECT store_id,COUNT(*) AS product_count 
FROM STOCK GROUP BY store_id HAVING product_count >= FLOOR((
SELECT AVG(product_count) 
FROM (SELECT COUNT(*) AS product_count 
FROM STOCK GROUP BY store_id) t));

-- Advanced queries 

-- Create a query by LEFT JOIN 

SELECT c.customer_id,CONCAT(c.first_name," ",c.last_name)
 AS full_name,c.phone, co.order_date,co.order_status 
 FROM CUSTOMER AS c 
 LEFT JOIN CUSTOMER_ORDER AS co 
 ON c.customer_id = co.customer_id; 

-- Create a query by RIGHT JOIN 

SELECT p.product_id,p.product_name,p.unit_price,c.color_id,c.color_name 
FROM PRODUCT AS p RIGHT JOIN PRODUCT_COLOR AS pc 
ON p.product_id = pc.product_id RIGHT JOIN COLOR c 
ON pc.color_id = c.color_id;	

-- Create 3 queries with Joining 2 tables

SELECT co.order_id,co.order_date,d.address,d.delivery_type,d.planned_delivery_date 
FROM CUSTOMER_ORDER AS co INNER JOIN DELIVERY AS d 
ON c.order_id = d.order_id;

SELECT s.store_id,s.city,s.store_name,CONCAT(e.first_name," ",e.last_name) 
AS full_name,e.role,e.is_active,e.employment_date 
FROM STORE s LEFT JOIN EMPLOYEE e 
ON s.store_id = e.store_id;

SELECT c.order_id,c.order_date,p.payment_date,p.payment_method,p.amount 
FROM CUSTOMER_ORDER c
 LEFT JOIN PAYMENT p ON c.order_id = p.order_id;

-- Create 3 queries with Joining 3 tables 

SELECT c.order_id,c.order_date,p.product_name,op.color_id,
c.store_id,p.unit_price,op.quantity 
FROM CUSTOMER_ORDER c INNER JOIN ORDER_PRODUCT op ON c.order_id = op.order_id
INNER JOIN PRODUCT p ON op.product_id = p.product_id;

SELECT c.order_id,p.payment_method,p.amount,d.address,
d.delivery_type,c.order_date,p.payment_date,
d.planned_delivery_date,c.order_status 
FROM PAYMENT p INNER JOIN 
CUSTOMER_ORDER c ON p.order_id = c.order_id 
INNER JOIN DELIVERY d ON c.order_id = d.order_id;

SELECT pc.category_id,pc.category_name,c.category_name,
p.product_name,p.unit_price 
FROM CATEGORY pc INNER JOIN CATEGORY c 
ON pc.category_id = c.parent_category_id
INNER JOIN PRODUCT p ON c.category_id = p.category_id;  

-- Create 4 queries with subquery in WHERE clause 
	-- Create 3 queries in the WHERE clause, including at least 1 correlated subquery (which works on the main table). 
	-- Create a correlated subquery using at least 1 WHERE EXISTS or WHERE NOT EXISTS. 

SELECT product_id,product_name, unit_price FROM PRODUCT 
WHERE unit_price >= (SELECT AVG(unit_price) FROM PRODUCT);

SELECT p.product_id,p.product_name,p.unit_price,p.category_id 
FROM PRODUCT p WHERE p.unit_price = (SELECT MAX(unit_price) 
FROM PRODUCT p2 WHERE p.category_id = p2.category_id);

SELECT c.customer_id,CONCAT(c.first_name," ", c.last_name) 
AS full_name, c.phone,c.city FROM CUSTOMER c 
WHERE NOT EXISTS (SELECT 1 FROM CUSTOMER_ORDER co 
WHERE c.customer_id = co.customer_id);

SELECT s.store_id,s.store_name,s.city FROM STORE s 
WHERE NOT EXISTS (SELECT 1 FROM EMPLOYEE e 
WHERE s.store_id = e.store_id AND e.role = "Cashier");


-- Create 3 queries with subquery in SELECT columns  

SELECT s.store_id,s.city,s.store_name,(SELECT COUNT(*) 
FROM EMPLOYEE e WHERE s.store_id = e.store_id) 
AS number_of_employee FROM STORE s;

SELECT s.product_id,s.color_id, (SELECT SUM(s1.quantity_on_hand) 
AS total_stock FROM STOCK s1 WHERE s.product_id = s1.product_id 
AND s.color_id = s1.color_id) FROM 
(SELECT DISTINCT product_id,color_id FROM STOCK) s;

SELECT c.category_id,c.category_name,(SELECT COUNT(*) 
FROM CATEGORY c1 WHERE c.category_id = c1.parent_category_id) 
AS number_subcategory FROM CATEGORY c 
WHERE c.parent_category_id IS NULL;  


-- Copy one table structure and data to new table

CREATE TABLE PRODUCT_COPY LIKE PRODUCT;
INSERT INTO PRODUCT_COPY SELECT * FROM PRODUCT;
SELECT * FROM PRODUCT_COPY;

-- Using MySQL user-defined variables (@variables), 
-- create at least 2 queries that list the tuple
-- with the highest value in a category or a ranking. 

SET @max_price = 0;
SELECT * FROM PRODUCT WHERE unit_price = 
(SELECT @max_price := MAX(unit_price) FROM PRODUCT);

SET @is_win = FALSE;
SELECT customer_id,CONCAT(first_name," ",last_name),phone,(@is_win := 
(SUBSTRING(phone,10,1) > '5')) AS 'has_discount_coupon'FROM CUSTOMER;

SELECT * FROM all_orders;
