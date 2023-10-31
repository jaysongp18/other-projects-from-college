--- NO 2 INSERT TABLE 
-- Staff
INSERT INTO Staff VALUES
('ST001', 'Maguire Renaldy', 'Male', '1500000'),
('ST002', 'Stefan Renaldy', 'Male', '1525000'),
('ST003', 'Felicia Hartono', 'Female', '1600000'),
('ST004', 'Astley Rahmat', 'Male', '1508000'),
('ST005', 'Amogyn Briston', 'Female', '1700000'),
('ST006', 'Regina Trista', 'Female', '1645000'),
('ST007', 'Cena Johnson', 'Male', '5000000'),
('ST008', 'Jonathan', 'Male', '6000000'),
('ST009', 'Valerie Anastasia', 'Female', '6500000'),
('ST010', 'Anya Chen', 'Female', '8000000')


--Customer
INSERT INTO Customer VALUES
('CU001', 'Andari Anna', '18', '0821638252'),
('CU002', 'Ferry Susanto', '28', '0822939375'),
('CU003', 'Stefan Gun', '15', '0854019782'),
('CU004', 'Jonathan Verzy', '18', '0883892645'),
('CU005', 'Maria Sun', '36', '0811837284'),
('CU006', 'Prenia Alexandra Gun', '42', '0899172839'),
('CU007', 'John Morgan', '24', '0866383925'),
('CU008', 'Tachanapol Samsakattavuroh', '29', '0882935437'),
('CU009', 'Song Hyun Jie', '14', '0822735552'),
('CU010', 'Venny Suyanni', '52', '0812993736')

--Product
INSERT INTO Product VALUES
('PR001', 'Soccer Ball', '80000'),
('PR002', 'Volley Ball', '70000'),
('PR003', 'Tennis Ball', '45000'),
('PR004', 'Shuttlecock', '30000'),
('PR005', 'Tennis Racket', '65000'),
('PR006', 'Badminton Racket', '42000'),
('PR007', 'Basket Ball', '70000'),
('PR008', 'Sport Shoes', '77000'),
('PR009', 'Racket Grip', '14000'),
('PR010', 'Basketball Clothes', '90000')

--Sportfields
INSERT INTO  SportFields VALUES
('SF001', 'Gelora Field', 'Veteran Street', '20000'),
('SF002', 'Sanjaya Field', 'Sudirman Street', '30000'),
('SF003', 'Arek Field', 'Pahlawan Street', '10000'),
('SF004', 'Kejayaan Field', 'Jaya Street', '25000'),
('SF005', 'Passion Field', 'Veteran Street', '21000'),
('SF006', 'Bulan Field', 'Veteran Street', '20000'),
('SF007', 'Kemayoran Field', 'Veteran Street', '65000'),
('SF008', 'Bonek Field', 'Veteran Street', '70000'),
('SF009', 'Raja Field', 'Veteran Street', '80000'),
('SF010', 'Mangkubumi Field', 'Veteran Street', '85000')

--HeaderProductTransaction
INSERT INTO HeadProductTransaction VALUES
('PT001', 'ST001', 'CU001', 'PR001', '2022-01-05'),
('PT002', 'ST002', 'CU002', 'PR002', '2022-11-05'),
('PT003', 'ST003', 'CU003', 'PR003', '2022-07-15'),
('PT004', 'ST004', 'CU004', 'PR004', '2022-07-12'),
('PT005', 'ST005', 'CU005', 'PR005', '2022-04-11'),
('PT006', 'ST006', 'CU006', 'PR006', '2022-02-22'),
('PT007', 'ST007', 'CU007', 'PR007', '2022-02-24'),
('PT008', 'ST008', 'CU008', 'PR008', '2022-02-25'),
('PT009', 'ST009', 'CU009', 'PR009', '2022-05-19'),
('PT010', 'ST010', 'CU010', 'PR010', '2022-01-20'),
('PT011', 'ST004', 'CU002', 'PR001', '2022-10-05'),
('PT012', 'ST002', 'CU006', 'PR004', '2022-11-27'),
('PT013', 'ST009', 'CU001', 'PR002', '2022-09-16'),
('PT014', 'ST006', 'CU010', 'PR008', '2022-04-23'),
('PT015', 'ST007', 'CU005', 'PR003', '2022-01-15')

--HeaderRentalTransaction
INSERT INTO HeadRentalTransaction VALUES
('RT001', 'ST001', 'CU001', 'SF001', '2022-01-01'),
('RT002', 'ST002', 'CU002', 'SF002', '2022-12-06'),
('RT003', 'ST003', 'CU003', 'SF003', '2022-09-08'),
('RT004', 'ST004', 'CU004', 'SF004', '2022-11-05'),
('RT005', 'ST005', 'CU005', 'SF005', '2022-12-01'),
('RT006', 'ST006', 'CU006', 'SF006', '2022-08-11'),
('RT007', 'ST007', 'CU007', 'SF007', '2022-07-19'),
('RT008', 'ST008', 'CU008', 'SF008', '2022-12-09'),
('RT009', 'ST009', 'CU009', 'SF009', '2022-12-17'),
('RT010', 'ST010', 'CU010', 'SF010', '2022-05-15'),
('RT011', 'ST002', 'CU004', 'SF003', '2022-02-27'),
('RT012', 'ST005', 'CU001', 'SF002', '2022-03-22'),
('RT013', 'ST001', 'CU009', 'SF004', '2022-03-21'),
('RT014', 'ST009', 'CU007', 'SF002', '2022-12-07'),
('RT015', 'ST010', 'CU006', 'SF009', '2022-12-23')


--DetailProductTransaction
INSERT INTO  DetailProductTransaction VALUES
('PT001', 'PR001', 1),
('PT002', 'PR002', 3),
('PT003', 'PR003', 2),
('PT004', 'PR004', 2),
('PT005', 'PR005', 1),
('PT006', 'PR006', 6),
('PT007', 'PR007', 2),
('PT008', 'PR008', 3),
('PT009', 'PR009', 1),
('PT010', 'PR010', 3),
('PT011', 'PR001', 8),
('PT012', 'PR004', 10),
('PT013', 'PR002', 2),
('PT014', 'PR008', 1),
('PT015', 'PR003', 4),
('PT012', 'PR006', 1),
('PT014', 'PR007', 3),
('PT005', 'PR010', 5),
('PT003', 'PR006', 7),
('PT011', 'PR009', 11),
('PT004', 'PR002', 4),
('PT001', 'PR006', 9),
('PT007', 'PR001', 2),
('PT006', 'PR009', 9),
('PT002', 'PR005', 1)

--DetailRentalTransaction
INSERT INTO DetailRentalTransaction VALUES
('RT001', 'SF001', '2'),
('RT002', 'SF002', '1'),
('RT003', 'SF003', '1'),
('RT004', 'SF004', '3'),
('RT005', 'SF005', '2'),
('RT006', 'SF006', '1'),
('RT007', 'SF007', '1'),
('RT008', 'SF008', '2'),
('RT009', 'SF009', '2'),
('RT010', 'SF010', '1'),
('RT011', 'SF003', '3'),
('RT012', 'SF002', '2'),
('RT013', 'SF004', '2'),
('RT014', 'SF002', '1'),
('RT015', 'SF009', '2'),
('RT001', 'SF009', '1'),
('RT004', 'SF002', '1'),
('RT009', 'SF010', '4'),
('RT002', 'SF006', '2'),
('RT010', 'SF007', '2'),
('RT003', 'SF001', '1'),
('RT005', 'SF004', '2'),
('RT007', 'SF004', '3'),
('RT006', 'SF003', '3'),
('RT012', 'SF001', '2')
