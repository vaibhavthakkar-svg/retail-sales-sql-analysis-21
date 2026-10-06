-- ============================================================
-- Retail Sales Database: Schema + Seed Data
-- Compatible with SQLite 3.25+, PostgreSQL, MySQL 8.0+
-- ============================================================

-- Drop tables if they exist (for re-runs)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- ============================================================
-- TABLE DEFINITIONS
-- ============================================================

CREATE TABLE customers (
    customer_id   INTEGER PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    email         VARCHAR(150),
    region        VARCHAR(50)
);

CREATE TABLE products (
    product_id    INTEGER PRIMARY KEY,
    product_name  VARCHAR(100) NOT NULL,
    category      VARCHAR(50),
    unit_price    DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    order_id      INTEGER PRIMARY KEY,
    customer_id   INTEGER,
    order_date    DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id       INTEGER PRIMARY KEY,
    order_id      INTEGER,
    product_id    INTEGER,
    quantity      INTEGER NOT NULL,
    sale_price    DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================================================
-- SEED DATA: CUSTOMERS
-- ============================================================

INSERT INTO customers VALUES (1,  'Alice Martin',   'alice@email.com',   'North');
INSERT INTO customers VALUES (2,  'Bob Chen',        'bob@email.com',     'South');
INSERT INTO customers VALUES (3,  'Carol White',     'carol@email.com',   'East');
INSERT INTO customers VALUES (4,  'David Kim',       'david@email.com',   'West');
INSERT INTO customers VALUES (5,  'Eva Rossi',       'eva@email.com',     'North');
INSERT INTO customers VALUES (6,  'Frank Torres',    'frank@email.com',   'South');
INSERT INTO customers VALUES (7,  'Grace Patel',     'grace@email.com',   'East');
INSERT INTO customers VALUES (8,  'Henry Liu',       'henry@email.com',   'West');
INSERT INTO customers VALUES (9,  'Irene Nakamura',  'irene@email.com',   'North');
INSERT INTO customers VALUES (10, 'James Okafor',    'james@email.com',   'South');

-- ============================================================
-- SEED DATA: PRODUCTS
-- ============================================================

INSERT INTO products VALUES (1,  'Laptop Pro 15',      'Electronics',  1199.99);
INSERT INTO products VALUES (2,  'Wireless Mouse',      'Electronics',    29.99);
INSERT INTO products VALUES (3,  'USB-C Hub',           'Electronics',    49.99);
INSERT INTO products VALUES (4,  'Standing Desk',       'Furniture',     349.99);
INSERT INTO products VALUES (5,  'Ergonomic Chair',     'Furniture',     249.99);
INSERT INTO products VALUES (6,  'Notebook Pack',       'Stationery',      8.99);
INSERT INTO products VALUES (7,  'Ballpoint Pens x10',  'Stationery',      4.99);
INSERT INTO products VALUES (8,  'Whiteboard 36x24',    'Office',          59.99);
INSERT INTO products VALUES (9,  'Coffee Maker',        'Appliances',      89.99);
INSERT INTO products VALUES (10, 'Air Purifier',        'Appliances',     129.99);
INSERT INTO products VALUES (11, 'Monitor 27"',         'Electronics',    399.99);
INSERT INTO products VALUES (12, 'Desk Lamp',           'Furniture',       34.99);
-- Product 13 intentionally never ordered (for query 7)
INSERT INTO products VALUES (13, 'Fax Machine',         'Office',          79.99);

-- ============================================================
-- SEED DATA: ORDERS
-- ============================================================

INSERT INTO orders VALUES (1,  1,  '2024-01-05');
INSERT INTO orders VALUES (2,  2,  '2024-01-18');
INSERT INTO orders VALUES (3,  3,  '2024-02-02');
INSERT INTO orders VALUES (4,  4,  '2024-02-20');
INSERT INTO orders VALUES (5,  5,  '2024-03-11');
INSERT INTO orders VALUES (6,  6,  '2024-03-25');
INSERT INTO orders VALUES (7,  7,  '2024-04-08');
INSERT INTO orders VALUES (8,  8,  '2024-04-19');
INSERT INTO orders VALUES (9,  9,  '2024-05-03');
INSERT INTO orders VALUES (10, 10, '2024-05-22');
INSERT INTO orders VALUES (11, 1,  '2024-06-14');
INSERT INTO orders VALUES (12, 2,  '2024-06-30');
INSERT INTO orders VALUES (13, 3,  '2024-07-09');
INSERT INTO orders VALUES (14, 4,  '2024-07-21');
INSERT INTO orders VALUES (15, 5,  '2024-08-05');
INSERT INTO orders VALUES (16, 1,  '2024-09-10');
INSERT INTO orders VALUES (17, 6,  '2024-09-28');
INSERT INTO orders VALUES (18, 7,  '2024-10-15');
INSERT INTO orders VALUES (19, 8,  '2024-10-30');
INSERT INTO orders VALUES (20, 9,  '2024-11-12');
INSERT INTO orders VALUES (21, 10, '2024-11-25');
INSERT INTO orders VALUES (22, 1,  '2024-12-03');
-- Order 23: intentionally has no items (for query 5)
INSERT INTO orders VALUES (23, 2,  '2024-12-20');

-- ============================================================
-- SEED DATA: ORDER ITEMS
-- ============================================================

INSERT INTO order_items VALUES (1,  1,  1,  1, 1199.99);
INSERT INTO order_items VALUES (2,  1,  2,  2,   29.99);
INSERT INTO order_items VALUES (3,  2,  3,  1,   49.99);
INSERT INTO order_items VALUES (4,  2,  9,  1,   89.99);
INSERT INTO order_items VALUES (5,  3,  4,  1,  349.99);
INSERT INTO order_items VALUES (6,  3,  6,  3,    8.99);
INSERT INTO order_items VALUES (7,  4,  5,  1,  249.99);
INSERT INTO order_items VALUES (8,  4, 11,  1,  399.99);
INSERT INTO order_items VALUES (9,  5,  2,  1,   29.99);
INSERT INTO order_items VALUES (10, 5,  7,  5,    4.99);
INSERT INTO order_items VALUES (11, 6,  8,  1,   59.99);
INSERT INTO order_items VALUES (12, 6, 10,  1,  129.99);
INSERT INTO order_items VALUES (13, 7,  1,  1, 1199.99);
INSERT INTO order_items VALUES (14, 7,  3,  2,   49.99);
INSERT INTO order_items VALUES (15, 8,  4,  1,  349.99);
INSERT INTO order_items VALUES (16, 8, 12,  2,   34.99);
INSERT INTO order_items VALUES (17, 9,  9,  2,   89.99);
INSERT INTO order_items VALUES (18, 9,  6,  4,    8.99);
INSERT INTO order_items VALUES (19, 10, 5,  1,  249.99);
INSERT INTO order_items VALUES (20, 10, 2,  3,   29.99);
INSERT INTO order_items VALUES (21, 11, 11, 1,  399.99);
INSERT INTO order_items VALUES (22, 11,  3, 1,   49.99);
INSERT INTO order_items VALUES (23, 12,  1, 1, 1199.99);
INSERT INTO order_items VALUES (24, 13,  4, 2,  349.99);
INSERT INTO order_items VALUES (25, 14,  5, 1,  249.99);
INSERT INTO order_items VALUES (26, 14,  8, 1,   59.99);
INSERT INTO order_items VALUES (27, 15,  2, 2,   29.99);
INSERT INTO order_items VALUES (28, 15, 10, 1,  129.99);
INSERT INTO order_items VALUES (29, 16,  1, 1, 1199.99);
INSERT INTO order_items VALUES (30, 16,  7, 10,   4.99);
INSERT INTO order_items VALUES (31, 17,  9, 1,   89.99);
INSERT INTO order_items VALUES (32, 17, 12, 1,   34.99);
INSERT INTO order_items VALUES (33, 18,  1, 2, 1199.99);
INSERT INTO order_items VALUES (34, 19,  4, 1,  349.99);
INSERT INTO order_items VALUES (35, 19,  6, 5,    8.99);
INSERT INTO order_items VALUES (36, 20, 11, 1,  399.99);
INSERT INTO order_items VALUES (37, 21,  5, 2,  249.99);
INSERT INTO order_items VALUES (38, 22,  1, 1, 1199.99);
INSERT INTO order_items VALUES (39, 22,  3, 3,   49.99);