CREATE DATABASE TaskManagementDB;
GO

USE TaskManagementDB;
GO


CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Role NVARCHAR(20) NOT NULL CHECK (Role IN ('Manager', 'Employee'))
);


CREATE TABLE Tasks (
    TaskID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(500),
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Pending', 'In Progress', 'Completed')),
    DueDate DATETIME NOT NULL,
    AssignedTo INT NULL,
    FOREIGN KEY (AssignedTo) REFERENCES [User](UserID)
);


INSERT INTO [User] (Name, Password, Email, Role) VALUES
('seif', '123', 'seif@company.com', 'Employee'),
('mohamed', '123', 'mohamed@company.com', 'Manager'),
('zeyad', '123', 'zeyad@company.com', 'Employee'),
('abdelsadek', '123', 'abdelsadek@company.com', 'Manager');

INSERT INTO Tasks (Title, Description, Status, DueDate, AssignedTo) VALUES
('Complete Project Documentation', 'Write detailed documentation for the project', 'Pending', '2024-12-31', 1),
('Fix Login Bug', 'Resolve the authentication issue', 'In Progress', '2024-12-20', 1),
('Update User Manual', 'Update the user manual with new features', 'Completed', '2024-12-15', 1),
('Design New Feature', 'Create mockups for the new feature', 'Pending', '2024-12-25', 3),
('Code Review', 'Review team members code', 'In Progress', '2024-12-18', 3);