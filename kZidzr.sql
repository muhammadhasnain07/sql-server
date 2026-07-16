-- 1. Department Table (ID auto-increment hogi)
CREATE TABLE Department1 (
    DepartID INT IDENTITY(1,1) PRIMARY KEY,
    Designation VARCHAR(100)
);

-- 2. Salary Table (ID auto-increment hogi aur Department as Foreign Key)
CREATE TABLE Salary (
    SalaryID INT IDENTITY(1,1) PRIMARY KEY,
    Department INT,
    Salary DECIMAL(10, 2),
    FOREIGN KEY (Department) REFERENCES Department1(DepartID)
);

-- 3. Employees3 Table (ID auto-increment hogi aur DepartID as Foreign Key)
CREATE TABLE Employees3 (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100),
    Joining DATE,
    DepartID INT,
    FOREIGN KEY (DepartID) REFERENCES Department1(DepartID)
);

INSERT INTO Department1 (Designation) VALUES ('IT');       -- Yeh ban jayega DepartID = 1
INSERT INTO Department1 (Designation) VALUES ('Faculty');  -- Yeh ban jayega DepartID = 2
INSERT INTO Department1 (Designation) VALUES ('HR');       -- Yeh ban jayega DepartID = 3


INSERT INTO Employees3 (Name, Joining, DepartID) VALUES ('Ali Ahmed', '2026-01-15', 1);
INSERT INTO Employees3 (Name, Joining, DepartID) VALUES ('Sana Khan', '2026-02-10', 2);
INSERT INTO Employees3 (Name, Joining, DepartID) VALUES ('Zainab Fatima', '2026-03-01', 3);


SELECT 
    e.ID AS EmployeeID,
    e.Name AS EmployeeName,
    e.Joining AS JoiningDate,
    d.Designation AS DepartmentName,
    s.Salary AS FixedSalary
FROM Employees3 e
INNER JOIN Department1 d ON e.DepartID = d.DepartID
INNER JOIN Salary s ON d.DepartID = s.Department;

SELECT * FROM Department1
SELECT * FROM Employees3
SELECT * FROM Salary