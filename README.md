# MYSQL-LibraryManagementSystem

# Library Management System

This project is a simple library management system implemented using MySQL as the database. The system allows users to manage books, customers, employees, and track book issuing and returning.

## Features

- **Books:**
  - View a list of books in the library.
  - Add new books to the library.
  - Update book information.
  - Delete books from the library.

- **Customers:**
  - Register new customers.
  - View customer information.
  - Update customer details.
  - Delete customer records.

- **Employees:**
  - Manage employee details.
  - Track employee positions, salaries, and branch assignments.

- **Book Issuing and Returning:**
  - Issue books to customers.
  - Record book returns.

## Database Structure

The system uses MySQL to store data. Here is a simplified overview of the database structure:

- `books`: Contains information about books, including ISBN, title, category, rental price, status, author, and publisher.

- `customer`: Stores customer details, including customer ID, name, address, and registration date.

- `employee`: Manages employee information, including employee ID, name, position, salary, and branch assignment.

- `IssueStatus` and `ReturnStatus`: Track the issuing and returning of books by customers, respectively.
- 

## Usage
Navigate to the different sections of the library management system using the provided user interface.

Perform  Create, Read, Update, Delete operations on books, customers, and employees.

Track book issuing and returning using the respective modules.
