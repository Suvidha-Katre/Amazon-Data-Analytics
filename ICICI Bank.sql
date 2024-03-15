create database ICIC_BANK_MANAGEMENT; 
Use ICIC_BANK_MANAGEMENT;

-- Table1:- Account Type
CREATE TABLE Account_Type (
    Account_no INT PRIMARY KEY,
    Type_Account VARCHAR(255),
    Manager_id INT,
    Department_name VARCHAR(255),
    Opening_Date DATE
);
INSERT INTO Account_Type (Account_no, Type_Account, Manager_id, Department_name, Opening_Date) VALUES
(12345, 'Saving', 20, 'Account', '2003-04-23'),(67899, 'loan', 21, 'Loan', '2004-05-24'),(10112, 'Saving', 22, 'HR', '2006-01-04'),
(13145, 'loan', 23, 'Admin', '2003-04-23'),(15167, 'current', 24, 'Sales', '2004-05-24'),(18190, 'business', 25, 'Security', '2006-01-04'),
(20210, 'loan', 26, 'Account', '2003-04-23'),(22230, 'Saving', 27, 'Loan', '2004-05-24'),(24250, 'loan', 28, 'HR', '2006-01-04'),
(26270, 'current', 29, 'Admin', '2003-04-23'),(28290, 'business', 30, 'Sales', '2004-05-24'),(30310, 'current', 31, 'Security', '2006-01-04'),
(32330, 'Saving', 32, 'Account', '2003-04-23'),(34350, 'loan', 33, 'Loan', '2004-05-24'),(36370, 'current', 34, 'HR', '2006-01-04'),
(38390, 'current', 35, 'Admin', '2003-04-23'),(40410, 'business', 36, 'Sales', '2004-05-24'),(42430, 'loan', 37, 'Security', '2006-01-04'),
(44450, 'Saving', 38, 'Account', '2003-04-23'),(46470, 'loan', 39, 'Loan', '2004-05-24'),(48490, 'Saving', 40, 'HR', '2006-01-04');
Select * from Account_type;

-- Table2:- Department
CREATE TABLE Department (
    Department_id INT PRIMARY KEY,
    Department_name VARCHAR(255),
    Manager_id INT,
    Employee_id INT,
    Account_no INT,
    FOREIGN KEY (Account_no) REFERENCES Account_Type(Account_no)
);
INSERT INTO Department (Department_id, Department_name, Manager_id, Employee_id, Account_no) VALUES
(1, 'Account', 20, 50, 12345),(8, 'Loan', 21, 51, 67899),(11, 'HR', 22, 52, 10112),
(16, 'Admin', 23, 53, 13145),(19, 'Sales', 24, 54, 15167),(21, 'Security', 25, 55, 18190);
select * from Department;

-- Table3:- Bank Details
CREATE TABLE Bank_Details (
    Branch_code INT PRIMARY KEY,
    Address VARCHAR(255),
    Department_id INT,
    Branch_name VARCHAR(255),
    State VARCHAR(255),
    FOREIGN KEY (Department_id) REFERENCES Departments(Department_id)
);
INSERT INTO Bank_Details (Branch_code, Address, Department_id, Branch_name, State) VALUES
(100, 'Nagpur', 1, 'ICIC_N', 'Maharashtra'),(101, 'pune', 1, 'ICIC_P', 'Maharashtra'),(102, 'Mumbai', 1, 'ICIC_M', 'Maharashtra'),
(103, 'delhi', 1, 'ICIC_D', 'DEL'),(104, 'Mumbai', 1, 'ICIC_M', 'Maharashtra'),(105, 'delhi', 1, 'ICIC_D', 'DEL'),
(106, 'Nagpur', 1, 'ICIC_N', 'Maharashtra'),(107, 'pune', 8, 'ICIC_P', 'Maharashtra'),(108, 'Mumbai', 8, 'ICIC_M', 'Maharashtra'),
(109, 'Nagpur', 8, 'ICIC_N', 'Maharashtra'),(110, 'pune', 11, 'ICIC_P', 'Maharashtra'),(111, 'Mumbai', 11, 'ICIC_M', 'Maharashtra'),
(112, 'delhi', 11, 'ICIC_D', 'DEL'),(113, 'Nagpur', 11, 'ICIC_N', 'Maharashtra'),(114, 'pune', 11, 'ICIC_P', 'Maharashtra'),
(115, 'Mumbai', 16, 'ICIC_M', 'Maharashtra'),(116, 'Nagpur', 16, 'ICIC_N', 'Maharashtra'),(117, 'pune', 16, 'ICIC_P', 'Maharashtra'),
(118, 'Mumbai', 19, 'ICIC_M', 'Maharashtra'),(119, 'delhi', 19, 'ICIC_D', 'DEL'),(120, 'Pune', 21, 'ICIC_P', 'Maharashtra');
select * from Bank_Details;
-- alter table Bank_Details modify column column_name datatype;

-- Table4:- Job Details
CREATE TABLE Job_Details (
    Job_id VARCHAR(255) PRIMARY KEY,
    Department_id INT,
    Branch_code INT,
    FOREIGN KEY (Department_id) REFERENCES Departments(Department_id),
    FOREIGN KEY (Branch_code) REFERENCES Bank_Details(Branch_code)
);
INSERT INTO Job_Details (Job_id, Department_id, Branch_code) VALUES
('ST_CLERK', 1, 101),('ST_MAN', 8, 108),('FI_ACCOUNT', 11, 113),('SA_REP', 19, 118);
select * from Job_Details;

-- Table5:- Employees
CREATE TABLE Employees (
    Employee_id INT PRIMARY KEY,
    First_name VARCHAR(255),
    Department_id INT,
    Manager_id INT,
    Job_id VARCHAR(255),
    Email VARCHAR(255),
    Hire_Date DATE,
    Phone_no VARCHAR(20),
    Salary DECIMAL(10,2),
    FOREIGN KEY (Department_id) REFERENCES Departments(Department_id),
    FOREIGN KEY (Job_id) REFERENCES Job_Details(Job_id)
);
INSERT INTO Employees (Employee_id, First_name, Department_id, Manager_id, Job_id, Email, Hire_Date, Phone_no, Salary) VALUES
(50, 'Samuel', 1, 20, 'ST_CLERK', 'SMCCAIN', '2007-11-23', '650.505.1876', 3800.00),
(51, 'Allan', 8, 21, 'ST_CLERK', 'SSEWALL', '2004-01-30', '650.505.2876', 3600.00),
(52, 'Irene', 11, 22, 'ST_CLERK', 'SSTILES', '2004-03-04', '650.505.3876', 2900.00),
(53, 'Kevin', 16, 23, 'ST_CLERK', 'STOBIAS', '2004-08-01', '650.505.4876', 2500.00),
(54, 'Julia', 19, 24, 'ST_CLERK', 'SVOLLMAN', '2005-03-10', '650.501.1876', 4000.00),
(55, 'Donald', 21, 25, 'ST_CLERK', 'TFOX', '2005-12-15', '650.501.2876', 3900.00),
(56, 'Christopher', 1, 26, 'ST_CLERK', 'TGATES', '2006-11-03', '650.501.3876', 3200.00),
(57, 'TJ', 8, 27, 'ST_MAN', 'TJOLSON', '2005-11-11', '650.501.4876', 2800.00),
(58, 'Lisa', 11, 28, 'ST_MAN', 'TRAJS', '2007-03-19', '650.507.9811', 3100.00),
(59, 'Karen', 16, 29, 'ST_MAN', 'VJONES', '2008-01-24', '650.507.9822', 3000.00),
(60, 'Valli', 19, 30, 'ST_MAN', 'VPATABAL', '2008-02-23', '650.507.9833', 2600.00),
(61, 'Joshua', 21, 31, 'ST_MAN', 'WGIETZ', '2003-05-01', '650.507.9844', 6400.00),
(62, 'Randall', 1, 32, 'FI_ACCOUNT', 'WSMITH', '2005-10-10', '515.123.4444', 6200.00),
(63, 'Hazel', 8, 33, 'FI_ACCOUNT', 'WTAYLOR', '2007-11-16', '515.123.5555', 11500.00),
(64, 'Luis', 11, 34, 'FI_ACCOUNT', 'JNAYER', '2005-07-16', '603.123.6666', 10000.00),
(65, 'Trenna', 16, 35, 'FI_ACCOUNT', 'JPATEL', '2006-09-28', '515.123.7777', 9600.00),
(66, 'Den', 19, 36, 'FI_ACCOUNT', 'JRUSSEL', '2007-01-14', '515.123.8888', 7400.00),
(67, 'Michael', 21, 37, 'SA_REP', 'JSEO', '2008-03-08', '515.123.8080', 7300.00),
(68, 'John', 1, 38, 'SA_REP', 'JTAYLOR', '2005-08-20', '011.44.1346.329268', 6100.00),
(69, 'Nandita', 8, 39, 'SA_REP', 'JWHALEN', '2005-10-30', '011.44.1346.529268', 11000.00),
(70, 'Ismael', 11, 40, 'SA_REP', 'KCHUNG', '2005-02-16', '011.44.1346.52', 8800.00);
select * from Employees;

-- Table6:- Customer
CREATE TABLE Customer (
    Account_No INT PRIMARY KEY,
    First_Name VARCHAR(255),
    City VARCHAR(255),
    Branch_code INT,
    Employee_id INT,
    Phone_no VARCHAR(20),
    ATM_NO BIGINT UNIQUE,
    Exp_date DATE,
    Pin_No INT UNIQUE,
    FOREIGN KEY (Branch_code) REFERENCES Bank_Details(Branch_code),
    FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id)
);
INSERT INTO Customer (Account_No, First_Name, City, Branch_code, Employee_id, Phone_no, ATM_NO, Exp_date, Pin_No) VALUES
(12345, 'Samuel', 'Ngapur', 100, 50, '650.505.1876', 423705689, '2006-04-23', 5689),
(67899, 'Allan', 'pune', 101, 51, '650.505.2876', 423568971, '2007-05-24', 8971),
(10112, 'Irene', 'Mumbai', 102, 52, '650.505.3876', 423432253, '2008-01-04', 12253),
(13145, 'Kevin', 'delhi', 103, 53, '650.505.4876', 423295535, '2006-01-24', 15535),
(15167, 'Julia', 'Mumbai', 104, 54, '650.501.1876', 423158817, '2006-02-23', 18817),
(18190, 'Donald', 'delhi', 105, 55, '650.501.2876', 423022099, '2007-06-21', 22099),
(20210, 'Christopher', 'Ngapur', 106, 56, '650.501.3876', 422885381, '2008-02-03', 25381),
(22230, 'TJ', 'pune', 107, 57, '650.501.4876', 422748663, '2004-01-27', 28663),
(24250, 'Lisa', 'Mumbai', 108, 58, '650.507.9811', 422611945, '2005-02-20', 31945),
(26270, 'Karen', 'Ngapur', 109, 59, '650.507.9822', 422475227, '2006-06-24', 35227),
(28290, 'Valli', 'pune', 110, 60, '650.507.9833', 422338509, '2007-02-07', 38509),
(30310, 'Joshua', 'Mumbai', 111, 61, '650.507.9844', 422201791, '2008-01-13', 41791),
(32330, 'Randall', 'delhi', 112, 62, '515.123.4444', 422065073, '2003-09-17', 45073),
(34350, 'Hazel', 'Ngapur', 113, 63, '515.123.5555', 421928355, '2004-02-17', 48355),
(36370, 'Luis', 'pune', 114, 64, '603.123.6666', 421791637, '2005-08-17', 51637),
(38390, 'Trenna', 'Mumbai', 115, 65, '515.123.7777', 421654919, '2002-06-07', 54919),
(40410, 'Den', 'Ngapur', 116, 66, '515.123.8888', 421518201, '2002-06-07', 58201),
(42430, 'Michael', 'pune', 117, 67, '515.123.8080', 421381483, '2002-06-07', 61483),
(44450, 'John', 'Mumbai', 118, 68, '011.44.1346.329268', 421244765, '2002-06-07', 64765),
(46470, 'Nandita', 'delhi', 119, 69, '011.44.1346.529268', 421108047, '2008-04-21', 68047),
(48490, 'Ismael', 'Pune', 120, 70, '011.44.1346.52', 420971329, '2005-03-11', 71329);
select * from Customer;

-- 1. syntax: select table1.column_name from table1 join table2 on table1.commoncolumn = table2.comoncolumn where 
select * from employees join bank_details
on employees.department_ID = bank_details.department_ID
where employee_id = 52 and branch_name = "icic_p"; -- it will show the same output but its Branch code is different.

-- 2. 
select * from bank_details
WHERE Address NOT IN ("mumbai", "pune", "delhi");

-- 3.
select departments.department_name, bank_details.address, bank_details.branch_code, departments.department_id, Customer.city
from departments Join bank_details 
ON departments.department_id = bank_details.department_id
Join Customer on customer.Account_no = departments.Account_no
where departments.Account_no = 18190;

-- 4.
select departments.department_id, departments.department_name, Job_details.Job_id
from departments Join Job_details
ON departments.department_id = Job_details.department_id
WHERE departments.department_name IN ('Loan', 'HR', 'Admin'); # it will not show admin, because its department id 16 is not present in job_detail table, hence it will not show o/p for admin.

-- 5.
select account_type.type_account, bank_details.state, customer.account_no
from Customer JOIN bank_details 
ON customer.branch_code = bank_details.branch_code
JOIN account_type ON customer.account_no = account_type.account_no
WHERE Customer.ATM_NO = 422748663;

-- 6
create VIEW MyView AS
SELECT Bank_Details.Address, Bank_details.Branch_name, Department.Department_name, Customer.First_Name, Customer.Phone_no
from Bank_Details JOIN Department
ON Bank_Details.department_id = Department.department_id
JOIN Customer 
ON Customer.Employee_id = Department.Employee_id;
select * from MyView;

-- 7.
create VIEW My_View as
select Customer.city, department.department_name, account_type.Opening_Date 
From customer,department,account_type 
where Account_Type.Opening_date < "2004-05-24";
Select * from My_View;

-- 8.
create VIEW Employee_Job_details AS
select * from employees
where employees.Job_id IN("ST_CLERK", "ST_MAN", "FI_ACCOUNT"); -- wrong

-- 9.
UPDATE Customer
SET ATM_no = 42321992 
WHERE ATM_no = 423295535;
select * from Customer;

-- 10.
UPDATE Account_type
SET department_name = 'admin'
Where department_name = 'sales';
select * from account_type;

