
CREATE TABLE employees (
  EmployeeID int(10) ,
  LastName varchar(20) ,
  FirstName varchar(10) ,
  Title varchar(30) ,
  TitleOfCourtesy varchar(25) ,
  BirthDate datetime ,
  HireDate datetime ,
  Address varchar(60) ,
  City varchar(15) ,
  PostalCode varchar(10) ,
  Country varchar(15) ,
  HomePhone varchar(24) ,
  Extension varchar(4) ,
  Photo longblob,
  Notes longtext,
  ReportsTo int(10) ,
  PRIMARY KEY (EmployeeID)
);

CREATE TABLE regions (
  RegionID int(10) ,
  RegionDescription varchar(50) ,
  PRIMARY KEY (RegionID)
);

CREATE TABLE categories (
  CategoryID int(10) ,
  CategoryName varchar(15) ,
  Description longtext default null,
  Picture longblob,
  PRIMARY KEY (CategoryID),
  UNIQUE KEY unique_CategoryName (CategoryName)
);

CREATE TABLE shippers (
  ShipperID int(10) ,
  CompanyName varchar(40) ,
  Phone varchar(24) ,
  PRIMARY KEY (ShipperID)
);

CREATE TABLE suppliers (
  SupplierID int(10) ,
  CompanyName varchar(40) ,
  ContactName varchar(30) ,
  ContactTitle varchar(30) ,
  Address varchar(60) ,
  City varchar(15) ,
  PostalCode varchar(10) ,
  Country varchar(15) ,
  Phone varchar(24) ,
  Fax varchar(24) ,
  HomePage longtext,
  PRIMARY KEY (SupplierID)
);

CREATE TABLE customers (
  CustomerID varchar(5) ,
  CompanyName varchar(40) ,
  ContactName varchar(30) ,
  ContactTitle varchar(30) ,
  Address varchar(60) ,
  City varchar(15) ,
  PostalCode varchar(10) ,
  Country varchar(15) ,
  Phone varchar(24) ,
  Fax varchar(24) ,
  PRIMARY KEY (CustomerID),
  KEY idx_CompanyName (CompanyName)
);

-- 2------------------------------------------------------------

CREATE TABLE territories (
  TerritoryID varchar(20) ,
  TerritoryDescription varchar(50) ,
  RegionID int(10) ,
  PRIMARY KEY (TerritoryID),
  KEY idx_RegionID(RegionID),
  CONSTRAINT RegionTerritories FOREIGN KEY (RegionID) 
                        REFERENCES regions (RegionID)
);

CREATE TABLE products (
  ProductID int(10) ,
  ProductName varchar(40) not NULL,
  SupplierID int(10) not null,
  CategoryID int(10) ,
  QuantityPerUnit varchar(20) ,
  UnitPrice decimal(19,4) ,
  UnitsInStock smallint(5) ,
  UnitsOnOrder smallint(5) ,
  ReorderLevel smallint(5) ,
  Discontinued tinyint(1) ,
  PRIMARY KEY (ProductID),
  CONSTRAINT CategoriesProducts FOREIGN KEY (CategoryID) REFERENCES categories (CategoryID),
  CONSTRAINT SuppliersProducts  FOREIGN KEY (SupplierID) REFERENCES suppliers (SupplierID)
);

CREATE TABLE orders (
  OrderID int(10) ,
  CustomerID varchar(5) ,
  EmployeeID int(10) ,
  OrderDate datetime ,
  ShipVia int(10) ,
  Freight decimal(19,4) ,
  ShipName varchar(40) ,
  PRIMARY KEY (OrderID),
  CONSTRAINT CustomersOrders FOREIGN KEY (CustomerID) REFERENCES customers (CustomerID),
  CONSTRAINT EmployeesOrders FOREIGN KEY (EmployeeID) REFERENCES employees (EmployeeID),
  CONSTRAINT ShippersOrders  FOREIGN KEY (ShipVia)    REFERENCES shippers  (ShipperID)
);

-- 3------------------------------------------------------------

CREATE TABLE orderdetails (
  OrderID int(10) ,
  ProductID int(10) ,
  UnitPrice decimal(19,4) ,
  Quantity smallint(5) ,
  Discount double ,
  CONSTRAINT Ord_det FOREIGN KEY (OrderID)   REFERENCES orders   (OrderID),
  CONSTRAINT det_pro FOREIGN KEY (ProductID) REFERENCES products (ProductID)
);

CREATE TABLE `employee territories` (
  EmployeeID int(10) ,
  TerritoryID varchar(20),
  CONSTRAINT EmpTer_Emp FOREIGN KEY (EmployeeID)  REFERENCES    employees (EmployeeID),
  CONSTRAINT EmpTer_Ter FOREIGN KEY (TerritoryID) REFERENCES  territories (TerritoryID)
);

-- CREATE INDEX Idx_EmployeeID  ON `employee territories`  (EmployeeID);
-- CREATE INDEX Idx_TerritotyID ON `employee territories`  (TerritoryID);
