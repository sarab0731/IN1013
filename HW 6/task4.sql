-- 1 Which waiters have taken 2 or more bills on a single date? List the waiter names and surnames, the dates and the number of bills they have taken.

SELECT first_name, surname, bill_date, count(*)
FROM restStaff
INNER JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
GROUP BY first_name, surname, bill_date
HAVING count(*) >= 2;

-- 2 List the rooms with tables that can server more than 6 people and how many of such tables they have.

SELECT room_name, count(*)
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3 List the names of the rooms and the total amount of bills in each room.

SELECT room_name, sum(bill_total)
FROM restBill
INNER JOIN restRest_table rt
ON restBill.table_no = rt.table_no
GROUP BY rt.room_name;

-- 4 List the headwaiter’s name and surname and the total bill amount their waiters have taken. Order the list by total bill amount, largest first.

SELECT s2.first_name, s2.surname, sum(bill_total)
FROM restBill b
INNER JOIN restStaff s1 ON b.waiter_no = s1.staff_no
INNER JOIN restStaff s2 ON s1.headwaiter = s2.staff_no
GROUP BY s2.first_name, s2.surname
ORDER BY sum(bill_total) desc;

-- 5 List any customers who have spent more than £400 on average.

SELECT cust_name
FROM restBill
GROUP BY cust_name
HAVING avg(bill_total) > 400;

-- 6 Which waiters have taken 3 or more bills on a single date? List the waiter names, surnames, and the number of bills they have taken.

SELECT first_name, surname, count(*)
FROM restStaff
INNER JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
GROUP BY first_name, surname, bill_date
HAVING count(*) >= 3;