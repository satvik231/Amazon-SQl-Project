-- Category Table
CREATE TABLE category
(
category_id	INT PRIMARY KEY,
category_name VARCHAR(25)
);

--Customer Table
CREATE TABLE customers
(
customer_id INT PRIMARY KEY	,
first_name VARCHAR(20),	
last_name VARCHAR(20),	
state VARCHAR(20),
address VARCHAR(20)
);

--Sellers Table
CREATE TABLE sellers
(
seller_id INT PRIMARY KEY,
seller_name VARCHAR(25),
origin VARCHAR(25)
);

-- Product Table
CREATE TABLE products
(
product_id INT PRIMARY KEY,	
product_name VARCHAR(50),
price FLOAT,	
cogs FLOAT,	
category_id INT,
CONSTRAINT product_fk_category FOREIGN KEY(category_id) REFERENCES category(category_id) 
);

--Orders Table
CREATE TABLE orders
(
order_id INT PRIMARY KEY,	
order_date DATE,	
customer_id INT, --FK 	
order_status VARCHAR(15),	
product_id INT, --FK	
seller_id INT,
CONSTRAINT orders_fk_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
CONSTRAINT orders_fk_products FOREIGN KEY(product_id) REFERENCES products(product_id),
CONSTRAINT orders_fk_sellers FOREIGN KEY(seller_id) REFERENCES sellers(seller_id)
);

--Orders Items Table
CREATE TABLE order_items
(
order_item_id INT PRIMARY KEY,
order_id INT,	
product_id INT,
quantity INT,	
price_per_unit FLOAT,
total_price FLOAT,
CONSTRAINT items_fk_orders FOREIGN KEY(order_id) REFERENCES orders(order_id),
CONSTRAINT items_fk_products FOREIGN KEY(product_id) REFERENCES products(product_id)
);

--Payment Table
CREATE TABLE payments
(
payment_id INT PRIMARY KEY,	
payment_date DATE,	
payment_mode VARCHAR(15),	
payment_status VARCHAR(15),
order_id INT,
CONSTRAINT payments_fk_orders FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

--Shiping Table
CREATE TABLE shipping
(
shipping_id INT PRIMARY KEY,
order_id INT,
delivery_status VARCHAR(20),
shipping_date DATE,
return_date DATE,
shipping_provider VARCHAR(50),
CONSTRAINT shipping_fk_orders FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

--Inventory Table
CREATE TABLE inventory
(
inventory_id INT PRIMARY KEY,	
product_id INT,	
stock INT,	
warehouse_id INT,	
last_stock_date DATE,
CONSTRAINT inventory_fk_products FOREIGN KEY(product_id) REFERENCES products(product_id)
);

SELECT *
FROM orders;
