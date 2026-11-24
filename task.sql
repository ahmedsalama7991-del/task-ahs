-- Create a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).
use [storeDB]
create table dbo.Employees(
id int identity,
name varchar(20) NOT NULL,
salary decimal(7,3)
 )
 --Add a new column named "Department" to the "Employees" table with data type varchar(50).
alter table Employees
add Department varchar(50)

--Remove the "Salary" column from the "Employees" table
alter table Employees
drop column salary

--Rename the "Department" column in the "Employees" table to "DeptName
execute sp_rename 'Employees.Department','Dept_Name','column'
--Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).

--Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).
create table Projects(
id int identity Primary KEY,
Project_Name varchar(20)
)
--Add a primary key constraint to the "Employees" table for the "ID" column
alter table Employees
add constraint PK_Employees Primary key (id)
--Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").
ALTER TABLE projects
ADD Employees_id int references Employees(id)
--Remove the foreign key relationship between "Employees" and "Projects."
ALTER TABLE Projects
DROP CONSTRAINT FK__Projects__Employees
--Add a unique constraint to the "Name" column in the "Employees" table.
ALTER TABLE Employees
ADD CONSTRAINT UQ_Employees_Name
UNIQUE (Name);
--Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Status VARCHAR(20)
)
--Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table.
ALTER TABLE Customers
ADD CONSTRAINT UQ_Customers_Name
UNIQUE (FirstName, LastName);
--Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE Orders
(
    OrderID INT,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2)
)
--Create a schema named "Sales" and move the "Orders" table into this schema.
CREATE SCHEMA Sales
ALTER SCHEMA Sales
TRANSFER dbo.Orders;
--Rename the "Orders" table to "SalesOrders."
EXEC sp_rename 'Sales.Orders', 'SalesOrders'
