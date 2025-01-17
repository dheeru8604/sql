
-- TRIGGERS IN MYSQL
-- In mysql trigger is a database object that is automatically 
-- executed or fired in response to certain events or action
-- like(UPDATE,AFTER,BEFORE ,etc)
-- Triggers are used to enforce business rules that maintain
-- data integrity and automate task within databas.

CREATE DATABASE SBIBANK;
USE SBIBANK;
DROP TABLE MAIN_TABLE;
CREATE TABLE MAIN_TABLE(
CUST_ID INT AUTO_INCREMENT PRIMARY KEY,
CUST_NAME VARCHAR(50),
CUST_AC_NO BIGINT UNIQUE,
CUST_MOB BIGINT UNIQUE,
CUST_BALANCE BIGINT,
CUST_CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CUST_UPDATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);

DROP TABLE BACKUP_TABLE;
CREATE TABLE BACKUP_TABLE(
CUST_ID INT ,
CUST_NAME VARCHAR(50),
CUST_AC_NO BIGINT ,
CUST_MOB BIGINT ,
CUST_BALANCE BIGINT,
CUST_CREATED_AT TIMESTAMP ,
CUST_UPDATED_AT TIMESTAMP ,
CUST_DELETED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CREATING TRIGGER 

DELIMITER //
CREATE TRIGGER BEFORE_MAIN_TABLE_DELETE BEFORE DELETE ON MAIN_TABLE
FOR EACH ROW
	BEGIN 
		INSERT INTO BACKUP_TABLE (
        CUST_ID,CUST_NAME,
        CUST_AC_NO,CUST_MOB,
        CUST_BALANCE,
        CUST_CREATED_AT,
        CUST_UPDATED_AT)
        VALUES (OLD.CUST_ID,
        OLD.CUST_NAME,
        OLD.CUST_AC_NO,
        OLD.CUST_MOB,
        OLD.CUST_BALANCE,
        OLD.CUST_CREATED_AT,
        OLD.CUST_UPDATED_AT
        );
	END; 
    //
    DELIMITER ;
    
INSERT INTO MAIN_TABLE(CUST_NAME,CUST_AC_NO,CUST_MOB,CUST_BALANCE)
VALUES('Dev',27500012,8909905900,90000);

INSERT INTO MAIN_TABLE(CUST_NAME,CUST_AC_NO,CUST_MOB,CUST_BALANCE)
VALUES('Dev1',275000122,8909908900,90000);

INSERT INTO MAIN_TABLE(CUST_NAME,CUST_AC_NO,CUST_MOB,CUST_BALANCE)
VALUES('Dev2',275000332,8909906900,90000);

UPDATE MAIN_TABLE SET CUST_BALANCE=40000 WHERE CUST_NAME='Dev';

INSERT INTO MAIN_TABLE(CUST_NAME,CUST_AC_NO,CUST_MOB,CUST_BALANCE)
VALUES('AMAN',275000882,8909907700,1000);
UPDATE MAIN_TABLE SET CUST_BALANCE=80000 WHERE CUST_NAME='AMAN';

DELETE FROM MAIN_TABLE ;

SELECT * FROM MAIN_TABLE;
SELECT * FROM BACKUP_TABLE;
