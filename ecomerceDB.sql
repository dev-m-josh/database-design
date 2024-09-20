--ecommerce database
--- needed data
----users
        --id
        --email
        --password
        --userName
        --user address
----products
        --product category
                        --category id
                        --category name
        --products table
                    --product id
                    --category id
                    --product name
                    --description
                    --product image
        --
----products added to cart
                    --cart id
                    --user id
        --user shopping cart item
                    --id
                    --cart id
                    --product id
                    --quantity
----orders
        --id
        --user id
        --order date
        --

CREATE DATABASE ecommerce_db

USE ecommerce_db

---customers table
CREATE TABLE users (
    user_id INT PRIMARY KEY IDENTITY(1, 1),
    user_name VARCHAR(50),
    user_email VARCHAR(200),
    user_password VARCHAR(255),
    user_address VARCHAR(50)
)

---insert data to the users table
INSERT INTO users (user_name, user_email, user_password, user_address) 
VALUES ('JOhn Doe', 'johndoe@gmail.com', 'password123', 'murima'),
        ('Jayden Smith', 'jaydensmith@gmail.com', 'jay@003', 'kisumu'),
        ('John Kamau', 'kamaus@gmail.com', '12345678', 'nairobi'),
        ('Jane Chebet', 'jane@gmail.com', 'jane@secure', 'nakuru'),
        ('Juma Hamisa', 'hamisa@gmail.com', 'hamis1234', 'mombasa')

DROP TABLE users;

---products_category table
CREATE TABLE products_category(
    category_id INT  PRIMARY KEY IDENTITY(1, 1),
    category_name VARCHAR(50) 
)

INSERT INTO products_category(category_name)
VALUES  ('cars'),
        ('shoes'),
        ('clothes'),
        ('accesories')

SELECT * FROM products_category;


---products table
CREATE TABLE products(
    product_id INT  PRIMARY KEY IDENTITY(1, 1),
    category_id INT FOREIGN KEY REFERENCES products_category(category_id),
    product_name VARCHAR(50),
    product_description VARCHAR(255),
    product_image VARCHAR(150)
)

INSERT INTO products(category_id, product_name, product_description, product_image)
VALUES(1, 'probox', 'A commercial and durable vehicle', 'image_url'),
        (2, 'airmax', 'Best shoe for jogging', 'image_url'),
        (3, 'gucci T-shirt', 'gucci', 'image_url'),
        (4, 'lenovo', 'A portable and fast laptop', 'image_url')

SELECT * FROM products;

----products added to cart by users
CREATE TABLE cart(
    cart_id INT PRIMARY KEY IDENTITY(1, 1),
    user_id INT FOREIGN KEY REFERENCES users(user_id),
)

INSERT INTO cart(user_id)
VALUES  (1),
        (3),
        (2)

SELECT * FROM cart;

---users cart
CREATE TABLE shopping_cart(
    shopping_cart_id INT PRIMARY KEY IDENTITY(1, 1),
    cart_id INT FOREIGN KEY REFERENCES cart(cart_id),
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    quantity INT
)

INSERT INTO shopping_cart(cart_id, product_id, quantity)
VALUES  (1, 1, 10),
        (3, 3, 1),
        (2, 2, 5)

SELECT * FROM shopping_cart;


---ORDERS
CREATE TABLE orders(
    order_id INT PRIMARY KEY IDENTITY(1, 1),
    user_orders INT FOREIGN KEY REFERENCES shopping_cart(shopping_cart_id),
    order_date TIMESTAMP
)

INSERT INTO orders(user_id)
VALUES(1),
(3)

SELECT * FROM orders

