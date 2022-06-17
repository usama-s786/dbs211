/*
TITLE: DBS211 PROJECT MILESTONE-3 (GROUP)
DATE : 15/04/2022
MEMBERS:
1) Usama Sidat (ID. 131034217)
2) Yeonsu Park (ID. 128899218)
3) MingMing Ma (ID. 147697205)
*/

#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <occi.h> 
#include <iomanip> 
#include <cstring>


//including the namespaces required in the program
using oracle::occi::Environment;
using oracle::occi::Connection;
using namespace oracle::occi;
using namespace std;

//declare Employee struct
struct Employee {
	int employeeNumber;							//integer type
	char lastName[50];							//rest all are char type with their respective sizes
	char firstName[50];
	char email[100];
	char phone[50];
	char extension[10];
	char reportsTo[100];
	char jobTitle[50];
	char city[50];
};

int menu(void) {																												//declare a void menu function 
	cout << "\n\n********************* HR Menu *********************" << endl;										//display the title
	cout << "1) Find Employee\n2) Employees Report\n3) Add Employee\n4) Update Employee\n5) Remove Employee\n0) Exit" << endl; //display the menu options

	int option;																							//declare variable (option) which is to be entered
	cin >> option;																						//taking the input from the user
	while (option != 0) {																				//iterate until the entered option is zero
		if (option < 0 || option > 5) {																	//execute the if condition if the number is less than 0 or more than 5
			cout << "Incorrect input chosen, please select the option from (0 to 5)" << endl;			//display the message if true
		}
		else {																							//if the number is from 0 to 5, break.
			break;
		}
		cin >> option;																					//taking the input again
	}
	return option;																						//return an integer value that is selected option.  
}

//declare function called findEmployee. This function get a connection object,
//employee number type is int, and a pointer to a variable of type Employee. 
int findEmployee(Connection* conn, int employeeNumber, struct Employee* emp) {
	Statement* stmt = conn->createStatement();														//create a statement variable to hold the query statement
	ResultSet* rs = stmt->executeQuery("SELECT e1.employeenumber, e1.lastname, e1.firstname, e1.email, phone, e1.extension, e2.firstname || ' ' || e2.lastname AS reportsto, e1.jobtitle, city FROM employees e1 LEFT JOIN employees e2 ON e1.reportsto = e2.employeenumber JOIN offices ON e1.officecode = offices.officecode WHERE e1.employeenumber IS NOT NULL AND e1.employeenumber= " + to_string(employeeNumber));
	//to execute query statement in the database and show the table of data.
	if (!(rs->next())) {													//if there is no next line to pass the result of query statement stored in the ResultSet, return 0.
		return 0;
	}
	else {																	//if there is next line to pass them, return true and make a row. otherwise end.
		emp->employeeNumber = rs->getInt(1);								//get first column employeeNumber as int
		strcpy(emp->lastName, rs->getString(2).c_str());					//get second column lastName as string 
		strcpy(emp->firstName, rs->getString(3).c_str());					//etc (do the rest of the columns)
		strcpy(emp->email, rs->getString(4).c_str());
		strcpy(emp->phone, rs->getString(5).c_str());
		strcpy(emp->extension, rs->getString(6).c_str());
		strcpy(emp->reportsTo, rs->getString(7).c_str());
		strcpy(emp->jobTitle, rs->getString(8).c_str());
		strcpy(emp->city, rs->getString(9).c_str());
	}
	conn->terminateStatement(stmt);											//end the statement. 
	return 1;
}

/*
Display the employee information of an existing employee number using the pointer to conn connection variable and the emp structure object
*/
void displayEmployee(Connection* conn, struct Employee emp) {
	cout << "\nemployeeNumber = " << emp.employeeNumber;
	cout << "\nlastName = " << emp.lastName;
	cout << "\nfirstName = " << emp.firstName;
	cout << "\nemail = " << emp.email;
	cout << "\nphone = " << emp.phone;
	cout << "\nextension = " << emp.extension;
	cout << "\nreportsTo = " << emp.reportsTo;
	cout << "\njobTitle = " << emp.jobTitle;
	cout << "\ncity = " << emp.city << endl;

}

/*
Display all employee information of existing employees by receiving a pointer to conn connection variable
*/
void displayAllEmployees(Connection* conn) {
	Statement* stmt = conn->createStatement();											//create a statement variable to hold the query statement
	ResultSet* rs = stmt->executeQuery("SELECT e1.employeenumber, e1.lastname || ' ' || e1.firstname AS employeename, e1.email, phone, e1.extension, e2.firstname || ' ' || e2.lastname AS reportsto_name FROM employees e1 LEFT JOIN employees e2 ON e1.reportsto = e2.employeenumber JOIN offices ON e1.officecode = offices.officecode ORDER BY e1.employeenumber");  //employees left join employees

	//to execute query statement in the database and show the table of data.
	if (!(rs->next())) {														//the query does not return any rows and displays the error message
		cout << "There is no employee's information to be displayed." << endl;
	}
	else {																		//if there is next line to pass them, return true and make a row. otherwise end.
		while (rs->next()) {
			int employeeNumber = rs->getInt(1);									//get first column employeeNumber as int
			string employeename = rs->getString(2);								//get second column lastName as string 
			string email = rs->getString(3);									//etc (do the rest of the columns)
			string phone = rs->getString(4);
			string extension = rs->getString(5);
			string reportsTo = rs->getString(6);
			cout.setf(ios::fixed);
			cout << left << setw(5) << employeeNumber << setw(19) << employeename << setw(36) << email << setw(22) << phone << setw(6) << extension << "   " << setw(22) << reportsTo << endl;
		}
	}
	conn->terminateStatement(stmt);									//end the statement.
}

int reports = 1002; //declare variable(reports) default by 1002
/*
Insert employee of non-existing employee by receiving a connection pointer and entering the employee informatnion stored emp to table of employee
*/
void insertEmployee(Connection* conn, struct Employee emp) {
	cout << "Enter the Employee number: ";	// display the message
	cin >> emp.employeeNumber;				//get the employeeNumber stored in emp
	//validation check
	if (findEmployee(conn, emp.employeeNumber, &emp)) {									   //if emp.employeeNumber that entered exists
		cout << "An employee with the same employee number exists." << endl;			   //display the error message								
		return;
	}
	else {
		/*
		Get the information that want to insert to employee
		*/
		cout << "Enter the Last Name: ";
		cin >> emp.lastName;
		cout << "Enter the First Name: ";
		cin >> emp.firstName;
		cout << "Enter the Email: ";
		cin >> emp.email;
		cout << "Enter the Extension: ";
		cin >> emp.extension;
		cout << "Enter the Job Title: ";
		cin.ignore();                              //Ignore and clear character from input buffer 
		cin.getline(emp.jobTitle, 30);             //get character including space
		cout << "Enter the City: ";
		cin >> emp.city;
		Statement* stmt = conn->createStatement(); //create a statement variable to hold the query statement
		stmt->setAutoCommit(true);                 //set AutoCommit true
		stmt->executeUpdate("INSERT INTO employees (employeeNumber, lastname, firstname, email, extension, jobTitle, reportsto, officecode) VALUES ('" + to_string(emp.employeeNumber) + "','" + emp.lastName + "','" + emp.firstName + "','" + emp.email + "','" + emp.extension + "','" + emp.jobTitle + "'," + to_string(reports) + "," + '1' + ")"); //execute query to insert employee

		cout << "\nThe new employee is added successfully.\n" << endl;  //success message
		conn->terminateStatement(stmt); //end the statement
	}
}
/*
Update employee's extension of existing employee by receiving a connection pointer
*/
void updateEmployee(Connection* conn, int employeeNumber) {
	Employee emp;											//creating an instance of structure Employee to store the information for the update
	emp.employeeNumber = employeeNumber;					//assigning the structure's member variable to the variable employeenumber
	//check if employee exists or not by calling findEmployee function
	if (!(findEmployee(conn, emp.employeeNumber, &emp))) {    // if not exist            
		cout << "The employee does not exist in the table, please retry!" << endl; //display message
	}
	else {                                                    //if exist
		cout << "New Extension: ";
		cin >> emp.extension;                                 //get new extension to update 
		string ext = emp.extension;
		Statement* stmt = conn->createStatement();           //create a statement variable to hold the query statement
		stmt->setAutoCommit(true);                 //setting AutoCommit to true
		stmt->executeUpdate("UPDATE employees SET extension = '" + ext + "' WHERE employeeNumber = " + to_string(employeeNumber)); //execute query to update extension
		cout << "\nThe new employee is added successfully.\n" << endl; //success message
		conn->terminateStatement(stmt);  //end of statement
	}
}
/*
Delete employee of existing employee by receiving a connection pointer
*/
void deleteEmployee(Connection* conn, int employeeNumber) {
	Employee emp;								//creating an instance of structure Employee to store the information for the delete
	emp.employeeNumber = employeeNumber;		//assigning the structure's member variable to the variable employeenumber
	//check if employee exists or not by calling findEmployee function
	if (findEmployee(conn, emp.employeeNumber, &emp)) {															//if exist
		Statement* stmt = conn->createStatement();																//create a statement variable to hold the query statement
		stmt->setAutoCommit(true);                 //set AutoCommit true
		stmt->executeUpdate("DELETE FROM employees WHERE employeeNumber = " + to_string(employeeNumber));       //execute query to delete employee
		cout << "\nThe employee that you entered is deleted from the table\n" << endl;                          //success message
		conn->terminateStatement(stmt);																			//end of statement
	}
	else {																										//if not
		cout << "Employee does not exist, please retry!" << endl;												//display the message
		return;                                                                                                 //return
	}
}

int main(void) {
	time_t now = time(0);											//variables tht helps to show login time and date
	char* date = ctime(&now);

	Environment* env = nullptr;										//environment pointer
	Connection* conn = nullptr;										//connection pointer 
	string str;
	string usr = "dbs211_221za27";  								//login username
	string pass = "23281311";										//login password
	string srv = "myoracle12c.senecacollege.ca:1521/oracle12c";		//sql server

	try {
		//create connection and environment 
		env = Environment::createEnvironment(Environment::DEFAULT);
		conn = env->createConnection(usr, pass, srv);
		cout << "***Connection is Successful***\n" << endl << "DBS211 Group Project Milestone 3 (FINAL) \nCreated by:- \nUsama Sidat,\nMingming Ma,\nYeonsu Park" << endl << "\nCurrent time:-" << date << endl; //prints out the message and title with date and time

		struct Employee emp;
		int temp = menu();

		while (1) {
			//iterate until the entered option is zero
			if (temp == 0) {
				break;
			}
			else if (temp == 1) {
				cout << "Please enter the employee number you want to search for:" << endl;

				//prompt the user to enter a value for the employee number
				int empnum;
				cin >> empnum;

				//call function findEmployee() to check if the employee with the given employee number exists.
				if (!(findEmployee(conn, empnum, &emp))) {
					cout << "Employee " << empnum << " does not exists";				//if not exists, display error message
				}
				else {																	//if exists, call the function displayEmployee() to display the employee information 
					displayEmployee(conn, emp);
				}
			}
			else if (temp == 2) {
				displayAllEmployees(conn);												//call the function displayAllEmployees() to display all employee information 
			}
			else if (temp == 3) {
				insertEmployee(conn, emp);                                              //call the function insertEmployee () to insert an employee information
			}
			else if (temp == 4) {
				int employeeNumber;                                                     //declare variable employeeNumber as int
				cout << "Employee Number: ";
				cin >> employeeNumber;													//get the employeeNumber
				updateEmployee(conn, employeeNumber);									//if employeeNumber exists, call the function updateEmployee() to update extension of employee
			}
			else if (temp == 5) {
				int employeeNumber;														//declare variable employeeNumber as int
				cout << "Employee Number: ";
				cin >> employeeNumber;													//get the employeeNumber
				deleteEmployee(conn, employeeNumber);									//if employeeNumber exists, call the function deleteeEmployee() to delete employee
			}

			temp = menu();																//displaying the menu again if in case any of the loops runs and the execution reaches here to avoid infinite loop  

		}

		//terminate connection and environment
		env->terminateConnection(conn);
		Environment::terminateEnvironment(env);
	}
	catch (SQLException& sqlExcp) {								// Catches any exceptions or errors if the connection is not successful or any other errors.
		cout << sqlExcp.getErrorCode() << ": " << sqlExcp.getMessage();
	}
	return 0;
}