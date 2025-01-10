-- 1 List the names of customers who spent more than 450.00 on a single bill on occasions when ‘Charles’ was their Headwaiter.

SELECT DISTINCT b.cust_name
FROM restBill b
WHERE bill_total > 450
and waiter_no IN
	(SELECT staff_no
	FROM restStaff
	WHERE headwaiter = (SELECT staff_no
		FROM restStaff
		WHERE first_name = 'Charles'));


-- 2 A customer called Nerida has complained that a waiter was rude to her when she dined at the restaurant on the 11th January 2016. What is the name and surname of the Headwaiter who will have to deal with the matter?

SELECT first_name, surname
FROM restStaff
WHERE staff_no in
	(SELECT headwaiter
	FROM restStaff
	WHERE staff_no in
		(SELECT DISTINCT waiter_no
		FROM restBill
		WHERE bill_date = 160111
		and cust_name LIKE 'Nerida%'));
 
-- 3 What are the names of customers with the smallest bill?

SELECT DISTINCT cust_name
FROM restBill
WHERE bill_total =
	(SELECT min(bill_total) FROM restBill);

-- 4 List the names of any waiters who have not taken any bills.

SELECT first_name, surname
FROM restStaff
WHERE headwaiter IS NOT NULL and staff_no NOT IN
	(select DISTINCT waiter_no from restBill);

-- 5 Which customers had the largest single bill? List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.

SELECT cust_name, s.first_name, s.surname, rm.room_name, 
FROM restBill b
INNER JOIN restRest_table rt
ON b.table_no = rt.table_no
INNER JOIN restRoom_management rm
ON rt.room_name = rm.room_name
INNER JOIN restStaff s
ON rm.headwaiter = s.staff_no
WHERE b.bill_date = rm.room_date and bill_total =
	(select max(bill_total) FROM restBill); 