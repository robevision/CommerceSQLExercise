----create database eCommerce;
--CREATE TABLE category
--(
--Id INT IDENTITY(1, 1) PRIMARY KEY,
--name VARCHAR(255) NOT NULL,
--);
--CREATE TABLE subcategory
--(
--Id int IDENTITY(1, 1) PRIMARY KEY,
--name varchar(255) NULL,
--category_Id int UNIQUE FOREIGN KEY (category_Id) REFERENCES dbo.category(Id)
--);
--CREATE TABLE product
--(
--Id int IDENTITY(1, 1) PRIMARY KEY,
--name varchar(255) NOT NULL,
--cost int,
--description varchar(255) NOT NULL,
--subcategory_Id int FOREIGN KEY (subcategory_Id) REFERENCES dbo.subcategory(Id)
--);
--CREATE TABLE tag
--(Id int IDENTITY(1, 1) PRIMARY KEY,
--name varchar(255) NOT NULL
--);
--CREATE TABLE dbo.product_tag
--(
--product_Id int,
--tag_Id int,
--CONSTRAINT product_tag_Id PRIMARY KEY (product_Id, tag_Id),
--CONSTRAINT FK_product
--	FOREIGN KEY (product_Id) REFERENCES dbo.product,
--CONSTRAINT FK_tag
--	FOREIGN KEY (tag_Id) REFERENCES dbo.tag
--);
--CREATE TABLE "image"
--(
--Id INT IDENTITY(1, 1) PRIMARY KEY,
--description varchar(255) NOT NULL,
--featured int,
--image varbinary(max),
--product_Id int FOREIGN KEY (product_Id) REFERENCES dbo.product
--); 
CREATE TABLE payment
(
Id int IDENTITY(1, 1) PRIMARY KEY,
full_name varchar(255),
card_number int,
card_security int,
expires_month int,
expires_year int,
"description" varchar(255),
);
--CREATE TABLE customer
--(
--Id int IDENTITY(1, 1) PRIMARY KEY,
--last_name varchar(255),
--first_name varchar(255),
--phone varchar(255),
--dob DATETIME,
--username varchar(255),
--"password" varchar(255),
--gender varchar(255),
--permission INT,
--mystery_parameter INT,
--);
--CREATE TABLE dbo.customer_payment
--(
--customer_Id int,
--payment_Id int,
--CONSTRAINT customer_payment_Id PRIMARY KEY (customer_Id, payment_Id),
--CONSTRAINT FK_customer
--	FOREIGN KEY (customer_Id) REFERENCES dbo.customer,
--CONSTRAINT FK_bin
--	FOREIGN KEY (payment_Id) REFERENCES dbo.payment
--);
--CREATE TABLE "address"
--(
--Id int IDENTITY(1, 1) PRIMARY KEY,
--street_one varchar(255),
--street_two varchar(255),
--zipcode varchar(255),
--city varchar(255),
--"state" varchar(255),
--country varchar(255),
--);
--CREATE TABLE shipment_center
--(
--Id int IDENTITY(1, 1) PRIMARY KEY,
--"name" varchar(255),
--phone varchar(255),
--address_Id int FOREIGN KEY (address_Id) REFERENCES dbo."address"
--);
--CREATE TABLE dbo.customer_address
--(
--customer_Id int,
--address_Id int,
--CONSTRAINT customer_address_Id PRIMARY KEY (customer_Id, address_Id),

--	FOREIGN KEY (customer_Id) REFERENCES dbo.customer,

--	FOREIGN KEY (address_Id) REFERENCES dbo."address"
--);
CREATE TABLE dbo."transaction"
(
cart INT,
timestamp DATETIME,
Id int IDENTITY(1, 1) PRIMARY KEY,
payment_Id int,
customer_Id int,
	FOREIGN KEY (payment_Id) REFERENCES dbo.payment (payment_Id),
	FOREIGN KEY (customer_Id) REFERENCES dbo.customer (customer_Id),
);
CREATE TABLE dbo.transaction_product
(
transaction_Id int,
product_Id int,
quantity int,
CONSTRAINT transaction_address_Id PRIMARY KEY (transaction_Id, product_Id),
CONSTRAINT FK_transaction
	FOREIGN KEY (transaction_Id) REFERENCES dbo."transaction",
CONSTRAINT FK_address
	FOREIGN KEY (product_Id) REFERENCES dbo."product",
);
CREATE TABLE dbo.transaction_address
(
transaction_Id int,
address_Id int,
phone varchar(255),
"type" varchar(255),
CONSTRAINT transaction_address_Id PRIMARY KEY (transaction_Id, address_Id),
CONSTRAINT FK_transaction
	FOREIGN KEY (transaction_Id) REFERENCES dbo."transaction",
CONSTRAINT FK_address
	FOREIGN KEY (address_Id) REFERENCES dbo."address",
);
CREATE TABLE bin
(
Id int IDENTITY(1, 1) PRIMARY KEY,
name varchar(255),
shipment_center_ID int, 
FOREIGN KEY (shipment_center_ID) REFERENCES dbo.shipment_center_Id,
);
CREATE TABLE dbo.product_bin
(
product_Id int,
bin_Id int,
stock int,
CONSTRAINT product_bin_Id PRIMARY KEY (product_Id, bin_Id),
CONSTRAINT FK_product
	FOREIGN KEY (product_Id) REFERENCES dbo.product,
CONSTRAINT FK_bin
	FOREIGN KEY (bin_Id) REFERENCES dbo.bin
);
