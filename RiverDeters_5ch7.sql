--====================================================== 
--RIVER DETERS
--CIS332: Database and SQL
--UNIT 5, CHAPTER 7 Assignment
--======================================================

-- Hands on #1 --
CREATE USER rdeters;

-- Hands on #3 --
GRANT CONNECT, CREATE TABLE, ALTER ANY TABLE
TO rdeters;

-- Hands on #4 --
CREATE ROLE CUSTOMERREP;

GRANT INSERT, DELETE ON ORDERS 
TO CUSTOMERREP;

GRANT INSERT, DELETE ON ORDERITEMS 
TO CUSTOMERREP;

-- Hands on #6 --
SELECT * 
FROM USER_SYS_PRIVS;

SELECT * 
FROM USER_ROLE_PRIVS;

-- Hands on #9 --
DROP ROLE CUSTOMERREP;