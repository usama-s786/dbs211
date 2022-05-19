-- ----------------------------------
-- DBS211 - Lab 01
-- Name: Usama Sidat
-- StudentID: 131034217
-- Date: 16 Jan 2022
-- ----------------------------------


-- Question 1
/* How many tables have been created? List the names of the created tables. */

/*
There are a total of 8 tables created, the names are mentioned below:
    1)CUSTOMERS
    2)EMPLOYEES
    3)OFFICES
    4)ORDERDETAILS
    5)ORDERS
    6)PAYMENTS
    7)PRODUCTLINES
    8)PRODUCTS
*/
    
--Question 2
/* Click on table customers. Click on the Data tab near the top of the worksheet. How many rows are there in the table customers? */

/* 
There are a total of 122 rows in the table "CUSTOMERS".
*/

--Question 3
/* What SQL statement would return the same results. Write the statement in the .sql file and execute it.  

You will learn how to select rows and columns from a table by writing SQL select statements later in this course.
*/

SELECT COUNT (*) FROM CUSTOMERS;

/*
The above SQL statement will return the same result -> (122), i.e the total number of rows in the table "Customers"
*/

--Question 4
/* How many columns does the customers table have? List the column names.
*/

/* There are a total of 13 columns in the table "Customers". The names are mentioned below:
    1)CUSTOMERNUMBER
    2)CUSTOMERNAME
    3)CONTACTLASTNAME
    4)CONTACTFIRSTNAME
    5)PHONE
    6)ADDRESSLINE1
    7)ADDRESSLINE2
    8)CITY
    9)STATE
    10)POSTALCODE
    11)COUNTRY
    12)SALESREPEMPLOYEENUMBER
    13)CREDITLIMIT
*/
    
--Question 5
/* What is the value of each column in the first row in table customers? Write the column name and the column data type in addition to the value.
*/

/* 
Value of 1st column (CUSTOMERNUMBER) -          103,                Data type - NUMBER(38,0)
Value of 2nd column (CUSTOMERNAME) -            Atelier graphique,  Data type - VARCHAR2(50 BYTE)
Value of 3rd column (CONTACTLASTNAME) -         Schmitt,            Data type - VARCHAR2(50 BYTE)
Value of 4th column (CONTACTFIRSTNAME) -        Carine,             Data type - VARCHAR2(50 BYTE)
Value of 5th column (PHONE) -                   40.32.2555,         Data type - VARCHAR2(50 BYTE)
Value of 6th column (ADDRESSLINE1) -            54, rue Royale,     Data type - VARCHAR2(50 BYTE)
Value of 7th column (ADDRESSLINE2) -            (null),             Data type - VARCHAR2(50 BYTE)
Value of 8th column (CITY) -                    Nantes,             Data type - VARCHAR2(50 BYTE)
Value of 9th column (STATE) -                   (null),             Data type - VARCHAR2(50 BYTE)
Value of 10th column (POSTALCODE) -             44000,              Data type - VARCHAR2(15 BYTE)
Value of 11th column (COUNTRY) -                France,             Data type - VARCHAR2(50 BYTE)
Value of 12th column (SALESREPEMPLOYEENUMBER) - 1370,               Data type - NUMBER(38,0)
Value of 13th column (CREDITLIMIT) -            21000,              Data type - NUMBER(10,2)
*/

--Question 6
/* Write the number of rows and columns for the rest of the tables in your schema.  Format it something like the following.
*/

/*
---------------------------------------
Table Name		    Rows		Columns
------------        ----        -------
EMPLOYEES           23          8
OFFICES             7           9
ORDERDETAILS        2996        5
ORDERS              326         7
PAYMENTS            273         4
PRODUCTLINES        7           4
PRODUCTS            110         9
----------------------------------------
*/

--Question 7
/* Right Click on the orderdetails table and choose tables/count rows.  How many rows does the order details table include?
*/

/* 
The table ORDERDETAILS contains 2996 Rows
*/

--Question 8
/*  Write the following SQL statement in the new tab.
    desc offices; 
	You can also write
    describe offices;
	What is the result of the statement execution?
*/

describe offices;

/* 
This SQL statement basically describes the details of the OFFICES table.
It returns all the column's names, their data types and also decribes whether they are null or not.
*/

--Question 9
/* Type the following statements in, execute them, then briefly describe what the statement is doing!
SELECT * FROM employees;
SELECT * FROM customers ORDER BY ContactLastName;
*/

SELECT * FROM employees;
SELECT * FROM customers ORDER BY ContactLastName;

/*
First statement here returns all the content of the "EMPLOYEES" table as it is (all the rows and all the columns)

Second statement here returns all the content of the "CUSTOMERS" table, 
but it displays the content sorted by the CONTACTLASTNAME column in ascending order (ascending order of ASCII value)
*/

--Question 10
/* How many constraints does the products table have?*/

/* 
The "PRODUCTS" table has total of 11 constraints.
*/

--Question 11
/* Find a way to turn on line numbers in the gutter.  Where is the gutter? Describe its location in your solution file. */

/*
The gutter is the void white area on the extreme left of the worksheet.
In order to turn on the display of line numbers:
-right click anywhere in the gutter area
-select toggle line numbers (2nd option) to turn on/off the display of line numbers
*/

--Question 12
/* Set the font size in the worksheet editor to a size that is best for you.*/

/* 
Did it!,
Set to 19.

From Tools->Preferences->Code Editor->Fonts->Font Size
*/


 









