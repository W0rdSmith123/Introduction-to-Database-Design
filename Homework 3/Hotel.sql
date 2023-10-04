-- Filename: LastName_FirstName.sql

CREATE DATABASE IF NOT EXISTS LTUHotel;
USE LTUHotel;

DROP TABLE IF EXISTS Guest;
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Hotel;

-- Create the Hotel table
CREATE TABLE Hotel(
    hotelNo INT NOT NULL,
    hotelName VARCHAR(50),
    city VARCHAR(50),
    PRIMARY KEY (hotelNo)
);

-- Insert data into the Hotel table
INSERT INTO Hotel VALUES (1,'Marriott Detroit','Romulus');
INSERT INTO Hotel VALUES (2,'Mariott Chicago','Evanston');
INSERT INTO Hotel VALUES (3,'Marriott Nashvillle','Nashville');

-- Create the Room Table
CREATE TABLE Room(
    roomNo INT NOT NULL,
    hotelNo INT NOT NULL,
    type VARCHAR(255),
    price DECIMAL(10, 2),
    PRIMARY KEY (roomNo,hotelNo)
);

-- Insert data into the Room table
INSERT INTO Room VALUES (1, 1, 'one king suite', 229.00);
INSERT INTO Room VALUES (2, 3, 'one king suite', 329.00);
INSERT INTO Room VALUES (3, 4, 'two king suite', 450.00);
INSERT INTO Room VALUES (4, 3, 'bridal suite', 400.00);
INSERT INTO Room VALUES (5, 1, 'two queen suite', 375.00);
INSERT INTO Room VALUES (6, 1, 'one queen suite', 195.00);

-- Create the Booking Table
CREATE TABLE Booking(
    hotelNo INT NOT NULL,
    guestNo INT NOT NULL,
    dateFrom DATE NOT NULL,
    dateTo DATE,
    roomNo INT,
    PRIMARY KEY (hotelNo,guestNo,dateFrom)
);

-- Insert data into the Booking table
INSERT INTO Booking VALUES (1, 1, '2022-03-12', '2022-03-26', 5);
INSERT INTO Booking VALUES (2, 2, '2022-03-31', '2022-04-07', 2);
INSERT INTO Booking VALUES (1, 2, '2022-03-20', '2022-03-30', 3);
INSERT INTO Booking VALUES (2, 4, '2022-02-28', '2022-03-14', 10);

-- Create the Guest table
CREATE TABLE Guest (
    guestNo INT NOT NULL,
    guestName VARCHAR(255),
    guestAddress VARCHAR(255),
    PRIMARY KEY (guestNo)
);

-- Insert data into the Guest table
INSERT INTO Guest VALUES (1,'Sam Spade','123 Apple Lane');
INSERT INTO Guest VALUES (2,'Steven Gunn','45 Mulhollander Drive');
INSERT INTO Guest VALUES (3,'Jane Marple','4534 Mystery Lane');
INSERT INTO Guest VALUES (4,'John and Jane Rockwell','12455 Rosemont Street');
INSERT INTO Guest VALUES (5, 'Donald Duck','454 DuckPond Way');