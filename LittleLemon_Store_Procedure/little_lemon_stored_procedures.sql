USE LittleLemonDB;

DROP PROCEDURE IF EXISTS GetMaxQuantity;
DROP PROCEDURE IF EXISTS ManageBooking;
DROP PROCEDURE IF EXISTS UpdateBooking;
DROP PROCEDURE IF EXISTS AddBooking;
DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity FROM Orders;
END //

CREATE PROCEDURE ManageBooking(
    IN p_booking_date DATE,
    IN p_table_number INT
)
BEGIN
    DECLARE v_next_booking_id INT;
    DECLARE v_count INT DEFAULT 0;
    SELECT COUNT(*) INTO v_count
    FROM Bookings
    WHERE BookingDate = p_booking_date
      AND TableNumber = p_table_number;

    IF v_count > 0 THEN
        SELECT 'Table is already booked - booking rejected' AS BookingStatus;
    ELSE
        SELECT COALESCE(MAX(BookingID), 0) + 1 INTO v_next_booking_id FROM Bookings;
        INSERT INTO Bookings(BookingID, BookingDate, TableNumber, CustomerID)
        VALUES (v_next_booking_id, p_booking_date, p_table_number, 1);
        SELECT CONCAT('Booking confirmed for table ', p_table_number) AS BookingStatus;
    END IF;
END //

CREATE PROCEDURE UpdateBooking(
    IN p_table_number INT,
    IN p_booking_date DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = p_booking_date
    WHERE TableNumber = p_table_number;

    SELECT CONCAT('Booking updated for table ', p_table_number) AS Confirmation;
END //

CREATE PROCEDURE AddBooking(
    IN p_booking_id INT,
    IN p_customer_id INT,
    IN p_table_number INT,
    IN p_booking_date DATE
)
BEGIN
    INSERT INTO Bookings(BookingID, BookingDate, TableNumber, CustomerID)
    VALUES (p_booking_id, p_booking_date, p_table_number, p_customer_id);

    SELECT CONCAT('New booking added: ', p_booking_id) AS Confirmation;
END //

CREATE PROCEDURE CancelBooking(
    IN p_table_number INT
)
BEGIN
    DELETE FROM Bookings
    WHERE TableNumber = p_table_number;

    SELECT CONCAT('Booking cancelled for table ', p_table_number) AS Confirmation;
END //

DELIMITER ;
