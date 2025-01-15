-- deterministic Function
-- DELIMITER //

-- CREATE FUNCTION ADD_NUMBER(A INT, B INT)
-- RETURNS INT -- Correct keyword for specifying the return type
-- DETERMINISTIC -- Indicates the function will always return the same result for the same inputs
-- BEGIN -- Correct keyword
--     RETURN A + B; -- Logic to add two numbers
-- END //

-- DELIMITER ;



USE FUNCTIONS;
DELIMITER //
CREATE FUNCTION ADD_NUMBER(A INT ,B INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN A+B;
END//
DELIMITER ;


DROP TABLE ADD_NUMBER;

SELECT ADD_NUMBER(10, 23) AS Result;



-- WRITE A FUNCTIONS CONVERT FARENHIETE TO CELCIOUS.

DELIMITER // 




