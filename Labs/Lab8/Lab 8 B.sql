/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

**************************************
Question 1b
*/

SELECT employeeid, jobtitle, type, tempservice, supervisor, emailaddr, salarywage
FROM employee
WHERE firstname = 'Sandra' AND lastname = 'Daniels';

--Resutls
/*
EMPLOYEEID JOBTITLE         TYPE       TEMPSERVIC SUPERVISOR EMAILADDR         SALARYWAGE
---------- ---------------- ---------- ---------- ---------- ----------------- ----------
250967     Assembly         Temporary  Work For U 250944                        24.5
*/
--**************************************
--Question 1c

UPDATE employee
SET jobtitle = 'DBA', 
    type = 'Permanent', 
    Tempservice = NULL, 
    lockernumber = Null, 
    supervisor = '250650', 
    emailaddr = 'sdaniels@pencomp.com', 
    salarywage = 87600
WHERE firstname = 'Sandra' AND lastname = 'Daniels';

--Results
/*
1 row updated.
*/
--**************************************
--Question 1e

SELECT employeeid, jobtitle, type, tempservice, supervisor, emailaddr, salarywage
FROM employee
WHERE firstname = 'Sandra' AND lastname = 'Daniels';

--Results
/*
EMPLOYEEID JOBTITLE      TYPE       TEMPSERVIC SUPERVISOR EMAILADDR              SALARYWAGE
---------- ------------- ---------- ---------- ---------- ---------------------- ----------
250967     DBA           Permanent             250650     sdaniels@pencomp.com   87600
*/
--**************************************
--Question 1g

COMMIT;

--Results
/*
Commit complete.
*/
--**************************************
--Question 2a

SELECT categoryid, COUNT(categoryid)
FROM inventorypart
GROUP BY categoryid;

--Results
/*
CATEGORYID COUNT(CATEGORYID)
---------- -----------------
STOR                      19
BASE                      35
PROC                      19
ACS                        8
SFTW                       9
CBL                       36
KEY                        9
COMP                      29
                           0
NET                        5
HOME                       3

CATEGORYID COUNT(CATEGORYID)
---------- -----------------
POW                        3

12 rows selected.
*/
--**************************************
--Question 2b

UPDATE inventorypart
SET categoryid = 'ACS'
WHERE categoryid = 'HOME';

--Results
/*
3 rows updated.
*/

--**************************************
--Question 2c

SELECT categoryid, COUNT(categoryid)
FROM inventorypart
GROUP BY categoryid;

--Results
/*
CATEGORYID COUNT(CATEGORYID)
---------- -----------------
STOR                      19
BASE                      35
PROC                      19
ACS                       11
SFTW                       9
CBL                       36
KEY                        9
COMP                      29
                           0
NET                        5
POW                        3

11 rows selected.
*/
--**************************************
--Question 2d

ROLLBACK;

--Results
/*
Rollback complete.
*/
--**************************************
--Question 2e

SELECT categoryid, COUNT(categoryid)
FROM inventorypart
GROUP BY categoryid;

--Results
/*
CATEGORYID COUNT(CATEGORYID)
---------- -----------------
STOR                      19
BASE                      35
PROC                      19
ACS                        8
SFTW                       9
CBL                       36
KEY                        9
COMP                      29
                           0
NET                        5
HOME                       3

CATEGORYID COUNT(CATEGORYID)
---------- -----------------
POW                        3

12 rows selected.
*/
--**************************************
--Question 2f

UPDATE inventorypart
SET categoryid = 'ACS'
WHERE categoryid = 'HOME';

--Results
/*
3 rows updated.
*/
--**************************************
--Question 2g

COMMIT;

--Results
/*
Commit complete.
*/
--**************************************
--Question 2h

DELETE FROM category
WHERE categoryid = 'HOME';

--Results
/*
1 row deleted.
*/
--**************************************
--Question 2i

COMMIT;

--Results
/*
Commit complete.
*/
--**************************************
--Question 3a

INSERT INTO employee (employeeid, lastname, firstname, jobtitle, streetaddress, city, 
state, postalcode, homephone, setupallowed, hiredate, releasedate, type, tempservice, 
lockernumber, birthdate, stampnumber, supervisor, emailaddr, salarywage)
VALUES('252001', 'Smith', 'John', 'assistant', '12 River Road', 'Rumson', 'NJ', 
'0776012345', '123456789012', '1', '12-JAN-2020', NULL, 'Permanent', NULL, '204', 
'16-DEC-1990', '300', '250944', 'johnsmith@pencomp.com', 24);

--Results
/*
1 row inserted.
*/
--**************************************
--Question 3b1

insert into purchaseorder (purchorderid, supplierid, employeeid, dateordered, datedelivered, paidinfull)
values ('EE99-030', 'SE-450', 252001, '28-JAN-2020', '12-FEB-2020', 'Y');

--Results
/*
1 row inserted.
*/
--**************************************
--Question 3b2

INSERT INTO purchaseorder(purchorderid, supplierid, employeeid, dateordered, datedelivered, paidinfull)
VALUES('EE99-031', 'SE-450', 252001, '01-FEB-2020', '27-FEB-2020', 'Y');

--Results
/*
1 row inserted.
*/
--**************************************
--Question 3e

SELECT e.employeeid, lastname, purchorderid, dateordered, s.supplierid, contactname
FROM employee e INNER JOIN purchaseorder po
ON e.employeeid = po.employeeid
INNER JOIN supplier s
ON s.supplierid = po.supplierid
WHERE e.employeeid = '252001';

--Results
/*
EMPLOYEEID LASTNAME             PURCHORDER DATEORDER SUPPLIERID CONTACTNAME         
---------- -------------------- ---------- --------- ---------- --------------------
252001     Smith                EE99-030   28-JAN-20 SE-450     Gina Wendal         
252001     Smith                EE99-031   01-FEB-20 SE-450     Gina Wendal
*/
--**************************************
--Question 3f

COMMIT;

--Results
/*
Commit complete.
*/
--**************************************
--Question 4a

SELECT COUNT(*)
FROM timecardline;

--Results
/*
COUNT(*)
----------
         0
*/
--**************************************
--Question 4b

SELECT employeeid, salarywage
FROM employee
WHERE jobtitle = 'Assembly';

--Results
/*
EMPLOYEEID SALARYWAGE
---------- ----------
250101           22.8
250120          23.75
250204           22.5
250399          23.25
250475           22.6
250550          25.85
250892          24.75
250989          24.88
251030           24.6
251045           23.5
251088          24.45

EMPLOYEEID SALARYWAGE
---------- ----------
251089          24.25
251097          24.35
251115           24.5
251135          24.65
251154          24.25
251166           24.5
251175           23.5

18 rows selected.
*/
--**************************************
--Question 4c

INSERT INTO timecardline (employeeid, datetimestart, ecnumber, machineid, processid, 
datetimestop, goodparts)
    SELECT employeeid, sysdate, lastname, firstname, jobtitle, hiredate, salarywage
    FROM employee
    WHERE jobtitle = 'Assembly';

--Results
/*
18 rows inserted.
*/
--**************************************
--Question 4d

SELECT employeeid, TO_CHAR(datetimestart, 'FMDD/MM/YYYY, DAY, HH:MM') AS TimeCard
FROM timecardline;

--Results
/*
EMPLOYEEID TIMECARD                    
---------- ----------------------------
250101     8/11/2021, MONDAY, 10:11    
250120     8/11/2021, MONDAY, 10:11    
250204     8/11/2021, MONDAY, 10:11    
250399     8/11/2021, MONDAY, 10:11    
250475     8/11/2021, MONDAY, 10:11    
250550     8/11/2021, MONDAY, 10:11    
250892     8/11/2021, MONDAY, 10:11    
250989     8/11/2021, MONDAY, 10:11    
251030     8/11/2021, MONDAY, 10:11    
251045     8/11/2021, MONDAY, 10:11    
251088     8/11/2021, MONDAY, 10:11    

EMPLOYEEID TIMECARD                    
---------- ----------------------------
251089     8/11/2021, MONDAY, 10:11    
251097     8/11/2021, MONDAY, 10:11    
251115     8/11/2021, MONDAY, 10:11    
251135     8/11/2021, MONDAY, 10:11    
251154     8/11/2021, MONDAY, 10:11    
251166     8/11/2021, MONDAY, 10:11    
251175     8/11/2021, MONDAY, 10:11    

18 rows selected.
*/
--**************************************
--Question 4e1

ROLLBACK;

--Results
/*
Rollback complete.
*/
--**************************************
--Question 4e2

SELECT employeeid, TO_CHAR(datetimestart, 'FMDD/MM/YYYY, DAY, HH:MM') AS TimeCard
FROM timecardline;

--Results
/*
no rows selected
*/
--**************************************
--Question 4f

INSERT INTO timecardline (employeeid, datetimestart) 
VALUES ('250204', TO_DATE('11-01-2021', 'MM-DD-YYYY'));


INSERT INTO timecardline (employeeid, datetimestart) 
VALUES ('252001', TO_DATE('11-01-2021', 'MM-DD-YYYY'));
    
--Results
/*
1 row inserted.

1 row inserted.
*/
--**************************************
--Question 4g

SELECT employeeid, datetimestart, sysdate
FROM timecardline;

--Results
/*
EMPLOYEEID DATETIMES SYSDATE  
---------- --------- ---------
250204     01-NOV-21 09-NOV-21
252001     01-NOV-21 09-NOV-21
*/
--**************************************
--Question 5b

SELECT partnumber, partdescription, stockprice, categoryname, weight
FROM category c INNER JOIN inventorypart ip
ON c.categoryid = ip.categoryid
WHERE weight > 10 AND categoryname != 'Computers';

--Results
/*
PARTNUMBER PARTDESCRIPTION                  STOCKPRICE CATEGORYNAME                       WEIGHT
---------- -------------------------------- ---------- ------------------------------ ----------
CS-002     INTERNET SECURITY                    199.97 Accessories                         10.75
MON-005    24 HDMI WIDESCREEN MONITOR           149.99 Basics                                 13
MON-004    27 LED LCD MONITOR                   167.99 Basics                                 13
MON-002    27IN MULTIMEDIA MONITOR               139.4 Basics                                 13
MON-001    24IN MULTIMEDIA MONITOR                99.4 Basics                                 18
*/
--**************************************
--Question 5c

UPDATE inventorypart
SET stockprice = stockprice * 1.15
WHERE weight > 10 AND categoryid NOT IN (SELECT categoryid
                                        FROM category
                                        WHERE categoryname = 'Computers');

--Results
/*
5 rows updated.
*/
--**************************************
--Question 5d

SELECT partnumber, partdescription, stockprice, categoryname, weight
FROM category c INNER JOIN inventorypart ip
ON c.categoryid = ip.categoryid
WHERE weight > 10 AND categoryname != 'Computers';

--Results
/*
PARTNUMBER PARTDESCRIPTION               STOCKPRICE CATEGORYNAME                       WEIGHT
---------- ----------------------------- ---------- ------------------------------ ----------
CS-002     INTERNET SECURITY                 229.97 Accessories                         10.75
MON-005    24 HDMI WIDESCREEN MONITOR        172.49 Basics                                 13
MON-004    27 LED LCD MONITOR                193.19 Basics                                 13
MON-002    27IN MULTIMEDIA MONITOR           160.31 Basics                                 13
MON-001    24IN MULTIMEDIA MONITOR           114.31 Basics                                 18
*/
--**************************************
--Question 5e

COMMIT;

--Results
/*
Commit complete.
*/
--**************************************
--Question 6b

SELECT *
FROM customer
WHERE customerid = 'I-310009';


SELECT *
FROM custorder
WHERE customerid = 'I-310009';


SELECT *
FROM custorderline
WHERE orderid = '3000000071' OR orderid = '3000000413';


SELECT *
FROM shippeditem
WHERE orderid = '3000000071' OR orderid = '3000000413' OR shipmentid = 'H195' OR shipmentid = 'L013' OR shipmentid = 'M013';


SELECT *
FROM shipment
WHERE orderid = '3000000071' OR orderid = '3000000413';


SELECT *
FROM packingslip
WHERE shipmentid = 'H195' OR shipmentid = 'L013' OR shipmentid = 'M013';

--Results
/*
CUSTOMERID COMPANYNAME   CUSTFIRSTNAME   CUSTLASTNAME         CUSTT 
---------- ------------- --------------- -------------------- ----- 
I-310009                  Angela         Wainscott            Dr.                             

ADDRESS            CITY          ST POSTALCODE PHONE         CELLPHONE  EMAILADDR
----------------   ------------- -- ---------- ------------  ---------- ----------------------
3646 North Ave.    Idaho Falls   ID 83415      208-788-4112              awainscott@icloud.com


ORDERID    CUSTOMERID ORDERDATE REQUIREDD
---------- ---------- --------- ---------
3000000071 I-310009   04-AUG-19 06-AUG-19
3000000413 I-310009   09-DEC-19 27-DEC-19


ORDERID    PARTNUMBER  UNITPRICE ORDERQUANTITY   DISCOUNT STATUS         
---------- ---------- ---------- ------------- ---------- ---------------
3000000071 PRT-004           299             1          0 SHIPPED        
3000000413 MEM-004        269.99             1          0 SHIPPED        
3000000413 MEM-012         99.99             1          0 SHIPPED


ORDERID    PARTNUMBER SHIPMENTID PACKAGENUMBER QUANTITYSHIPPED
---------- ---------- ---------- ------------- ---------------
3000000034 CTR-005    L013                   1               1
3000000034 PRT-001    L013                   2               1
3000000071 PRT-004    M013                   1               1
3000000413 MEM-004    H195                   1               1
3000000413 MEM-012    H195                   1               1


SHIPMENTID ORDERID     SHIPPERID SHIPNAME             SHIPADDRESS       SHIPCITY             SH SHIPPOSTAL
---------- ---------- ---------- -------------------- ----------------- -------------------- -- ----------
H195       3000000413          2 Angela Wainscott     3646 North Ave.   Idaho Falls          ID 83415     
L013       3000000071          4 Angela Wainscott     3646 North Ave.   Idaho Falls          ID 83415


SHIPMENTID PACKAGENUMBER EMPLOYEEID SHIPPEDDA
---------- ------------- ---------- ---------
H195                   1 251154     14-DEC-19
L013                   1 250101     29-JUL-19
L013                   2 250550     29-JUL-19
M013                   1 251045     05-AUG-19
*/
--**************************************
--Question 6c1

DELETE FROM shippeditem
WHERE orderid = '3000000034' OR orderid = '3000000071' OR orderid = '3000000413';

--Results
/*
5 rows deleted.
*/
--**********************************8
--Question 6c2
DELETE FROM packingslip
WHERE shipmentid = 'H195' AND employeeid = '251154';

DELETE FROM packingslip
WHERE shipmentid = 'L013' AND employeeid = '250101';

DELETE FROM packingslip
WHERE shipmentid = 'L013' AND employeeid = '250550';

DELETE FROM packingslip
WHERE shipmentid = 'M013' AND employeeid = '251045';
--Results
/*
1 row deleted.

1 row deleted.

1 row deleted.

1 row deleted.
*/
--**********************************8
--Question 6c3

DELETE FROM shipment
WHERE orderid = '3000000413' OR orderid = '3000000071';

--Results
/*
2 rows deleted.
*/
--**********************************8
--Question 6c4

DELETE FROM custorderline
WHERE orderid = '3000000071' OR orderid = '3000000413';

--Results
/*
3 rows deleted.
*/
--**********************************8
--Question 6c5

DELETE FROM custorder
WHERE orderid = '3000000071' OR orderid = '3000000413';

--Results
/*
2 rows deleted.
*/
--**********************************8
--Question 6c6

DELETE FROM customer
WHERE customerid = 'I-310009';

--Results
/*
1 row deleted.
*/
--**************************************
--Question 6d

COMMIT;

--Results
/*
Commit complete.
*/
--**************************************
--Question 7

SELECT USER, systimestamp
FROM DUAL;

--Results
/*
USER                                       SYSTIMESTAMP                          
------------------------------------------ --------------------------------------
JMAHEDY                                    09-NOV-21 07.15.43.903004000 PM -05:00
*/
--**************************************
--Question 8b

INSERT INTO venue (venueid, name, city, state)
VALUES (5456573849, 'City Done', 'West Lafayette', 'IN');


INSERT INTO venue (venueid, name, city, state)
VALUES (1254345678, 'Convention Center', 'West Lafayette', 'IN');


INSERT INTO securityguard (securityid, venueid, firstname, lastname, clearancelevel)
VALUES (2565647476, 5456573849, 'Jack', 'Mahedy', 2);


INSERT INTO securityguard (securityid, venueid, firstname, lastname, clearancelevel)
VALUES (8498388844, 1254345678, 'John', 'Smith', 5);

--Results
/*
1 row inserted.
1 row inserted.
1 row inserted.
1 row inserted.
*/
--**************************************
--Question 8c

SELECT *
FROM venue;

SELECT *
FROM securityguard;

--Results
/*
VENUEID    NAME                 CITY                 ST
---------- -------------------- -------------------- --
5456573849 City Done            West Lafayette       IN
1254345678 Convention Center    West Lafayette       IN


SECURITYID VENUEID    FIRSTNAME            LASTNAME             C
---------- ---------- -------------------- -------------------- -
2565647476 5456573849 Jack                 Mahedy               2
8498388844 1254345678 John                 Smith                5
*/
--**************************************
--Question 8d

ROLLBACK;

--Results
/*
Rollback complete.
*/
--**************************************
--Question 8e

DROP TABLE venue CASCADE CONSTRAINTS;

DROP TABLE securityguard CASCADE CONSTRAINTS;

--Results
/*
Table VENUE dropped.

Table SECURITYGUARD dropped.
*/
/***************************************
Question 9
Commit makes permanent all inserts, updates, deletes, which have occured since 
the last commit or rollback command or since the last session began. Rollback 
reverses all changes (inserts, updates, deletes) made to the table in the database 
since the last commit or rollback, and releases any locks on the table. 

***************************************
Question 10
An employeeid must be in the employee table to be in the purchaseorder table 
because the employeeid in the employee table is the PK and the employeeid in the
purchaseorder is the FK. With poor quality control the administrator can delete 
the employeeid in the employee table and not the employeeid in the purchaseorder 
table. primary kay and Foreign key controls might be missing.

***************************************
Question 11
One limitation is that when you are just inserting records the size of the attribute 
you are updating must be with in the size of the specified datatype. when you update
table with the a value of null do not use single quotes. If you use single quotes
the field will update with the word 'null'.
*/