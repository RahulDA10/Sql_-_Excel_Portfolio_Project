CREATE DATABASE PIZZA_DB;
USE PIZZA_DB;


CREATE TABLE pizza_sales (
    pizza_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    pizza_name_id VARCHAR(50) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    order_date DATE NOT NULL,
    order_time TIME NOT NULL,
    unit_price DECIMAL(5,2) NOT NULL,
    total_price DECIMAL(7,2) NOT NULL,
    pizza_size ENUM('S', 'M', 'L', 'XL', 'XXL') NOT NULL,
    pizza_category VARCHAR(50) NOT NULL,
    pizza_ingredients VARCHAR(255),
    pizza_name VARCHAR(200) NOT NULL
);


SHOW VARIABLES LIKE 'secure_file_priv';
SET GLOBAL local_infile = 1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pizza_sales.csv'
INTO TABLE pizza_sales
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


select * from pizza_sales limit 5;












