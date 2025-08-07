USE temp;

CREATE TABLE Customer(
id INT PRIMARY KEY,
cname VARCHAR(255),
address VARCHAR(255),
gender CHAR(2),
city VARCHAR(255),
pincode INT
);

-- Insert in to table
INSERT INTO Customer (id, cname, address, gender, city, pincode)
VALUES (9, "Bishal", "Dorangi", "M", "Bhratpur", 44200);

-- Update from table
UPDATE Customer SET address="Mumbai", Gender="M" WHERE id=1; 

SET SQL_SAFE_UPDATES = 0;

-- Update multiple row
UPDATE Customer SET pincode=4545;

SELECT * FROM Customer;

DELETE FROM order_details;
DELETE FROM Customer;