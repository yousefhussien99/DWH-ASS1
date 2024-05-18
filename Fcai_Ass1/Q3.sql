USE DW_Ass
GO 
CREATE TABLE Employee_Q3 (
    ID INT Primary Key,
    Name VARCHAR(100),
    City VARCHAR(100),
    Email VARCHAR(100),
    Schedule_Date DATE,
);
CREATE TABLE TRG_Employee_Q3 (
    Emp_Key INT IDENTITY(1,1) PRIMARY KEY,
    ID INT,
    Name VARCHAR(100),
    City VARCHAR(100),
    Email VARCHAR(100),
    Insert_Date DATE,
    Active_Flag BIT,
    Version_No INT
);

INSERT INTO Employee_Q3 (ID, Name, City, Email, Schedule_Date)
VALUES
    (1001, 'Ahmed', 'Cairo', 'ahmed@mail.com', '2024-04-20'),
    (1002, 'Nehal', 'Giza', 'nehal@mail.com', '2024-04-20'),
    (1003, 'Asem', 'Cairo', 'asem@mail.com', '2024-04-20');

Delete from Employee_Q3
select * from Employee_Q3
INSERT INTO Employee_Q3 (ID, Name, City, Email, Schedule_Date)
VALUES
    (1001, 'Ahmed', 'Cairo', 'ahmed@mail.com', '2024-05-21'),
    (1002, 'Nehal', 'Giza', 'nehal@mail.com', '2024-05-21'),
    (1003, 'Asem', 'Cairo', 'asem@mail.com', '2024-05-21');

Delete from TRG_Employee_Q3
select * from TRG_Employee_Q3