--3. Simulate Transaction Proses 

---1. Staff named Astley Rahmat checks the Sport Field Location Available, because one customer came in to the store
--man, why he do that if no customer came, smh.
SELECT SportFieldsID, SportFieldsName, 
SportFieldsAddress, 
[SportFieldsRenting] = 'Rp. ' + CONVERT(varchar, SportFieldsRentingFee) 
FROM SportFields

--2. Anton, customer's name, wants to rent one of the location available to play Basketball with his friends
-- for 3 hours at Kejayaan Field
--So, staff wants the information about the customer to be inputted 
INSERT INTO Customer VALUES
('CU011', 'Anton Stefanus', '19', '0811776528')

--3 Anton gives the payment and Staff inputs the Rental Transaction Tables and and also basketball with 3 balls
INSERT INTO HeadRentalTransaction VALUES 
('RT016', 'ST004', 'CU011', 'SF004', '2022-06-17')

INSERT INTO DetailRentalTransaction VALUES
('RT016', 'SF004', '3')

----4. Staff will show the transaction statistics of the location rental
-- (Customer (CustomerName, CustomerAge), Staff (StaffName), 
-- SportFields (SportFieldsName, SportFieldsAddress, SportFieldRenting) HeadRentalTransaction (RentalTransactionID), DetailRentalTransaction (RentalLength))

SELECT [Rental ID] = h.RentalTransactionID, [Customer Name] = CustomerName, [Age] = CustomerAge, [Staff] = StaffName,
[Sport Field Name] = SportFieldsName, 
[Sport Field Address] = SportFieldsAddress, 
[Rent Cost] = 'Rp. '+ (convert (varchar, SportFieldsRentingFee)), 
[Duration] = convert(varchar,RentalLength) + ' hours',
[Total Cost] = 'Rp. ' + convert (varchar, (SportFieldsRentingFee * RentalLength))
from Customer c
join HeadRentalTransaction h on c.CustomerID = h.CustomerID
join DetailRentalTransaction d on h.RentalTransactionID = d.RentalTransactionID
join Staff s on s.StaffID = h.StaffID
join SportFields sf on sf.SportFieldsID = h.SportFieldsID
where c.CustomerID = 'CU011' AND
s.StaffID = 'ST004' AND
sf.SportFieldsID LIKE 'SF004' AND
h.RentalTransactionID LIKE 'RT016'