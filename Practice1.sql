-- -------------------------------
-- один к одному
-- -------------------------------

create DATABASE lottery;

use lottery;

CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT NOT NULL,
    ticket_number INT NOT NULL,
    PRIMARY KEY (ticket_id)
);

insert into tickets (ticket_number) 
values(12345), (23456), (34567);

SELECT * FROM tickets;

CREATE TABLE participants (
    participant_id INT AUTO_INCREMENT NOT NULL,
    fName VARCHAR(30) NOT NULL,
    lName VARCHAR(30) NOT NULL,
    phone VARCHAR(13) NOT NULL UNIQUE,
    ticket_id INT NOT NULL UNIQUE,
    FOREIGN KEY (ticket_id)
        REFERENCES tickets (ticket_id),
    PRIMARY KEY (participant_id)
);

INSERT INTO participants (fName, lName, phone, ticket_id) 
values 
('Ivan', 'Ivanov', '+380501234567', 3), 
('Petrov', 'Peter', '+380951234567', 1), 
('Sidorov', 'Serhii', '+380671234567', 2);

-- ERROR!
INSERT INTO participants (fName, lName, phone, ticket_id) values ('Ivan', 'Ivanov', '+380671234567', 2);