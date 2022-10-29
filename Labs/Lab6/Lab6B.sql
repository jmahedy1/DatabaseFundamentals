/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

**************************************
Question 1
*/

SELECT m.machineid, manufacturername, make, model
FROM machine m LEFT JOIN machineprocess mp
ON m.machineid = mp.machineid
WHERE mp.machineid IS NULL
GROUP BY m.machineid, manufacturername, make, model;

--Results
/*
MACHINEID  MANUFACTURERNAME          MAKE                      MODEL                    
---------- ------------------------- ------------------------- -------------------------
CONVEY     NORTHWEST CONVEYER        LINESHAFT CONVEYOR        STAINLESS STEEL          
RFID       READY ONE RFID            RFID SYSTEM               ZR33D0
*/
--**********************************
--Question 2

SELECT e.employeeid, lastname, jobtitle, hiredate, MIN(shippeddate)
FROM employee e LEFT JOIN packingslip p
ON e.employeeid = p.employeeid
GROUP BY e.employeeid, lastname, jobtitle, hiredate
ORDER BY e.employeeid;

--Results
/*
EMPLOYEEID LASTNAME             JOBTITLE                            HIREDATE  MIN(SHIPP
---------- -------------------- ----------------------------------- --------- ---------
250001     Thompson             Chief Financial Officer             12-JUN-01          
250101     Rosner               Assembly                            04-APR-05 25-FEB-19
250103     Gomez                VP Operations                       30-JAN-12          
250104     Blair                Engineer                            25-JAN-12          
250106     Loreto               Programmer Analyst                  04-APR-13          
250112     Hickman              Programmer Analyst                  01-FEB-15          
250120     Nairn                Assembly                            04-APR-11 05-JUL-19
250125     Stevens              Chief Information Officer           01-FEB-15          
250127     Watson               Operations Officer                  07-JAN-18          
250200     Hernandez            Engineer                            13-OCT-08          
250204     Vigus                Assembly                            04-APR-03 25-FEB-19

EMPLOYEEID LASTNAME             JOBTITLE                            HIREDATE  MIN(SHIPP
---------- -------------------- ----------------------------------- --------- ---------
250206     Guiomar              VP Finance                          01-DEC-11          
250209     Reyes                Engineer                            09-JAN-11          
250220     Gomez                Accountant                          11-NOV-05          
250330     Gustavel             Operations Officer                  10-SEP-15          
250365     Zollman              President                           20-JAN-13          
250399     Day                  Assembly                            04-MAY-11 20-SEP-19
250475     Hess                 Assembly                            04-APR-03          
250488     Osman                Programmer Analyst                  03-JAN-10          
250550     Roland               Assembly                            04-APR-14 06-JUL-19
250559     Romilda              Engineer                            03-JAN-13          
250600     Winters              Sales                               04-APR-11          

EMPLOYEEID LASTNAME             JOBTITLE                            HIREDATE  MIN(SHIPP
---------- -------------------- ----------------------------------- --------- ---------
250650     Lilley               VP Information                      25-NOV-08          
250700     Jones                DBA                                 03-JAN-12          
250880     Goldwear             Chief Sales Officer                 18-JUN-15          
250892     Platt                Assembly                            04-APR-13 06-JUL-19
250944     Thompson             Engineer                            20-JUN-05          
250967     Daniels              Assembly                            25-FEB-12 20-MAR-19
250989     Deagen               Assembly                            04-JAN-06 13-JUL-19
251007     Krastner             Sales                               06-JUN-08          
251030     Moore                Assembly                            06-JUN-12          
251045     Meyer                Assembly                            06-JUN-19 05-JUL-19
251066     Rodgers              Sales                               05-MAY-15          

EMPLOYEEID LASTNAME             JOBTITLE                            HIREDATE  MIN(SHIPP
---------- -------------------- ----------------------------------- --------- ---------
251088     Underwood            Assembly                            10-OCT-17 13-JUL-19
251089     Alvarez              Assembly                            23-JUL-15          
251097     Trale                Assembly                            26-SEP-10 07-JUL-19
251115     Cochran              Assembly                            17-JUN-13          
251135     Gostler              Assembly                            06-JUN-14          
251154     Hettinger            Assembly                            25-JAN-02 07-JUL-19
251166     Sidney               Assembly                            25-JUN-10 08-JUL-19
251167     Natlen               Sales                               25-JAN-15 08-MAR-20
251175     Darby                Assembly                            14-APR-19          

42 rows selected.
*/
--**********************************
--Question 3

SELECT partnumber, i.categoryid, categoryname, stockprice, stocklevel
FROM category c RIGHT JOIN inventorypart i
ON c.categoryid = i.categoryid
WHERE stocklevel > 15 AND stockprice > (SELECT AVG(stockprice)
                                        FROM inventorypart
                                        WHERE categoryid = 'NET');
                                        
--Results
/*
PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
BB-003     BASE       Basics                             317.99         22
BB-005     BASE       Basics                             211.99         30
C-001      BASE       Basics                              70.97         23
MOM-001    BASE       Basics                              59.93         45
MOM-002    BASE       Basics                              95.99         55
MOM-003    BASE       Basics                              83.99         30
ADT-002    CBL        Cables                              63.88         30
ADT-007    CBL        Cables                              74.88         45
BRK-004    CBL        Cables                              62.79         55
P-001      PROC       Processors                         209.99         30
P-002      PROC       Processors                         239.99         30

PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
P-003      PROC       Processors                         257.99         30
P-004      PROC       Processors                         275.99         45
P-005      PROC       Processors                         239.99         45
P-006      PROC       Processors                         203.99         45
P-007      PROC       Processors                         460.79         30
P-008      PROC       Processors                         119.99         22
P-009      PROC       Processors                         161.99         22
P-010      PROC       Processors                         179.99         22
CD-003     STOR       Storage                            171.99         18
DVD-002    STOR       Storage                             95.99         27
MEM-001    STOR       Storage                            155.97         25

PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
MEM-004    STOR       Storage                            161.99         18
MEM-007    STOR       Storage                             63.99         27
MEM-012    STOR       Storage                             99.99         36
CRD-001                                                   89.99         60
CRD-003                                                   59.99         60

27 rows selected.
*/
--**********************************
--Question 4

SELECT employeeid
FROM employee
MINUS
SELECT employeeid
FROM packingslip;

--Results
/*
EMPLOYEEID
----------
250001
250103
250104
250106
250112
250125
250127
250200
250206
250209
250220

EMPLOYEEID
----------
250330
250365
250475
250488
250559
250600
250650
250700
250880
250944
251007

EMPLOYEEID
----------
251030
251066
251089
251115
251135
251175

28 rows selected.
*/
--**********************************
--Question 5

SELECT SUBSTR(phone, 1, 3)
FROM supplier
INTERSECT
SELECT SUBSTR(phone, 1, 3)
FROM customer
INTERSECT
SELECT SUBSTR(homephone, 1, 3)
FROM employee;

--Results
/*
SUB
---
860
*/
--**********************************
--Question 6

SELECT (firstname ||' '|| lastname) AS NAME, emailaddr, hiredate, birthdate, TO_CHAR(hiredate, 'fmMONTH') AS HIRE_BIRTHDAY
FROM employee
WHERE TO_CHAR(hiredate, 'fmMONTH') = TO_CHAR(birthdate, 'fmMONTH')
INTERSECT
SELECT (firstname ||' '|| lastname) AS NAME, emailaddr, hiredate, birthdate, TO_CHAR(birthdate, 'fmMONTH') AS HIRE_BIRTHDAY
FROM employee
WHERE TO_CHAR(hiredate, 'fmMONTH') = TO_CHAR(birthdate, 'fmMONTH');

--Results
/*
NAME                                 EMAILADDR                                          HIREDATE  BIRTHDATE HIRE_BIRT
------------------------------------ -------------------------------------------------- --------- --------- ---------
Allison Roland                                                                          04-APR-14 08-APR-88 APRIL    
David Gostler                                                                           06-JUN-14 04-JUN-84 JUNE     
Gregory Hettinger                                                                       25-JAN-02 20-JAN-84 JANUARY  
Malik Krastner                       mkrastner@pencomp.com                              06-JUN-08 08-JUN-85 JUNE     
Maria Guiomar                        mguiomar@pencomp.com                               01-DEC-11 01-DEC-79 DECEMBER 
Melissa Alvarez                                                                         23-JUL-15 17-JUL-85 JULY     
Rosario Gomez                        rgomez@pencomp.com                                 11-NOV-05 20-NOV-90 NOVEMBER 
Ryan Thompson                        rthompson@pencomp.com                              20-JUN-05 20-JUN-86 JUNE     
Shannon Darby                                                                           14-APR-19 14-APR-93 APRIL    
Steve Cochran                                                                           17-JUN-13 03-JUN-90 JUNE     

10 rows selected.
*/
--**********************************
--Question 7

SELECT partnumber, status, COUNT(*), SUBSTR(partnumber, 1, 3)
FROM custorderline
WHERE SUBSTR(partnumber, 1, 3) = 'KEY'
GROUP BY partnumber, status
UNION
SELECT partnumber, ecnumber, COUNT(*), SUBSTR(partnumber, 1, 3)
FROM operation
WHERE SUBSTR(partnumber, 1, 3) = 'KEY'
GROUP BY partnumber, ecnumber;

--Results
/*
PARTNUMBER STATUS            COUNT(*) SUB
---------- --------------- ---------- ---
KEY-001    PACK-009                 7 KEY
KEY-001    PENDING                  1 KEY
KEY-001    PICKED                   1 KEY
KEY-001    SHIPPED                  4 KEY
KEY-002    PACK-009                 7 KEY
KEY-002    SHIPPED                  7 KEY
KEY-003    PACK-009                 7 KEY
KEY-003    SHIPPED                  6 KEY
KEY-004    PACK-009                 7 KEY
KEY-004    SHIPPED                  4 KEY
KEY-005    PACK-009                 7 KEY

PARTNUMBER STATUS            COUNT(*) SUB
---------- --------------- ---------- ---
KEY-005    SHIPPED                  5 KEY
KEY-006    PACK-009                 7 KEY
KEY-006    SHIPPED                 13 KEY
KEY-007    PACK-009                 7 KEY
KEY-007    SHIPPED                 10 KEY
KEY-008    PACK-009                 7 KEY
KEY-008    SHIPPED                 14 KEY
KEY-009    PACK-009                 7 KEY
KEY-009    PACKED                   1 KEY
KEY-009    SHIPPED                  8 KEY

21 rows selected.
*/
--**********************************
--Question 8

SELECT shipname, shipaddress, shipcity, shipstate
FROM shipment s INNER JOIN shipper sr
ON s.shipperid = sr.shipperid
WHERE shippername = 'Federal Express' AND shipstate = 'NY'
UNION
SELECT companyname, address, city, state
FROM customer
WHERE companyname IS NOT NULL AND state = 'IL';

--Results
/*
SHIPNAME                                 SHIPADDRESS                              SHIPCITY             SH
---------------------------------------- ---------------------------------------- -------------------- --
Apartment Referrals                      555 W. Liberty Ave.                      Chicago              IL
Bankruptcy Help                          5991 Kenwood Rd.                         Chicago              IL
Jack Illingworth                         2741 Ashland Ave.                        Buffalo              NY
Kevin Zubarev                            5933 Valley St.                          Syracuse             NY
Lucille Appleton                         5260 Blue Mound Rd.                      Newburgh             NY
Tim Leffert                              2765 Independence Ave.                   Rome                 NY

6 rows selected.
*/
--**********************************
--Question 9

SELECT partnumber
FROM inventorypart
MINUS
SELECT partnumber
FROM custorderline;

--Results
/*
PARTNUMBER
----------
ADT-002
BRK-006
C-004
CAB-002
CAB-004
CAB-014
CAB-019
CAB-024
CS-001
CS-002
CS-003

PARTNUMBER
----------
CTR-010
CTR-020
POW-001
PRT-005
SCN-003
SFT-009

17 rows selected.
*/
--**********************************
--Question 10

SELECT orderid, MAX(orderdate), MIN(orderdate), customerid
FROM custorder
WHERE orderdate IN (SELECT MAX(orderdate)
                        FROM custorder
                        UNION
                        SELECT MIN(orderdate)
                        FROM custorder)
GROUP BY orderid, customerid;

--Results
/*
ORDERID    MAX(ORDER MIN(ORDER CUSTOMERID
---------- --------- --------- ----------
3000000001 01-JUL-19 01-JUL-19 I-310001  
3000000002 01-JUL-19 01-JUL-19 C-310008  
3000000003 01-JUL-19 01-JUL-19 I-310002  
3000000004 01-JUL-19 01-JUL-19 I-310003  
3001000813 02-APR-20 02-APR-20 I-310150  
3001000814 02-APR-20 02-APR-20 C-310065  
3001000815 02-APR-20 02-APR-20 I-310155  
3001000816 02-APR-20 02-APR-20 I-310010  
3001000817 02-APR-20 02-APR-20 C-310043  

9 rows selected.
*/
--**********************************
/*Question 11
Inner join is joining two tables based on matching (equal) vales in specific 
columns (PK to FK). Outter join includes all of the rows from one table even 
if there are no rows with matching values in the joining table. 

************************************
Question 12
In 272 we use left outer join and right outer join. Left outer join reports all 
of the inner join records between the parent and child table, plus any primary
key (parent) values that do not have matching foreign key (child) values. Right
outer join reports all of the inner join records between the parent and child
table, plus any foreign key null values that do not have matching primary key 
values from the parent table.

************************************
Question 13
When you add attributes to the select clasue there has to be the same number of 
attributes and the attributes must have matching datatypes per column. When I 
added more attributes to both select clauses that were the same datatype, it 
added new fields in the result table. All of the existing fields remained the 
same. Intersect  will look for all intersection of all queries in the SQL 
statement. If you add an additional entity with interestion it will limit the 
results further. Intersect only returns rows selected by all queries or data 
sets. If a record exists in one query and not in the other, it will be omitted 
from the results.

************************************
Question 14
Union final result set contains the rows that are in either or both individual
result sets (no duplicates listed). The selected data must have similar
datatypes (column names can differ). You must have the same number of fields
from each table in the select statement. For joins you do not need the same
number of fields or the same datatypes. With joins you can only connect them
when they are connected in the ERD. With union you can connect entities with no 
direct relationship.

************************************
Question 15
Minus works by taking all of query 1 results that did not also appear in the
row output from query 2. The queries involved must select data with the similar
structure. It does matter which query is first. Becasue it will return the first 
query results with the common rows removed.
*/