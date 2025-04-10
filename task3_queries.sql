SELECT * FROM orders
WHERE order_date BETWEEN '2023-08-01' AND '2023-08-31'
ORDER BY order_amount DESC;


SELECT c.customer_name, o.order_id, o.order_date, o.order_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;


SELECT c.customer_id, c.customer_name, SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


SELECT product_id, product_name
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM order_items
    WHERE quantity > 1
);



CREATE VIEW high_value_customers AS
SELECT c.customer_id, c.customer_name, SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING total_spent > 50;
SELECT * FROM high_value_customers;


SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 3;


CREATE INDEX idx_order_items_order_id ON order_items(order_id);
SHOW INDEX FROM order_items;

