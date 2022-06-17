/* 
NAME: USAMA SIDAT
ID: 131034217
EMAIL: uisidat@myseneca.ca
TITLE: LAB09- TRANSACTIONS
*/

--1. List the 4 ways that we know that a transaction can be started.

--The 4 ways we can start a transcations are:
--1) By executing a COMMIT statement
--2) By executing a DDL statement
--3) By connecting a database server within each session.
--4) By using SET TRANSACTIONS

--2. Using SQL, create an empty table, that is the same as the employees table, and name it newEmployees.

CREATE TABLE newEmployees AS
    SELECT * 
    FROM employees 
    WHERE 1=0;
    
--3. Execute the following commands.

SET AUTOCOMMIT OFF;
SET TRANSACTION READ WRITE;

--4. Write an INSERT statement to populate the newEmployees table with the rows of the sample data. Insert the NULL value for the reportsTo column. (Write a single INSERT statement to insert all the rows)

INSERT ALL
INTO newEmployees VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
INTO newEmployees VALUES (101, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
INTO newEmployees VALUES (102, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
INTO newEmployees VALUES (103, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL, 'Sales Rep')
SELECT *
FROM dual;

--5. Create a query that shows all the inserted rows from the newEmployees table. How many rows are selected?

SELECT *
FROM newEmployees;
--A total of 5 rows were selected.

--6. Execute the rollback command. Display all rows and columns from the newEmployees table. How many rows are selected?

ROLLBACK;

SELECT *
FROM newEmployees;
--No rows and columns were displayed .

--7. Repeat Task 4. Make the insertion permanent to the table newEmployees. Display all rows and columns from the newEmployee table. How many rows are selected?

INSERT ALL
INTO newEmployees VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
INTO newEmployees VALUES (101, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
INTO newEmployees VALUES (102, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
INTO newEmployees VALUES (103, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL, 'Sales Rep')
SELECT *
FROM dual;

COMMIT;

SELECT *
FROM newEmployees;
--A total of 5 rows were selected.

--8. Write an update statement to update the value of column jobTitle to ‘unknown’ for all the employees in the newEmployees table.

UPDATE newEmployees
SET jobTitle = 'unknown';

--9. Make your changes permanent.

COMMIT;

--10. Execute the rollback command. 

ROLLBACK;

--a. Display all employees from the newEmployees table whose job title is ‘unknown’. How many rows are still updated?
SELECT *
FROM newEmployees
WHERE jobTitle = 'unknown';

--b. Was the rollback command effective?
-- No, the rollback command was not effective for me and it displayed 5 results in my query result.

--c. What was the difference between the result of the rollback execution from Task 6 and the result of the rollback execution of this task?
-- When I used the rollback command during task 6, I didn't made the changes permanent with the commit command before that task, so due to that, the changes didn't stayed as it is and got rollbacked before that change. But now, as I did used the COMMIT to permannetly make the changes, the rollbac was nit effective and displayed 5 results.


--11. Begin a new transaction and then create a statement to delete to employees from the newEmployees table
COMMIT;

DELETE FROM newEmployees;

--12. Create a VIEW, called vwNewEmps, that queries all the records in the newEmployees table sorted by last name and then by first name.
CREATE VIEW vwNewEmps AS 
SELECT * 
FROM newEmployees
ORDER BY 
    lastname,
    firstname;

--13. Perform a rollback to undo the deletion of the employees
ROLLBACK;

--a. How many employees are now in the newEmployees table?
--There are 0 employees in the newEmployee table now.

--b. Was the rollback effective and why?
--YES, the rollback was effective because we executed a DDL statement after the deletion command and thus it starts a new transaction at that DDL statement.


--14. Begin a new transaction and rerun the data insertion from Task 4 (copy the code down to Task 14 and run it)
COMMIT;

INSERT ALL
INTO newEmployees VALUES (100, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
INTO newEmployees VALUES (101, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
INTO newEmployees VALUES (102, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
INTO newEmployees VALUES (103, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
INTO newEmployees VALUES (104, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL, 'Sales Rep')
SELECT *
FROM dual;


--15. Set a Savepoint, called insertion, after inserting the data
SAVEPOINT insertion;


--16. Rerun the update statement from Task 8 and run a query to view the data (copy the code down and run it again)
UPDATE newEmployees
SET jobTitle = 'unknown';

SELECT * 
FROM newEmployees;

--17. Rollback the transaction to the Savepoint created in task 15 above and run a query to view the data. What does the data look like (i.e. describe what happened?

ROLLBACK TO insertion;

SELECT * 
FROM newEmployees;

-- The rollback command went back to the savepoint insertion where the jobtitle for all of the employees is 'Sales Rep'.

--18. Use the basic for of the rollback statement and again view the data.  Describe what the results look like and what happened.

ROLLBACK;

SELECT * 
FROM newEmployees;

--This time, when I used the basic rollback command, it went to the start of the transaction in the task 14 and not to the savepoint 'insertion' where there is no data in the newEmployee table.


--19. Write a statement that denies all access to the newemployees table for all public users
REVOKE ALL 
ON newEmployees 
FROM PUBLIC;

--20. Write a statement that allows a classmate (use their database login) read only access to the newemployees table.
GRANT READ 
ON newEmployees 
TO dbs211_221za09;

--21. Write a statement that allows the same classmate to modify (insert, update and delete) the data of the newemployees table.
GRANT 
    INSERT,
    UPDATE,
    DELETE 
ON newEmployees 
TO dbs211_221za09;

--22. Write a statement the denies all access to the newemployees table for the same classmate.
REVOKE ALL 
ON newEmployees 
FROM dbs211_221za09;


--23. Write statements to permanently remove the view and table created for this lab
DROP TABLE newEmployees;
DROP VIEW vwNewEmps;

