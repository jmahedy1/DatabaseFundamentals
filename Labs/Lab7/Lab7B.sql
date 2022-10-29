/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

**************************************
Question 1a
*/

DROP TABLE F21APPLIANCE;

--Results
/*
Error starting at line : 11 in command -
DROP TABLE F21APPLIANCE
Error report -
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
*/
--**************************************
--Question 1b

CREATE TABLE F21APPLIANCE
(ApplianceCode CHAR(10),
Make VARCHAR2(30) NOT NULL,
Model VARCHAR2(10),
Price NUMBER(5,2) NOT NULL,
CONSTRAINT F21APPL_PK PRIMARY KEY (ApplianceCode));

--Results
/*
Table F21APPLIANCE created.
*/
--**************************************
--Question 1c

DESCRIBE F21APPLIANCE;

--Results
/*
Name          Null?    Type         
------------- -------- ------------ 
APPLIANCECODE NOT NULL CHAR(10)     
MAKE          NOT NULL VARCHAR2(30) 
MODEL                  VARCHAR2(10) 
PRICE         NOT NULL NUMBER(5,2)
*/
--**************************************
--Question 2a1

DROP TABLE F21INVENTORY CASCADE CONSTRAINTS;

--Results
/*
Error starting at line : 54 in command -
DROP TABLE F21INVENTORY CASCADE CONSTRAINTS
Error report -
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
*/
--**************************************
--Question 2a2

CREATE TABLE F21INVENTORY
(InventoryDate Date,
RoomNum CHAR(4),
AuditorID CHAR(9),
CleanLevel CHAR(2),
Temperature NUMBER(3,1),
Comments VARCHAR2(30),
CONSTRAINT F21INVENTORY_PK PRIMARY KEY (InventoryDate, RoomNum),
CONSTRAINT F21RMNUM_FK FOREIGN KEY (RoomNum) REFERENCES F21ROOM (RoomNum),
CONSTRAINT CleanLevel_CK CHECK (CleanLevel = 'L1' OR CleanLevel = 'L2' OR CleanLevel = 'L3' OR CleanLevel = 'L4'));

--Results
/*
Table F21INVENTORY created.
*/
--**************************************
--Question 2b

DESCRIBE F21INVENTORY;

--Results
/*
Name          Null?    Type         
------------- -------- ------------ 
INVENTORYDATE NOT NULL DATE         
ROOMNUM       NOT NULL CHAR(4)      
AUDITORID              CHAR(9)      
CLEANLEVEL             CHAR(2)      
TEMPERATURE            NUMBER(3,1)  
COMMENTS               VARCHAR2(30)
*/
--**************************************
--Question 2c

ALTER TABLE F21INVENTORY
    MODIFY Temperature NUMBER(2,2);

--Results
/*
Table F21INVENTORY altered.
*/
--**************************************
--Question 2d

ALTER TABLE F21INVENTORY
    DROP COLUMN Comments;

--Results
/*
Table F21INVENTORY altered.
*/
--**************************************
--Question 2e

DESCRIBE F21INVENTORY;

--Results
/*
Name          Null?    Type        
------------- -------- ----------- 
INVENTORYDATE NOT NULL DATE        
ROOMNUM       NOT NULL CHAR(4)     
AUDITORID              CHAR(9)     
CLEANLEVEL             CHAR(2)     
TEMPERATURE            NUMBER(2,2)
*/
--**************************************
--Question 3a1

DROP TABLE F21INVDETAIL CASCADE CONSTRAINTS;

--Results
/*
Error starting at line : 138 in command -
DROP TABLE F21INVDETAIL CASCADE CONSTRAINTS
Error report -
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
*/
--**************************************
--Question 3a2

CREATE TABLE F21INVDETAIL
(InventoryDate Date,
RoomNum CHAR(4),
ApplianceCode CHAR(10),
EnergyUsage NUMBER(9,2),
Location VARCHAR2(30) NOT NULL,
Comments VARCHAR2(50),
CONSTRAINT F21INVDETAIL_PK PRIMARY KEY (InventoryDate, RoomNum, ApplianceCode),
CONSTRAINT F21INV_FK FOREIGN KEY (InventoryDate, RoomNum) REFERENCES F21INVENTORY (InventoryDate, RoomNum),
CONSTRAINT F21APPL_FK FOREIGN KEY (ApplianceCode) REFERENCES F21APPLIANCE (ApplianceCode));

--Results
/*
Table F21INVDETAIL created.
*/
--**************************************
--Question 3b

DESCRIBE F21INVDETAIL;

--Results
/*
Name          Null?    Type         
------------- -------- ------------ 
INVENTORYDATE NOT NULL DATE         
ROOMNUM       NOT NULL CHAR(4)      
APPLIANCECODE NOT NULL CHAR(10)     
ENERGYUSAGE            NUMBER(9,2)  
LOCATION      NOT NULL VARCHAR2(30) 
COMMENTS               VARCHAR2(50)
*/
--**************************************
--Question 4a

CREATE TABLE F21AUDITOR
(AuditorID CHAR(9),
LName VARCHAR2(30),
FName VARCHAR2(30),
Email VARCHAR2(30),
License VARCHAR2(20),
HireDate Date,
CONSTRAINT F21AUDITOR_PK PRIMARY KEY (AuditorID),
CONSTRAINT EMAIL_UQ UNIQUE (Email));

--Results
/*
Table F21AUDITOR created.
*/
--**************************************
--Question 4b

DESCRIBE F21AUDITOR;

--Results
/*
Name      Null?    Type         
--------- -------- ------------ 
AUDITORID NOT NULL CHAR(9)      
LNAME              VARCHAR2(30) 
FNAME              VARCHAR2(30) 
EMAIL              VARCHAR2(30) 
LICENSE            VARCHAR2(20) 
HIREDATE           DATE
*/
--**************************************
--Question 4c

ALTER TABLE F21INVENTORY
    ADD CONSTRAINT F21INVENTORY_FK FOREIGN KEY (AuditorID) REFERENCES F21AUDITOR (AuditorID);

--Results
/*
Table F21INVENTORY altered.
*/
--**************************************
--Question 5a

SELECT Constraint_Name, Constraint_Type, Status, Search_Condition
FROM USER_CONSTRAINTS
WHERE Table_Name = 'F21ROOM';

--Results
/*
CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
NETWORKPORT_UQ                                                                                                                   U ENABLED                                                                                  
F21ROOM_PK                                                                                                                       P ENABLED                                                                                  
SYS_C00203165                                                                                                                    C ENABLED  "MAXOCCUPANY" IS NOT NULL
*/
--**************************************
--Question 5b

SELECT Constraint_Name, Constraint_Type, Status, Search_Condition
FROM USER_CONSTRAINTS
WHERE Table_Name = 'F21APPLIANCE';

--Results
/*
CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
SYS_C00206536                                                                                                                    C ENABLED  "MAKE" IS NOT NULL                                                              
SYS_C00206537                                                                                                                    C ENABLED  "PRICE" IS NOT NULL                                                             
F21APPL_PK                                                                                                                       P ENABLED
*/
--**************************************
--Question 5c

SELECT Constraint_Name, Constraint_Type, Status, Search_Condition
FROM USER_CONSTRAINTS
WHERE Table_Name = 'F21INVENTORY';

--Results
/*
CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
CLEANLEVEL_CK                                                                                                                    C ENABLED  CleanLevel = 'L1' OR CleanLevel = 'L2' OR CleanLevel = 'L3' OR CleanLevel = 'L4'
F21INVENTORY_PK                                                                                                                  P ENABLED                                                                                  
F21INVENTORY_FK                                                                                                                  R ENABLED                                                                                  
F21RMNUM_FK                                                                                                                      R ENABLED
*/
--**************************************
--Question 5d

SELECT Constraint_Name, Constraint_Type, Status, Search_Condition
FROM USER_CONSTRAINTS
WHERE Table_Name = 'F21INVDETAIL';

--Results
/*
CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
F21INV_FK                                                                                                                        R ENABLED                                                                                  
F21APPL_FK                                                                                                                       R ENABLED                                                                                  
SYS_C00206581                                                                                                                    C ENABLED  "LOCATION" IS NOT NULL                                                          
F21INVDETAIL_PK                                                                                                                  P ENABLED
*/
--**************************************
--Question 5e

SELECT Constraint_Name, Constraint_Type, Status, Search_Condition
FROM USER_CONSTRAINTS
WHERE Table_Name = 'F21AUDITOR';

--Results
/*
CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
F21AUDITOR_PK                                                                                                                    P ENABLED                                                                                  
EMAIL_UQ                                                                                                                         U ENABLED
*/
--**************************************
--Question 6a

DROP TABLE F21ROOM CASCADE CONSTRAINTS;

--Results
/*
Table F21ROOM dropped.
*/
--**************************************
--Question 6b

DROP TABLE F21APPLIANCE CASCADE CONSTRAINTS;

--Results
/*
Table F21APPLIANCE dropped.
*/
--**************************************
--Question 6c

DROP TABLE F21INVENTORY CASCADE CONSTRAINTS;

--Results
/*
Table F21INVENTORY dropped.
*/
--**************************************
--Question 6d

DROP TABLE F21INVDETAIL CASCADE CONSTRAINTS;

--Results
/*
Table F21INVDETAIL dropped.
*/
--**************************************
--Question 6e

DROP TABLE F21AUDITOR CASCADE CONSTRAINTS;

--Results
/*
Table F21AUDITOR dropped.
*/
--**************************************
--Question 7a

--Team: 5, Members: Karty Dhuper, Ryan Melenchuk, And Amel Vejzovic

CREATE TABLE VENUE
(VenueID CHAR(10),
Name VARCHAR2(20),
City VARCHAR2(20),
State CHAR(2),
CONSTRAINT VENUE_PK PRIMARY KEY (VenueID));

--Results
/*
Table VENUE created.
*/
--**************************************
--Question 7b

CREATE TABLE SECURITYGUARD
(SecurityID CHAR(10),
VenueID CHAR(10),
FirstName VARCHAR2(20),
LastName VARCHAR2(20),
ClearanceLevel CHAR(1),
CONSTRAINT SECURITYGUARD_PK PRIMARY KEY (SecurityID),
CONSTRAINT VenueID_FK FOREIGN KEY (VenueID) REFERENCES VENUE (VenueID));

--Results
/*
Table SECURITYGUARD created.

The parent table is the venue entity and the child table is the security guard 
entity. The venue hires security guards to keep the venue and its guests safe.
The two tables are related by a non-identifying relationship. The in the parent,
the primary key venueID is required. In the child the securityID is required. 
The relationship is a 0 or 1 to 1 or many. We allow the VenueID to have null 
values becasue the parent is 0 or 1. I selected these two tables becasue they 
are important. The owner of the venue or the organizer of the event want to 
keep their venue and guests safe. These two entites keep track of the venue and 
the security guards hired for the particular event.
*/

/***************************************
Question 8
There are 3 ways to set up a primary key. If you have 1 primary key you can use 
option 1, where you put the primary key constraint right next to where the 
PK attribute. The second option is recomended. You put the PK constraint at the
end of all of the attributes. This works well when you have more than one PK. 
Option 3 is where you add the PK constraint after you create the table. You use
the alter table command It is similar to option 2 where you can have many PKs. 

**************************************
Question 9
The DESCRIBE command displays the table contents. It includes the attributes,
datatypes, and conditions. It will let you know if the attributes can be null 
but not if they are unique.

**************************************
Question 10
After the tables have been created you use ALTER TABLE to modify it. To add a new
column you use ADD

EX.
ALTER TABLE Customer
    ADD Balance NUMBER(5,2);
    
To delete a column you use DROP COLUMN

EX.
ALTER TABLE Customer
    DROP COLUMN Balance;
    
You can also alter tables to modify datatypes and add or removes constraints

**************************************
Question 11
The DROP command removes objects from the database. Dropping the tables also 
removes all of the data from the table. The CASCADE CONSTRAINTS removes referentail
integrity constraints. The command is usually added to the begining of a script
for creating tables so you do not get errors if you accidetnly did not remove it 
before if you are trying to recreate it. A table must be dropped before it can 
be recreated.

Drop tables example:
DROP TABLE Shipper CASCADE CONSTRAINTS
*/