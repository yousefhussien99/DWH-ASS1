
CREATE TABLE Employee_Q2(
	ID int primary key,
	Name varchar(100) NULL,
	City varchar(100) NULL,
	Email varchar(100) NULL,
	Update_Date date NULL
);

INSERT INTO Employee_Q2 (ID, Name, City, Email, Update_Date)
VALUES
    (1001, 'Ahmed', 'Cairo', 'ahmed@mail.com', '2024-04-20'),
    (1002, 'Nehal', 'Giza', 'nehal@mail.com', '2024-04-20'),
    (1003, 'Asem', 'Cairo', 'asem@mail.com', '2024-04-20');


select * from Employee_Q2
delete  from Employee_Q2

INSERT INTO Employee_Q2 (ID, Name, City, Email, Update_Date)
VALUES
    (1001, 'Ahmed', 'Cairo', 'ahmed@mailA.com', '2024-04-21'),
    (1002, 'Nehal', 'Giza', 'nehal@mailA.com', '2024-04-21'),
    (1003, 'Asem', 'Cairo', 'asem@mailA.com', '2024-04-21');

CREATE TABLE TRG_EmployeeQ2 (
    ID INT primary key ,
    Name VARCHAR(255),
    City VARCHAR(255),
    Email VARCHAR(255),
    Update_Date DATE,
);
select * from TRG_EmployeeQ2
delete  from TRG_EmployeeQ2

CREATE TABLE Employee_History (
    History_ID int IDENTITY(1,1) NOT NULL,
    Original_ID int NULL,
	Name varchar(100) NULL,
	City varchar(100) NULL,
	Email varchar(100) NULL,
	Update_Date date NULL,
	End_Date date NULL,
);
select * from Employee_History
delete  from Employee_History