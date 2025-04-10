
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;


CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    email TEXT
);


CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    order_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    price DECIMAL(10, 2)
);

CREATE TABLE order_items (
    item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, email) VALUES
(1, 'Alice Johnson', 'alice@example.com'),
(2, 'Bob Smith', 'bob@example.com'),
(3, 'Charlie Davis', 'charlie@example.com'),
(4, 'Diana King', 'diana@example.com');

INSERT INTO products (product_id, product_name, category, price) VALUES
(101, 'Wireless Mouse', 'Electronics', 25.99),
(102, 'USB-C Cable', 'Electronics', 9.99),
(103, 'Notebook', 'Stationery', 3.49),
(104, 'Water Bottle', 'Fitness', 12.99),
(105, 'Desk Lamp', 'Home', 29.99);

INSERT INTO orders (order_id, customer_id, order_date, order_amount) VALUES
(1001, 1, '2023-08-01', 51.98),
(1002, 2, '2023-08-03', 43.97),
(1003, 1, '2023-08-05', 29.99),
(1004, 3, '2023-08-07', 25.98);

INSERT INTO order_items (item_id, order_id, product_id, quantity, price) VALUES
(1, 1001, 101, 2, 25.99),
(2, 1002, 102, 3, 9.99),
(3, 1003, 105, 1, 29.99),
(4, 1004, 103, 2, 3.49),
(5, 1004, 104, 1, 12.99);
