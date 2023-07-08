/*

STEP 1: SELECTING RELEVANT DATA

*/


/*

Customers and their order details

*/

SELECT
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name) AS customer_name
		, Customers.city, Customers.state, Orders.order_date
FROM sales.orders AS Orders
JOIN sales.customers AS Customers
ON Orders.customer_id = Customers.customer_id


/*

Sales volume and total revenue generated (plus customer & their order details)

*/

SELECT
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name) AS customer_name
		, Customers.city, Customers.state, Orders.order_date
		, SUM(Items.quantity) AS total_Units, SUM(Items.quantity * Items.list_price) AS revenue
FROM sales.orders AS Orders
JOIN sales.customers AS Customers
ON Orders.customer_id = Customers.customer_id
JOIN sales.order_items AS Items
ON Orders.order_id = Items.order_id
GROUP BY 
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name)
		, Customers.city, Customers.state, Orders.order_date


/*

Product name, sales, customer and order details

*/

SELECT
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name) AS customer_name
		, Customers.city, Customers.state, Orders.order_date
		, SUM(Items.quantity) AS total_Units, SUM(Items.quantity * Items.list_price) AS revenue
		, Products.product_name
FROM sales.orders AS Orders
JOIN sales.customers AS Customers
ON Orders.customer_id = Customers.customer_id
JOIN sales.order_items AS Items
ON Orders.order_id = Items.order_id
JOIN production.products AS Products
ON Items.product_id = Products.product_id
GROUP BY 
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name)
		, Customers.city, Customers.state, Orders.order_date, products.product_name


/*

Product category, product name, sales, customer and order details

*/


SELECT
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name) AS customer_name
		, Customers.city, Customers.state, Orders.order_date
		, SUM(Items.quantity) AS total_Units, SUM(Items.quantity * Items.list_price) AS revenue
		, Products.product_name, Categories.category_name
FROM sales.orders AS Orders
JOIN sales.customers AS Customers
ON Orders.customer_id = Customers.customer_id
JOIN sales.order_items AS Items
ON Orders.order_id = Items.order_id
JOIN production.products AS Products
ON Items.product_id = Products.product_id
JOIN production.categories AS Categories
ON Products.category_id = Categories.category_id
GROUP BY 
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name)
		, Customers.city, Customers.state, Orders.order_date, products.product_name, Categories.category_name



/*

Stores, product category, product name, sales, customer and order details

*/

SELECT
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name) AS customer_name
		, Customers.city, Customers.state, Orders.order_date
		, SUM(Items.quantity) AS total_Units, SUM(Items.quantity * Items.list_price) AS revenue
		, Products.product_name, Categories.category_name, Stores.store_name
FROM sales.orders AS Orders
JOIN sales.customers AS Customers
ON Orders.customer_id = Customers.customer_id
JOIN sales.order_items AS Items
ON Orders.order_id = Items.order_id
JOIN production.products AS Products
ON Items.product_id = Products.product_id
JOIN production.categories AS Categories
ON Products.category_id = Categories.category_id
JOIN sales.stores AS Stores
ON Orders.store_id = Stores.store_id
GROUP BY 
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name)
		, Customers.city, Customers.state, Orders.order_date, products.product_name, Categories.category_name
		, Stores.store_name



/*

Sales rep, stores, product category, product name, sales, customer and order details


*/


SELECT
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name) AS customer_name
		, Customers.city, Customers.state, Orders.order_date
		, SUM(Items.quantity) AS total_Units, SUM(Items.quantity * Items.list_price) AS revenue
		, Products.product_name, Categories.category_name, Stores.store_name
		, CONCAT(Staffs.first_name, ' ', Staffs.last_name) AS sales_rep
FROM sales.orders AS Orders
JOIN sales.customers AS Customers
ON Orders.customer_id = Customers.customer_id
JOIN sales.order_items AS Items
ON Orders.order_id = Items.order_id
JOIN production.products AS Products
ON Items.product_id = Products.product_id
JOIN production.categories AS Categories
ON Products.category_id = Categories.category_id
JOIN sales.stores AS Stores
ON Orders.store_id = Stores.store_id
JOIN sales.staffs AS Staffs
ON Orders.staff_id = Staffs.staff_id
GROUP BY 
		Orders.order_id, CONCAT (Customers.first_name, ' ', Customers.last_name)
		, Customers.city, Customers.state, Orders.order_date, products.product_name, Categories.category_name
		, Stores.store_name, CONCAT(Staffs.first_name, ' ', Staffs.last_name)



/*

STEP 2: DATA CLEANING

*/
