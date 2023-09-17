--======================================================
--River Deters
--CIS332: Database and SQL
--UNIT 4, CHAPTER 5 Assignment
--======================================================

--Clean-up & Preparation for Running the Script--
START C:\Users\15154\Downloads\JLDB_Build_5.sql;

--Describe Orders to see column names--
DESC ORDERS;

--Hands On 1--
INSERT INTO ORDERS (ORDER#, CUSTOMER#, ORDERDATE)
VALUES (1021, 1009, 'July 20, 2009');

--Error when adding date is due to the format of the date (all existing dates in table are set to DD-MON-YY format)--
SELECT *
FROM ORDERS;

--Hands On 2--
UPDATE ORDERS
SET SHIPZIP = 33222
WHERE ORDER# = 1017;

SELECT *
FROM ORDERS;

--Hands On 3--
COMMIT;

--Describe Books to see column names & ISBN for an example test--
DESC BOOKS;
SELECT *
FROM BOOKS;

--Hands On 6--
UPDATE BOOKS
SET Cost = &Cost
WHERE ISBN = &ISBN;

SELECT *
FROM BOOKS;

--Hands On 9--
DELETE FROM ORDERS
WHERE ORDER# = 1005;

SELECT *
FROM ORDERS;

--Hands On 10--
ROLLBACK;
