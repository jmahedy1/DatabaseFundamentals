/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

**************************************
Question 1a
*/

CREATE TABLE F21TOOL
(ToolID CHAR(6),
PartName VARCHAR2(15),
Condition VARCHAR2(15),
Model VARCHAR2(15),
PurchaseDate DATE,
CONSTRAINT f21tool_pk PRIMARY KEY (ToolID));

--Results
/*
Table F21TOOL created.
*/
--**************************************
--Question 1b
ALTER TABLE F21TOOL 
    ADD Supplier VARCHAR2(30);
    
--Results
/*
Table F21TOOL altered.
*/
--**************************************
--Question 1c

DESCRIBE F21TOOL;

--Results
/*
Name         Null?    Type         
------------ -------- ------------ 
TOOLID       NOT NULL CHAR(6)      
PARTNAME              VARCHAR2(15) 
CONDITION             VARCHAR2(15) 
MODEL                 VARCHAR2(15) 
PURCHASEDATE          DATE         
SUPPLIER              VARCHAR2(30)
*/
--*************************************
--Question 1d

DROP TABLE F21TOOL CASCADE CONSTRAINTS;

--Results
/*
Table F21TOOL dropped.
*/
--*************************************
--Question 1e

DESCRIBE F21TOOL;

--Results
/*
ERROR:
ORA-04043: object F21TOOL does not exist
*/
--*************************************
--Question 2a

CREATE TABLE F21ZIPCODE AS
(SELECT PostalCode as ZipCode, City, State FROM Supplier
    UNION
SELECT PostalCode as ZipCode, City, State FROM Employee
    UNION
SELECT PostalCode as ZipCode, City, State FROM Customer
    UNION
SELECT ShipPostalCode as ZipCode, ShipCity, ShipState FROM Shipment);

--Results
/*
Table F21ZIPCODE created.
*/
--*************************************
--Question 2b

SELECT COUNT(*)
FROM F21ZIPCODE;

--Results
/*
  COUNT(*)
----------
       301
*/
--************************************
--Question 2c

SELECT zipcode, city, state
FROM F21ZIPCODE
WHERE state = 'NY';

--Results
/*
ZIPCODE    CITY                 ST
---------- -------------------- --
10013      New York             NY
10044      New York City        NY
10131      New York             NY
10131      New York City        NY
12182      Troy                 NY
12211      Albany               NY
12553      Newburgh             NY
13261      Syracuse             NY
13442      Rome                 NY
13504      Utica                NY
13699      Potsdam              NY

ZIPCODE    CITY                 ST
---------- -------------------- --
14206      Buffalo              NY
14895      Wellsville           NY

13 rows selected.
*/
--************************************
--Question 3a

CREATE TABLE F21ROOM
(RoomNum CHAR(4),
LastRemodel DATE,
MaxOccupany INTEGER NOT NULL,
SquareFootage NUMBER(5, 2),
RoomType VARCHAR2(10),
Amenities VARCHAR2(50),
FloorNum INTEGER,
NetworkPort CHAR(7),
CONSTRAINT F21ROOM_PK PRIMARY KEY (RoomNum),
CONSTRAINT NetworkPort_UQ UNIQUE (NetworkPort));

--Results
/*
Table F21ROOM created.
*/
--************************************
--Question 3b

DESCRIBE F21ROOM;

--Results
/*
Name          Null?    Type         
------------- -------- ------------ 
ROOMNUM       NOT NULL CHAR(4)      
LASTREMODEL            DATE         
MAXOCCUPANY   NOT NULL NUMBER(38)   
SQUAREFOOTAGE          NUMBER(5,2)  
ROOMTYPE               VARCHAR2(10) 
AMENITIES              VARCHAR2(50) 
FLOORNUM               NUMBER(38)   
NETWORKPORT            CHAR(7)
*/
--************************************
--Question 3c

SELECT Constraint_Name, Constraint_Type, Status, Search_Condition
FROM USER_CONSTRAINTS
WHERE Table_Name = 'F21ROOM';

--Results
/*
CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------
SYS_C00203165                                                                                                                    C ENABLED  "MAXOCCUPANY" IS NOT NULL                                                       
F21ROOM_PK                                                                                                                       P ENABLED                                                                                  
NETWORKPORT_UQ                                                                                                                   U ENABLED
*/
--************************************
--Question 4a

ALTER TABLE F21ROOM
    ADD Condition VARCHAR2(20);

--Results
/*
Table F21ROOM altered.
*/
--************************************
--Question 4b

DESCRIBE F21ROOM;

--Results
/*
Name          Null?    Type         
------------- -------- ------------ 
ROOMNUM       NOT NULL CHAR(4)      
LASTREMODEL            DATE         
MAXOCCUPANY   NOT NULL NUMBER(38)   
SQUAREFOOTAGE          NUMBER(5,2)  
ROOMTYPE               VARCHAR2(10) 
AMENITIES              VARCHAR2(50) 
FLOORNUM               NUMBER(38)   
NETWORKPORT            CHAR(7)      
CONDITION              VARCHAR2(20)
*/
--************************************
--Question 5a

CREATE TABLE F21HOUSEKEEP
(HKeepID CHAR(7),
Name VARCHAR2(15),
Email VARCHAR2(15),
ContractDate DATE,
CONSTRAINT F21HK_PK PRIMARY KEY (HKeepID),
CONSTRAINT Email_UQ UNIQUE (Email));

--Results
/*
Table F21HOUSEKEEP created.
*/
--************************************
--Question 5b

DESCRIBE F21HOUSEKEEP;

--Results
/*
Name         Null?    Type         
------------ -------- ------------ 
HKEEPID      NOT NULL CHAR(7)      
NAME                  VARCHAR2(15) 
EMAIL                 VARCHAR2(15) 
CONTRACTDATE          DATE
*/
--************************************
--Question 6a

CREATE TABLE F21CLEANING
(HKeepID CHAR(7),
RoomNum CHAR(7),
CleaningDate DATE,
CleaningFee NUMBER(4, 2),
WorkHours INTEGER,
StatementofWork VARCHAR2(50),
CONSTRAINT F21CLEANING_PK PRIMARY KEY (HKeepID, RoomNum, CleaningDate));

--Results
/*
Table F21CLEANING created.
*/
--************************************
--Question 6b

ALTER TABLE F21CLEANING
    ADD CONSTRAINT F21HK_FK FOREIGN KEY (HKeepID) REFERENCES F21HOUSEKEEP (HKeepID);

--Results
/*
Table F21CLEANING altered.
*/
--************************************
--Question 6c

ALTER TABLE F21CLEANING
    ADD CONSTRAINT F21RM_FK FOREIGN KEY (RoomNum) REFERENCES F21ROOM (RoomNum);

--Results
/*
Table F21CLEANING altered.
*/
--************************************
--Question 6d

DESCRIBE F21CLEANING;

--Results
/*
Name            Null?    Type         
--------------- -------- ------------ 
HKEEPID         NOT NULL CHAR(7)      
ROOMNUM         NOT NULL CHAR(7)      
CLEANINGDATE    NOT NULL DATE         
CLEANINGFEE              NUMBER(4,2)  
WORKHOURS                NUMBER(38)   
STATEMENTOFWORK          VARCHAR2(50)
*/
--************************************
--Question 7a

CREATE TABLE F21CATEGORY
(CleanType CHAR(6),
Description VARCHAR2(20),
Chemical VARCHAR2(50),
CONSTRAINT F21CAT_PK PRIMARY KEY (CleanType));

--Results
/*
Table F21CATEGORY created.
*/
--************************************
--Question 7b

DESCRIBE F21CATEGORY;

--Results
/*
Name        Null?    Type         
----------- -------- ------------ 
CLEANTYPE   NOT NULL CHAR(6)      
DESCRIPTION          VARCHAR2(20) 
CHEMICAL             VARCHAR2(50)
*/
--************************************
--Question 7Ca

ALTER TABLE F21CLEANING
    ADD CleanType CHAR(6);
    
--Results
/*
Table F21CLEANING altered.
*/
--************************************
--Question 7Cb

ALTER TABLE F21CLEANING
    ADD CONSTRAINT F21CAT_FK FOREIGN KEY (CleanType) REFERENCES F21CATEGORY (CleanType);

--Results
/*
Table F21CLEANING altered.
*/
--************************************
--Question 7d

DESCRIBE F21CLEANING;

--Results
/*
Name            Null?    Type         
--------------- -------- ------------ 
HKEEPID         NOT NULL CHAR(7)      
ROOMNUM         NOT NULL CHAR(7)      
CLEANINGDATE    NOT NULL DATE         
CLEANINGFEE              NUMBER(4,2)  
WORKHOURS                NUMBER(38)   
STATEMENTOFWORK          VARCHAR2(50) 
CLEANTYPE                CHAR(6)
*/
--************************************
--Question 8

ALTER TABLE F21CLEANING
    ADD CONSTRAINT CLEAN_CK CHECK (WorkHours > 0);

--Results
/*
Table F21CLEANING altered.
*/
--************************************
--Question 9a

SELECT Constraint_Name, Table_Name, Status
FROM USER_CONSTRAINTS
WHERE Constraint_Type = 'P';

--Results
/*
CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
PROCESSROUTING_PK                                                                                                                PROCESSROUTING                                                                                                                   ENABLED 
PURCHASE_ORDER_PK                                                                                                                PURCHASEORDER                                                                                                                    ENABLED 
PURCHORDERID_PK                                                                                                                  PURCHORDERLINE                                                                                                                   ENABLED 
SHIPMENT_PK                                                                                                                      SHIPMENT                                                                                                                         ENABLED 
SHIPPEDITEM_PK                                                                                                                   SHIPPEDITEM                                                                                                                      ENABLED 
SHIPPER_PK                                                                                                                       SHIPPER                                                                                                                          ENABLED 
SUPPLIEDPART_PK                                                                                                                  SUPPLIEDPART                                                                                                                     ENABLED 
SUPPLIER_PK                                                                                                                      SUPPLIER                                                                                                                         ENABLED 
TIMECARDLINE_PK                                                                                                                  TIMECARDLINE                                                                                                                     ENABLED 
WORKER_PK                                                                                                                        WORKER                                                                                                                           ENABLED 

32 rows selected.
*/
--************************************
--Question 9b

SELECT Constraint_Name, Table_Name, R_Constraint_Name, Status
FROM USER_CONSTRAINTS
WHERE Constraint_Type = 'R';

--Results
/*
CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       R_CONSTRAINT_NAME                                                                                                                STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
PURCHORDERLINE_SUPPLIEDPART_FK                                                                                                   PURCHORDERLINE                                                                                                                   SUPPLIEDPART_PK                                                                                                                  ENABLED 
SHIPMENT_CUSTORDER_FK                                                                                                            SHIPMENT                                                                                                                         CUSTORDER_PK                                                                                                                     ENABLED 
SHIPMENT_SHIPPER_FK                                                                                                              SHIPMENT                                                                                                                         SHIPPER_PK                                                                                                                       ENABLED 
SHIPPEDITEM_CUSTORDERLINE_FK                                                                                                     SHIPPEDITEM                                                                                                                      CUSTORDERLINE_PK                                                                                                                 ENABLED 
SHIPPEDITEM_PACKINGSLIP_FK                                                                                                       SHIPPEDITEM                                                                                                                      PACKINGSLIP_PK                                                                                                                   ENABLED 
SUPERVISOR_EMPLOYEE_FK                                                                                                           EMPLOYEE                                                                                                                         EMPLOYEE_PK                                                                                                                      ENABLED 
SUPPLIEDPART_INVENTORYPART_FK                                                                                                    SUPPLIEDPART                                                                                                                     INVENTORYPART_PK                                                                                                                 ENABLED 
SUPPLIEDPART_SUPPLIER_FK                                                                                                         SUPPLIEDPART                                                                                                                     SUPPLIER_PK                                                                                                                      ENABLED 
SUPPLIER_FK                                                                                                                      FOOD                                                                                                                             FOOD_SUPPLIER_PK                                                                                                                 ENABLED 
TIMECARDLINE_EMPLOYEE_FK                                                                                                         TIMECARDLINE                                                                                                                     EMPLOYEE_PK                                                                                                                      ENABLED 
TIMECARDLINE_MACHINEPROCESS_FK                                                                                                   TIMECARDLINE                                                                                                                     MACHINEPROCESS_PK                                                                                                                ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       R_CONSTRAINT_NAME                                                                                                                STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
WORKER_FK                                                                                                                        LUNCH                                                                                                                            WORKER_PK                                                                                                                        ENABLED 

34 rows selected. 
*/
--************************************
--Question 10a

DROP TABLE F21ZIPCODE CASCADE CONSTRAINTS;

/*
Table F21ZIPCODE dropped.
*/
--************************************
--Question 10b

DROP TABLE F21CATEGORY CASCADE CONSTRAINTS;

/*
Table F21CATEGORY dropped.
*/
--************************************
--Question 10c

DROP TABLE F21HOUSEKEEP CASCADE CONSTRAINTS;

/*
Table F21HOUSEKEEP dropped.
*/
--************************************
--Question 10d

DROP TABLE F21CLEANING CASCADE CONSTRAINTS;

/*
Table F21CLEANING dropped.
*/