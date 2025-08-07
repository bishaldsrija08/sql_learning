CREATE DATABASE IF NOT EXISTS ORG;
SHOW DATABASES;
USE ORG;
USE TEMP;

CREATE TABLE Worker(
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT(15),
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(1, 'John',     'Doe',      50000, '2021-06-15', 'HR'),
(2, 'Jane',     'Smith',    60000, '2022-01-10', 'Finance'),
(3, 'Alice',    'Johnson',  55000, '2020-09-23', 'IT'),
(4, 'Bob',      'Brown',    45000, '2023-03-05', 'Marketing'),
(5, 'Charlie',  'Davis',    70000, '2019-11-30', 'Operations'),
(6, 'Emily',    'Wilson',   48000, '2021-08-19', 'HR'),
(7, 'Frank',    'Miller',   52000, '2020-04-11', 'Finance'),
(8, 'Grace',    'Lee',      65000, '2022-07-25', 'IT');

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(9, 'JohnS',     'DoeS',      NULL, '2021-06-15', 'IT');

SELECT * FROM Worker;
SELECT FIRST_NAME, SALARY, DEPARTMENT FROM Worker;
SELECT 66+44;
SELECT NOW();
SELECT lcase("BISHAL RIJAL");

SELECT FIRST_NAME, SALARY FROM Worker WHERE SALARY>50000;
SELECT FIRST_NAME, SALARY FROM Worker WHERE SALARY BETWEEN 50000 AND 100000;
SELECT * FROM Worker WHERE DEPARTMENT = "IT";
SELECT * FROM Worker WHERE DEPARTMENT = "IT" OR DEPARTMENT = "HR";
SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'Finance', 'IT'); -- HR FINANCE RW IT KO AUXA
SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'Finance', 'IT'); -- HR FINANCE RW IT BAYEK ARU AXUA
SELECT * FROM Worker WHERE SALARY IS NOT NULL;
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_o%';
SELECT * FROM Worker ORDER BY FIRST_NAME;
SELECT DISTINCT DEPARTMENT FROM Worker;
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT;

-- AVERAGE SALARY PER DEPARTMENT
SELECT DEPARTMENT, AVG(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- MINIMUM SALARY PER DEPARTMENT
SELECT DEPARTMENT, MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- MAX SALARY PER DEPARTMENT
SELECT DEPARTMENT, MAX(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- TOTAL SALARY PER DEPARTMENT
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT)>1;

-- GROUP BY HAVING
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT;

CREATE TABLE Bonus(
WORKER_REF_ID INT,
BONUS_AMOUNT INT(10),
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(1, 5000, '2023-12-25 10:00:00'),
(2, 3000, '2024-01-15 14:30:00'),
(3, 4500, '2024-02-10 09:00:00'),
(4, 2500, '2024-03-20 11:15:00'),
(5, 6000, '2023-11-05 16:45:00'),
(6, 3500, '2024-04-01 13:20:00'),
(7, 4000, '2024-05-10 08:00:00'),
(8, 5500, '2024-06-18 17:10:00');

SELECT * FROM Bonus;

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR (25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(1, 'Manager',        '2022-01-01 09:00:00'),
(2, 'Executive',      '2022-03-15 10:30:00'),
(3, 'Lead Developer', '2021-07-10 08:45:00'),
(4, 'Salesperson',    '2023-02-01 14:00:00'),
(5, 'Operations Head','2020-11-20 13:20:00'),
(6, 'HR Executive',   '2022-06-05 11:10:00'),
(7, 'Finance Lead',   '2021-09-17 16:00:00'),
(8, 'Software Engg',  '2023-05-25 12:45:00');

SELECT * FROM Title;


-- Creating another DB

CREATE DATABASE temp;
USE temp;
CREATE TABLE Customer(
id INT PRIMARY KEY,
cname VARCHAR(255),
address VARCHAR(255),
gender CHAR(2),
city VARCHAR(255),
pincode INT
);

INSERT INTO Customer (id, cname, address, gender, city, pincode) VALUES
(1, 'Amit Sharma', '123 MG Road', 'M', 'Delhi', 110001),
(2, 'Priya Verma', '56 Park Street', 'F', 'Kolkata', 700016),
(3, 'Ravi Patel', '89 Nehru Nagar', 'M', 'Ahmedabad', 380001),
(4, 'Sneha Iyer', '22 Churchgate', 'F', 'Mumbai', 400020),
(5, 'Karan Singh', '77 Civil Lines', 'M', 'Lucknow', 226001),
(6, 'Neha Gupta', '12 Residency Area', 'F', 'Indore', 452001),
(7, 'Vikram Das', '44 MG Marg', 'M', 'Pune', 411001),
(8, 'Asha Menon', '90 Marine Drive', 'F', 'Chennai', 600004);


CREATE TABLE Order_details(
    order_id INT,
    delivery_date DATE,
    cust_id INT,
    FOREIGN KEY(cust_id) REFERENCES Customer(id) -- Foreign key cust id jasle reference garxa customer table ko id
);

CREATE TABLE account (
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT,
CONSTRAINT acc_balance_chk CHECK(balance>1000)
);

INSERT INTO account (id, name, balance) VALUES
(1, 'Alice', 1500),
(2, 'Bob', 2500),
(3, 'Charlie', 3200),
(4, 'David', 500),
(5, 'Eva', 1800);

CREATE TABLE account (
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT NOT NULL DEFAULT 0
);

INSERT INTO account (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva');

SELECT * FROM account;

DROP TABLE account;

-- Add new column
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

-- Modefy
ALTER TABLE account MODIFY interest DOUBLE NOT NULL DEFAULT 0;

DESC account;

-- Rename the column

ALTER TABLE account CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN
ALTER TABLE account DROP COLUMN saving_interest;

-- Rename table name
ALTER TABLE account RENAME TO account_details;

INSERT INTO Order_details (order_id, delivery_date, cust_id) VALUES
(101, '2025-07-01', 1),
(102, '2025-07-05', 2),
(103, '2025-07-10', 3),
(104, '2025-07-15', 4),
(105, '2025-07-20', 5),
(106, '2025-07-22', 6),
(107, '2025-07-25', 7),
(108, '2025-07-28', 8),
(109, '2025-08-01', 2),
(110, '2025-08-03', 4);