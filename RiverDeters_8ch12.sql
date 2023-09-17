--====================================================== 
--RIVER DETERS
--CIS332: Database and SQL
--UNIT 8, CHAPTER 12 Assignment
--======================================================

--Clean-up & Preparation for Running the Script--
START C:\Users\15154\Downloads\JLDB_Build_8.sql;
START C:\Users\15154\Downloads\JLDB_Build_12.sql;

--Hands On #1--
SELECT title, retail
FROM books
WHERE retail < (
    SELECT AVG(retail)
    FROM books
);

--Hands On #2--
SELECT title, retail, category
FROM books b
WHERE retail < (
    SELECT AVG(retail)
    FROM books
    WHERE category = b.category
);

--Hands On #3--
SELECT order#, shipstate
FROM orders
WHERE shipstate = (
    SELECT shipstate
    FROM orders
    WHERE order# = 1014
);

--Hands On #4--
SELECT order#, (paideach * quantity) AS "Order Total"
FROM orderitems
WHERE (paideach * quantity) > (
    SELECT (paideach * quantity)
    FROM orderitems
    WHERE order# = 1008
);

--Hands On #5--
SELECT a.fname, a.lname
FROM author a
JOIN bookauthor ba ON a.authorid = ba.authorid
WHERE ba.isbn IN (
    SELECT b.isbn
    FROM books b
    JOIN orderitems oi ON b.isbn = oi.isbn
    JOIN orders o ON oi.order# = o.order#
)
GROUP BY a.fname, a.LNAME
HAVING COUNT(DISTINCT ba.isbn) = (
    SELECT MAX(purchase_count)
    FROM (
        SELECT COUNT(DISTINCT ba.isbn) AS purchase_count
        FROM books b
        JOIN bookauthor ba ON b.isbn = ba.isbn
        JOIN orderitems oi ON b.isbn = oi.isbn
        JOIN orders o ON oi.order# = o.order#
        GROUP BY ba.authorid
    ) 
);

--Hands On #6--
SELECT DISTINCT b.title, b.category
FROM books b
JOIN orderitems oi ON b.ISBN = oi.ISBN
JOIN orders o ON oi.order# = o.order#
JOIN customers c ON o.customer# = c.customer#
WHERE b.category IN (
    SELECT DISTINCT b.category
    FROM books b
    JOIN orderitems oi ON b.ISBN = oi.ISBN
    JOIN orders o ON oi.order# = o.order#
    JOIN customers c ON o.customer# = c.customer#
    WHERE c.customer# = 1007
)
AND c.customer# <> 1007;

--Hands On #7--
SELECT shipcity, shipstate
FROM orders
WHERE shipdate = (
    SELECT shipdate
    FROM (
        SELECT shipdate, MONTHS_BETWEEN(shipdate, orderdate) AS month_diff
        FROM orders
        ORDER BY month_diff DESC
    )
    WHERE ROWNUM = 1
);

--Hands On #8--
SELECT c.lastname, c.firstname, b.retail
FROM customers c
JOIN orders o ON c.customer# = o.customer#
JOIN orderitems oi ON o.order# = oi.order#
JOIN books b ON oi.isbn = b.isbn
WHERE b.retail = (
    SELECT MIN(retail)
    FROM books
);

--Hands On #9--
SELECT COUNT(DISTINCT o.customer#) 
FROM orders o
JOIN orderitems oi ON o.order# = oi.order#
JOIN books b ON oi.isbn = b.isbn
JOIN bookauthor ba ON b.isbn = ba.isbn
WHERE ba.isbn IN (
    SELECT ba.isbn
    FROM bookauthor ba
    JOIN author a ON ba.authorid = a.authorid
    WHERE a.lname = 'Austin' AND a.fname = 'James'
);

--Hands On #10--
SELECT b.title
FROM books b
JOIN publisher p ON b.pubid = p.pubid
WHERE p.name = (
    SELECT p.name
    FROM books b
    JOIN publisher p ON b.pubid = p.pubid
    WHERE b.title = 'The Wok Way to Cook'
);
