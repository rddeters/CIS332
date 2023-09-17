--======================================================
--River Deters
--CIS332: Database and SQL
--UNIT 4, CHAPTER 6 Assignment
--======================================================

DROP SEQUENCE orders_customer#_seq;
DROP TABLE email_log;
DROP SEQUENCE MY_FIRST_SEQ;

-- Clean-up & Preparation for Running the Script
START C:\Users\15154\Downloads\JLDB_Build_5.sql;

-- View all rows in the ORDERS table
SELECT *
FROM ORDERS;

-- Hands on 1--
CREATE SEQUENCE orders_customer#_seq
INCREMENT BY 1
START WITH 1000
NOCYCLE
NOCACHE;

-- Hands on 2--
INSERT INTO CUSTOMERS (CUSTOMER#, LASTNAME, FIRSTNAME, ZIP)
VALUES (orders_customer#_seq.NEXTVAL, 'Shoulders', 'Frank', '23567');

-- Hands on 3--
CREATE SEQUENCE MY_FIRST_SEQ
INCREMENT BY -3
START WITH 5
MINVALUE 0
MAXVALUE 6
NOCYCLE;

-- Hands on 4--
SELECT MY_FIRST_SEQ.NEXTVAL FROM DUAL;
SELECT MY_FIRST_SEQ.NEXTVAL FROM DUAL;
SELECT MY_FIRST_SEQ.NEXTVAL FROM DUAL;

-- Hands on 5--
ALTER SEQUENCE MY_FIRST_SEQ MINVALUE -1000;

-- Hands on 6--
CREATE TABLE email_log
(
  emailid NUMERIC GENERATED ALWAYS AS IDENTITY,
  emaildate DATE,
  customer# NUMERIC,
  PRIMARY KEY (emailid)
);

DESC email_log;

INSERT INTO email_log (emaildate, customer#)
VALUES (CURRENT_DATE, 1007);

INSERT INTO email_log (emaildate, customer#)
VALUES (CURRENT_DATE, 1008);

INSERT INTO email_log (emailid, emaildate, customer#)
VALUES (25, CURRENT_DATE, 1009);

SELECT * FROM email_log;

-- Hands on 7--
CREATE SYNONYM NUMGEN FOR MY_FIRST_SEQ;

-- Hands on 8--
SELECT NUMGEN.CURRVAL FROM DUAL;

DROP SYNONYM NUMGEN;
DROP SEQUENCE MY_FIRST_SEQ;

-- Hands on 10 --
CREATE INDEX idx_customers_lastname
ON CUSTOMERS (Lastname);

SELECT index_name
FROM user_indexes
WHERE table_name = 'CUSTOMERS' AND index_name = 'IDX_CUSTOMERS_LASTNAME';

DROP INDEX idx_customers_lastname;

SELECT index_name
FROM user_indexes
WHERE table_name = 'CUSTOMERS' AND index_name = 'IDX_CUSTOMERS_LASTNAME';
