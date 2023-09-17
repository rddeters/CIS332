--====================================================== 
--RIVER DETERS
--CIS332: Database and SQL
--UNIT 5, CHAPTER 8 Assignment
--======================================================

--Clean-up & Preparation for Running the Script--
START C:\Users\15154\Downloads\JLDB_Build_8.sql;

--In your own session of SQL Developer, use SET commands to format the output / results
SPOOL C:\Users\15154\Desktop\Ch08_output.txt REPLACE

--Hands On #1--
SELECT firstname, lastname, state
FROM customers
WHERE state <= 'NJ';

--Hands On #2--
SELECT order#, shipdate
FROM orders
WHERE shipdate > '01-APR-09';

--Hands On #3--
SELECT title, category
FROM books
WHERE category != 'Fitness';

--Hands On #4--
SELECT customer#, lastname, state
FROM customers
WHERE state = 'GA' or state = 'NJ'
ORDER BY lastname;

SELECT customer#, lastname, state
FROM customers
WHERE state IN ('GA', 'NJ')
ORDER BY lastname;

--Hands On #5--
SELECT order#, orderdate
FROM orders
WHERE orderdate >= '01-APR-09';

SELECT order#, orderdate
FROM orders
WHERE orderdate > '01-APR-09' OR orderdate = '01-APR-09';

--Hands On #6--
SELECT lname, fname
FROM author
WHERE lname LIKE '%IN%'
ORDER BY lname, fname;

--Hands On #7--
SELECT lastname, referred
FROM customers
WHERE referred IS NOT NULL;

--Hands On #8--
SELECT title, category
FROM books
WHERE category LIKE '%CHILDREN%' OR category LIKE '%COOKING%';

SELECT title, category
FROM books
WHERE category = 'CHILDREN' OR category = 'COOKING';

SELECT title, category
FROM books
WHERE category IN ('CHILDREN', 'COOKING');

--Hands On #9--
SELECT isbn, title
FROM books
WHERE title LIKE '_A_N%'
ORDER BY title DESC;

--Hands On #10--
SELECT title, pubdate
FROM books
WHERE category = 'COMPUTER' AND pubdate BETWEEN '01-JAN-05' AND '31-DEC-05';

SELECT title, pubdate
FROM books
WHERE category = 'COMPUTER' AND pubdate >= '01-JAN-05' AND pubdate <= '31-DEC-05';

SELECT title, pubdate
FROM books
WHERE category = 'COMPUTER' AND pubdate LIKE '%05';

SPOOL OFF;
