-- DML 10 Question

USE JettSportsCenter
--1
SELECT [Product] = REPLACE(p.ProductID, 'PR', 'Product Id '),
[Total Item Sold] = CAST(SUM(ProdQuantity) AS VARCHAR) + ' pcs'
FROM DetailProductTransaction dt JOIN Product p 
ON dt.ProductID = p.ProductID JOIN HeadProductTransaction ht
ON ht.ProductID = dt.ProductID JOIN Staff s
ON s.StaffID = ht.StaffID
WHERE s.StaffGender LIKE 'Female' AND s.StaffSalary > 4000000
GROUP BY REPLACE(p.ProductID, 'PR', 'Product Id ')

--2
SELECT dt.ProductTransactionID, [Total Product Type] = SUM(ProdQuantity)
FROM DetailProductTransaction dt JOIN HeadProductTransaction ht
ON ht.ProductTransactionID = dt.ProductTransactionID JOIN Product p
ON p.ProductID = dt.ProductID
WHERE MONTH(ht.ProdTransactionDate) > 6
GROUP BY dt.ProductTransactionID
HAVING SUM(dt.ProdQuantity) > 1

--3
SELECT [Sport Field Id] = REPLACE(sp.SportFieldsID, 'SF', 'Sport Field '),
[Sport Field Address] = REPLACE(SportFieldsAddress, 'Street', 'St '),
[Highest Transaction] = 'RP ' + CONVERT(VARCHAR, MAX(SportFieldsRentingFee)),
[Cost] = COUNT(SportFieldsRentingFee * RentalLength),
[Lowest Transaction] = 'Rp ' + CONVERT(VARCHAR, MIN(SportFieldsRentingFee))
FROM SportFields sp JOIN DetailRentalTransaction dr
ON dr.SportFieldsID = sp.SportFieldsID
WHERE SportFieldsRentingFee < 50000 AND RIGHT(sp.SportFieldsID , 1) % 2 = 1
GROUP BY REPLACE(sp.SportFieldsID, 'SF', 'Sport Field '),  REPLACE(SportFieldsAddress, 'Street', 'St ')


--4
SELECT sf.SportFieldsID , [Staff Salary Deviation] = 'Rp ' + CAST(MAX(StaffSalary) - MIN(StaffSalary) AS varchar)
FROM SportFields sf JOIN HeadRentalTransaction ht 
ON ht.SportFieldsID = sf.SportFieldsID JOIN Staff ss
ON ss.StaffID = ht.StaffID
WHERE RIGHT(sf.SportFieldsID, 1) % 2 = 1 
GROUP BY sf.SportFieldsID
HAVING  MAX(ss.StaffSalary) - MIN(ss.StaffSalary) >= 1000000

--5
SELECT StaffID = LOWER(s.StaffID), StaffName = UPPER(StaffName), StaffGender = LEFT(StaffGender, 1),
RentalTransactionID, CustomerName
FROM Staff s JOIN HeadRentalTransaction hrt 
ON s.StaffID = hrt.StaffID JOIN Customer c 
ON c.CustomerID = hrt.CustomerID, 
(
SELECT [Highest Salary] = MAX(StaffSalary)
FROM Staff
) AS StaSalHigh
WHERE s.StaffSalary = StaSalHigh.[Highest Salary]
AND StaffGender LIKE 'Female'
ORDER BY  StaffName

--6
SELECT c.CustomerID, c.CustomerName, CustomerAge = CONVERT(VARCHAR, CustomerAge) + ' years old',
CustomerPhone = REPLACE(CustomerPhone, LEFT(CustomerPhone, 2), '+62')
from Customer c JOIN HeadProductTransaction hpt 
ON c.CustomerID = hpt.CustomerID JOIN DetailProductTransaction dpt 
ON hpt.ProductTransactionID = dpt.ProductTransactionID, 
(SELECT [Youngest Customer] = MIN(CustomerAge)
FROM Customer
) AS YoungCustomer
WHERE c.CustomerAge = YoungCustomer.[Youngest Customer]
AND ProdQuantity < 50

--7
SELECT ProductName =  UPPER(ProductName),
ProductPrice = 'Rp. ' +  CONVERT(varchar, ProductPrice)
FROM Product p, (
SELECT [Most Expensive Product] = MAX(ProductPrice)
FROM Product 
) AS Category
WHERE p.ProductPrice = Category.[Most Expensive Product] AND
CONVERT(INT, REPLACE(ProductID, 'PR', ' ')) % 2 = 0
UNION
SELECT ProductName =  UPPER(ProductName),
ProductPrice = 'Rp. ' +  CONVERT(VARCHAR, ProductPrice)
FROM Product p, (
SELECT [Most Affordable Product] = MIN(ProductPrice)
FROM Product 
) AS Category
WHERE p.ProductPrice = Category.[Most Affordable Product] AND
CONVERT(int, REPLACE(ProductID, 'PR', ' ')) % 2 = 0

--8
SELECT [ProductTransactionID] = REPLACE(ProductTransactionID, 'PT' , 'Product Transaction Id '),
[Date] = CONVERT(DATETIME, ProdTransactionDate, 107),
c.CustomerID, [CustomerName] = UPPER(CustomerName), s.StaffID, [StaffGender] =  LEFT(StaffGender, 1)
FROM HeadProductTransaction hp JOIN Customer c
ON c.CustomerID = hp.CustomerID JOIN Staff s
ON s.StaffID = hp.StaffID,
(
SELECT [Oldest Customer] = MIN(CustomerAge),
[Average Salary] =  AVG(StaffSalary)
FROM Customer c JOIN HeadProductTransaction hpt 
ON hpt.CustomerID = c.CustomerID JOIN Staff s 
ON hpt.StaffID = s.StaffID
GROUP BY REPLACE(ProductTransactionID, 'PT' , 'Product Transaction Id '), CONVERT(DATETIME, ProdTransactionDate, 107), c.CustomerID,
UPPER(CustomerName), s.StaffID, LEFT(StaffGender, 1)
) AS Oldcust
WHERE c.CustomerAge = OldCust.[Oldest Customer]
AND s.StaffSalary = OldCust.[Average Salary]
AND s.StaffSalary >= OldCust.[Average Salary]


--9
CREATE VIEW annualMonthlyRentalReport AS
SELECT [Yearly Rental Revenue] = SUM(dt.RentalLength * sf.SportFieldsRentingFee),
[Average Rental Revenue] = AVG(dt.RentalLength * sf.SportFieldsRentingFee)
FROM DetailRentalTransaction dt JOIN HeadRentalTransaction ht
ON ht.RentalTransactionID = dt.RentalTransactionID JOIN SportFields sf
ON sf.SportFieldsID = dt.SportFieldsID
WHERE MONTH(RentTransactionDate) = 12 AND SportFieldsRentingFee > 60000


--10
CREATE VIEW annualMonthlyProductReport AS
SELECT [Yearly Product Revenue] = COUNT(ProdQuantity * ProductPrice),
[Average Product Revenue] = AVG(ProdQuantity * ProductPrice)
FROM DetailProductTransaction dp JOIN Product p
ON p.ProductID = dp.ProductID JOIN HeadProductTransaction hp
ON hp.ProductID = dp.ProductID
WHERE MONTH(ProdTransactionDate) = 1 AND ProductPrice > 30000




