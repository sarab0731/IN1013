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
    full_name VARCHAR(50),
    phone_num CHAR(11)); /* from reservations */

CREATE Table purchase (
    order_number INT NOT NULL PRIMARY KEY,
    order_date DATE NOT NULL,
    order_time INT(4) NOT NULL, /*military time (1:38pm == 1338)*/
    total DECIMAL(7,2) NOT NULL,
    customerID INT NOT NULL,
    employeeID INT NOT NULL,
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
(1  , '23-12-24', 1808, 145.76, 1  , 5),
(32 , '23-12-31', 1020, 30.97 , 11 , 6),
(39 , '24-01-01', 1242, 22.98 , 23 , 5),
(51 , '24-01-03', 1958, 150.72, 12 , 5),
(89 , '24-01-07', 0918, 25.98 , 55 , 6),
(102, '24-01-14', 2048, 28.98 , 12 , 13),
(143, '24-01-26', 1312, 40.95 , 65 , 6),
(179, '24-02-01', 1035, 32.64 , 23 , 5),
(201, '24-02-10', 1247, 55.77 , 104, 5),
(255, '24-02-12', 1408, 60.89 , 12 , 13),
(300, '24-02-23', 1834, 22.55 , 188, 9),
(358, '24-02-26', 1445, 27.89 , 233, 13),
(402, '24-02-27', 1901, 48.97 , 23 , 5),
(487, '24-03-04', 1218, 18.98 , 104, 9),
(554, '24-03-10', 2031, 33.79 , 98 , 13),
(618, '24-03-14', 2053, 88.43 , 208, 5),
(701, '24-03-24', 1614, 16.98 , 115, 9);

INSERT INTO rating VALUES
(1, 5, "Emily was amazing, super friendly and made us feel welcome"),
(32, 4, "Daniel got everything right, no complaints!"),
(51, 5, "Our server was great, made sure we had everything we needed!"),
(89, 1, "We waited ages to get seated, and the server never apologized."),
(102, 1, "James was polite and quick, food came fast too :)"),
(143, 4, "Good service overall, but the place was kinda loud"),
(179, 5, "Highly recommend. The server was really helpful with the menu"),
(300, 2, "The server kept mixing up orders, and we had to correct her a few times"),
(487, 4, "Sophia was nice but seemed a bit busy. Food took a while"),
(554, 4, "Pretty good! Server was friendly and checked on us"),
(618, 3, "Service was ok, but not super family-friendly."),
(701, 1, "Food was cold and the service wasn't great");

                     
/* SECTION 3 - UPDATE STATEMENTS */

/* 1)  set the rating (1) to 5, for order 102 */
UPDATE rating SET rating_value = 5 WHERE order_number = 102;

/* 2) give a 5% salary raise to the highest performing server (i.e. taken the most orders) */

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

/* 1)  List the names of all servers that haven't had a morning shift. */
select '1)' AS '';

SELECT e.emp_name
FROM employee e
WHERE emp_role = 'server' 
    AND NOT EXISTS (
        SELECT order_number
        FROM purchase p
        WHERE 
            p.employeeID = e.employeeID
            AND p.order_time BETWEEN 0700 AND 1030 );

/* 2)  List all available vegetarian main course items */
select '2)' AS '';

SELECT * FROM dish
WHERE category = 'Main course' AND dish_status = 'available'
AND NOT (dish_name LIKE '%chicken%'
  OR dish_name LIKE '%beef%'
  OR dish_name LIKE '%salmon%'
  OR dish_name LIKE '%steak%');

/* 3)  Find the names of all the regulars, alongside the number of their visits, total amount spent, and average rating  */
select '3)' AS '';

SELECT 
    c.customerID,
    full_name AS regular_name, 
    COUNT(p.order_number) AS num_orders,
    SUM(p.total) AS total_spent,
    AVG(r.rating_value) AS avg_rating_given
FROM customer c
INNER JOIN purchase p ON c.customerID = p.customerID
LEFT JOIN rating r ON p.order_number = r.order_number
GROUP BY c.customerID
HAVING COUNT(p.order_number) > 1
ORDER BY total_spent DESC;

/* 4)  List all severs that have a rating assigned to them and the averages of all their ratings*/
select '4)' AS '';

SELECT 
    e.employeeID AS serverID, 
    emp_name AS name, 
    AVG(rating_value) AS avg_rating
FROM employee e
INNER JOIN purchase p ON e.employeeID = p.employeeID
INNER JOIN rating r ON p.order_number = r.order_number
GROUP BY e.employeeID
ORDER BY AVG(rating_value) DESC;

/* 5) List the average rating per day of the week */
select '5)' AS '';

SELECT 
    d.day_of_week,
    AVG(r.rating_value) AS avg_rating
FROM 
    (SELECT 'Monday' AS day_of_week UNION
     SELECT 'Tuesday' UNION
     SELECT 'Wednesday' UNION
     SELECT 'Thursday' UNION
     SELECT 'Friday' UNION
     SELECT 'Saturday' UNION
     SELECT 'Sunday') AS d
LEFT JOIN purchase p ON DAYNAME(p.order_date) = d.day_of_week
LEFT JOIN rating r ON p.order_number = r.order_number
GROUP BY d.day_of_week;

/* 6)  List customers who gave poor ratings (1 or 2) and have a valid phone number */
select '6)' AS ''; 

SELECT c.customerID, full_name, phone_num
FROM customer c
INNER JOIN purchase p ON c.customerID = p.customerID
INNER JOIN rating r ON p.order_number = r.order_number
WHERE rating_value BETWEEN 1 AND 2
AND phone_num IS NOT NULL;

/* 7)  Categorise customers based on their rating behaviour (i.e., "High Rater," "Low Rater") and show the total amount they have spent */
select '7)' AS '';

SELECT 
    c.customerID, 
    full_name, 
    'High Rater' AS rating_category, 
    SUM(p.total) AS total_spent
FROM customer c
INNER JOIN purchase p ON c.customerID = p.customerID
INNER JOIN rating r ON p.order_number = r.order_number
GROUP BY c.customerID
HAVING AVG(r.rating_value) >= 3
UNION
SELECT 
    c.customerID, 
    full_name, 
    'Low Rater' AS rating_category, 
    SUM(p.total) AS total_spent
FROM customer c
INNER JOIN purchase p ON c.customerID = p.customerID
INNER JOIN rating r ON p.order_number = r.order_number
GROUP BY c.customerID
HAVING AVG(r.rating_value) <= 2
ORDER BY total_spent DESC;

/* 8) List the number of orders placed during different meal times (breakfast, brunch, lunch, dinner) */
select '8)' AS '';

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


/*1) Delete all rows from the rating table for orders placed by customers who don't have a phone number recorded */

DELETE FROM rating
WHERE order_number IN (
    SELECT order_number
    FROM purchase
    WHERE customerID IN (
        SELECT customerID
        FROM customer
        WHERE phone_num IS NULL)
);


/*2) Delete all unavailable dishes */

DELETE FROM dish WHERE dish_status = 'unavailable';

/* SECTION 6 - DROP TABLES */

DROP TABLE rating;
DROP TABLE purchase;
DROP TABLE dish;
DROP TABLE employee;
DROP TABLE customer;

SHOW TABLES;