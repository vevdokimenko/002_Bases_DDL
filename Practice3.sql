# Многие ко многим
# Магазин. Многие товары могут быть куплены многими покупателями

CREATE DATABASE Market;

USE Market;

CREATE TABLE Goods
(
    ID_GOODS  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NameGoods VARCHAR(30)        NOT NULL
);

INSERT INTO Goods (NameGoods)
VALUES ('Mouse'),
       ('Keyboard'),
       ('Notebook');

CREATE TABLE Buyers
(
    ID_BUYER  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NameBuyer VARCHAR(30)        NOT NULL
);

INSERT INTO Buyers (NameBuyer)
VALUES ('Ivan'),
       ('Petro'),
       ('Serhii');

CREATE TABLE Purchases
(
    ID_PURCHASE INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_BUYER    INT                NOT NULL,
    ID_GOODS    INT                NOT NULL,
    FOREIGN KEY (ID_BUYER) REFERENCES Buyers (ID_BUYER),
    FOREIGN KEY (ID_GOODS) REFERENCES Goods (ID_GOODS)
);

INSERT INTO Purchases (ID_BUYER, ID_GOODS)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (2, 1),
       (2, 2),
       (2, 3),
       (3, 1),
       (3, 2),
       (3, 3);