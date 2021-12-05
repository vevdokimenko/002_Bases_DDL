# Задание 2
# Спроектируйте базу данных для оптового склада,
# у которого есть поставщики товаров, персонал, постоянные заказчики.
# Поля таблиц продумать самостоятельно.

CREATE DATABASE Warehouse;

USE Warehouse;

CREATE TABLE Customers
(
    CUSTOMER_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    FirstName   VARCHAR(30)        NOT NULL,
    LastName    VARCHAR(30)        NOT NULL,
    Phone       VARCHAR(13)        NOT NULL,
    Email       VARCHAR(30)        NOT NULL
);

CREATE TABLE Employees
(
    EMPLOYEE_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    FirstName   VARCHAR(30)        NOT NULL,
    LastName    VARCHAR(30)        NOT NULL,
    Phone       VARCHAR(13)        NOT NULL,
    Salary      DOUBLE             NOT NULL
);

CREATE TABLE Producers
(
    PRODUCER_ID   INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ProducerName  VARCHAR(30)        NOT NULL,
    ProducerPhone VARCHAR(13)        NOT NULL,
    ProducerEmail VARCHAR(30)        NOT NULL
);

CREATE TABLE Products
(
    PRODUCT_ID    INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ProductName   VARCHAR(30)        NOT NULL,
    PRODUCER_ID   INT                NOT NULL,
    ProducerPrice DOUBLE,
    FOREIGN KEY (PRODUCER_ID) REFERENCES Producers (PRODUCER_ID)
);

CREATE TABLE Invoice
(
    INVOICE_ID  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CUSTOMER_ID INT                NOT NULL,
    EMPLOYEE_ID INT                NOT NULL,
    PRODUCT_ID  INT                NOT NULL,
    Quantity    INT                NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES Customers (CUSTOMER_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employees (EMPLOYEE_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES Products (PRODUCT_ID)
);

CREATE TABLE Orders
(
    ORDER_ID   INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    OrderDate  DATE               NOT NULL,
    INVOICE_ID INT                NOT NULL,
    FOREIGN KEY (INVOICE_ID) REFERENCES Invoice (INVOICE_ID)
);