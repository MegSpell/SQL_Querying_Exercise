-- Comments in SQL Start with dash-dash --

-- ********* 1. Add a product to the table with the name of “chair”, price of 44.00, and can_be_returned of false.

INSERT INTO products (name, price, can_be_returned) VALUES('chair', '44.00', 'false');

-- products_db=# INSERT INTO products (name, price, can_be_returned) VALUES('chair', '44.00', 'false');
-- INSERT 0 1
-- products_db=# SELECT * FROM products;
--  id | name  | price | can_be_returned 
-- ----+-------+-------+-----------------
--   1 | chair |    44 | f
-- (1 row)

---------------------------------------------------------------------------------------------------------

-- ********* 2. Add a product to the table with the name of “stool”, price of 25.99, and can_be_returned of true.

INSERT INTO products (name, price, can_be_returned) VALUES('stool', '25.99', 'true');

-- products_db=# INSERT INTO products (name, price, can_be_returned) VALUES('stool', '25.99', 'true');
-- INSERT 0 1
-- products_db=# SELECT * FROM products;
--  id | name  | price | can_be_returned 
-- ----+-------+-------+-----------------
--   1 | stool |    25.99 | t
-- (1 row)

---------------------------------------------------------------------------------------------------------

-- ********* 3. Add a product to the table with the name of “table”, price of 124.00, and can_be_returned of false.

INSERT INTO products (name, price, can_be_returned) VALUES('table', '124.00', 'false');

-- products_db=# INSERT INTO products (name, price, can_be_returned) VALUES('table', '124.00', 'false');
-- INSERT 0 1
-- products_db=# SELECT * FROM products;
--  id | name  | price | can_be_returned 
-- ----+-------+-------+-----------------
--   1 | chair |    44 | f
-- (1 row)

----------------------------------------------------------------------------------------------------------

--********* 4. Display all of the rows and columns in the table.

SELECT * FROM products;

-- products_db=# SELECT * FROM products;
--  id | name  | price | can_be_returned 
-- ----+-------+-------+-----------------
--   1 | chair |    44 | f
--   2 | stool | 25.99 | t
--   3 | table |   124 | f
-- (3 rows)

----------------------------------------------------------------------------------------------------------

-- ********* 5. Display all of the names of the products.

SELECT name FROM products;

-- products_db=# SELECT name FROM products;
--  name  
-- -------
--  chair
--  stool
--  table
-- (3 rows)

----------------------------------------------------------------------------------------------------------

-- ********* 6. Display all of the names and prices of the products.

SELECT name, price FROM products;

-- products_db=# SELECT name, price FROM products;
--  name  | price 
-- -------+-------
--  chair |    44
--  stool | 25.99
--  table |   124
-- (3 rows)

----------------------------------------------------------------------------------------------------------

-- ********* 7. Add a new product - make up whatever you would like!

INSERT INTO products (name, price, can_be_returned) VALUES('pony', '1000000.00', 'false');

-- products_db=# SELECT * FROM products;
--  id | name  |  price  | can_be_returned 
-- ----+-------+---------+-----------------
--   1 | chair |      44 | f
--   2 | stool |   25.99 | t
--   3 | table |     124 | f
--   4 | pony  | 1000000 | f
-- (4 rows)

----------------------------------------------------------------------------------------------------------

-- ********* 8. Display only the products that ***can_be_returned***

SELECT * FROM products WHERE can_be_returned;

-- products_db=# SELECT * FROM products WHERE can_be_returned;
--  id | name  | price | can_be_returned 
-- ----+-------+-------+-----------------
--   2 | stool | 25.99 | t
-- (1 row)

-- ****OR****
-- SELECT * FROM products WHERE can_be_returned = 'true';

-- products_db=# SELECT * FROM products WHERE can_be_returned = 'true';
--  id | name  | price | can_be_returned 
-- ----+-------+-------+-----------------
--   2 | stool | 25.99 | t
-- (1 row)

----------------------------------------------------------------------------------------------------------

-- ********* 9. Display only the products that have a price less than 44.00.

SELECT * FROM products WHERE price < '44.00';

-- (*** OR *** no quotes around 44.00)

-- products_db=# SELECT * FROM products WHERE price < '44.00';
--  id | name  | price | can_be_returned 
-- ----+-------+-------+-----------------
--   2 | stool | 25.99 | t
-- (1 row)

----------------------------------------------------------------------------------------------------------

-- ********* 10. Display only the products that have a price in between 22.50 and 99.99.

SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;

-- products_db=# SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;
--  id | name  | price | can_be_returned 
-- ----+-------+-------+-----------------
--   1 | chair |    44 | f
--   2 | stool | 25.99 | t
-- (2 rows)

-- *** OR ****
-- SELECT * FROM products WHERE price > 22.50 AND price < 99.99;

-- products_db=# SELECT * FROM products WHERE price > 22.50 AND price < 99.99;
--  id | name  | price | can_be_returned 
-- ----+-------+-------+-----------------
--   1 | chair |    44 | f
--   2 | stool | 25.99 | t
-- (2 rows)

----------------------------------------------------------------------------------------------------------

-- ********* 11. There’s a sale going on: Everything is $20 off! Update the database accordingly.

UPDATE products SET price = (price - 20);

-- products_db=# UPDATE products SET price = (price - 20);
-- UPDATE 4
-- products_db=# SELECT * FROM products;
--  id | name  |       price       | can_be_returned 
-- ----+-------+-------------------+-----------------
--   1 | chair |                24 | f
--   2 | stool | 5.989999999999998 | t
--   3 | table |               104 | f
--   4 | pony  |            999980 | f
-- (4 rows)

----------------------------------------------------------------------------------------------------------

-- ********* 12. Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria.

DELETE FROM products WHERE price < 25;

-- products_db=# DELETE FROM products WHERE price < 25;
-- DELETE 2
-- products_db=# SELECT * FROM products;
--  id | name  | price  | can_be_returned 
-- ----+-------+--------+-----------------
--   3 | table |    104 | f
--   4 | pony  | 999980 | f
-- (2 rows)

-- products_db=# 

----------------------------------------------------------------------------------------------------------

-- ********* 13. And now the sale is over. For the remaining products, increase their price by $20.

UPDATE products SET price = (price + 20);

-- products_db=# UPDATE products SET price = (price + 20);
-- UPDATE 2
-- products_db=# SELECT * FROM products;
--  id | name  |  price  | can_be_returned 
-- ----+-------+---------+-----------------
--   3 | table |     124 | f
--   4 | pony  | 1000000 | f
-- (2 rows)

----------------------------------------------------------------------------------------------------------

-- ********* 14. There is a new company policy: everything is returnable. Update the database accordingly.

UPDATE products SET can_be_returned = true;

-- products_db=# UPDATE products SET can_be_returned = true;
-- UPDATE 2
-- products_db=# SELECT * FROM products;
--  id | name  |  price  | can_be_returned 
-- ----+-------+---------+-----------------
--   3 | table |     124 | t
--   4 | pony  | 1000000 | t
-- (2 rows)