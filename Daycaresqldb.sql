-- Drop for rerun
DROP TABLE IF EXISTS Attendance, Enrollment, Child, ParentGuardian, Staff, Classroom;

-- Parent/Guardian Table
CREATE TABLE ParentGuardian (
    ParentGuardianID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Contact VARCHAR(20),
    Address VARCHAR(100),
    Relation VARCHAR(30)
);

-- Child Table
CREATE TABLE Child (
    ChildID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Allergies VARCHAR(100),
    ParentGuardianID INT,
    FOREIGN KEY (ParentGuardianID) REFERENCES ParentGuardian(ParentGuardianID)
);

-- Classroom Table
CREATE TABLE Classroom (
    ClassroomID INT PRIMARY KEY,
    RoomID INT,
    AgeGroup VARCHAR(10)
);

-- Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Role VARCHAR(50),
    Schedule VARCHAR(20),
    ClassroomID INT,
    FOREIGN KEY (ClassroomID) REFERENCES Classroom(ClassroomID)
);

-- Enrollment Table
CREATE TABLE Enrollment (
    ChildID INT,
    ClassroomID INT,
    EnrollmentDate DATE,
    PRIMARY KEY (ChildID, ClassroomID),
    FOREIGN KEY (ChildID) REFERENCES Child(ChildID),
    FOREIGN KEY (ClassroomID) REFERENCES Classroom(ClassroomID)
);

-- Attendance Table
CREATE TABLE Attendance (
    AttendanceDate DATE,
    ChildID INT,
    Status VARCHAR(10),
    PRIMARY KEY (AttendanceDate, ChildID),
    FOREIGN KEY (ChildID) REFERENCES Child(ChildID)
);
  

INSERT INTO ParentGuardian VALUES
(1, 'Alice', 'Johnson', '555-1234', '34 Maple Avenue', 'Mother'),
(2, 'Mark', 'Thompson', '777-1234', '22 Pine Lane', 'Grandpa'),
(3, 'Sarah', 'Lee', '233-1234', '12 Oak Street', 'Mother'),
(4, 'David', 'Morales', '523-0934', '19 Cedar Drive', 'Uncle'),
(5, 'Emma', 'Brooks', '834-3412', '88 Birch Blvd', 'Nanny'),
(6, 'Rob', 'Carson', '343-2134', '20 Oak Street', 'Father'),
(7, 'John', 'Jay', '865-2344', '97 Mars street', 'Father'),
(8, 'Theo', 'Dorson', '937-9627', '10 Jupiter road', 'Father');

INSERT INTO Child VALUES
(1, 'Johnny', 'Johnson', '2021-01-25', 'None', 1),
(2, 'Marsha', 'Thompson', '2023-04-10', 'Peanuts', 2),
(3, 'Ronnie', 'Lee', '2023-01-15', 'None', 3),
(4, 'Miles', 'Morales', '2022-09-29', 'None', 4),
(5, 'Bobby', 'Brooks', '2023-11-20', 'Eggs, Peanuts', 5),
(6, 'Robert', 'Carson', '2022-12-25', 'Milk', 6),
(7, 'Josh', 'Jay', '2021-06-01', 'None', 7),
(8, 'Carson', 'Dorson', '2021-07-07', 'None', 8);

INSERT INTO Classroom VALUES
(211, 211, '4+'),
(212, 212, '1-3'),
(101, 101, 'N/A');

INSERT INTO Staff VALUES
(1, 'Ralph', 'Richards', 'Director', 'M-F', 101),
(2, 'Jordan', 'Queenie', 'Teacher', 'M-W', 211),
(3, 'Alice', 'Johns', 'Teacher', 'W-F', 212),
(4, 'Crissy', 'Martinez', 'Assistant', 'T-Th', 212),
(5, 'Molly', 'Williams', 'Front Desk', 'M-F', 101);

INSERT INTO Enrollment VALUES
(1, 211, '2025-05-01'),
(2, 212, '2025-04-16'),
(3, 212, '2025-02-14'),
(4, 212, '2025-05-10'),
(5, 212, '2025-03-29'),
(6, 212, '2024-09-22'),
(7, 211, '2025-01-12'),
(8, 211, '2025-05-12');

INSERT INTO Attendance VALUES
('2025-05-01', 1, 'Present'),
('2025-05-01', 4, 'Present'),
('2025-05-01', 5, 'Absent'),
('2025-05-02', 1, 'Present'),
('2025-05-02', 4, 'Absent'),
('2025-05-02', 8, 'Present'),
('2025-05-03', 8, 'Present'),
('2025-05-03', 5, 'Present'),
('2025-05-03', 2, 'Present'),
('2025-05-04', 2, 'Present');

