/*
*NAME: USAMA SIDAT
*ID: 131034217
*EMAIL: uisidat@myseneca.ca
*TITLE: DBS211 LAB-7 DML-2
*/

--1
--a
SELECT 
    employeenumber,
    firstname,
    lastname,
    city,
    phone,
    extension,
    postalcode
FROM
    employees, offices
WHERE 
    employees.officecode = offices.officecode AND country='France';

--b
SELECT 
    employeenumber,
    firstname,
    lastname,
    city,
    phone,
    extension,
    postalcode
FROM employees 
    JOIN offices ON employees.officecode = offices.officecode
WHERE 
    country = 'France';


--2
SELECT
    c.customernumber,
    customername,
    TO_CHAR(paymentdate, 'DD-MON-YYYY') AS payment_date,
    amount
FROM customers c
    JOIN payments p ON c.customernumber = p.customernumber
WHERE
    country = 'Canada'
ORDER BY c.customernumber ;
    
    
--3
SELECT 
    c.customernumber,
    customername
FROM payments p
    RIGHT OUTER JOIN customers c ON p.customernumber = c.customernumber
WHERE p.customernumber IS NULL;


--4
--a
CREATE VIEW vwcustomerorder AS
SELECT 
    customernumber,
    o.ordernumber,
    orderdate,
    productname,
    quantityordered,
    priceeach
FROM orders o 
    JOIN orderdetails od ON o.ordernumber = od.ordernumber
    JOIN products p ON od.productcode = p.productcode;

--b
SELECT * 
FROM vwcustomerorder;


--5
SELECT 
    customernumber,
    od.ordernumber,
    orderdate,
    productname,
    vwc.quantityordered,
    vwc.priceeach,
    orderlinenumber
FROM vwcustomerorder  vwc
    JOIN orderdetails od ON vwc.ordernumber = od.ordernumber AND vwc.quantityordered = od.quantityordered
WHERE
    customernumber=124
ORDER BY 
    ordernumber, orderlinenumber;


--6
SELECT
    c.customernumber,
    contactfirstname,
    contactlastname,
    phone,
    creditlimit
FROM customers c
    LEFT OUTER JOIN orders o ON c.customernumber = o.customernumber
WHERE
    ordernumber IS NULL;


--7
CREATE VIEW vwemployeemanager AS
SELECT 
    e1.employeenumber,
    e1.lastname,
    e1.firstname,
    e1.extension,
    e1.email,
    e1.officecode,
    e1.jobtitle,
    e1.reportsto,
    e2.firstname AS rt_fname,
    e2.lastname AS rt_lname
FROM employees e1
    LEFT JOIN employees e2 ON e1.reportsto=e2.employeenumber
WHERE 
    e1.employeenumber IS NOT NULL 
ORDER BY e1.employeenumber;


--8
CREATE OR REPLACE VIEW vwemployeemanager AS
SELECT 
    e1.employeenumber,
    e1.lastname,
    e1.firstname,
    e1.extension,
    e1.email,
    e1.officecode,
    e1.jobtitle,
    e1.reportsto,
    e2.firstname AS rt_fname,
    e2.lastname AS rt_lname
FROM employees e1
    LEFT JOIN employees e2 ON e1.reportsto=e2.employeenumber
WHERE 
    e1.employeenumber IS NOT NULL  AND e1.reportsto IS NOT NULL
ORDER BY e1.employeenumber;


--9
-- I've used the simple DROP statements here for the joins because the BEGIN-EXCEPTION statement was giving me error when I ran the whole script.
-- Only this simple DROP statement is working fine for me, even though I checked on dbs211.ca and on the Internet as well.
DROP VIEW vwcustomerorder CASCADE CONSTRAINTS;

DROP VIEW vwemployeemanager CASCADE CONSTRAINTS;


    
