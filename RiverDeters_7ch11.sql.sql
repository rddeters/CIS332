--====================================================== 
--RIVER DETERS
--CIS332: Database and SQL
--UNIT 7, CHAPTER 11 Assignment
--======================================================

--Clean-up & Preparation for Running the Script--
START C:\Users\15154\Downloads\JLDB_Build_8.sql;
START C:\Users\15154\Downloads\JLDB_Build_11.sql;

--Hands On #1--
SELECT COUNT(*) AS "Book Count"
FROM books
WHERE category = 'COOKING';

--Hands On #2--
SELECT COUNT(*) AS "Books for more than $30"
FROM books
WHERE retail > 30.00;

--Hands On #3--
SELECT MAX(pubdate) AS "Most recent publication"
FROM books;

--Hands On #5--
SELECT MIN(retail) AS "Least expensive computer book"
FROM books b
WHERE b.category = 'COMPUTER';

--Hands On #6--
SELECT AVG(ROUND(oi.quantity * (b.retail - b.cost))) AS "Average profit"
FROM orders o
JOIN orderitems oi ON o.order# = oi.order#
JOIN books b ON oi.isbn = b.isbn;

--Hands On #7--
SELECT customer#, COUNT(*) AS "Number of orders per customer"
FROM orders
GROUP BY customer#
HAVING MAX(orderdate) >= ADD_MONTHS(CURRENT_DATE, -12);

--Hands On #8--
SELECT p.name, b.category, AVG(b.retail) AS "Average retail price"
FROM books b
JOIN publisher p ON b.pubid = p.pubid
WHERE b.category IN ('CHILDREN', 'COMPUTER')
GROUP BY p.name, b.category
HAVING AVG(b.retail) > 50.00;

--Hands On #9--
SELECT c.customer#, c.firstname, c.lastname
FROM customers c
JOIN orders o ON c.customer# = o.customer#
JOIN orderitems oi ON o.order# = oi.order#
WHERE c.state IN ('GEORGIA', 'FLORIDA')
  AND oi.paideach > 80.00
  AND o.orderdate >= ADD_MONTHS(CURRENT_DATE, -3);