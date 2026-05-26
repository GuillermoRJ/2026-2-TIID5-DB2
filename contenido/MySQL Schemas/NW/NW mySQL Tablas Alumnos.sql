-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: _nw
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table categories
--

DROP TABLE IF EXISTS categories;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE categories (
  CategoryID int(10) ,
  CategoryName varchar(15) ,
  Description longtext default null,
  Picture longblob,
  PRIMARY KEY (CategoryID),
  UNIQUE KEY CategoryName (CategoryName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table customers
--

DROP TABLE IF EXISTS customers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY CompanyName (CompanyName)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee territories`
--

DROP TABLE IF EXISTS `employee territories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee territories` (
  EmployeeID int(10) ,
  TerritoryID varchar(20) ,
  PRIMARY KEY (EmployeeID,TerritoryID),
  CONSTRAINT EmpTer_Emp FOREIGN KEY (EmployeeID) REFERENCES employees (EmployeeID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT EmpTer_Ter FOREIGN KEY (TerritoryID) REFERENCES territories (TerritoryID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table employees
--

DROP TABLE IF EXISTS employees;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table orderdetails
--

DROP TABLE IF EXISTS orderdetails;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE orderdetails (
  OrderID int(10) ,
  ProductID int(10) ,
  UnitPrice decimal(19,4) ,
  Quantity smallint(5) ,
  Discount double ,
  PRIMARY KEY (OrderID,ProductID),
  CONSTRAINT Ord_det FOREIGN KEY (OrderID) REFERENCES orders (OrderID) ON DELETE CASCADE,
  CONSTRAINT det_pro FOREIGN KEY (ProductID) REFERENCES products (ProductID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table orders
--

DROP TABLE IF EXISTS orders;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE orders (
  OrderID int(10) ,
  CustomerID varchar(5) ,
  EmployeeID int(10) ,
  OrderDate datetime ,
  ShipVia int(10) ,
  Freight decimal(19,4) ,
  ShipName varchar(40) ,
  PRIMARY KEY (OrderID),
  CONSTRAINT CustomersOrders FOREIGN KEY (CustomerID) REFERENCES customers (CustomerID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT EmployeesOrders FOREIGN KEY (EmployeeID) REFERENCES employees (EmployeeID),
  CONSTRAINT ShippersOrders FOREIGN KEY (ShipVia) REFERENCES shippers (ShipperID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table products
--

DROP TABLE IF EXISTS products;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT SuppliersProducts FOREIGN KEY (SupplierID) REFERENCES suppliers (SupplierID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table region
--

DROP TABLE IF EXISTS region;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE region (
  RegionID int(10) ,
  RegionDescription varchar(50) ,
  PRIMARY KEY (RegionID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table shippers
--

DROP TABLE IF EXISTS shippers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE shippers (
  ShipperID int(10) ,
  CompanyName varchar(40) ,
  Phone varchar(24) ,
  PRIMARY KEY (ShipperID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table suppliers
--

DROP TABLE IF EXISTS suppliers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table territories
--

DROP TABLE IF EXISTS territories;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE territories (
  TerritoryID varchar(20) ,
  TerritoryDescription varchar(50) ,
  RegionID int(10) ,
  PRIMARY KEY (TerritoryID),
  CONSTRAINT RegionTerritories FOREIGN KEY (RegionID) REFERENCES region (RegionID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-23 13:56:11
