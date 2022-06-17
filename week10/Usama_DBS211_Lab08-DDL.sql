/*
NAME: USAMA SIDAT
ID: 131034217
EMAIL: uisidat@myseneca.ca
TITLE: DBS211 LAB08 DDL
*/

SET AUTOCOMMIT ON;

--1.Create table the following tables and their given constraints:

--MOVIES TABLE
CREATE TABLE l5_movies (
    movieID INT PRIMARY KEY,
    title VARCHAR(35) NOT NULL,
    year INT NOT NULL,
    directorID INT NOT NULL,
    score DECIMAL(3,2) 
    CONSTRAINT score_check CHECK (score BETWEEN 0 AND 5) 
);

--ACTORS TABLE
CREATE TABLE l5_actors(
    actorID INT PRIMARY KEY,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(30) NOT NULL
);

--CASTINGS TABLE
CREATE TABLE l5_castings (
    movieID INT,
    actorID INT,
    CONSTRAINT mov_cas_fk FOREIGN KEY (movieID) 
        REFERENCES l5_movies(movieID),
    CONSTRAINT act_cas_fk FOREIGN KEY (actorID)
        REFERENCES l5_actors(actorID),
    CONSTRAINT l5_castings_pk PRIMARY KEY (movieID, actorID)
);

--DIRECTORS TABLE
CREATE TABLE l5_directors(
    directorID INT PRIMARY KEY,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(30) NOT NULL
);

--2.Modify the movies table to create a foreign key constraint that refers to table directors. 
ALTER TABLE l5_movies
    ADD CONSTRAINT mov_dir_fk FOREIGN KEY (directorID)
        REFERENCES l5_directors(directorID);
       
--3.Modify the movies table to create a new constraint so the uniqueness of the movie title is guaranteed. 
ALTER TABLE l5_movies
    ADD CONSTRAINT title_chck UNIQUE (title);

--4.Write insert statements to add the following data to table directors and movies.
INSERT ALL 
INTO l5_directors VALUES (1010, 'Rob', 'Minkoff')
INTO l5_directors VALUES (1020, 'Bill', 'Condon')
INTO l5_directors VALUES (1050, 'Josh', 'Cooley')
INTO l5_directors VALUES (2010, 'Brad', 'Bird')
INTO l5_directors VALUES (3020, 'Lake', 'Bell')
SELECT * FROM dual;

INSERT ALL 
INTO l5_movies VALUES (100, 'The Lion King', 2019, 3020, 3.50)
INTO l5_movies VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20)
INTO l5_movies VALUES (300, 'Toy story 4', 2019, 1020, 4.50)
INTO l5_movies VALUES (400, 'Mission Impossible', 2018, 2010, 5.00)
INTO l5_movies VALUES (500, 'The secret Life of Pets', 2016, 1010, 3.90)
SELECT * FROM dual;

--5.Write SQL statements to remove all above tables. Is the order of tables important when removing? Why? 

-- Yes, we should drop the tables in the opposite order of that when we created them, so that if we delete the latest table, it does not have any contraints binded to any other tables.
-- Because, if I try to drop a table which already have some FK in it, the refrential integrity will not allow me to drop that table until I include a CASCADE CONSTRAINT into the DROP statement (then I can drop them in any order).

DROP TABLE l5_directors CASCADE CONSTRAINTS;

DROP TABLE l5_castings CASCADE CONSTRAINTS;

DROP TABLE l5_actors CASCADE CONSTRAINTS;

DROP TABLE l5_movies CASCADE CONSTRAINTS;


--6.Create a new empty table employee2 the same as table employees.  Use a single statement to create the table and insert the data at the same time.
CREATE TABLE employee2 AS
    SELECT * FROM employees;

--7.Modify table employee2 and add a new column username to this table. The value of this column is not required and does not have to be unique.
ALTER TABLE employee2
    ADD username VARCHAR(15);
    
--8.Delete all the data in the employee2 table
DELETE FROM employee2;

--9.Re-insert all data from the employees table into your new table employee2 using a single statement. 
INSERT INTO employee2 (employeenumber,lastname,firstname,extension,email,officecode,reportsto,jobtitle)
SELECT 
    employeenumber,
    lastname,
    firstname,
    extension,
    email,
    officecode,
    reportsto,
    jobtitle
FROM employees;

--10.In table employee2, write a SQL statement to change the first name and the last name of employee with ID 1002 to your name. 
UPDATE employee2 
    SET firstname = 'Usama',
        lastname = 'Sidat'
WHERE employeenumber = 1002;

--11.In table employee2, generate the email address for column username for each student by concatenating the first character of employee’s first name and the employee’s last name. For instance, the username of employee Peter Stone will be pstone. NOTE: the username is in all lower case letters.  
UPDATE employee2
SET username = LOWER(CONCAT(SUBSTR(firstname, 1,1),lastname));

--12.In table employee2, remove all employees with office code 4. 
DELETE FROM employee2 
    WHERE officecode =4;
    
--13.Drop table employee2. 
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE employee2 CASCADE CONSTRAINTS';
EXCEPTION
WHEN OTHERS THEN NULL;
END;




    