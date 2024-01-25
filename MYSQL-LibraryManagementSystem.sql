#Topic : Library Management System

-- Create a database named library
CREATE DATABASE LIBRARY;

USE LIBRARY;


-- Creating table Branch
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(100),
    Contact_no VARCHAR(20)
);

INSERT INTO branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 Main St, City1', '555-1111'),
(2, 102, '456 Oak St, City2', '555-2222'),
(3, 103, '789 Pine St, City3', '555-3333'),
(4, 104, '321 Elm St, City4', '555-4444'),
(5, 105, '654 Maple St, City5', '555-5555'),
(6, 106, '987 Cedar St, City6', '555-6666'),
(7, 107, '234 Birch St, City7', '555-7777'),
(8, 108, '567 Walnut St, City8', '555-8888');

select * from branch;


-- Creating table Employee
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(1, 'John Doe', 'Manager', 60000.00, 1),
(2, 'Jane Smith', 'Assistant Manager', 50000.00, 2),
(3, 'Bob Johnson', 'Sales Representative', 45000.00, 3),
(4, 'Alice Brown', 'Customer Service', 40000.00, 1),
(5, 'Charlie Wilson', 'IT Specialist', 55000.00, 2),
(6, 'Diana Miller', 'Accountant', 52000.00, 4),
(7, 'Edward Davis', 'HR Coordinator', 48000.00, 3),
(8, 'Fiona White', 'Marketing Specialist', 47000.00, 5),
(9, 'George Thompson', 'Sales Manager', 70000.00, 1),
(10, 'Helen Wilson', 'Marketing Coordinator', 48000.00, 4),
(11, 'Ivan Garcia', 'IT Analyst', 55000.00, 4),
(12, 'Jessica Turner', 'Customer Service Representative', 42000.00, 1),
(13, 'Kevin Lee', 'Financial Analyst', 60000.00, 4),
(14, 'Laura Miller', 'HR Manager', 65000.00, 1),
(15, 'Mike Johnson', 'Operations Supervisor', 58000.00, 4),
(16, 'Natalie Davis', 'Sales Representative', 48000.00, 4),
(17, 'Oscar Brown', 'IT Specialist', 52000.00, 1),
(18, 'Pamela White', 'Accountant', 53000.00, 1);

select * from employee;


-- Creating table Books
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(8, 2),
    Status VARCHAR(3) CHECK (Status IN ('yes', 'no')),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

INSERT INTO books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('9781234567890', 'The Great Gatsby', 'Fiction', 10.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('9780451524935', '1984', 'Dystopian', 12.99, 'yes', 'George Orwell', 'Signet Classic'),
('9780061120084', 'To Kill a Mockingbird', 'Classic', 11.99, 'yes', 'Harper Lee', 'Harper Perennial Modern Classics'),
('9780140283334', 'The Catcher in the Rye', 'Coming of Age', 9.99, 'yes', 'J.D. Salinger', 'Back Bay Books'),
('9780060935467', 'The Alchemist', 'Fantasy', 14.99, 'yes', 'Paulo Coelho', 'HarperOne'),
('9780553380784', 'Sapiens: A Brief History of Humankind', 'History', 16.99, 'yes', 'Yuval Noah Harari', 'Harper'),
('9780307743657', 'The Girl on the Train', 'Mystery', 13.99, 'yes', 'Paula Hawkins', 'Riverhead Books'),
('9780062315007', 'The Martian', 'Science Fiction', 15.99, 'yes', 'Andy Weir', 'Crown');

select * from books;

-- Creating table Customer
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(30),
    Customer_address VARCHAR(100),
    Reg_date DATE
);

INSERT INTO customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'John Smith', '123 Main St, City1', '2022-01-01'),
(2, 'Alice Johnson', '456 Oak St, City2', '2023-02-15'),
(3, 'Bob Brown', '789 Pine St, City3', '2021-03-10'),
(4, 'Catherine Davis', '321 Elm St, City4', '2020-04-05'),
(5, 'David Wilson', '654 Maple St, City5', '2023-05-20'),
(6, 'Eva Miller', '987 Cedar St, City6', '2022-06-15'),
(7, 'Frank White', '234 Birch St, City7', '2023-07-30'),
(8, 'Grace Taylor', '567 Walnut St, City8', '2021-08-25');

select * from customer;


-- Creating table IssueStatus
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1, 'The Great Gatsby', '2023-01-15', '9781234567890'),
(2, 2, '1984', '2023-02-20', '9780451524935'),
(3, 3, 'To Kill a Mockingbird', '2023-03-25', '9780061120084'),
(4, 4, 'The Catcher in the Rye', '2023-04-30', '9780140283334'),
(5, 5, 'The Alchemist', '2023-05-15', '9780060935467'),
(6, 6, 'Sapiens: A Brief History of Humankind', '2023-06-20', '9780553380784');

select * from issuestatus;


-- Creating table ReturnStatus
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES books(ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1, 'The Great Gatsby', '2023-02-10', '9781234567890'),
(2, 3, 'To Kill a Mockingbird', '2023-03-20', '9780061120084'),
(3, 5, 'The Alchemist', '2023-04-15', '9780060935467'),
(4, 7, 'The Girl on the Train', '2023-05-25', '9780307743657'),
(5, 4, '1984', '2023-06-05', '9780451524935');

select * from returnstatus;



-- Retrieve the book title, category, and rental price of all available books.
SELECT Book_title,category,rental_price from books where status='yes';


-- List the employee names and their respective salaries in descending order of salary.
SELECT emp_name, salary from employee order by salary desc;

--  Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, c.customer_name 
FROM books b
JOIN IssueStatus i ON b.ISBN = i.Isbn_book
JOIN Customer c on i.Issued_cust=c.customer_id;


-- Display the total count of books in each category.
SELECT CATEGORY,COUNT(*) as TotalCounts from books group by category;


-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT emp_name, position from employee where salary>50000;


-- List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name from customer where Reg_date< '2022-01-01' and customer_id not in (select issued_cust from issuestatus);


--  Display the branch numbers and the total count of employees in each branch.
SELECT branch_no,count(*) as TotalEmployee from employee group by branch_no;


-- Display the names of customers who have issued books in the month of June 2023.
 SELECT distinct c.customer_name, i.Issue_date from customer c join issuestatus i on c.customer_id=i.issued_cust
 where month(i.issue_date)=6 and year(i.issue_date)=2023;
 
 -- Retrieve the book_title from the book table containing history.
 SELECT book_title from Books where category='History';


-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no,count(*) as EmployeeCount from employee group by Branch_no having count(*)>5;



