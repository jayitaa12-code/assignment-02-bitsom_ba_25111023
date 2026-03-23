-- Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    city VARCHAR(50)
);

-- Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order Items
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(5,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample Inserts

INSERT INTO customers VALUES
(1001, 'Mumbai'),
(1002, 'Delhi'),
(1003, 'Bangalore'),
(1004, 'Mumbai'),
(1005, 'Chennai');

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 50000),
(2, 'Shirt', 'Clothing', 1500),
(3, 'Milk', 'Groceries', 60),
(4, 'Phone', 'Electronics', 30000),
(5, 'Shoes', 'Footwear', 2500);

INSERT INTO orders VALUES
(101, 1001, '2024-01-10'),
(102, 1002, '2024-01-11'),
(103, 1003, '2024-01-12'),
(104, 1004, '2024-01-13'),
(105, 1005, '2024-01-14');

INSERT INTO order_items VALUES
(101, 1, 1, 0),
(102, 2, 2, 5),
(103, 3, 5, 0),
(104, 4, 1, 10),
(105, 5, 2, 0);