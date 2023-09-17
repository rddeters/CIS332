--====================================================== 
--RIVER DETERS
--CIS332: Database and SQL
--UNIT 6, CHAPTER 9 Assignment 1
--======================================================

--Clean-up & Preparation for Running the Script--
START C:\Users\15154\Downloads\JLDB_Build_8.sql;
START C:\Users\15154\Downloads\JLDB_Build_9.sql;

-- Hands on #1 --
SELECT b.title, b.pubid, p.contact, p.phone
FROM books b JOIN publisher p ON b.pubid = p.pubid
ORDER BY b.title;

-- Hands on #2 --
SELECT o.order#, c.lastname, c.firstname
FROM orders o JOIN customers c ON c.customer# = o.customer#
WHERE o.shipdate IS NULL
AND c.state = 'FL'
ORDER BY o.orderdate;

-- Hands on #4 --
SELECT DISTINCT b.title
FROM books b JOIN orderitems oi ON b.isbn = oi.isbn
JOIN orders o ON oi.order# = o.order#
JOIN customers c ON o.customer# = c.customer#
WHERE c.firstname = 'JAKE' AND c.lastname = 'LUCAS';

-- Hands on #10 --
SELECT e.lname AS employee_last_name, e.fname AS employee_first_name, e.job, m.lname AS manager_last_name, m.fname AS manager_first_name
FROM employees e JOIN employees m ON e.mgr = m.empno
ORDER BY m.empno;