CREATE DATABASE JettSportsCenter

USE JettSportsCenter

-----------------------------------------------------------------------------------------------------
-- 1. CREATE TABLE 

--Table Staff (Master)
CREATE TABLE Staff (
StaffID CHAR(5) PRIMARY KEY,
StaffName VARCHAR(30) CHECK (LEN(StaffName) > 4) NOT NULL,
StaffGender VARCHAR(30) NOT NULL,
StaffSalary INT,
CONSTRAINT StaffID CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'), 
CONSTRAINT StaffGender CHECK (StaffGender LIKE 'Male' OR StaffGender LIKE 'Female'),
CONSTRAINT StaffSalary CHECK (StaffSalary >= 1000000)
)


--Table Customer (Master)
CREATE TABLE Customer(
CustomerID CHAR(5) PRIMARY KEY,
CustomerName VARCHAR (30) CHECK (CustomerName Like '% %') NOT NULL,
CustomerAge INT NOT NULL,
CustomerPhone varchar(30) CHECK (LEN(CustomerPhone) = 10) NOT NULL,
CONSTRAINT CustomerID CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
CONSTRAINT CustomerAge CHECK (CustomerAge >= 6)
)


-- Table Product (Master)
CREATE TABLE Product(
ProductID CHAR(5) PRIMARY KEY,
ProductName VARCHAR(50) NOT NULL CHECK (LEN(ProductName) >= 4),
ProductPrice INT,
CONSTRAINT ProductID CHECK (ProductID like 'PR[0-9][0-9][0-9]'),
CONSTRAINT ProductPrice CHECK (ProductPrice >= 10000 AND ProductPrice <= 100000)
)

--Table HeadProductTransaction (Transactions)
CREATE TABLE HeadProductTransaction(
ProductTransactionID CHAR(5) PRIMARY KEY,
StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
ProductID CHAR (5) FOREIGN KEY REFERENCES Product(ProductID) NOT NULL,
ProdTransactionDate DATE NOT NULL CHECK (YEAR(ProdTransactionDate) = 2022),
CONSTRAINT ProductTransactionID CHECK (ProductTransactionID LIKE 'PT[0-9][0-9][0-9]')
)


--Table DetailProductTransaction (Trans Detail)
CREATE TABLE DetailProductTransaction(
ProductTransactionID CHAR (5) FOREIGN KEY REFERENCES HeadProductTransaction(ProductTransactionID)
ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
ProductID CHAR (5) FOREIGN KEY REFERENCES Product(ProductID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
ProdQuantity INT NOT NULL,
CONSTRAINT ProdQuantity CHECK (ProdQuantity >= 1)
)


-- Table SportFields (Master)
CREATE TABLE SportFields(
SportFieldsID CHAR(5) PRIMARY KEY,
SportFieldsName VARCHAR(80) CHECK (SportFieldsName LIKE '%Field') NOT NULL,
SportFieldsAddress VARCHAR(80) CHECK (SportFieldsAddress LIKE '%Street') NOT NULL,
SportFieldsRentingFee INT,
CONSTRAINT SportFieldsID CHECK (SportFieldsID LIKE 'SF[0-9][0-9][0-9]'),
CONSTRAINT SportFieldsRentingFee CHECK (SportFieldsRentingFee >= 10000 AND SportFieldsRentingFee <= 100000)
)


-- Table HeadRentalTransaction (Transactions)
CREATE TABLE HeadRentalTransaction(
RentalTransactionID CHAR(5) PRIMARY KEY,
StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
SportFieldsID CHAR(5) FOREIGN KEY REFERENCES SportFields(SportFieldsID) NOT NULL,
RentTransactionDate DATE NOT NULL check (YEAR(RentTransactionDate) = 2022),
CONSTRAINT RentalTransactionID CHECK (RentalTransactionID LIKE 'RT[0-9][0-9][0-9]')
)


--Table DetailRentalTransaction (Trans Detail)
CREATE TABLE DetailRentalTransaction(
RentalTransactionID CHAR(5) FOREIGN KEY REFERENCES HeadRentalTransaction(RentalTransactionID)
ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
SportFieldsID CHAR(5) FOREIGN KEY REFERENCES SportFields(SportFieldsID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
RentalLength INT CHECK (RentalLength >= 1) NOT NULL
)