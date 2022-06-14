/* 
NAME: Usama Sidat
ID: 131034217
DATE: 12-03-2022
TITLE: DBS211-LAB 06
*/

-- 1. 
SELECT * 
FROM offices;

-- 2. 
SELECT employeenumber 
FROM employees 
WHERE 
    officecode=1;

-- 3. 
SELECT
    customernumber,
    customername,
    contactfirstname,
    contactlastname,
    phone
FROM customers
WHERE
    city='Paris';
    
-- 4. 

-- a. 
SELECT
    customernumber,
    customername,
    contactlastname || ' ' || contactfirstname AS fullname,
    phone
FROM customers
WHERE
    city='Paris';

-- b. 
SELECT
    customernumber,
    customername,
    contactlastname || ' ' || contactfirstname AS fullname,
    phone
FROM customers
WHERE
    country='Canada';

-- 5. 
SELECT DISTINCT customernumber
FROM payments;

-- 6. 
SELECT 
    customernumber,
    checknumber,
    amount
FROM payments
WHERE 
    amount NOT BETWEEN 30000 AND 65000
ORDER BY amount DESC;

-- 7. 
SELECT *
FROM orders
WHERE 
    status='Cancelled';

-- 8. 
-- a. 
SELECT 
    productcode,
    productname,
    buyprice,
    msrp,
    msrp - buyprice AS markup
FROM products;

-- b. 
SELECT 
    productcode,
    productname,
    buyprice,
    msrp,
    msrp - buyprice AS markup,
    round(100 * (msrp - buyprice) / buyprice, 1) AS percmarkup
FROM products;

-- 9. 
SELECT * 
FROM products
WHERE 
    productname LIKE '%Co%' OR productname LIKE '%co%' ;

-- 10. 
SELECT * 
FROM customers
WHERE 
    (contactfirstname LIKE 's%' OR contactfirstname LIKE 'S%') AND (contactfirstname LIKE '%e%' OR contactfirstname LIKE '%E%');

-- 11. 
INSERT INTO employees VALUES (1786, 'Sidat', 'Usama', 'NA', 'uisidat@myseneca.ca', 4, 1088, 'Cashier');

-- 12. 
SELECT *
FROM employees
WHERE 
    firstname='Usama';

-- 13. 
UPDATE employees SET jobtitle='Head Cashier'
WHERE 
    employeenumber=1786;

-- 14. 
INSERT INTO employees VALUES (1987, 'Fernandes', 'Londono', 'x8767', 'londonofernandes@test.com', 4, 1786, 'Cashier');

-- 15. 
-- No it did not work and my data was not deleted. This is because of referential integrity, where a field cannot be deleted if it has child dependencies.
DELETE 
FROM employees
WHERE 
    employeenumber=1786;

-- 16. 
-- Yes it did work, as it does not have any child dependencies now.
DELETE 
FROM employees
WHERE 
    employeenumber=1987;

DELETE 
FROM employees
WHERE employeenumber=1786;

-- 17. 
INSERT ALL
    INTO employees VALUES (1786, 'Sidat', 'Usama', 'NA', 'uisidat@myseneca.ca', 4, 1088, 'Head Cashier')
    INTO employees VALUES (1987, 'Fernandes', 'Londono', 'x8767', 'londonofernandes@test.com', 4, 1088, 'Cashier')
    SELECT * 
    FROM dual;
    
-- 18 
DELETE 
FROM employees
WHERE 
    employeenumber=1786 OR employeenumber=1987;


