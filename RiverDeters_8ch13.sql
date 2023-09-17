--====================================================== 
--RIVER DETERS
--CIS332: Database and SQL
--UNIT 8, CHAPTER 13 Assignment
--======================================================

--Clean-up & Preparation for Running the Script--
START C:\Users\15154\Downloads\JLDB_Build_8.sql;
START C:\Users\15154\Downloads\JLDB_Build_12.sql;

--Drop Views--
DROP VIEW CONTACT;
DROP VIEW HOMEWORK13;
DROP VIEW REORDERINFO;

--Hands On #1--
CREATE VIEW CONTACT AS
SELECT name, phone
FROM publisher;

--Hands On #2--
CREATE OR REPLACE VIEW CONTACT AS
SELECT name, phone
FROM publisher
WITH READ ONLY;

--Hands On #3--
CREATE OR REPLACE VIEW HOMEWORK13 AS
SELECT Col1, Col2
FROM (
    SELECT Col1, Col2
    FROM FIRSTATTEMPT
    UNION ALL
    SELECT NULL AS Col1, NULL AS Col2 FROM DUAL WHERE 1 = 0
);

--Hands On #4--
DESC HOMEWORK13;

--Hands On #5--
CREATE VIEW REORDERINFO AS
SELECT b.isbn, b.title, p.name AS CONTACT_NAME, p.phone AS CONTACT_PHONE
FROM books b
JOIN publisher p ON b.pubid = p.pubid;