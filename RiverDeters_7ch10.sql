--====================================================== 
--RIVER DETERS
--CIS332: Database and SQL
--UNIT 7, CHAPTER 10 Assignment
--======================================================

--Clean-up & Preparation for Running the Script--
START C:\Users\15154\Downloads\JLDB_Build_8.sql;
START C:\Users\15154\Downloads\JLDB_Build_10.sql;

--Hands On #1--
SELECT INITCAP(lastname) AS "Last name", INITCAP(firstname) AS "First name"
FROM customers;

--Hands On #2--
SELECT customer#, NVL2(referred, 'REFERRED', 'NOT REFERRED') AS "Was referred"
FROM customers;

--Hands On #3--
SELECT b.title, '$' || TO_CHAR(ROUND(oi.quantity * (b.retail - b.cost))) AS "Profit"
FROM orders o
JOIN orderitems oi ON o.order# = oi.order#
JOIN books b ON oi.isbn = b.isbn
WHERE o.order# = 1002;

--Hands On #4--
SELECT title, TO_CHAR(ROUND((retail - cost) / cost * 100)) || '%' AS "Markup percentage"
FROM books;

--Hands On #5--
SELECT TO_CHAR(SYSDATE, 'D') AS "Day of the week",
       TO_CHAR(SYSDATE, 'HH24') AS "Hour",
       TO_CHAR(SYSDATE, 'MI') AS "Minutes",
       TO_CHAR(SYSDATE, 'SS') AS "Seconds"
FROM DUAL;
    
--Hands On #6--
SELECT title, LPAD(cost, 12, '*') AS "Retail cost"
FROM books;

--Hands On #7--
SELECT DISTINCT LENGTH(isbn) AS "ISBN length"
FROM books;

--Hands On #8--
SELECT title, pubdate, ABS(ROUND(MONTHS_BETWEEN(pubdate, SYSDATE))) AS "Date since publication"
FROM books;

--Hands On #9--
SELECT NEXT_DAY(SYSDATE, 'WEDNESDAY') AS "Next Wednesday"
FROM DUAL;

--Hands On #10--
SELECT customer#,
       SUBSTR(zip, 3, 2) AS "3rd and 4th of Zip Code",
       INSTR(customer#, '3') AS "First Position of 3"
FROM customers;