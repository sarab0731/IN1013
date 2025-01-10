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
    phone_num CHAR(11)); /* from reservations */

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
    dish_status ENUM('available','unavailable') NOT NULL DEFAULT 'available' );

CREATE TABLE rating (
    order_number INT NOT NULL,
    rating_value INT NOT NULL CHECK (rating_value BETWEEN 1 AND 5),
    feedback VARCHAR(255),
    FOREIGN KEY (order_number) REFERENCES purchase(order_number),
    PRIMARY KEY (order_number));


/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO employee VALUES
(1, 'Head Chef', 'Gordon Ramsay', 90000.00),
(2, 'Sous Chef', 'Rita Oconnel', 60000.00),
(3, 'Line Cook', 'Lochlan Barrett', 40000.00),
(4, 'Line Cook', 'Farid Chouder', 41000.00),
(5, 'Server', 'Emily Davis', 30000.00),
(6, 'Server', 'Daniel Powers', 29500.00),
(7, 'Host', 'Sarah Thorley', 32000.00),
(8, 'Manager', 'Michael Brown', 70000.00),
(9, 'Server', 'Sophia Larkins', 29500.00),
(10, 'Sous Chef', 'Chris Taylor', 58000.00),
(11, 'Head Chef', 'Hana Meitah', 90000.00),
(12, 'Host', 'Olivia Martin', 33000.00),
(13, 'Server', 'James Green', 31000.00),
(14, 'Line Cook', 'Anna Tapia', 42000.00),
(15, 'Manager', 'Henry Vasquez', 75000.00);

INSERT INTO dish VALUES
('Garlic Bread', 'Appetizer', 4.99, 'available'),
('Chicken Teriyaki', 'Main course', 15.99, 'unavailable'),
('Grilled Salmon', 'Main course', 18.99, 'available'),
('Fruit Tart', 'Dessert', 7.99, 'available'),
('Beef Burger', 'Main course', 14.99, 'available'),
('Panna Cotta', 'Dessert', 6.50, 'available'),
('Bruschetta', 'Appetizer', 5.50, 'available'),
('Ribeye Steak', 'Main course', 22.99, 'available'),
('Mushroom Risotto', 'Main course', 16.99, 'available'),
('Chicken Wings', 'Appetizer', 7.99, 'available'),
('Mango Sorbet', 'Dessert', 4.50, 'available'),
('Margherita Pizza', 'Main course', 11.99, 'available'),
('Tiramisu', 'Dessert', 6.99, 'unavailable'),
('Chocolate Cake', 'Dessert', 5.99, 'available'),
('Caesar Salad', 'Appetizer', 7.99, 'available');

/* Sample data representing orders and customers over a 4-month period (December 2023- March 2024)*/

INSERT INTO customer VALUES
(1, 'Alice Towner', '07123456789'),
(11, 'Bob Green', NULL),
(12, 'Charlie Brown', '07222233344'),
(23, 'Esha Khan', '07333344455'),
(55, 'Georgia Black', NULL),
(65, 'Frankie Hawkins', NULL),
(98, 'Grace Smith', '07666677788'),
(104, 'Ellie Holland', NULL),
(115, 'Dennis Craigs', '07100011122'),
(188, 'Laura Adams', '07888899900'),
(208, 'Mabel Tapia', NULL),
(233, 'Kylie Lee', NULL);


INSERT INTO purchase VALUES
(1  , 231224, 1808, 145.76, 1  , 5),
(32 , 231231, 1020, 30.97 , 11 , 6),
(39 , 240101, 1242, 22.98 , 23 , 5),
(51 , 240103, 1958, 150.72, 12 , 5),
(89 , 240107, 0918, 25.98 , 55 , 6),
(102, 240114, 2048, 28.98 , 12 , 13),
(143, 240126, 1312, 40.95 , 65 , 6),
(179, 240201, 1035, 32.64 , 23 , 5),
(201, 240210, 1247, 55.77 , 104, 5),
(255, 240212, 1408, 60.89 , 12 , 13),
(300, 240223, 1834, 22.55 , 188, 9),
(358, 240226, 1445, 27.89 , 233, 13),
(402, 240227, 1901, 48.97 , 23 , 5),
(487, 240304, 1218, 18.98 , 104, 9),
(554, 240310, 2031, 33.79 , 98 , 13),
(618, 240314, 2053, 88.43 , 208, 5),
(701, 240324, 1614, 16.98 , 115, 9);

INSERT INTO rating VALUES
(1, 5, "Emily was amazing, super friendly and made us feel welcome"),
(32, 4, "Daniel got everything right, no complaints!"),
(51, 5, "Our server was great, made sure we had everything we needed!"),
(89, 1, "We waited ages to get seated, and the server never apologized."),
(102, 1, "James was polite and quick, food came fast too :)"),
(143, 4, "Good service overall, but the place was kinda loud"),
(179, 5, "Highly recommend. The server was really helpful with the menu"),
(300, 2, "The server kept mixing up orders, and we had to correct her a few times"),
(487, 3, "Sophia was nice but seemed a bit busy. Food took a while"),
(554, 4, "Pretty good! Server was friendly and checked on us"),
(618, 3, "Service was ok, but not super family-friendly."),
(701, 1, "Food was cold and the service wasn't great");

                     
/* SECTION 3 - UPDATE STATEMENTS */

/* 
1)  set the rating (1) to 5, for order 102
*/
UPDATE rating SET rating_value = 5 WHERE order_number = 102;

/*
2) give a 5% salary raise to the highest performing server (i.e. taken the most orders)
*/

UPDATE employee
SET salary = salary * 1.05
WHERE employeeID = (
    SELECT employeeID
    FROM (
        SELECT employeeID, COUNT(order_number) AS total_orders
        FROM purchase
        GROUP BY employeeID
        ORDER BY total_orders DESC
        LIMIT 1
    ) AS top_performer
);

/* SECTION 4 - SELECT STATEMENTS */

/* 
1)  List each customer's ID, name, and the total amount they have spent.
*/

SELECT c.customerID, full_name, SUM(p.total) AS total_spent
FROM customer c
INNER JOIN purchase p ON c.customerID = p.customerID
GROUP BY c.customerID
ORDER BY total_spent DESC;

/* 
2)  List all available vegetarian main course items
*/

SELECT * FROM dish
WHERE category = 'Main course' AND dish_status = 'available'
AND NOT (dish_name LIKE '%chicken%'
  OR dish_name LIKE '%beef%'
  OR dish_name LIKE '%salmon%'
  OR dish_name LIKE '%steak%');

/* 
3)  Find the names of all the regulars, alongside the number of their visits and total amount spent  
*/

SELECT 
    full_name AS regular_name, 
    COUNT(p.order_number) AS num_orders,
    SUM(p.total) AS total_spent
FROM customer c
INNER JOIN purchase p ON c.customerID = p.customerID
GROUP BY c.customerID
HAVING COUNT(order_number) > 1;

/* 
4)  List all severs that have a rating assigned to them and the averages of all their ratings
*/

SELECT 
    e.employeeID AS serverID, 
    emp_name AS name, 
    AVG(rating_value) AS avg_rating
FROM employee e
INNER JOIN purchase p ON e.employeeID = p.employeeID
INNER JOIN rating r ON p.order_number = r.order_number
GROUP BY e.employeeID;

/* 
5)  List the servers who served at least one order during dinner time (6pm-9pm) in January 2024
*/

SELECT
    employeeID, emp_name AS name
FROM employee e
WHERE EXISTS (  SELECT order_time
                FROM purchase p
                WHERE e.employeeID = p.employeeID
                AND order_time BETWEEN 1800 AND 2100
                AND order_date BETWEEN 240101 AND 240131 );

/* 
6)  List customers who gave poor ratings (1 or 2) and have a valid phone number
*/

SELECT c.customerID, full_name, phone_num
FROM customer c
INNER JOIN purchase p ON c.customerID = p.customerID
INNER JOIN rating r ON p.order_number = r.order_number
WHERE rating_value BETWEEN 1 AND 2
AND phone_num IS NOT NULL;

/* 
7)  Categorises customers based on their behaviour: those with high-spending orders (total >100) 
    and those who give low ratings (rating_value ≤ 2)
*/

SELECT c.customerID, c.full_name, 'High Spender' AS behaviour
FROM customer c
INNER JOIN purchase p ON c.customerID = p.customerID
WHERE p.total > 100
UNION
SELECT c.customerID, c.full_name, 'Low Rating Giver' AS behaviour
FROM customer c
INNER JOIN purchase p ON c.customerID = p.customerID
INNER JOIN rating r ON p.order_number = r.order_number
WHERE r.rating_value <= 2;

/* 
8) List the number of orders placed during different meal times (breakfast, brunch, lunch, dinner)
*/

SELECT 
    CASE                    
        WHEN order_time BETWEEN 0700 AND 1030 THEN 'Breakfast'      /*www.w3schools.com/sql/sql_case.asp*/
        WHEN order_time BETWEEN 1031 AND 1130 THEN 'Brunch'
        WHEN order_time BETWEEN 1131 AND 1600 THEN 'Lunch'
        WHEN order_time BETWEEN 1601 AND 2200 THEN 'Dinner'
        ELSE 'Other'
    END AS meal_time,
    COUNT(*) AS num_orders
FROM purchase
GROUP BY meal_time
ORDER BY num_orders DESC;


/* SECTION 5 - DELETE ROWS */

/*
1) Delete all rows from the rating table for orders placed by customers who don't have a phone number recorded
*/

DELETE FROM rating
WHERE order_number IN (
    SELECT order_number
    FROM purchase
    WHERE customerID IN (
        SELECT customerID
        FROM customer
        WHERE phone_num IS NULL
    )
);

/*
2) Delete all unavailable dishes
*/

DELETE FROM dish WHERE dish_status = 'unavailable';

/* SECTION 6 - DROP TABLES */

DROP TABLE rating;
DROP TABLE purchase;
DROP TABLE dish;
DROP TABLE employee;
DROP TABLE customer;

SHOW TABLES;