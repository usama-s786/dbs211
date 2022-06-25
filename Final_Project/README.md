# Final Project - An HR application using C++ and Oracle Server.
<br>

**\*PLEASE DO NOT COPY FROM ANY OF THE FILES IN THIS REPOSITORY\***

<br>

### Objective: In this assignment, you create a simple HR application using the C++ programming language and Oracle server. This assignment helps students learn a basic understanding of application development using C++ programming and an Oracle database

------------------------
# Milestone 1

## Tasks:
- The output should be formatted in a way that columns line up nicely
- The appropriate data types are used for the respective database data type
- All open objects should be terminated
- Modify the SQL statement to include a WHERE clause to return a specific employee number and only show the output for the employee number typed in from a console prompt line.
- Error check the code for a couple things
  - The entered employee number is the right data type before trying to query the database
  - The employee number exists in the database before trying to output the values to the console window. 
- Give appropriate error messages to the user in both cases
- Modify your code such that the connection success message has your name and the current date in the message
- Make sure your code has an appropriate comment header
- Include a screen shot of your console window displaying your connection successful message with your name and the current date in it
- Include a short video (1 minute) with you sharing your screen and talking about the code, the connection, and demonstrating it working.

------------------------

# Milestone 2

## Tasks:
- In your function main(), create a connection to your database and implement the following functions
  - int menu(void);
    - The menu() function returns an integer value which is the selected option by the user from the menu.
    1) Find Employee
    2) Employees Report
    3) Add Employee
    4) Update Employee
    5) Remove Employee
    6) Exit
    - Before printing the menu, display the following title on the screen - ********************* HR Menu *********************
    - Prompt the user to enter an option. If the user enters an incorrect option, the user is asked to enter an option again.
    - Prompt the user to enter an option. If the user enters an incorrect option, the user is asked to enter an option again.
    - If the user selects 0 (Exit), the program terminates.
  - int findEmployee(*conn,  int employeeNumber, struct Employee *emp);
    - This function receives a connection object, an integer number as the employee number, and a pointer to a variable of type Employee
    - The function returns 0 if the employee does not exist
    - To store the employee data from the findEmployee() function, we use a variable of type structure called Employee
    - The Employee structure has the following members:
    1) struct Employee{int employeeNumber; char lastName[50]; char firstName[50]; char email[100];  char phone[50]; char extension[10]; char reportsTo[100];  char jobTitle[50]; char city[50]; };
    - The ReportsTo member stores the first name and the last name of the employee who is the manager of the given employee number
    - If the employee exists, store the employee data into the members of an Employee variable using the third parameter in the findEmployee() function which references to that variable of type Employee
  - void displayEmployee(*conn, struct Employee emp);
    - If the user selects option 1, this function is called
    - First, prompt the user to enter a value for the employee number
    - Then, call function findEmployee() to check if the employee with the given employee number exists
    - If the returning value of function findEmployee() is 0, display a proper error message
    - Otherwise, call the function displayEmployee() to display the employee information
    - This function receives a connection pointer and values of a variable of type Employee and displays all members of the emp parameter
  - void displayAllEmployees(*conn);
    - If the user selects option 2 (Employees Report), call function displayAllEmployees()
    - This function receives a connection pointer and displays all employees’ information if exists
    - Write a query to select and display the following attributes for all employees
    - If the query does not return any rows, display a proper message

------------------------

# Milestone 3

## Tasks:
- In this milestone, we complete the application from the first part to insert, update, and delete the employee information. You need to implement the following functions:
  - void insertEmployee(*conn,  struct Employee emp);
    - This function receives a connection pointer and a structure of type Employee and inserts the given employee information stored in the parameter emp to employee table
    - In function insertEmployee(), call the function findEmployee() to see if the employee number of the given employee exists. If an employee with the same employee number exists display a proper message
    - Otherwise, insert the employee information into the employee table and display the following message - The new employee is added successfully
  - void updateEmployee(*conn,  int employeeNumber);
    - This function receives a connection pointer and an integer number as the employee number and updates the phone extension for the given employee
    - In function updateEmployee(), call function findEmployee() to see if the employee exists in table employees
    - In function updateEmployee(), call function findEmployee() to see if the employee exists in table employees
  - void deleteEmployee(*conn,  int employeeNumber);
    - This function receives a connection pointer  and an integer number as the employee number and deletes a row with the given employee number from table employees
    - In function deleteEmployee(), call function findEmployee() to see if the employee with the given employee number exists
    - If the employee does not exist display a proper message
    - If the employee exits, delete the row from table employees and display a proper message
  - Function main()
    1) Add an Employee
       - If the user chooses option 3, prompt the user to enter the new employee information and store them into a variable of type Employee structure. Then, call function insertEmployee() to insert the new employee information in table employees. 
    2) Update an Employee
       - If the user chooses option 4, ask the user to enter the employee number. Then, call function updateEmployee() to update the phone extension for the row with the employee number 1216. In this function, the user is asked to enter the new extension. New Extension: x2111. The extension column of the row with the employee number 1216 will be updated with the new value x2111
    3) Delete an Employee
       - If the user chooses option 5, ask the user to enter the employee number
       - Then, call function deleteEmployee() to remove the employee from table employees  
       - Error_code is a number returned if the query execution is not successful

--------------
