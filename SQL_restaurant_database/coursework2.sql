/*
Student name: Sara Boumrah       
Student ID: 230022374
*/

/* SECTION 1 - CREATE TABLE STATEMENTS */

CREATE Table employee (
    employeeID VARCHAR(5) NOT NULL PRIMARY KEY,
    emp_role ENUM('Cook','Server','') NOT NULL,
    emp_name VARCHAR(50) NOT NULL,
    salary INTEGER(7),
);

CREATE Table customer (
    full_name VARCHAR(50) NOT NULL,
    phone_num CHAR(11) NOT NULL, 
    PRIMARY KEY(full_name,phone_num)
);

CREATE Table purchase (
    orderID VARCHAR(8) NOT NULL PRIMARY KEY,
    order_date INTEGER(6) NOT NULL, /*YYMMDD*/
    order_time INTEGER(4) NOT NULL, /*military time (1:38pm == 1338)*/
    total DECIMAL(7,2) NOT NULL,
    c_name VARCHAR(50) NOT NULL,
    c_phone_num CHAR(11) NOT NULL, 
    employeeID VARCHAR(5) NOT NULL,
    FOREIGN KEY(c_name,c_phone_num) REFERENCES customer(full_name,phone_num),
    FOREIGN KEY(employeeID) REFERENCES employee(employeeID)
);

CREATE Table dish (
    dish_name VARCHAR(50) NOT NULL PRIMARY KEY,
    category, /*e.g. appetizer, main course, dessert*/
    price DECIMAL(4,2),
    dish_status ENUM('available','unavailable'),
    recipe ,
);

CREATE Table stock (
    stockID INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    stock_name NOT NULL,
    quantity,
    supplier_name,
    date_supplied,
);



/* SECTION 2 - INSERT STATEMENTS */


                     
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