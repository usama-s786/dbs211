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
