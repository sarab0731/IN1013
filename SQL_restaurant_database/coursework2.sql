/*
Student name: Sara Boumrah       
Student ID: 230022374
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE Table employee (
    employeeID INT NOT NULL PRIMARY KEY,
    emp_role ENUM('Head Chef','Sous Chef','Line Cook','Server','Host','Manager') NOT NULL,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2));

CREATE Table customer (
    customerID INT NOT NULL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    phone_num CHAR(11) NOT NULL);

CREATE Table purchase (
    order_number INT NOT NULL PRIMARY KEY,
    order_date INT(6) NOT NULL, /*YYMMDD*/
    order_time INT(4) NOT NULL, /*military time (1:38pm == 1338)*/
    total DECIMAL(7,2) NOT NULL,
    customerID INT NOT NULL,
    employeeID INT,
    FOREIGN KEY(customerID) REFERENCES customer(customerID),
    FOREIGN KEY(employeeID) REFERENCES employee(employeeID));

CREATE Table dish (
    dish_name VARCHAR(50) NOT NULL PRIMARY KEY,
    category ENUM('Appetizer','Main course','Dessert'),
    price DECIMAL(4,2) NOT NULL,
    dish_status ENUM('available','unavailable') NOT NULL DEFAULT 'unavailable' );

CREATE TABLE rating (
    order_number INT NOT NULL,
    rating_value INT NOT NULL CHECK (rating_value BETWEEN 1 AND 5),
    feedback VARCHAR(255),
    FOREIGN KEY (order_number) REFERENCES purchase(order_number),
    PRIMARY KEY (order_number));


/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO employee (employeeID, emp_role, emp_name, salary) VALUES
(1, 'Head Chef', 'Gordon Ramsay', 85000.00),
(2, 'Sous Chef', 'Claire Smith', 60000.00),
(3, 'Line Cook', 'John Doe', 40000.00),
(4, 'Line Cook', 'Jane Smith', 41000.00),
(5, 'Server', 'Emily Davis', 30000.00),
(6, 'Server', 'Daniel Wilson', 29000.00),
(7, 'Host', 'Sarah Johnson', 32000.00),
(8, 'Manager', 'Michael Brown', 70000.00),
(9, 'Server', 'Sophia Lee', 29500.00),
(10, 'Sous Chef', 'Chris Taylor', 58000.00),
(11, 'Head Chef', 'Julia Child', 90000.00),
(12, 'Host', 'Olivia Martin', 33000.00),
(13, 'Server', 'James Anderson', 31000.00),
(14, 'Line Cook', 'Anna Roberts', 42000.00),
(15, 'Manager', 'Henry White', 75000.00);


INSERT INTO customer (customerID, full_name, phone_num) VALUES
(1001, 'Alice Walker', '07123456789'),
(1002, 'Bob Green', '07111122233'),
(1003, 'Charlie Brown', '07222233344'),
(1004, 'Diana Prince', '07333344455'),
(1005, 'Eve Black', '07444455566'),
(1006, 'Frank Castle', '07555566677'),
(1007, 'Grace Hall', '07666677788'),
(1008, 'Harry Styles', '07777788899'),
(1009, 'Ivy Adams', '07888899900'),
(1010, 'Jack Ryan', '07999900011'),
(1011, 'Kylie White', '07000011122'),
(1012, 'Liam Neeson', '07100011122'),
(1013, 'Maya Carter', '07200011122'),
(1014, 'Nathan Drake', '07300011122'),
(1015, 'Olivia Parker', '07400011122');


INSERT INTO dish (dish_name, category, price, dish_status) VALUES
('Caesar Salad', 'Appetizer', 7.50, 'available'),
('Garlic Bread', 'Appetizer', 5.00, 'available'),
('Chicken Alfredo', 'Main course', 15.00, 'available'),
('Grilled Salmon', 'Main course', 18.50, 'available'),
('Beef Burger', 'Main course', 12.00, 'available'),
('Margherita Pizza', 'Main course', 10.00, 'available'),
('Tiramisu', 'Dessert', 6.50, 'available'),
('Chocolate Cake', 'Dessert', 5.50, 'available'),
('Panna Cotta', 'Dessert', 6.00, 'available'),
('Bruschetta', 'Appetizer', 6.00, 'available'),
('Ribeye Steak', 'Main course', 22.00, 'unavailable'),
('Seafood Risotto', 'Main course', 16.50, 'available'),
('Fruit Tart', 'Dessert', 7.00, 'available'),
('Chicken Wings', 'Appetizer', 8.00, 'available'),
('Mango Sorbet', 'Dessert', 4.50, 'available');


INSERT INTO purchase (order_number, order_date, order_time, total, customerID, employeeID) VALUES
(1, 231230, 1808, 45.00, 1001, 5),
(2, 231230, 1839, 30.00, 1002, 6),
(3, 231230, 1842, 22.00, 1003, 5),
(4, 231230, 1901, 50.00, 1004, 5),
(5, 231230, 1918, 75.00, 1005, 6),
(6, 231231, 1208, 25.00, 1006, 13),
(7, 231231, 1212, 40.00, 1007, 9),
(8, 231231, 1235, 35.00, 1008, 5),
(9, 231231, 1247, 55.00, 1009, 9),
(10, 231231, 1308, 60.00, 1010, 13),
(11, 231231, 1334, 22.50, 1011, 5),
(12, 231231, 1345, 27.00, 1012, 13),
(13, 231231, 1401, 48.00, 1013, 5),
(14, 231231, 1418, 18.00, 1014, 9),
(15, 231231, 1432, 33.00, 1015, 13);
(13, 231231, 1503, 48.00, 1013, 5),
(14, 231231, 1614, 18.00, 1014, 9),

INSERT INTO rating (order_number, rating_value, feedback) VALUES
(1, 5, 'Excellent service and food!'),
(2, 4, 'Great experience overall.'),
(4, 5, 'Amazing staff and delicious dishes.'),
(5, 4, 'Very satisfied.'),
(7, 5, 'Perfect dining experience!'),
(8, 4, 'Good food but a bit noisy.'),
(9, 5, 'Highly recommend the dessert.'),
(10, 3, 'Service could be better.'),
(11, 4, 'Pretty good.'),
(13, 3, 'Mediocre.'),
(14, 1, 'Not impressed.'),

                     
/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 
1)  
*/



/*
2)
*/


/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs*/


/* 
1)  
*/
select '1)' AS '';



/* 
2)  
*/
select '2)' AS '';




/* 
3)  
*/
select '3)' AS '';



/* 
4)  
*/
select '4)' AS '';




/* 
5)  
*/
select '5)' AS '';



/* 
6)  
*/
select '6)' AS '';


/* 
7)  
*/
select '7)' AS '';



/* 
8)  
*/
select '8)' AS '';



/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/*
1)
*/

/*
2)
*/


/* SECTION 6 - DROP TABLES */



SHOW TABLES;