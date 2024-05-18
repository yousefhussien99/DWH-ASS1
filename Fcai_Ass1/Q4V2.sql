CREATE TABLE Attendance_Device 
(
    id                smallint PRIMARY KEY,
    employee_id        smallint,
    finger_print_ts    datetime,
    in_out            varchar(3)
);

-- Target Table: Employee_Attendance_Details
drop table Employee_Attendance_Detail
CREATE TABLE Employee_Attendance_Detail 
(
    Att_Key           int Identity(1,1) ,
    Emp_ID            smallint,
    Date    varchar(30),
    Time_In        time,
    Time_Out     time,
    Worked_hours float,
    state   varchar(50)

);
delete from Employee_Attendance_Detail
delete from Attendance_Device

INSERT INTO Attendance_Device (id, employee_id, finger_print_ts, in_out) VALUES
    ('1', '101', '2024-03-12 9:00:00', 'in'),
    ('2', '101', '2024-03-12 10:00:00', 'in'),
    ('3', '102', '2024-03-12 9:00:00', 'in'),
    ('4', '103', '2024-03-12 11:00:00', 'in'),
    ('5', '104', '2024-03-12 9:15:00', 'in'),
    ('6', '105', '2024-03-12 10:00:00', 'in'),
    ('7', '105', '2024-03-12 11:00:00', 'in'),
    ('8', '105', '2024-03-12 11:30:00', 'in'),
    ('9', '106', '2024-03-12 9:00:00', 'in'),
    ('10', '107', '2024-03-12 9:00:00', 'in'),
    ('11', '108', '2024-03-12 9:00:00', 'in'),
    ('12', '101', '2024-03-12 9:00:00', 'out'),
    ('13', '101', '2024-03-12 17:00:00', 'out'),
    ('14', '101', '2024-03-12 19:00:00', 'out'),
    ('15', '102', '2024-03-12 17:00:00', 'out'),
    ('16', '103', '2024-03-12 17:00:00', 'out'),
    ('17', '105', '2024-03-12 10:00:00', 'out'),
    ('18', '105', '2024-03-12 11:00:00', 'out'),
    ('19', '105', '2024-03-12 18:00:00', 'out'),
    ('20', '106', '2024-03-12 19:00:00', 'out'),
    ('21', '107', '2024-03-12 14:00:00', 'out'),
    ('22', '108', '2024-03-12 17:00:00', 'out');


INSERT INTO Attendance_Device (id, employee_id, finger_print_ts, in_out) VALUES
	('23', '101', '2024-03-12 9:30:00', 'out'),
	('24', '101', '2024-03-13 17:30:00', 'out'),
	('25', '101', '2024-03-13 17:00:00', 'in'),
	('27', '101', '2024-03-14 16:00:00', 'in'),
	('26', '101', '2024-03-14 14:00:00', 'out')



INSERT INTO Attendance_Device (id, employee_id, finger_print_ts, in_out) VALUES
    ('5', '101', '2024-03-13 09:00:00', 'in'),
    ('6', '101', '2024-03-14 10:00:00', 'in'),
	('7', '101', '2024-03-13 09:30:00', 'out'),
	('8', '101', '2024-03-14 20:00:00', 'out');

select * from Attendance_Device;  
SELECT * FROM Employee_Attendance_Detail order by Emp_ID ;