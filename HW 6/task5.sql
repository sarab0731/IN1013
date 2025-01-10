-- 1
CREATE VIEW samsBills AS
(SELECT first_name, surname, bill_date, cust_name, bill_total
FROM restStaff
INNER JOIN restBill
ON restStaff.staff_no = restBill.waiter_no
WHERE staff_no = '004');

-- 2
SELECT * FROM samsBills
WHERE bill_total >= 400.00;

-- 3
CREATE VIEW roomTotals (room_name, total_sum) AS 
(SELECT room_name, sum(bill_total)
FROM restRest_table R
INNER JOIN restBill B
ON  R.table_no = B.table_no
GROUP BY room_name);

-- 4
CREATE VIEW teamTotals (headwaiter_name, total_sum) AS
(SELECT CONCAT(H.first_name, ' ', H.surname), sum(bill_total)
FROM restStaff S
INNER JOIN restStaff H
ON H.staff_no = S.headwaiter
INNER JOIN restBill B
WHERE S.staff_no = B.waiter_no
GROUP BY H.first_name, H.surname);