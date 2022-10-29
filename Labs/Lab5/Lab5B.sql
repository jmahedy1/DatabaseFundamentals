/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

**************************************
Question 1 
*/

SELECT partnumber, partdescription, stockprice
FROM inventorypart
WHERE partnumber NOT IN (SELECT partnumber 
                          FROM custorderline)
ORDER BY stockprice;

--Results
/*
PARTNUMBER PARTDESCRIPTION                                    STOCKPRICE
---------- -------------------------------------------------- ----------
POW-001    P819 POWER EXTENSION CABLE SET                           4.17
SFT-009    DESKTOP PUBLISHER                                        5.99
CAB-019    12FT USB A MALE TO B MALE PRINTER CABLE                  7.99
CAB-004    10FT USB HUB EXTENSION CABLE                             8.79
BRK-006    BLANK BRACKET                                           11.79
CAB-014    25FT HDMI AND MINI DVI TO HDMI ADAPTER                  20.99
CAB-002    6FT MONITOR CABLE                                       21.19
CS-003     PC LOCK                                                 21.67
C-004      LAPTOP PLASTIC CASE                                     21.93
CAB-024    DVID CABLE LENOVO TO SINGLE DVID                        29.99
CS-001     SECURITY CAMERA                                         55.97

PARTNUMBER PARTDESCRIPTION                                    STOCKPRICE
---------- -------------------------------------------------- ----------
ADT-002    THUNDERBOLT 3 TO 2 ADAPTER                              63.88
PRT-005    COLOR INKJET PRINTER                                     89.4
CS-002     INTERNET SECURITY                                      199.97
SCN-003    SCANJET PROFESSIONAL SERIES COLOR SCANNER               239.4
CTR-020    FLY XPSB                                              1218.15
CTR-010    Basic ATHLON II                                       1399.67

17 rows selected.
*/
--**********************************
--Question 2

COL unitprice format $9,999.99;
SELECT categoryid, i.partnumber, partdescription, unitprice, orderquantity, weight
FROM inventorypart i inner join custorderline c
ON i.partnumber = c.partnumber
WHERE status LIKE 'PENDING' AND unitprice < 100;

--Results
/*
CATEGORYID PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY     WEIGHT
---------- ---------- -------------------------------------------------- ---------- ------------- ----------
CBL        BRK-002    1X4 USB CABLE AND BRACKET                               $8.99             5       .375
CBL        BRK-004    MOUNT IR MICROSENSOR                                    $7.99             2       .375
BASE       C-003      MINI TOWER CASE                                        $69.95             1        2.5
           CAB-012    12FT WHITE MINI DVI TO FEMALE MINI DVI                 $14.99             3       .813
           CAB-027    16FT HDMI TO DVID CABLE                                $44.79             3          1
           CAB-028    3FT DVID TO DVID MALE TO MALE                          $31.95             2         .5
PROC       CF-001     HIGH AIRFLOW FAN TWIN PACK                             $32.95             1         .5
PROC       CF-009     CPU COOLING FAN FOR HP                                  $5.95             1         .5
           CRD-004    2GB RADEON R5 230 VIDEO CARD                           $89.99             2       .313
           CRD-008    2GB 64 BIT GDDR5 PCI EXPRESS                           $39.99             8       .375
CBL        ICAB-005   MOTHERBOARD 20 PIN F TO 2 USB3 F                       $12.99             5       .438

CATEGORYID PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY     WEIGHT
---------- ---------- -------------------------------------------------- ---------- ------------- ----------
KEY        KEY-001    NATURAL KEYBOARD PRO                                   $68.95            30          2
BASE       MIC-001    RGB TUNABLE GAMING MOUSE                               $69.95            12      1.188
BASE       MIC-004    WIRELESS OPTICAL MOUSE                                 $37.95            12       .188
BASE       MIC-009    OPTICAL PURPLE LED 6 MOUSE                             $29.50            15       1.25
NET        MOD-002    CABLE MODEM                                            $87.99            16        .75
BASE       MOM-001    X370 ATX MOTHERBOARD                                   $99.88             1          5
ACS        PRT-006    SINGLEHEAD THERMAL INKJET PRINTER                      $99.00             4          9
SFTW       SFT-001    ANTIVIRUS SOFTWARE                                      $7.99             2       .188
SFTW       SFT-002    HOME FINANCE SOFTWARE                                   $8.85             1      1.375
SFTW       SFT-004    HOME AND GARDEN                                         $8.49             1       .313
SFTW       SFT-006    CARD GAMES                                              $9.99             6       .313

CATEGORYID PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY     WEIGHT
---------- ---------- -------------------------------------------------- ---------- ------------- ----------
SFTW       SFT-007    INTERNET SECURITY                                       $8.49             2      1.375
SFTW       SFT-008    PHOTO EDITING                                           $6.99             1        .25

24 rows selected.
*/
--**********************************
--Question 3a

SELECT datedelivered, COUNT(pol.purchorderid) AS UNITS_COUNTED, MAX(pol.orderedunitcost) AS MAX_COST, MIN(pol.orderedunitcost) AS MIN_COST, ROUND(AVG(pol.orderedunitcost), 1) AS AVG_COST
FROM purchaseorder po inner join purchorderline pol
ON po.purchorderid = pol.purchorderid
GROUP BY datedelivered
ORDER BY datedelivered;

--Results
/*
DATEDELIV UNITS_COUNTED   MAX_COST   MIN_COST   AVG_COST
--------- ------------- ---------- ---------- ----------
29-APR-20             7    5399.82     210.33     1530.7
30-APR-20             5    7539.64     225.82       2108
22-MAY-20             6   12351.33     174.28     3347.5
24-MAY-20             5    5459.73     265.46     1686.1
26-MAY-20             2     7549.2     242.87       3896
28-MAY-20             9    2475.85      21.42      737.1
29-JUL-20             3     2153.6     815.92     1534.7
01-AUG-20            10    6047.37      21.42     1006.2
02-AUG-20            12    3003.82      98.93     1030.4
10-AUG-20             5     648.92     164.73        382
11-AUG-20             4    3219.64     328.87     1254.5

DATEDELIV UNITS_COUNTED   MAX_COST   MIN_COST   AVG_COST
--------- ------------- ---------- ---------- ----------
17-AUG-20             5     908.99     225.64      482.1
07-SEP-20             4     1514.6      71.42      794.8
08-SEP-20            13    8622.38     145.32     2954.9
09-SEP-20            13     5507.7      64.62       1273
10-SEP-20             2    1895.16     215.91     1055.5
11-SEP-20             5    3239.73       65.7     1258.2
12-SEP-20            15    6244.22      64.62     1801.6
13-SEP-20            12    6479.73       80.6     1617.6
14-SEP-20            14    1079.91      92.25        391

20 rows selected.
*/
--**********************************
--Question 3b

SELECT datedelivered, pol.supplierid, COUNT(pol.purchorderid) AS UNITS_COUNTED, MAX(pol.orderedunitcost) AS MAX_COST, MIN(pol.orderedunitcost) AS MIN_COST, ROUND(AVG(pol.orderedunitcost), 1) AS AVG_COST
FROM purchaseorder po inner join purchorderline pol
ON po.purchorderid = pol.purchorderid
WHERE datedelivered between '01-AUG-2020' AND '31-AUG-2020'
GROUP BY datedelivered, pol.supplierid
ORDER BY datedelivered;

--Results
/*
DATEDELIV SUPPLIERID UNITS_COUNTED   MAX_COST   MIN_COST   AVG_COST
--------- ---------- ------------- ---------- ---------- ----------
01-AUG-20 CA-103                 5    1888.65      21.42      614.2
01-AUG-20 JLI-450                5    6047.37      64.62     1398.3
02-AUG-20 MY-450                 6    3003.82     215.64     1299.3
02-AUG-20 PA-450                 6    2585.52      98.93      761.5
10-AUG-20 LU-450                 5     648.92     164.73        382
11-AUG-20 CV-104                 4    3219.64     328.87     1254.5
17-AUG-20 NA-450                 1     908.99     908.99        909
17-AUG-20 PA-455                 4     648.92     225.64      375.4

8 rows selected.
*/
--**********************************
--Question 3c

SELECT datedelivered, pol.supplierid, COUNT(pol.purchorderid) AS UNITS_COUNTED, MAX(pol.orderedunitcost) AS MAX_COST, MIN(pol.orderedunitcost) AS MIN_COST, ROUND(AVG(pol.orderedunitcost), 1) AS AVG_COST
FROM purchaseorder po inner join purchorderline pol
ON po.purchorderid = pol.purchorderid
WHERE datedelivered between '01-AUG-2020' AND '31-AUG-2020' 
GROUP BY datedelivered, pol.supplierid
HAVING ROUND(AVG(pol.orderedunitcost), 1) > 1000
ORDER BY datedelivered;

--Results
/*
DATEDELIV SUPPLIERID UNITS_COUNTED   MAX_COST   MIN_COST   AVG_COST
--------- ---------- ------------- ---------- ---------- ----------
01-AUG-20 JLI-450                5    6047.37      64.62     1398.3
02-AUG-20 MY-450                 6    3003.82     215.64     1299.3
11-AUG-20 CV-104                 4    3219.64     328.87     1254.5
*/
--**********************************
--Question 4

SELECT s.shipmentid, co.orderid, (custfirstname ||' '|| custlastname) AS Contact, NVL(emailaddr, '**missing Email**'), orderdate
FROM customer c inner join custorder co
ON c.customerid = co.customerid
inner join shipment s
ON co.orderid = s.orderid
WHERE shipmentid LIKE 'M%' AND shipmentid NOT IN (SELECT shipmentid
                                                  FROM packingslip);

--Results
/*
SHIPMENTID ORDERID    CONTACT                              NVL(EMAILADDR,'**MISSINGEMAIL**')                  ORDERDATE
---------- ---------- ------------------------------------ -------------------------------------------------- ---------
M129       3001000667 John Skadberg                        skad@comcast.net                                   23-FEB-20
M137       3001000703 Joan Hedden                          **missing Email**                                  01-MAR-20
M147       3001000750 Louise Cool                          **missing Email**                                  13-MAR-20
M159       3001000796 Jill Reece                           jreece1@comcast.net                                29-MAR-20
M160       3001000799 Karen Mangus                         karenm122@outlook.com                              29-MAR-20
M161       3001000803 Shirley Osborne                      **missing Email**                                  30-MAR-20
M162       3001000808 Howard Huegel                        **missing Email**                                  31-MAR-20

7 rows selected.
*/
--**********************************
--Question 5

SELECT sm.shipperid, shippername, emailaddr, phone, COUNT(sm.shipmentid) AS CORNER_SHIPMENTS
FROM shipper s inner join shipment sm
ON s.shipperid = sm.shipperid
WHERE shipstate IN ('NY', 'NM', 'FL', 'WA')
GROUP BY sm.shipperid, shippername, emailaddr, phone
ORDER BY shippername;

--Results
/*
 SHIPPERID SHIPPERNAME               EMAILADDR                                          PHONE        CORNER_SHIPMENTS
---------- ------------------------- -------------------------------------------------- ------------ ----------------
         8 Bike Courier              tburke@bikec.com                                   972-534-9433                4
         1 Channel Express           gtrackner@chexpress.com                            303-434-8000               13
         2 Federal Express           emike@fedex.com                                    517-486-4643               23
         7 Mail Hub                  croush@mailhub.com                                 305-267-9966                2
         5 Next Day Air              lanab@nda.com                                      972-747-0747               13
         4 Shipping Experts          ghemmel@shipex.com                                 972-848-8396               15
         3 U.S. Postal Service       suzyc@usps.gov                                     919-486-4745               21
         6 United Parcel Service     juliar@ups.com                                     471-774-2527                7

8 rows selected.
*/
--**********************************
--Question 6

COL TOTALPRICE FORMAT $99,999.99;
SELECT ps.shippeddate, e.employeeid, e.firstname, e.lastname, si.orderid, ps.shippeddate, COUNT(ps.packagenumber), coll.unitprice AS TOTALPRICE
FROM custorderline coll INNER JOIN shippeditem si
ON coll.orderid = si.orderid AND coll.partnumber = si.partnumber
INNER JOIN packingslip ps
ON ps.packagenumber = si.packagenumber AND ps.shipmentid = si.shipmentid
INNER JOIN employee e
ON e.employeeid = ps.employeeid
WHERE ps.shippeddate BETWEEN '01-MAR-20' AND '31-MAR-20' AND coll.status = 'SHIPPED'
GROUP BY ps.shippeddate, e.employeeid, e.firstname, e.lastname, si.orderid, coll.unitprice
HAVING COUNT(ps.packagenumber) > 8
ORDER BY ps.shippeddate;

--Results
/*
SHIPPEDDA EMPLOYEEID FIRSTNAME       LASTNAME             ORDERID    SHIPPEDDA COUNT(PS.PACKAGENUMBER)  TOTALPRICE
--------- ---------- --------------- -------------------- ---------- --------- ----------------------- -----------
01-MAR-20 251088     Kayla           Underwood            3001000681 01-MAR-20                      19   $1,368.89
01-MAR-20 251097     Jack            Trale                3001000681 01-MAR-20                      20     $159.99
02-MAR-20 251088     Kayla           Underwood            3001000685 02-MAR-20                      17   $1,846.79
08-MAR-20 250892     Joseph          Platt                3001000732 08-MAR-20                      11   $1,696.49
08-MAR-20 251088     Kayla           Underwood            3001000712 08-MAR-20                      13   $1,846.79
08-MAR-20 251088     Kayla           Underwood            3001000732 08-MAR-20                      11   $1,696.49
08-MAR-20 251167     Devin           Natlen               3001000732 08-MAR-20                      16     $249.99
09-MAR-20 250892     Joseph          Platt                3001000729 09-MAR-20                      11   $1,716.69
14-MAR-20 251097     Jack            Trale                3001000748 14-MAR-20                      16     $299.00
21-MAR-20 251088     Kayla           Underwood            3001000769 21-MAR-20                       9   $1,846.79
27-MAR-20 250550     Allison         Roland               3001000784 27-MAR-20                      10     $399.00

SHIPPEDDA EMPLOYEEID FIRSTNAME       LASTNAME             ORDERID    SHIPPEDDA COUNT(PS.PACKAGENUMBER)  TOTALPRICE
--------- ---------- --------------- -------------------- ---------- --------- ----------------------- -----------
27-MAR-20 251088     Kayla           Underwood            3001000784 27-MAR-20                      20   $2,202.09
28-MAR-20 251088     Kayla           Underwood            3001000761 28-MAR-20                       9   $1,696.49
28-MAR-20 251088     Kayla           Underwood            3001000786 28-MAR-20                      12     $172.85
28-MAR-20 251097     Jack            Trale                3001000761 28-MAR-20                       9     $249.99
29-MAR-20 251088     Kayla           Underwood            3001000776 29-MAR-20                      12   $1,357.09

16 rows selected.
*/
--**********************************
--Question 7

SELECT c.customerid, c.companyname, co.orderdate, s.companyname, sp.partnumber
FROM customer c INNER JOIN custorder co
ON c.customerid = co.customerid
INNER JOIN custorderline coll
ON co.orderid = coll.orderid
INNER JOIN inventorypart ip
ON ip.partnumber = coll.partnumber
INNER JOIN suppliedpart sp
ON ip.partnumber = sp.partnumber
INNER JOIN supplier s
ON s.supplierid = sp.supplierid
WHERE c.companyname IS NOT NULL AND co.orderdate = '28-FEB-20'
GROUP BY c.customerid, c.companyname, co.orderdate, s.companyname, sp.partnumber
ORDER BY c.companyname;

--Results
/*
CUSTOMERID COMPANYNAME                              ORDERDATE COMPANYNAME                    PARTNUMBER
---------- ---------------------------------------- --------- ------------------------------ ----------
C-310052   Appliances Inc.                          28-FEB-20 Computer Surplus               P-007     
C-310052   Appliances Inc.                          28-FEB-20 Information Security           MEM-004   
C-310052   Appliances Inc.                          28-FEB-20 Net Works                      KEY-006   
C-310066   Bobs Repair Service                      28-FEB-20 Beach Audio                    MON-006   
C-310066   Bobs Repair Service                      28-FEB-20 Monster Parts                  DVD-001   
C-310066   Bobs Repair Service                      28-FEB-20 Server Store                   MIC-012   
C-310012   Photography Niche                        28-FEB-20 Computer Surplus               CF-006    
C-310012   Photography Niche                        28-FEB-20 Electronics Cafe               KEY-009   
C-310012   Photography Niche                        28-FEB-20 Electronics Cafe               P-001     
C-310024   Reflexions Manufacturing                 28-FEB-20 Cables and Kits                PRT-003   
C-310024   Reflexions Manufacturing                 28-FEB-20 Information Security           MEM-001   

CUSTOMERID COMPANYNAME                              ORDERDATE COMPANYNAME                    PARTNUMBER
---------- ---------------------------------------- --------- ------------------------------ ----------
C-310024   Reflexions Manufacturing                 28-FEB-20 Tech Parts Mart                MOD-002   
C-310037   Store It Here                            28-FEB-20 Computer Surplus               P-003     
C-310037   Store It Here                            28-FEB-20 Electronics Cafe               CRD-003   
C-310037   Store It Here                            28-FEB-20 Information Security           MEM-004   
C-310037   Store It Here                            28-FEB-20 Limited Comp                   SFT-008   

16 rows selected.
*/
--**********************************
--Question 8

SELECT po.purchorderid, po.dateordered, pol.unitquantity, sp.unitcost, ip.stocklevel, ip.partdescription
FROM purchaseorder po INNER JOIN purchorderline pol
ON po.purchorderid = pol.purchorderid
INNER JOIN suppliedpart sp
ON sp.supplierid = pol.supplierid AND sp.catalognumber = pol.catalognumber
INNER JOIN inventorypart ip
ON ip.partnumber = sp.partnumber
WHERE (po.employeeid = '250600' AND (pol.unitquantity > 10 OR ip.stocklevel < 10))
GROUP BY po.purchorderid, po.dateordered, pol.unitquantity, sp.unitcost, ip.stocklevel, ip.partdescription;

--Results
/*
PURCHORDER DATEORDER UNITQUANTITY   UNITCOST STOCKLEVEL PARTDESCRIPTION                                   
---------- --------- ------------ ---------- ---------- --------------------------------------------------
EE99-018   05-SEP-20            3      63.82          9 SLIM COOLING FAN LOW NOISE                        
EE99-012   27-JUL-20           12       89.4          9 COLOR INKJET PRINTER                              
EE99-012   27-JUL-20           12      239.4          8 LASER JET 1999SE                                  
EE99-018   05-SEP-20           10     179.94          9 DVDRW SLIM EXTERNAL
*/
--**********************************
--Question 9

SELECT s.supplierid, s.companyname, s.phone, COUNT(sp.partnumber) AS SUPPLIEDPARTS, SUM(sp.unitcost)
FROM supplier s INNER JOIN suppliedpart sp
ON s.supplierid = sp.supplierid
GROUP BY s.supplierid, s.companyname, s.phone
HAVING COUNT(sp.partnumber) > 10;

--Results
/*
SUPPLIERID COMPANYNAME                    PHONE        SUPPLIEDPARTS SUM(SP.UNITCOST)
---------- ------------------------------ ------------ ------------- ----------------
GC-450     Tech WorldWide                 207-634-1969            13          8604.98
TA-144     Computer Medic                 520-486-6025            12          6204.87
MC-455     Discount Print                 505-660-9632            12         15583.97
CA-105     CompCom                        919-736-9458            11          3303.78
PP-103     Toner Recyclers                303-967-1415            13         14151.87
*/
--**********************************
--Question 10

SELECT co.orderid, co.orderdate, c.companyname, c.state, SUBSTR(c.cellphone, 1, 3)
FROM customer c INNER JOIN custorder co
ON c.customerid = co.customerid
WHERE co.orderdate BETWEEN '01-JAN-20' AND '31-DEC-20' AND c.companyname IS NOT NULL AND SUBSTR(c.cellphone, 1, 3) = '727'
GROUP BY co.orderid, co.orderdate, c.companyname, c.state, SUBSTR(c.cellphone, 1, 3)
ORDER BY co.orderdate;

--Results
/*
ORDERID    ORDERDATE COMPANYNAME                              ST SUB
---------- --------- ---------------------------------------- -- ---
3001000522 14-JAN-20 Cellular Services                        FL 727
3001000620 14-FEB-20 Supplying Crafts                         FL 727
3001000624 14-FEB-20 Cellular Services                        FL 727
3001000684 25-FEB-20 Supplying Crafts                         FL 727
3001000739 09-MAR-20 Supplying Crafts                         FL 727
3001000800 30-MAR-20 Supplying Crafts                         FL 727

6 rows selected.
*/

/****************************************************
Question 11. 
In nested queries, the query on the inside is ran first, and the 
outside query only compares to the data result set from the inner query.

****************************************************
Question 12. 

SELECT {attribute}
FROM {table 1} INNER JOIN {table 2}
ON {table1.PK} = {table2.PK}

EX. NON-composite primary key
SELECT v.patient, v.datetime, dentistid, result
FROM visit v INNER JOIN visitprocedure vp
ON v.patientid = vp.patientid;

In the select statement, if you have an attribute from two 
different tables (ambiguous attribute), you have to identify which table you 
are pulling from with the table name. EX. v.patientid. In the FROM statement you
are can add a table name and join the two tables with the same attribute using  
"inner join". EX. FROM visit v INNER JOIN visitprocedure vp. In the ON statement,
you set the PK of the parent to the PF or F of the child. EX. ON v.patientid = 
vp.patientid. If there is a composite key you have to set all of the attributes 
in the parent key equal to the same attribute in the child key, if they are PF 
or F. 
 
EX. Composite primary key
SELECT v.patient, v.datetime, dentistid, result
FROM visit v INNER JOIN visitprocedure vp
ON v.patientid = vp.patientid AND v.datetime = vp.datetime;

If you miss a composite primary key, SQL will not give you an error, but the 
number of rows will be way off in the result set.

**************************************************************
Question 13.
When you want to add a third table to the two table inner join, 
it first has to be connected to one of the two tables already joined. If there
is a relationship between table 3 and table 1 or 2, then you can add another 
INNER JOIN {table 3} under the ON statement EX. ON {table 1, 2, 3 PK, FK, F} = 
{table 1, 2, 3 PK, FK, F} Depending on which table is the parent and which is 
the child.

SELECT {attribute}
FROM {table 1} INNER JOIN {table 2}
ON {table1.PK} = {table2.PK}
INNER JOIN {table 3}
ON {table2.PK} = {table3.PK}

***************************************************************
Question 14.
Column alias is in the select clause. Table alias is in the from 
clause. When you give a table an alias you can you it thoughout the rest of the 
statement. Column names are usually not unique.

***************************************************************
Question 15. 
If you do not join all of the composite key attributes, you will 
not get an error. You will just get a lot more rows than you want. 
*/