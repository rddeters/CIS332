--====================================================== 
--RIVER DETERS
--CIS332: Database and SQL
--UNIT 6, CHAPTER 9 Assignment 2
--======================================================

--Clean-up & Preparation for Running the Script--
START C:\Users\15154\Downloads\JLDB_Build_8.sql;
START C:\Users\15154\Downloads\JLDB_Build_9.sql;

-- Hands on #3 --
SELECT DISTINCT c.lastname, c.firstname
FROM orders o, customers c, books b
WHERE b.category = 'COMPUTER'
AND c.state = 'FL';

-- Hands on #7 --
SELECT p.gift
FROM promotion p, orders o, orderitems oi, books b
WHERE o.order# = oi.order#
AND b.title = 'SHORTEST POEMS'
AND oi.paideach BETWEEN p.minretail AND p.maxretail;

-- Hands on #9 --
SELECT b.title, oi.order#,c.state
FROM books b LEFT OUTER JOIN orderitems oi ON b.isbn = oi.isbn
LEFT OUTER JOIN orders o ON oi.order# = o.order#
LEFT OUTER JOIN customers c ON o.customer# = c.customer#
ORDER BY b.title;
