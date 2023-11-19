-- -----------------------------------------------------
-- Schema hoa_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS db_app;
CREATE SCHEMA IF NOT EXISTS db_app;
USE db_app;

-- -----------------------------------------------------
-- Table customer
-- -----------------------------------------------------
CREATE TABLE customer(
customer_id INT NOT NULL,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
mobile_no INT(10) NOT NULL,
address VARCHAR(45) NOT NULL,
birthday DATE NOT NULL,
PRIMARY KEY (customer_id)
);

-- -----------------------------------------------------
-- Table vendor
-- -----------------------------------------------------
CREATE TABLE vendor(
vendor_id INT NOT NULL,
vendor_name VARCHAR(45) NOT NULL,
description VARCHAR(45) NOT NULL,
vendor_type VARCHAR(45) NOT NULL,
product_type VARCHAR(45) NOT NULL,
cost_per_set DECIMAL(10,2) NOT NULL,
PRIMARY KEY (vendor_id)
);

-- -----------------------------------------------------
-- Table employee
-- -----------------------------------------------------
CREATE TABLE employee(
employee_id INT NOT NULL,
first_name VARCHAR(45) NOT NULL,
last_name VARCHAR(45) NOT NULL,
gender ENUM('MALE', 'FEMALE') NOT NULL,
birthday DATE NOT NULL,
age INT NOT NULL,
position VARCHAR(45) NOT NULL,
salary DECIMAL(10,2) NOT NULL,
mobile_no INT(10) NOT NULL,
vendor_id INT NOT NULL,
PRIMARY KEY (employee_id),
FOREIGN KEY (vendor_id)
	REFERENCES vendor(vendor_id)
);

-- -----------------------------------------------------
-- Table venue
-- -----------------------------------------------------
CREATE TABLE venue(
venue_id INT NOT NULL,
venue_name VARCHAR(45) NOT NULL,
venue_size VARCHAR(45) NOT NULL,
venue_capacity INT NOT NULL,
cost DECIMAL(10,2) NOT NULL,
address VARCHAR(45) NOT NULL,
description VARCHAR(45) NOT NULL,
PRIMARY KEY (venue_id)
);

-- -----------------------------------------------------
-- Table vendor_transaction
-- -----------------------------------------------------
CREATE TABLE vendor_transaction(
transaction_id INT NOT NULL,
event_date DATE NOT NULL,
sets_ordered INT NOT NULL,
transaction_cost DECIMAL(10,2) NOT NULL,
transaction_status ENUM('completed', 'incomplete'),
vendor_id INT NOT NULL,
customer_id INT NOT NULL,
PRIMARY KEY (transaction_id),
FOREIGN KEY (vendor_id)
	REFERENCES vendor(vendor_id),
FOREIGN KEY (customer_id)
	REFERENCES customer(customer_id)
);

-- -----------------------------------------------------
-- Table vendor_payment
-- -----------------------------------------------------
CREATE TABLE vendor_payment(
payment_id INT NOT NULL,
payment DECIMAL(10,2),
pending_payment DECIMAL(10,2),
vendor_transaction_id INT NOT NULL,
PRIMARY KEY (payment_id),
FOREIGN KEY (vendor_transaction_id)
	REFERENCES vendor_transaction(transaction_id)
);

-- -----------------------------------------------------
-- Table venue_transaction
-- -----------------------------------------------------
CREATE TABLE venue_transaction(
transaction_id INT NOT NULL,
reservation_date DATE NOT NULL,
transaction_cost DECIMAL(10,2) NOT NULL,
transaction_status ENUM('completed', 'incomplete'),
venue_id INT NOT NULL,
customer_id INT NOT NULL,
PRIMARY KEY (transaction_id),
FOREIGN KEY (venue_id)
	REFERENCES venue(venue_id),
FOREIGN KEY (customer_id)
	REFERENCES customer(customer_id)
);

-- -----------------------------------------------------
-- Table venue_payment
-- -----------------------------------------------------
CREATE TABLE venue_payment(
payment_id INT NOT NULL,
payment DECIMAL(10,2),
pending_payment DECIMAL(10,2),
venue_transaction_id INT NOT NULL,
PRIMARY KEY (payment_id),
FOREIGN KEY (venue_transaction_id)
	REFERENCES venue_transaction(transaction_id)
);
