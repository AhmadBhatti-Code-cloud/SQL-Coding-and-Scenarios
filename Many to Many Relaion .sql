--- E -Commerce Database ---

create table Customer 
( CustomerID int primary key ,
FirstName varchar(50),
LastName varchar (50),
City varchar(50),
)
insert into Customer (CustomerID,FirstName ,LastName,City)
values 
(101,'Ali','Rao','Multan'),
(102,'Ahmad','Malik','Karach'),
(103,'Saim','Hamid','Bahawalpur'),
(104,'Ayan','Ali','Kashmir')
select * from Customer

----------------------------------------------------------------------------
Create table Products
(
ProductID int primary key ,
ProductName varchar (50),
Price decimal,
Quantity int 
)
insert into Products (ProductID ,ProductName ,Price ,Quantity)
values 
(010,'Torch',999.5,100),
(020,'Mug',1000.5,19),
(030,'Laptop',20000.5,50),
(040,'Mobile',250000.5,20),
(050,'TV',7500.5,90)


--Create index on productname for fast fetching of data
create nonclustered index idx_Products_ProductName on Products(ProductName)

-----------------------------------------------------------------------------
create table Orders 
(
OrderID int primary key ,
OrderDate date,
CustomerID int , --(Foreign key) (One to Many Relation between Customer and Orders )
Foreign key (CustomerID) references Customer(CustomerID)

)
insert into Orders (OrderID, OrderDate,CustomerID)
values 
(0011,'2025-12-21',101),
(0012,'2025-2-01',102),
(0013,'2025-3-21',104),
(0014,'2025-5-1',102)

--(One Customer has Multiple Orders)
 
 select * from Orders

 -----------------------------------------------------------
 -- (Many toMany Relation)
 -- (Customer and Products)
 create table Shoping
(
ShopingID int primary key ,
CustomerID int,
Foreign key (CustomerID) References Customer(CustomerID),
ProductID int ,
Foreign key (ProductID) References Products(ProductID),
ProductName varchar(50)
)
Insert into Shoping (ShopingID,CustomerID,ProductID,ProductName)
Values 
(1,101,10,'Torch'),
(2,101,20,'Mug'),
(3,103,10,'Torch'),
(4,104,30,'Laptop')
 
 

 select * from Customer
 select * from Products
 select * from Shoping