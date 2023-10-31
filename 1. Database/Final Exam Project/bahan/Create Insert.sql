
create database Metroland2
use Metroland2

--Branch
create table Branch (
StaffID char(5) primary key check(StaffID like 'ST[0-9][0-9][0-9]') not null,
StaffName varchar (50) not null
)

insert into Branch values 
('ST001', 'Anton'),
('ST002', 'Andi Suyanto'),
('ST003', 'Merry Yuliana'),
('ST004', 'Juliari Natu'),
('ST005', 'Helin Yuni')

--Members
create table Members(
MemberID char(5) primary key check(MemberID like 'ME[0-9][0-9][0-9]') not null,
MemberName varchar (100) not null,
MemberAddress varchar (100) check (MemberAddress like 'Jl.%') not null,
MemberPhone varchar(30) check (LEN(MemberPhone) = 12) not null,
)

insert into Members values 
('ME001', 'Joshua Antonius', 'Jl. Kenangan', '082132892910'),
('ME002', 'Effendy Antonius', 'Jl. Veteran', '082235491210'),
('ME003', 'Menny Wijaya', 'Jl. Sudirman', '085522592990'),
('ME004', 'Tutug Suandi', 'Jl. Pahlawan', '089804192910'),
('ME005', 'Veryn Saputra', 'Jl. Hatta', '081152892230'),
('ME006', 'Roberto Unstan', 'Jl. Kenangan', '086628949180'),
('ME007', 'Amanda Verly', 'Jl. Nangka', '082174920297'),
('ME008', 'Angelina Candra', 'Jl. Sudirman', '083302983739'),
('ME009', 'Ricky Astlanto', 'Jl. Perjuangan', '081233029387'),
('ME010', 'Mulyanos', 'Jl. Kehidupan', '082749308286')

--Toy
create table Toy(
ToyID char (5) primary key check (ToyID like 'TO[0-9][0-9][0-9]'),
ToyName varchar(100) not null,
ToyType varchar(50) not null,
)

insert into Toy values 
('TO001', 'Dinosaurrrr', 'Nature Toy'),
('TO002', 'Cold Tires', 'Vehicle Toy'),
('TO003', 'DeWent', 'Brick Toy'),
('TO004', 'Gendum', 'Robot Toy'),
('TO005', 'MatchCircle', 'Puzzle Toy')

--SalesHeader
create table SalesHeader (
SalesID char(5) primary key check (SalesID like 'SA[0-9][0-9][0-9]'),
MemberID char(5) foreign key references Members(MemberID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
StaffID char(5) foreign key references Branch(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
SalesDate date not null  CHECK (YEAR(SalesDate) = 2022)
)

insert into SalesHeader values 
('SA001', 'ME001', 'ST001', '2022-01-01'),
('SA002', 'ME002', 'ST002', '2022-06-01'),
('SA003', 'ME003', 'ST003', '2022-03-01'),
('SA004', 'ME004', 'ST004', '2022-08-01'),
('SA005', 'ME005', 'ST005', '2022-08-20'),
('SA006', 'ME006', 'ST005', '2022-06-12'),
('SA007', 'ME007', 'ST004', '2022-02-22'),
('SA008', 'ME008', 'ST004', '2022-02-13'),
('SA009', 'ME009', 'ST002', '2022-01-21'),
('SA010', 'ME010', 'ST003', '2022-01-11')


--SalesDetail
create table SalesDetail (
SalesID char(5) foreign key references SalesHeader(SalesID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
ToyID char(5) foreign key references Toy(ToyID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
SalesQuantity int not null,
SalesPrice int not null
)


insert into SalesDetail values 
('SA001', 'TO001', 4, 30000),
('SA002', 'TO002', 2, 25000),
('SA003', 'TO003', 5, 20000),
('SA004', 'TO004', 4, 40000),
('SA005', 'TO005', 2, 15000),
('SA006', 'TO003', 1, 20000),
('SA007', 'TO004', 1, 40000),
('SA008', 'TO004', 4, 40000),
('SA009', 'TO002', 3, 25000),
('SA010', 'TO002', 2, 25000),
('SA008', 'TO001', 5, 30000),
('SA004', 'TO003', 1, 20000)


--Supplier
create table Supplier (
SupplierID char (5) primary key check (SupplierID like 'SU[0-9][0-9][0-9]'),
SupplierName varchar(100) not null,
SupplierPhone varchar(50) check (LEN(SupplierPhone) = 12) not null
)

insert into Supplier values 
('SU001', 'Kencana Supplier', '082301928190'),
('SU002', 'Damai Supplier', '081192928190'),
('SU003', 'Unity Supplier', '081290428190'),
('SU004', 'Kamuro Supplier', '082302925194'),
('SU005', 'Strong Supplier', '085201222175')

--PurchaseHeader
create table PurchaseHeader (
PurchaseID char(5) primary key check (PurchaseID like 'PA[0-9][0-9][0-9]'),
SupplierID char(5) foreign key references Supplier(SupplierID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
PurchaseDate date not null CHECK (YEAR(PurchaseDate) = 2022)
)

insert into PurchaseHeader values 
('PA001', 'SU001', '2022-01-02'),
('PA002', 'SU002', '2022-06-28'),
('PA003', 'SU003', '2022-03-22'),
('PA004', 'SU004', '2022-05-12'),
('PA005', 'SU005', '2022-04-26')


--PurchaseDetail
create table PurchaseDetail (
PurchaseID char(5) foreign key references PurchaseHeader(PurchaseID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
ToyID char(5) foreign key references Toy(ToyID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
PurchaseQuantity int not null,
PurchasePrice int not null
)

insert into PurchaseDetail values 
('PA001', 'TO001', 20, '25000'),
('PA002', 'TO002', 8, '24000'),
('PA003', 'TO003', 15, '16500'),
('PA004', 'TO004', 20, '38000'),
('PA005', 'TO005', 14, '8000'),
('PA003', 'TO002', 10, '24000'),
('PA002', 'TO004', 10, '38000'),
('PA004', 'TO005', 8, '8000')


--Answers

--6
select distinct
t.ToyID,
[Sold Toy Type] =  ToyType,
[Purchase Price] = 'Rp. ' + convert(varchar,PurchasePrice),
[Sales Price] =  'Rp. ' + convert(varchar,SalesPrice),
[Profit For Each Type] =  'Rp. ' + convert(varchar,(SalesPrice - PurchasePrice)),
[Profit Percentage] = 
(convert(varchar,(((convert(float,SalesPrice) - convert(float, PurchasePrice)) * 100) / convert(float, PurchasePrice)))) + '%',
[Total Quantity] = sum(SalesQuantity),
[Total Profit For Each Type] = 'Rp. ' + convert(varchar, sum (((SalesQuantity) * (SalesPrice - PurchasePrice))))
from Toy t
join SalesDetail sd on t.ToyID = sd.ToyID
join SalesHeader sh on sd.SalesID = sh.SalesID
join PurchaseDetail pd on t.ToyID = pd.ToyID
where YEAR(SalesDate) = 2022
and
MONTH(SalesDate) < 4 
group by t.ToyID, ToyType ,PurchasePrice, SalesPrice
order by t.ToyID asc



--7
select distinct t.*
from Toy t
where not exists (
select *
from SalesDetail
join SalesDetail sd on t.ToyID = sd.ToyID
join SalesHeader sh on sd.SalesID = sh.SalesID
where YEAR(SalesDate) = 2022 and MONTH(SalesDate) < 4
) 






--8
create view [Customer Data] AS
select [Customer Name] = MemberName, 
[Customer Phone] = MemberPhone
from Members

select * from [Customer Data]
