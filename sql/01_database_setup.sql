CREATE TABLE customers (customer_id INTEGER PRIMARY KEY, customer_name VARCHAR(120), gender VARCHAR(20), age INTEGER, city VARCHAR(80), customer_segment VARCHAR(40), signup_date DATE);
CREATE TABLE categories (category_id INTEGER PRIMARY KEY, category_name VARCHAR(80));
CREATE TABLE products (product_id INTEGER PRIMARY KEY, product_name VARCHAR(150), category_id INTEGER REFERENCES categories(category_id), cost_price NUMERIC(10,2), selling_price NUMERIC(10,2));
CREATE TABLE orders (order_id INTEGER PRIMARY KEY, customer_id INTEGER REFERENCES customers(customer_id), order_date DATE, status VARCHAR(30), payment_method VARCHAR(40));
CREATE TABLE order_items (order_item_id INTEGER PRIMARY KEY, order_id INTEGER REFERENCES orders(order_id), product_id INTEGER REFERENCES products(product_id), quantity INTEGER, unit_price NUMERIC(10,2), discount_pct NUMERIC(5,2));
CREATE TABLE payments (payment_id INTEGER PRIMARY KEY, order_id INTEGER REFERENCES orders(order_id), payment_date DATE, payment_method VARCHAR(40), amount NUMERIC(12,2), payment_status VARCHAR(30));
