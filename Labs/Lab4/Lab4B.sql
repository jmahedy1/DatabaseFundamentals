/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

**************************************
Question 1.
*/

SET linespace 200
SELECT USER, ROUND(3859.5886, 2), TRUNC(3859.5886, 2), FLOOR(3859.5886), CEIL(3859.5886)
FROM DUAL;

--Results
/*
USER                                        ROUND(3859.5886,2) TRUNC(3859.5886,2) FLOOR(3859.5886) CEIL(3859.5886)
------------------------------------------- ------------------ ------------------ ---------------- ---------------
JMAHEDY                                                3859.59            3859.58             3859            3860
*/

--**********************************
--Question 2.

SELECT customerid, (custfirstname ||' '|| custlastname) AS customer, emailaddr, NVL(cellphone,'*Cell Missing*') AS CELLPHONE
FROM customer
WHERE (state = 'NY' AND (companyname IS NOT NULL OR emailaddr LIKE '%outlook%'));

--Results
/*
CUSTOMERID CUSTOMER                             EMAILADDR                                          CELLPHONE     
---------- ------------------------------------ -------------------------------------------------- --------------
C-310005   Carl Tulain                          ctulain@guidestar.com                              507-762-9493  
C-310006   Davin Coleman                        davinc@allianz.com                                 507-543-1845  
C-310023   David Tarter                         estate@gmail.com                                   518-500-6159  
C-310039   Tim Leffert                          trailrent@comcast.net                              315-486-0683  
C-310053   Jeff Kowaiski                        equipit@live.com                                   212-492-9525  
C-310062   Doug Blizzard                        collectit@outlook.com                              518-646-2170  
I-310035   Tim Parker                           tparker22@outlook.com                              *Cell Missing*
I-310092   Trudi Antonio                        trudia67@outlook.com                               *Cell Missing*

8 rows selected.
*/

--*************************
--Question 3.

SELECT supplierid, COUNT(*), MIN(unitcost), MAX(unitcost), ROUND(AVG(unitcost), 2)
FROM suppliedpart
WHERE (partnumber LIKE 'M%' OR partnumber LIKE 'P%')
GROUP BY supplierid;

--Results
/*
SUPPLIERID   COUNT(*) MIN(UNITCOST) MAX(UNITCOST) ROUND(AVG(UNITCOST),2)
---------- ---------- ------------- ------------- ----------------------
C-455               4         23.44        257.44                 135.55
CA-103              3         23.44       1179.25                 554.48
CCS-106             2        431.94       1689.85                 1060.9
CF-450              1        459.25        459.25                 459.25
DCI-450             2        233.97        239.79                 236.88
DE-450              2        525.82       4697.44                2611.63
GC-450              8         45.67       2699.85                 962.52
JLI-450             1       3322.65       3322.65                3322.65
LL-455              2          75.8        8275.8                 4175.8
MC-455              8         235.8        7195.8                 1641.4
MM-103              2        149.95        215.96                 182.96

SUPPLIERID   COUNT(*) MIN(UNITCOST) MAX(UNITCOST) ROUND(AVG(UNITCOST),2)
---------- ---------- ------------- ------------- ----------------------
MM-104              2         239.4       2429.85                1334.63
MSN-105             2        134.85         535.8                 335.33
MY-450              4         83.99         322.4                 180.44
NA-450              2        125.97         419.4                 272.69
OI-450              4         95.99        239.46                 155.19
PA-384              3        167.22        285.56                 245.55
PA-450              3          52.4         239.4                 127.07
PP-103              4         229.4        6115.8                2112.14
RC-450              1        4199.8        4199.8                 4199.8
SS-455              4        289.85       2339.55                 1313.3
TA-144              3         179.4       1619.85                 778.24

SUPPLIERID   COUNT(*) MIN(UNITCOST) MAX(UNITCOST) ROUND(AVG(UNITCOST),2)
---------- ---------- ------------- ------------- ----------------------
WE-450              2       2266.85        5122.8                3694.83

23 rows selected.
*/

--***********************
--Question 4.

SELECT supplierid, COUNT(*), MIN(unitcost), MAX(unitcost), ROUND(AVG(unitcost), 2)
FROM suppliedpart
WHERE (partnumber LIKE 'M%' OR partnumber LIKE 'P%')
GROUP BY supplierid
HAVING COUNT(*) > 5;

--Results
/*
SUPPLIERID   COUNT(*) MIN(UNITCOST) MAX(UNITCOST) ROUND(AVG(UNITCOST),2)
---------- ---------- ------------- ------------- ----------------------
GC-450              8         45.67       2699.85                 962.52
MC-455              8         235.8        7195.8                 1641.4
*/

--***************************
--Question 5.

SELECT SUBSTR(partnumber, 1, 3), operationstep, COUNT(*)
FROM operation
WHERE operationstep IN ('BOX', 'WRAP', 'SEAL')
GROUP BY operationstep, SUBSTR(partnumber, 1, 3)
HAVING COUNT (*) > 10
ORDER BY SUBSTR(partnumber, 1, 3);

--Restults
/*
SUB OPERATIONS   COUNT(*)
--- ---------- ----------
BRK BOX                11
BRK SEAL               11
BRK WRAP               11
CAB BOX                28
CAB SEAL               28
CAB WRAP               28
CTR BOX                29
CTR SEAL               29
CTR WRAP               29
MEM BOX                12
MEM SEAL               12

SUB OPERATIONS   COUNT(*)
--- ---------- ----------
MEM WRAP               12
MIC BOX                12
MIC SEAL               12
MIC WRAP               12

15 rows selected.
*/

--******************************
--Question 6.

SELECT employeeid, supplierid, dateordered, MAX(datedelivered)
FROM purchaseorder
WHERE datedelivered = (SELECT MAX(datedelivered) FROM purchaseorder)
GROUP BY employeeid, supplierid, dateordered;

--Results
/*
EMPLOYEEID SUPPLIERID DATEORDER MAX(DATED
---------- ---------- --------- ---------
250892     CA-105     03-SEP-20 14-SEP-20
250880     MSN-105    10-SEP-20 14-SEP-20
*/

--***************************
--Question 7.

SELECT partnumber, RPAD(LOWER(partdescription),30,'*'), categoryid, weight, stockprice
FROM inventorypart
WHERE (stocklevel < reorderlevel) AND stockprice < (SELECT ROUND(AVG(stockprice), 2) FROM inventorypart);

SELECT ROUND(AVG(stockprice), 2)
FROM inventorypart;


--Results
/*
PARTNUMBER RPAD(LOWER(PARTDESCRIPTION),30 CATEGORYID     WEIGHT STOCKPRICE
---------- ------------------------------ ---------- ---------- ----------
BRK-010    3 1/2in mounting kit********** CBL                .5       2.99
CAB-027    16ft hdmi to dvid cable*******                     1      25.99
CRD-009    4gb 128 bit ddr3 pci hdcp read                  .438     119.99
MIC-005    wired optical mouse*********** BASE             1.25      17.97
MOD-003    surfboard modem*************** NET                .5     121.99
MOM-004    raspberry pi****************** BASE                6      65.99
POW-002    6in y internal power adapter 3 CBL              .188       1.19
PS-001     750 watt power supply********* POW                 3      59.97
SFT-003    home attorney software******** SFTW              .25       6.99
SFT-007    internet security************* SFTW            1.375       5.99
SP-003     dual serial single parallel ec                   .75      41.97

PARTNUMBER RPAD(LOWER(PARTDESCRIPTION),30 CATEGORYID     WEIGHT STOCKPRICE
---------- ------------------------------ ---------- ---------- ----------
CS-001     security camera*************** HOME             2.75      55.97
CS-002     internet security************* HOME            10.75     199.97
CS-003     pc lock*********************** HOME             1.75      21.67

14 rows selected. 


ROUND(AVG(STOCKPRICE),2)
------------------------
                  222.85
*/

--***************************
--Question 8.

SELECT (firstname || ' ' || lastname) AS EMPLOYEE_NAME, TO_CHAR(salarywage,'$999,999.99'), hiredate, birthdate, TRUNC(MONTHS_BETWEEN(hiredate, birthdate)/12,0) AS HIRED_AGE
FROM employee
WHERE TRUNC(MONTHS_BETWEEN(hiredate, birthdate)/12,0) > 30
ORDER BY HIRED_AGE;

--Results
/*
EMPLOYEE_NAME                        TO_CHAR(SALA HIREDATE  BIRTHDATE  HIRED_AGE
------------------------------------ ------------ --------- --------- ----------
Maria Guiomar                         $115,600.00 01-DEC-11 01-DEC-79         32
Rita Gomez                             $85,700.00 30-JAN-12 01-APR-77         34
Laura Rodgers                              $23.95 05-MAY-15 02-JUN-80         34
Kayla Underwood                            $24.45 10-OCT-17 03-SEP-82         35
Kristen Gustavel                       $78,800.00 10-SEP-15 06-OCT-76         38
*/

--***************************
--Question 9a.

SELECT status, COUNT(*), SUM(unitprice * orderquantity) AS SUBTOTAL
FROM custorderline
GROUP BY status
ORDER BY SUM(ROUND(unitprice * orderquantity, 2));

--Results
/*
STATUS            COUNT(*)   SUBTOTAL
--------------- ---------- ----------
PACKED                   8    4973.04
PICKED                  13   10984.79
PART SHIP                3   21076.67
PENDING                 43   38171.03
SHIPPED               2225  2974080.4
*/

--***************************
--Question 9b.

SELECT unitprice, orderquantity, (unitprice * orderquantity) AS SUBTOTAL, orderid
FROM custorderline
WHERE status LIKE '%PACKED%';

--Results
/*
 UNITPRICE ORDERQUANTITY   SUBTOTAL ORDERID   
---------- ------------- ---------- ----------
     12.99             1      12.99 3001000667
     69.99             1      69.99 3001000667
     31.95             3      95.85 3001000703
      5.99             1       5.99 3001000703
     44.99             2      89.98 3001000703
     14.99            29     434.71 3001000797
   1856.79             2    3713.58 3001000810
    109.99             5     549.95 3001000810

8 rows selected.
*/

--***************************
--Question 9c.

SELECT status, COUNT(*), SUM(unitprice * orderquantity) AS SUBTOTAL 
FROM custorderline
GROUP BY status
HAVING SUM(unitprice * orderquantity) <= 30000;

--Results
/*
STATUS            COUNT(*)   SUBTOTAL
--------------- ---------- ----------
PART SHIP                3   21076.67
PACKED                   8    4973.04
PICKED                  13   10984.79
*/

--***************************
--Question 10a.

SELECT sysdate, TO_CHAR(sysdate, 'fmMONTH dd, YYYY')
FROM DUAL

--Results
/*
SYSDATE   TO_CHAR(SYSDATE,'F
--------- ------------------
12-OCT-21 OCTOBER 12, 2021
*/

--***************************
--Question 10b.

SELECT sysdate, TO_CHAR(sysdate,'day')
FROM DUAL;

--Results
/*
SYSDATE   TO_CHAR(S
--------- ---------
13-OCT-21 wednesday
*/

--***************************
--Question 10c.

SELECT USER, TO_CHAR(DATE '2000-06-10','DAY')
FROM DUAL;

--Results
/*
USER                                                               TO_CHAR(D
------------------------------------------------------------------ ---------
JMAHEDY                                                            SATURDAY
*/

/****************************

Question 11. A row function always operates on only one row (record) at a time. 
A Column function summarizes data in an entire column in the table. A comumn 
fuction is also called a group function.

Question 12. Nested queries are used when a group function is not allows in the 
where clause. You cant have something greater than, less than, or equal to in 
the where clause. EX.   SELECT employeeid, supplierid, dateordered, MAX(datedelivered)
                        FROM purchaseorder
                        WHERE datedelivered = (SELECT MAX(datedelivered) 
                                                FROM purchaseorder);

Question 13. The WHERE clause limits the rows. The HAVING clause restricts the 
groups rows that are returned from the database. (Like a where clause for group 
results.)

Question 14. You use GROUP BY when the data is duplicated in at least one column.
When rows are grouped, only one line of output is returned for each group. the 
result table can not be a list of aggregate and detail data.

Question 15. TO_CHAR is the output. It converts the date to a value of varchar2 
datatype. It is used to externally display a date. TO_DATE is the inpt. It 
converts the character in varchar2 to a date datatype. It is sed to reformat 
date or store a date into a date datatype for processing or insertion.

*/
