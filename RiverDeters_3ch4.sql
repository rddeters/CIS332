--====================================================== 
--RIVER DETERS
--CIS332: Database and SQL
--UNIT 3, CHAPTER 4 Assignment
--======================================================

--1--
CREATE TABLE STORE_REPS (
  rep_ID NUMBER(5),
  last VARCHAR2(15),
  first VARCHAR2(10),
  comm CHAR(1)
);

ALTER TABLE STORE_REPS
MODIFY (rep_ID NUMBER(5) PRIMARY KEY,
        comm CHAR(1) DEFAULT 'Y');

DESCRIBE STORE_REPS;

--2--
ALTER TABLE STORE_REPS
MODIFY (last VARCHAR2(15) NOT NULL,
        first VARCHAR2(10) NOT NULL);
        
DESCRIBE STORE_REPS;

--3--
ALTER TABLE STORE_REPS
ADD CONSTRAINT check_comm_ck CHECK (comm IN ('Y', 'N'));

SELECT constraint_name, constraint_type
FROM all_constraints
WHERE table_name = 'STORE_REPS';

--4--
ALTER TABLE STORE_REPS
ADD (base_salary NUMBER(7,2));

DESCRIBE STORE_REPS;

ALTER TABLE STORE_REPS
ADD CONSTRAINT check_base_salary_ck CHECK (base_salary > 0);

SELECT constraint_name, constraint_type
FROM all_constraints
WHERE table_name = 'STORE_REPS';

--5--
CREATE TABLE BOOK_STORES (
  store_id NUMBER(8) PRIMARY KEY,
  name VARCHAR2(30) NOT NULL UNIQUE,
  contact VARCHAR2(30),
  rep_id NUMBER(5),
  CONSTRAINT rep_id_bookstores_fk FOREIGN KEY (rep_id) REFERENCES STORE_REPS (rep_id)
);

DESCRIBE BOOK_STORES;

--6--
ALTER TABLE BOOK_STORES
ADD CONSTRAINT rep_id_bookstores_fk FOREIGN KEY (rep_id) REFERENCES STORE_REPS (rep_id)

SELECT constraint_name, constraint_type
FROM all_constraints
WHERE table_name = 'BOOK_STORES';

--7--
ALTER TABLE BOOK_STORES
DROP CONSTRAINT rep_id_bookstores;

SELECT constraint_name, constraint_type
FROM all_constraints
WHERE table_name = 'BOOK_STORES';

ALTER TABLE BOOK_STORES
ADD CONSTRAINT rep_id_bookstores_fk FOREIGN KEY (rep_id) REFERENCES STORE_REPS (rep_id)
ON DELETE CASCADE;

SELECT constraint_name, constraint_type
FROM all_constraints
WHERE table_name = 'BOOK_STORES';

--8--
CREATE TABLE REP_CONTRACTS (
  store_id NUMBER(8),
  name NUMBER(5),
  quarter CHAR(3),
  rep_id NUMBER(5),
  PRIMARY KEY (rep_id, store_id, quarter),
  CONSTRAINT store_id_repcontracts_fk FOREIGN KEY (store_id) REFERENCES BOOK_STORES (store_id),
  CONSTRAINT rep_id_repcontracts_fk FOREIGN KEY (rep_id) REFERENCES STORE_REPS (rep_id)
);

DESCRIBE REP_CONTRACTS;

--9--
SELECT constraint_name, constraint_type
FROM all_constraints
WHERE table_name = 'STORE_REPS';

--10--
ALTER TABLE STORE_REPS
DISABLE CONSTRAINT check_base_salary_ck;

SELECT constraint_name, constraint_type
FROM all_constraints
WHERE table_name = 'STORE_REPS';

ALTER TABLE STORE_REPS
ENABLE CONSTRAINT check_base_salary_ck;

SELECT constraint_name, constraint_type
FROM all_constraints
WHERE table_name = 'STORE_REPS';

--Drop all tables--
DROP TABLE REP_CONTRACTS;
DROP TABLE BOOK_STORES;
DROP TABLE STORE_REPS;
