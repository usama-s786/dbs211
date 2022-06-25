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
