-- Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Sales Representatives
CREATE TABLE sales_reps (
    rep_id INT PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);

-- Products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    rep_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (rep_id) REFERENCES sales_reps(rep_id)
);

-- Order Items
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    discount DECIMAL(5,2) DEFAULT 0,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample Data

INSERT INTO customers VALUES
(1001, 'Rahul', 'Mumbai'),
(1002, 'Priya', 'Delhi'),
(1003, 'Amit', 'Bangalore'),
(1004, 'Sneha', 'Mumbai'),
(1005, 'Karan', 'Chennai');

INSERT INTO sales_reps VALUES
(1, 'Arjun'),
(2, 'Neha'),
(3, 'Vikram');

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 50000),
(2, 'Shirt', 'Clothing', 1500),
(3, 'Milk', 'Groceries', 60),
(4, 'Phone', 'Electronics', 30000),
(5, 'Shoes', 'Footwear', 2500);

INSERT INTO orders VALUES
(101, 1001, 1, '2024-01-10'),
(102, 1002, 2, '2024-01-11'),
(103, 1003, 3, '2024-01-12'),
(104, 1004, 1, '2024-01-13'),
(105, 1005, 2, '2024-01-14');

INSERT INTO order_items VALUES
(101, 1, 1, 0),
(102, 2, 2, 5),
(103, 3, 5, 0),
(104, 4, 1, 10),
(105, 5, 2, 0);
