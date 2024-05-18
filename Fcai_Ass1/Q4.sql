
CREATE TABLE Attendance_Device
(
	ID		         INT IDENTITY(1,1),
	Employee_Id      INT NOT NULL,
	Finger_Print_TS  DATETIME NOT NULL,
	In_Out           VARCHAR(5) NOT NULL,
);
CREATE TABLE Demo_Attendance_Device
(
	Att_Key INT IDENTITY(1,1),
	Emp_ID INT NOT NULL,
	Date  DATE NOT NULL,
	Time_In Varchar(50) NOT NULL,
	Time_Out Varchar(50),
	Worked_Hours DECIMAL(10,2) ,
	State Varchar(50)
);

CREATE TABLE TRG_Attendance_Device
(
	Att_Key		         INT IDENTITY(1,1),
	Emp_ID      INT NOT NULL,
	Date  DATE NOT NULL,
	Time_In Varchar(50) NOT NULL,
	Time_Out Varchar(50),
	Worked_Hours decimal(10,2) ,
	State Varchar(50)
);


INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(101, '2024-03-12 09:00:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(101, '2024-03-12 10:00:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(102, '2024-03-12 09:00:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(103, '2024-03-12 11:00:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(104, '2024-03-12 09:15:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(105, '2024-03-12 10:00:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(105, '2024-03-12 11:00:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(105, '2024-03-12 11:30:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(106, '2024-03-12 09:00:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(107, '2024-03-12 09:00:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(108, '2024-03-12 09:00:00', 'in');

INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(101, '2024-03-12 09:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(101, '2024-03-12 17:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(101, '2024-03-12 19:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(102, '2024-03-12 17:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(103, '2024-03-12 17:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(105, '2024-03-12 10:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(105, '2024-03-12 11:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(105, '2024-03-12 18:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(106, '2024-03-12 19:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(107, '2024-03-12 14:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(108, '2024-03-12 17:00:00', 'out');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(108, '2024-03-13 9:00:00', 'in');
INSERT INTO Attendance_Device(Employee_Id, Finger_Print_TS, In_Out)
			VALUES(108, '2024-03-13 18:00:00', 'out');

INSERT INTO TRG_Attendance_Device ( Emp_ID,Date,Time_In,Time_Out,Worked_Hours,State)
SELECT Emp_ID,Date,Time_In,Time_Out,Worked_Hours,State FROM Demo_Attendance_Device
ORDER BY Emp_ID;

SELECT *
FROM Attendance_Device;
select * from TRG_Attendance_Device



delete from Attendance_Device
delete from TRG_Attendance_Device
delete from Demo_Attendance_Device
select * from Demo_Attendance_Device
select * from TRG_Attendance_Device




SELECT *
FROM Attendance_Device;
SELECT 
    Employee_Id,
    CAST(MIN(CASE WHEN In_Out = 'in' THEN Finger_Print_TS END) AS DATE) AS Date,
    CONVERT(TIME, MIN(CASE WHEN In_Out = 'in' THEN Finger_Print_TS END)) AS Time_In,
    (SELECT CONVERT(TIME, MIN(Finger_Print_TS))
     FROM Attendance_Device
     WHERE In_Out = 'out'
       AND Employee_Id = A.Employee_Id
       AND Finger_Print_TS > MAX(CASE WHEN A.In_Out = 'in' THEN A.Finger_Print_TS END)
    ) AS Time_Out,
    CAST(DATEDIFF(MINUTE, 
                  MIN(CASE WHEN In_Out = 'in' THEN Finger_Print_TS END), 
                  (SELECT MIN(Finger_Print_TS)
                   FROM Attendance_Device
                   WHERE In_Out = 'out'
                     AND Employee_Id = A.Employee_Id
                     AND Finger_Print_TS > MAX(CASE WHEN A.In_Out = 'in' THEN A.Finger_Print_TS END)
                  )
                 ) / 60.0 AS DECIMAL(10,2)) AS Worked_Hours
FROM 
    Attendance_Device AS A
GROUP BY 
    Employee_Id, 
    CAST(Finger_Print_TS AS DATE)
HAVING 
    CAST(MIN(CASE WHEN In_Out = 'in' THEN Finger_Print_TS END) AS DATE) IS NOT NULL;


