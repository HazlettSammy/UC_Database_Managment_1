-- Create Organizations table with NVARCHAR primary key
CREATE TABLE Organizations (
    OrganizationID NVARCHAR(10) PRIMARY KEY,
    OrganizationName NVARCHAR(255) NOT NULL,
    Country NVARCHAR(100),
    Address NVARCHAR(255)
);

-- Create Staff table with NVARCHAR primary key
CREATE TABLE Staff (
    StaffID NVARCHAR(10) PRIMARY KEY,
    FullName NVARCHAR(255) NOT NULL,
    Title NVARCHAR(100),
    Role NVARCHAR(100),
    Email NVARCHAR(255),
    Phone NVARCHAR(15),
    DepartmentID NVARCHAR(10) -- Foreign key column
);

-- Create Departments table with NVARCHAR primary key
CREATE TABLE Departments (
    DepartmentID NVARCHAR(10) PRIMARY KEY,
    DepartmentName NVARCHAR(255) NOT NULL,
    Location NVARCHAR(255),
    Budget DECIMAL(18, 2)
);

-- Create Products table with NVARCHAR primary key
CREATE TABLE Products (
    ProductID NVARCHAR(10) PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    Price DECIMAL(18, 2),
    ProductType NVARCHAR(100)
);

-- Create Order Details table with NVARCHAR primary key and foreign keys
CREATE TABLE OrderDetails (
    OrderID NVARCHAR(10) PRIMARY KEY,
    Country NVARCHAR(100),
    OrganizationName NVARCHAR(255),
    ContractLength NVARCHAR(50),
    DateEstablished DATE,
    ActiveStatus BIT,
    ProductID NVARCHAR(10), -- Foreign key column
    OrganizationID NVARCHAR(10) -- Foreign key column
);

-- Create Projects table with NVARCHAR primary key and foreign keys
CREATE TABLE Projects (
    ProjectID NVARCHAR(10) PRIMARY KEY,
    StaffID NVARCHAR(10), -- Foreign key column
    ProductID NVARCHAR(10), -- Foreign key column
    OrganizationID NVARCHAR(10) -- Foreign key column
);

-- Assign Foreign Key to Organizations table
ALTER TABLE Organizations
ADD OrderID NVARCHAR(10); -- Foreign key column

ALTER TABLE Organizations
ADD CONSTRAINT FK_Organizations_OrderID 
FOREIGN KEY (OrderID) REFERENCES OrderDetails(OrderID);

-- Assign Foreign Key to Staff table
ALTER TABLE Staff
ADD CONSTRAINT FK_Staff_DepartmentID 
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

-- Assign Foreign Keys to Order Details table
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_ProductID 
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_OrganizationID 
FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID);

-- Assign Foreign Keys to Projects table
ALTER TABLE Projects
ADD CONSTRAINT FK_Projects_StaffID 
FOREIGN KEY (StaffID) REFERENCES Staff(StaffID);

ALTER TABLE Projects
ADD CONSTRAINT FK_Projects_ProductID 
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

ALTER TABLE Projects
ADD CONSTRAINT FK_Projects_OrganizationID 
FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID);

-- Data for Organizations Table
INSERT INTO Organizations (OrganizationID, OrganizationName, Country, Address)
VALUES 
('C001', 'U.S. Department of Defense', 'United States', '1400 Defense Pentagon, Washington, DC 20301-1400'),
('C002', 'Battle Organization', 'Taiwan', '123 Maple Street, Taipei, Taiwan'),
('C003', 'Transport Organization', 'Poland', '124 Oak Avenue, Warsaw, Poland'),
('C004', 'Tech Organization', 'United Kingdom', '125 Pine Road, London, UK'),
('C005', 'Transport Organization', 'Mexico', '126 Cedar Lane, Mexico City, Mexico'),
('C006', 'Tech Organization', 'Canada', '127 Birch Street, Toronto, Canada'),
('C007', 'Transport Organization', 'Japan', '128 Cherry Blossom Way, Tokyo, Japan');

-- Data for Staff Table
INSERT INTO Staff (StaffID, FullName, Title, Role, Email, Phone)
VALUES 
('E001-M', 'John Smith', 'Aerospace Engineering Department Head', 'Member, Supervisor', 'john.smith@mail.com', '(555) 654-3210'),
('E002', 'Eric Carter', 'Researcher', 'Member', 'eric.carter@mail.com', '(555) 321-0987'),
('E003-M', 'Juliet Love', 'Human Resource Department Head', 'Member, Supervisor', 'juliet.love@mail.com', '(555) 432-1098'),
('E004', 'Tania Little', 'Financial Accountant', 'Member', 'tania.little@mail.com', '(555) 210-9876'),
('E005-M', 'Karl Wheeler', 'IT Department Head', 'Member, Supervisor', 'karl.wheeler@mail.com', '(555) 890-1234'),
('E006-M', 'Lydia Caldwell', 'Finance Department Head', 'Member, Supervisor', 'lydia.caldwell@mail.com', '(555) 012-3456'),
('E007-M', 'Felix Mercer', 'Machinist Department Head', 'Member, Supervisor', 'felix.mercer@mail.com', '(555) 987-6543'),
('E008-M', 'Ava Kline', 'Mechanical Engineering Department Head', 'Member, Supervisor', 'ava.kline@mail.com', '(555) 234-5678'),
('E009-M', 'Miles Thorne', 'Electrical Engineering Department Head', 'Member, Supervisor', 'miles.thorne@mail.com', '(555) 876-5432'),
('E010-M', 'Zara Voss', 'Project Management Head', 'Member, Supervisor', 'zara.voss@mail.com', '(555) 345-6789'),
('E011', 'Julian Langley', 'Project Manager', 'Member, Supervisor', 'julian.langley@mail.com', '(555) 765-4321'),
('E012', 'Mira Reyes', 'Project Manager', 'Member, Supervisor', 'mira.reyes@mail.com', '(555) 456-7890');

-- Data for Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName, Location, Budget)
VALUES 
('A-ENG', 'Aerospace Engineers', 'Room 103', 100000000000),
('E-ENG', 'Electrical Engineers', 'Room 104', 18000000000),
('M-ENG', 'Mechanical Engineers', 'Room 204', 500000000),
('MACH', 'Machinists', 'Room 203', 24000000000),
('FIN', 'Financial Management', 'Lockheed Hall', 1000000000),
('TECH', 'Information Technology', 'Room 209', 100000000000),
('HR', 'Human Resources', 'Room 218', 100000000000),
('PMO', 'Project Management Office', 'Room 312', 10000000000);

-- Data for Products
INSERT INTO Products (ProductID, ProductName, Price, ProductType)
VALUES
('P1', 'F16 Fighting Falcon', 70000000, 'Fighter'),
('P2', 'F2 Mitsubishi', 120000000, 'Fighter'),
('P3', 'F117 NightHawk', 111000000, 'Fighter'),
('P4', 'F22 Raptor', 150000000, 'Fighter'),
('P5', 'F35 Lightning II', 100000000, 'Fighter'),
('P6', 'C130 Hercules', 50000000, 'Transport'),
('P7', 'C141 Starlifter', 14000000, 'Transport'),
('P8', 'C5 Galaxy', 100000000, 'Transport'),
('P9', 'A4 Fighting Hawk', 4000000, 'Attack'),
('P10', 'T-50 Golden Eagle', 20000000, 'Trainer');

-- Data for OrderDetails
INSERT INTO OrderDetails (OrderID, Country, OrganizationName, ProductID, OrganizationID, ContractLength, DateEstablished, ActiveStatus)
VALUES 
('LMA-001', 'United States', 'U.S. Department of Defense', 'P1', 'C001', '30 Years', '2014-07-18', 1),
('LMA-002', 'Taiwan', 'Battle organization', 'P2', 'C002', '6 Years', '2021-08-13', 1),
('LMA-003', 'Poland', 'Transport organization', 'P3', 'C003', '3 Years', '2015-08-14', 0),
('LMA-004', 'United Kingdom', 'Tech organization', 'P4', 'C004', '8 Years', '2021-08-15', 1),
('LMA-005', 'Mexico', 'Transport organization', 'P5', 'C005', '1 Year', '2019-08-16', 0),
('LMA-006', 'Canada', 'Tech organization', 'P6', 'C006', '10 Years', '2018-08-17', 1),
('LMA-007', 'Japan', 'Transport organization', 'P7', 'C007', '11 Years', '2016-08-18', 1);

-- Data for Projects
INSERT INTO Projects (ProjectID, StaffID, ProductID, OrganizationID)
VALUES 
('PJ 1', 'E012', 'P2', 'C007'),
('PJ 2', 'E012', 'P5', 'C001'),
('PJ 3', 'E011', 'P5', 'C004'),
('PJ 4', 'E011', 'P6', 'C005'),
('PJ 5', 'E011', 'P6', 'C006');

-- Adding Foreign Key OrderID Data

UPDATE Organizations
SET OrderID = 'LMA-001'
WHERE OrganizationID = 'C001';

UPDATE Organizations
SET OrderID = 'LMA-002'
WHERE OrganizationID = 'C002';

UPDATE Organizations
SET OrderID = 'LMA-003'
WHERE OrganizationID = 'C003';

UPDATE Organizations
SET OrderID = 'LMA-004'
WHERE OrganizationID = 'C004';

UPDATE Organizations
SET OrderID = 'LMA-005'
WHERE OrganizationID = 'C005';

UPDATE Organizations
SET OrderID = 'LMA-006'
WHERE OrganizationID = 'C006';

UPDATE Organizations
SET OrderID = 'LMA-007'
WHERE OrganizationID = 'C007';

-- Adding Foreign Key DepartmentID Data
UPDATE Staff
SET DepartmentID = 'A-ENG'
WHERE StaffID = 'E001-M';

UPDATE Staff
SET DepartmentID = 'TECH'
WHERE StaffID = 'E002';

UPDATE Staff
SET DepartmentID = 'HR'
WHERE StaffID = 'E003-M';

UPDATE Staff
SET DepartmentID = 'TECH'
WHERE StaffID = 'E004';

UPDATE Staff
SET DepartmentID = 'TECH'
WHERE StaffID = 'E005-M';

UPDATE Staff
SET DepartmentID = 'FIN'
WHERE StaffID = 'E006-M';

UPDATE Staff
SET DepartmentID = 'MACH'
WHERE StaffID = 'E007-M';

UPDATE Staff
SET DepartmentID = 'M-ENG'
WHERE StaffID = 'E008-M';

UPDATE Staff
SET DepartmentID = 'E-ENG'
WHERE StaffID = 'E009-M';

UPDATE Staff
SET DepartmentID = 'PMO'
WHERE StaffID = 'E010-M';

UPDATE Staff
SET DepartmentID = 'PMO'
WHERE StaffID = 'E011';

UPDATE Staff
SET DepartmentID = 'PMO'
WHERE StaffID = 'E012';

