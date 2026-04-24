CREATE DATABASE IF NOT EXISTS LittleLemonDB;
USE LittleLemonDB;

CREATE TABLE IF NOT EXISTS Customers(
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Bookings(
    BookingID INT PRIMARY KEY,
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE IF NOT EXISTS Orders(
    OrderID INT PRIMARY KEY,
    BookingID INT NOT NULL,
    BillAmount DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

INSERT IGNORE INTO Customers(CustomerID, FullName, ContactNumber, Email) VALUES
(1, 'Alice Johnson', '1111111111', 'alice@example.com'),
(2, 'Bob Smith', '2222222222', 'bob@example.com'),
(3, 'Carlos Diaz', '3333333333', 'carlos@example.com');

INSERT IGNORE INTO Bookings(BookingID, BookingDate, TableNumber, CustomerID) VALUES
(1, '2026-02-10', 3, 1),
(2, '2026-02-11', 5, 2),
(3, '2026-02-12', 2, 3);

INSERT IGNORE INTO Orders(OrderID, BookingID, BillAmount, Quantity) VALUES
(1, 1, 120.00, 2),
(2, 2, 200.00, 4),
(3, 3, 150.00, 3);
