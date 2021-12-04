# Один ко многим
# Кинотеатр. Один фильм может быть показан в разных сеансах

CREATE DATABASE Cinema;

USE Cinema;

CREATE TABLE Films
(
    ID_FILM  INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NameFilm VARCHAR(30)        NOT NULL
);

INSERT INTO Films (NameFilm)
VALUES ('Men In Black'),
       ('Transformers'),
       ('IT Crowd');

CREATE TABLE Shedule
(
    ID_SHEDULE INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Time       TIME               NOT NULL,
    ID_FILM    INT                NOT NULL,
    FOREIGN KEY (ID_FILM) REFERENCES Films (ID_FILM)
);

INSERT INTO Shedule (Time, ID_FILM)
VALUES ('14:00', 1),
       ('18:00', 1),
       ('10:00', 2),
       ('12:00', 2);