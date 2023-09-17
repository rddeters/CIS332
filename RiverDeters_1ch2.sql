--====================================================== 
--RIVER DETERS
--CIS332: Database and SQL
--UNIT 1, CHAPTER 2 Assignment
--======================================================

--Hands-on 1--
SELECT *
    from books;

--Hands-on 2--    
SELECT title
    from books;
    
--Hands-on 3--
SELECT title, pubdate as "Publication Date"
    from books;
 
--Hands-on 4--   
SELECT customer#, city, state
    from customers;

--Hands-on 5--  
SELECT name || ', ' || contact || ' ' || phone as "Contact Person"
    from publisher;
    
--Hands-on 6--
SELECT UNIQUE category
    from books;
   
--Hands-on 7-- 
SELECT UNIQUE customer#
    from orders;
    
--Hands-on 8--
SELECT category, title
    from books;
    
--Hands-on 9--
SELECT lname || ', ' || fname as "Author Names"
    from author;
    
--Hands-on 10--
SELECT order#, item#, isbn, quantity, paideach, (quantity * paideach) as "Item Total"
    from orderitems;
    
--Advanced Challenge 1--
SELECT lastname || ', ' || firstname as "Name", address || ' ' || city || ', ' || state || ' ' || zip as "Location"
    from customers;
    
--Advanced Challenge 2--
SELECT title, (retail - cost) / cost * 100 as "Profit %"
    from books;
