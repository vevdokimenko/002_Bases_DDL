-- -------------------------------
-- один к одному
-- Лотерея. Один участник может вытянуть только 1 билет
-- -------------------------------

CREATE
    DATABASE lottery;

USE
    lottery;

CREATE TABLE tickets
(
    ticket_id     INT AUTO_INCREMENT NOT NULL,
    ticket_number INT                NOT NULL,
    PRIMARY KEY (ticket_id)
);

INSERT INTO tickets (ticket_number)
VALUES (12345),
       (23456),
       (34567);

SELECT *
FROM tickets;

CREATE TABLE participants
(
    participant_id INT AUTO_INCREMENT NOT NULL,
    fName          VARCHAR(30)        NOT NULL,
    lName          VARCHAR(30)        NOT NULL,
    phone          VARCHAR(13)        NOT NULL UNIQUE,
    ticket_id      INT                NOT NULL UNIQUE,
    FOREIGN KEY (ticket_id)
        REFERENCES tickets (ticket_id),
    PRIMARY KEY (participant_id)
);

INSERT INTO participants (fName, lName, phone, ticket_id)
VALUES ('Ivan', 'Ivanov', '+380501234567', 3),
       ('Petrov', 'Peter', '+380951234567', 1),
       ('Sidorov', 'Serhii', '+380671234567', 2);

SELECT *
FROM participants;

-- ERROR!
INSERT INTO participants (fName, lName, phone, ticket_id)
VALUES ('Ivan', 'Ivanov', '+380671234567', 2);