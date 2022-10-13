/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

**************************************
Question 1a.
*/

DESCRIBE user_tables;

--Results
/*
Name                      Null?    Type           
------------------------- -------- -------------- 
TABLE_NAME                NOT NULL VARCHAR2(128)  
TABLESPACE_NAME                    VARCHAR2(30)   
CLUSTER_NAME                       VARCHAR2(128)  
IOT_NAME                           VARCHAR2(128)  
STATUS                             VARCHAR2(8)    
PCT_FREE                           NUMBER         
PCT_USED                           NUMBER         
INI_TRANS                          NUMBER         
MAX_TRANS                          NUMBER         
INITIAL_EXTENT                     NUMBER         
NEXT_EXTENT                        NUMBER         
MIN_EXTENTS                        NUMBER         
MAX_EXTENTS                        NUMBER         
PCT_INCREASE                       NUMBER         
FREELISTS                          NUMBER         
FREELIST_GROUPS                    NUMBER         
LOGGING                            VARCHAR2(3)    
BACKED_UP                          VARCHAR2(1)    
NUM_ROWS                           NUMBER         
BLOCKS                             NUMBER         
EMPTY_BLOCKS                       NUMBER         
AVG_SPACE                          NUMBER         
CHAIN_CNT                          NUMBER         
AVG_ROW_LEN                        NUMBER         
AVG_SPACE_FREELIST_BLOCKS          NUMBER         
NUM_FREELIST_BLOCKS                NUMBER         
DEGREE                             VARCHAR2(10)   
INSTANCES                          VARCHAR2(10)   
CACHE                              VARCHAR2(5)    
TABLE_LOCK                         VARCHAR2(8)    
SAMPLE_SIZE                        NUMBER         
LAST_ANALYZED                      DATE           
PARTITIONED                        VARCHAR2(3)    
IOT_TYPE                           VARCHAR2(12)   
TEMPORARY                          VARCHAR2(1)    
SECONDARY                          VARCHAR2(1)    
NESTED                             VARCHAR2(3)    
BUFFER_POOL                        VARCHAR2(7)    
FLASH_CACHE                        VARCHAR2(7)    
CELL_FLASH_CACHE                   VARCHAR2(7)    
ROW_MOVEMENT                       VARCHAR2(8)    
GLOBAL_STATS                       VARCHAR2(3)    
USER_STATS                         VARCHAR2(3)    
DURATION                           VARCHAR2(15)   
SKIP_CORRUPT                       VARCHAR2(8)    
MONITORING                         VARCHAR2(3)    
CLUSTER_OWNER                      VARCHAR2(128)  
DEPENDENCIES                       VARCHAR2(8)    
COMPRESSION                        VARCHAR2(8)    
COMPRESS_FOR                       VARCHAR2(30)   
DROPPED                            VARCHAR2(3)    
READ_ONLY                          VARCHAR2(3)    
SEGMENT_CREATED                    VARCHAR2(3)    
RESULT_CACHE                       VARCHAR2(7)    
CLUSTERING                         VARCHAR2(3)    
ACTIVITY_TRACKING                  VARCHAR2(23)   
DML_TIMESTAMP                      VARCHAR2(25)   
HAS_IDENTITY                       VARCHAR2(3)    
CONTAINER_DATA                     VARCHAR2(3)    
INMEMORY                           VARCHAR2(8)    
INMEMORY_PRIORITY                  VARCHAR2(8)    
INMEMORY_DISTRIBUTE                VARCHAR2(15)   
INMEMORY_COMPRESSION               VARCHAR2(17)   
INMEMORY_DUPLICATE                 VARCHAR2(13)   
DEFAULT_COLLATION                  VARCHAR2(100)  
DUPLICATED                         VARCHAR2(1)    
SHARDED                            VARCHAR2(1)    
EXTERNAL                           VARCHAR2(3)    
HYBRID                             VARCHAR2(3)    
CELLMEMORY                         VARCHAR2(24)   
CONTAINERS_DEFAULT                 VARCHAR2(3)    
CONTAINER_MAP                      VARCHAR2(3)    
EXTENDED_DATA_LINK                 VARCHAR2(3)    
EXTENDED_DATA_LINK_MAP             VARCHAR2(3)    
INMEMORY_SERVICE                   VARCHAR2(12)   
INMEMORY_SERVICE_NAME              VARCHAR2(1000) 
CONTAINER_MAP_OBJECT               VARCHAR2(3)    
MEMOPTIMIZE_READ                   VARCHAR2(8)    
MEMOPTIMIZE_WRITE                  VARCHAR2(8)    
HAS_SENSITIVE_COLUMN               VARCHAR2(3)    
ADMIT_NULL                         VARCHAR2(3)    
DATA_LINK_DML_ENABLED              VARCHAR2(3)    
LOGICAL_REPLICATION                VARCHAR2(8)
*/

--**************************************
--Question 1b.

SELECT table_name
FROM user_tables

--Resutls
/*
TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
BILLOFMATERIALS
CATEGORY
CUSTOMER
CUSTORDER
CUSTORDERLINE
DEPARTMENT
EMPLOYEE
FOOD
FOOD_SUPPLIER
INVENTORYPART
LUNCH

TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
LUNCH_ITEM
MACHINE
MACHINEPROCESS
OPERATION
PACKINGSLIP
PROCESS
PROCESSROUTING
PURCHASEORDER
PURCHORDERLINE
SHIPMENT
SHIPPEDITEM

TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
SHIPPER
SUPPLIEDPART
SUPPLIER
TIMECARDLINE
WORKER

27 rows selected.
*/

--****************************
--Question 2a.

SET linespace 200
SELECT ROUND (265.73788, 2), ROUND (265.73788, 0), ROUND (265.73788, -1)
FROM DUAL;

--Results
/*
ROUND(265.73788,2) ROUND(265.73788,0) ROUND(265.73788,-1)
------------------ ------------------ -------------------
            265.74                266                 270
*/

--**************************************
--Question 2b.

SET linespace 200
SELECT TRUNC(265.73788,2), TRUNC(265.73788,0), TRUNC(265.73788,-1)
FROM DUAL;

--Results
/*
TRUNC(265.73788,2) TRUNC(265.73788,0) TRUNC(265.73788,-1)
------------------ ------------------ -------------------
            265.73                265                 260
*/

--*********************************
--Question 3.

SET linespace 200;
COL desc_length FORMAT a11;
SELECT description, LENGTH(description), UPPER (product_code)
FROM food
WHERE product_code IN('Pz', 'Sp', 'Ds')
ORDER BY description;

--Results
/*
DESCRIPTION          LENGTH(DESCRIPTION) UP
-------------------- ------------------- --
Apple Pie                              9 DS
Barley Soup                           11 SP
Brownie                                7 DS
Cheese Pizza                          12 PZ
Chicken Soup                          12 SP
Mushroom Pizza                        14 PZ
PB Cookie                              9 DS
Potato Soup                           11 SP
Sugar Cookie                          12 DS
Veggie Pizza                          12 PZ
Veggie Soup                           11 SP

DESCRIPTION          LENGTH(DESCRIPTION) UP
-------------------- ------------------- --
Yellow Cake                           11 DS

12 rows selected.
*/

--************************
--Question 4.

SELECT first_name, last_name, dept_code, NVL(dept_code, 'Xxx')
FROM worker
WHERE credit_limit > 25
ORDER BY dept_code;

--Results
/*
FIRST_NAME LAST_NAME            DEP NVL
---------- -------------------- --- ---
Trey       Vought               Acc Acc
Dana       Shreve               Exe Exe
Blair      Reynolds             Fin Fin
Melody     Campbell             Hmn Hmn
Kerry      Alveral              Leg Leg
Rita       Gradle               Leg Leg
James      Kingman              Sal Sal
Tom        Neal                 Srv Srv
Brooks     Walsh                Srv Srv
Sam        Frank                Srv Srv
Tyler      Harney               Tch Tch

FIRST_NAME LAST_NAME            DEP NVL
---------- -------------------- --- ---
Carole     Sumner               Tch Tch
Cassie     Irwin                    Xxx
Gail       Walsh                    Xxx

14 rows selected.
*/
--**************************
--Question 4b.

SELECT first_name, last_name, dept_code
FROM worker
WHERE credit_limit > 25
ORDER BY dept_code;

--Results
/*
FIRST_NAME LAST_NAME            DEP
---------- -------------------- ---
Trey       Vought               Acc
Dana       Shreve               Exe
Blair      Reynolds             Fin
Melody     Campbell             Hmn
Kerry      Alveral              Leg
Rita       Gradle               Leg
James      Kingman              Sal
Tom        Neal                 Srv
Brooks     Walsh                Srv
Sam        Frank                Srv
Tyler      Harney               Tch

FIRST_NAME LAST_NAME            DEP
---------- -------------------- ---
Carole     Sumner               Tch
Cassie     Irwin                   
Gail       Walsh                   

14 rows selected.
*/
--***************************
--Question 5.

COL lunch_date FORMAT a25;
SELECT TO_CHAR(MIN(lunch_date), 'Month DD, YYYY, Day') AS min_date, TO_CHAR(MAX(lunch_date), 'Month DD, YYYY, Day')as max_date
FROM lunch;

--Results
/*
MIN_DATE                      MAX_DATE                     
----------------------------- -----------------------------
May       22, 2021, Saturday  June      23, 2021, Wednesday
*/

--********************
--Question 6a.

SELECT supplier_id, COUNT(*), to_char(sum(price), '$999.99'), to_char(avg(price), '$999.99')
FROM food
GROUP BY supplier_id;

--Results
/*
SUP   COUNT(*) TO_CHAR( TO_CHAR(
--- ---------- -------- --------
Ard          3   $12.75    $4.25
Blu          2   $10.30    $5.15
Crm          4   $25.05    $6.26
Dpz          3   $10.25    $3.42
Foi          4   $14.75    $3.69
Gls          3    $9.70    $3.23
Hsd          4   $23.50    $5.88
Jd6          3    $7.25    $2.42
Jmd          4   $18.60    $4.65
Lak          3   $14.10    $4.70
Lss          2   $10.80    $5.40

11 rows selected.
*/

--**********************
--Question 6b.

SELECT supplier_id, COUNT(supplier_id), to_char(sum(price), '$999.99'), to_char(avg(price), '$999.99')
FROM food
GROUP BY supplier_id;

--Results
/*
SUP COUNT(SUPPLIER_ID) TO_CHAR( TO_CHAR(
--- ------------------ -------- --------
Ard                  3   $12.75    $4.25
Blu                  2   $10.30    $5.15
Crm                  4   $25.05    $6.26
Dpz                  3   $10.25    $3.42
Foi                  4   $14.75    $3.69
Gls                  3    $9.70    $3.23
Hsd                  4   $23.50    $5.88
Jd6                  3    $7.25    $2.42
Jmd                  4   $18.60    $4.65
Lak                  3   $14.10    $4.70
Lss                  2   $10.80    $5.40

11 rows selected.
*/

--*******************************
--Question 6c.

SELECT supplier_id, COUNT(price_upcharge), to_char(sum(price), '$999.99'), to_char(avg(price), '$999.99')
FROM food
GROUP BY supplier_id;

--Results
/*
SUP COUNT(PRICE_UPCHARGE) TO_CHAR( TO_CHAR(
--- --------------------- -------- --------
Ard                     0   $12.75    $4.25
Blu                     1   $10.30    $5.15
Crm                     4   $25.05    $6.26
Dpz                     1   $10.25    $3.42
Foi                     2   $14.75    $3.69
Gls                     1    $9.70    $3.23
Hsd                     3   $23.50    $5.88
Jd6                     3    $7.25    $2.42
Jmd                     3   $18.60    $4.65
Lak                     1   $14.10    $4.70
Lss                     0   $10.80    $5.40

11 rows selected.
*/

--Question 7.

SELECT supplier_id, COUNT(*), to_char(sum(price), '$999.99'), to_char(avg(price), '$999.99')
FROM food
GROUP BY supplier_id, price_upcharge
ORDER BY supplier_id, price_upcharge;

--Results
/*
SUP   COUNT(*) TO_CHAR( TO_CHAR(
--- ---------- -------- --------
Ard          3   $12.75    $4.25
Blu          1    $7.50    $7.50
Blu          1    $2.80    $2.80
Crm          1    $4.00    $4.00
Crm          1    $7.20    $7.20
Crm          1    $5.25    $5.25
Crm          1    $8.60    $8.60
Dpz          1    $1.00    $1.00
Dpz          2    $9.25    $4.63
Foi          1    $4.00    $4.00
Foi          1    $4.75    $4.75

SUP   COUNT(*) TO_CHAR( TO_CHAR(
--- ---------- -------- --------
Foi          2    $6.00    $3.00
Gls          1    $3.50    $3.50
Gls          2    $6.20    $3.10
Hsd          1    $5.75    $5.75
Hsd          2   $13.50    $6.75
Hsd          1    $4.25    $4.25
Jd6          1    $1.55    $1.55
Jd6          2    $5.70    $2.85
Jmd          2   $10.85    $5.43
Jmd          1    $1.50    $1.50
Jmd          1    $6.25    $6.25

SUP   COUNT(*) TO_CHAR( TO_CHAR(
--- ---------- -------- --------
Lak          1    $5.50    $5.50
Lak          2    $8.60    $4.30
Lss          2   $10.80    $5.40

25 rows selected.
*/

--*******************************
--Question 8a.

SELECT dept_code, COUNT(dept_code), to_char(sum(credit_limit), '$999.99')
FROM worker
GROUP BY dept_code
ORDER BY dept_code;

--Results
/*
DEP COUNT(DEPT_CODE) TO_CHAR(
--- ---------------- --------
Acc                3   $72.00
Aud                3   $69.00
Com                1   $22.00
Exe                1   $45.00
Fin                2   $48.00
Hmn                3   $66.00
Leg                3   $87.00
Sal                2   $53.00
Srv                3   $89.00
Tch                5  $137.00
                   0  $202.00

11 rows selected.
*/

--**************************
--Question 8b.

SELECT dept_code, COUNT(dept_code), to_char(sum(credit_limit), '$999.99')
FROM worker
GROUP BY dept_code, city
ORDER BY dept_code, city;

--Results
/*
DEP COUNT(DEPT_CODE) TO_CHAR(
--- ---------------- --------
Acc                1   $24.00
Acc                1   $30.00
Acc                1   $18.00
Aud                1   $25.00
Aud                1   $22.00
Aud                1   $22.00
Com                1   $22.00
Exe                1   $45.00
Fin                1   $28.00
Fin                1   $20.00
Hmn                1   $17.00

DEP COUNT(DEPT_CODE) TO_CHAR(
--- ---------------- --------
Hmn                2   $49.00
Leg                2   $55.00
Leg                1   $32.00
Sal                1   $33.00
Sal                1   $20.00
Srv                1   $30.00
Srv                1   $26.00
Srv                1   $33.00
Tch                1   $27.00
Tch                1   $25.00
Tch                2   $60.00

DEP COUNT(DEPT_CODE) TO_CHAR(
--- ---------------- --------
Tch                1   $25.00
                   0   $25.00
                   0   $27.00
                   0   $25.00
                   0   $20.00
                   0   $50.00
                   0   $55.00

29 rows selected.
*/

--**************************
--Question 8c.

SELECT dept_code, COUNT(dept_code), to_char(sum(credit_limit), '$999.99'), COUNT(*)
FROM worker
GROUP BY dept_code, city
ORDER BY dept_code, city;

--Results
/*
DEP COUNT(DEPT_CODE) TO_CHAR(   COUNT(*)
--- ---------------- -------- ----------
Acc                1   $24.00          1
Acc                1   $30.00          1
Acc                1   $18.00          1
Aud                1   $25.00          1
Aud                1   $22.00          1
Aud                1   $22.00          1
Com                1   $22.00          1
Exe                1   $45.00          1
Fin                1   $28.00          1
Fin                1   $20.00          1
Hmn                1   $17.00          1

DEP COUNT(DEPT_CODE) TO_CHAR(   COUNT(*)
--- ---------------- -------- ----------
Hmn                2   $49.00          2
Leg                2   $55.00          2
Leg                1   $32.00          1
Sal                1   $33.00          1
Sal                1   $20.00          1
Srv                1   $30.00          1
Srv                1   $26.00          1
Srv                1   $33.00          1
Tch                1   $27.00          1
Tch                1   $25.00          1
Tch                2   $60.00          2

DEP COUNT(DEPT_CODE) TO_CHAR(   COUNT(*)
--- ---------------- -------- ----------
Tch                1   $25.00          1
                   0   $25.00          1
                   0   $27.00          1
                   0   $25.00          1
                   0   $20.00          1
                   0   $50.00          2
                   0   $55.00          2

29 rows selected.
*/

--**************************
--Question 8d.

SELECT dept_code, COUNT(dept_code), to_char(sum(credit_limit), '$999.99'), COUNT(*)
FROM worker
WHERE hire_date > '31-DEC-2013'
GROUP BY dept_code, city
ORDER BY dept_code, city;

--Results
/*
DEP COUNT(DEPT_CODE) TO_CHAR(   COUNT(*)
--- ---------------- -------- ----------
Aud                1   $25.00          1
Hmn                2   $49.00          2
Leg                2   $55.00          2
Leg                1   $32.00          1
Sal                1   $20.00          1
Srv                1   $30.00          1
Tch                1   $27.00          1
Tch                2   $60.00          2
                   0   $27.00          1
                   0   $25.00          1
                   0   $23.00          1

11 rows selected.
*/

--************************
--Question 8e.

SELECT dept_code, COUNT(dept_code), to_char(sum(credit_limit), '$999.99'), COUNT(*)
FROM worker
WHERE hire_date > '31-DEC-2013'
GROUP BY dept_code, city
HAVING SUM(credit_limit) > 30
ORDER BY dept_code, city;

--Results
/*
DEP COUNT(DEPT_CODE) TO_CHAR(   COUNT(*)
--- ---------------- -------- ----------
Hmn                2   $49.00          2
Leg                2   $55.00          2
Leg                1   $32.00          1
Tch                2   $60.00          2
*/

--**********************
--Question 9a.

SELECT supplier_id, product_code, description, price
FROM food
WHERE price < (SELECT AVG(price) FROM food);

--Results
/*
SUP PR DESCRIPTION               PRICE
--- -- -------------------- ----------
Ard Ds PB Cookie                  1.25
Hsd Sp Chicken Soup               4.25
Crm Br Wheat Bagel                   4
Foi Vt Broccoli Salad                4
Foi Ff French Fries                1.5
Jd6 Vr Soda                       2.25
Jd6 Cf Coffee                     1.55
Jd6 Ds Brownie                    3.45
Jmd Vr Iced Tea                   2.85
Jmd Vt Cole Slaw                   1.5
Dpz Br Dinner Roll                   1

SUP PR DESCRIPTION               PRICE
--- -- -------------------- ----------
Dpz Sc Cheese Sauce                .75
Gls Ds Sugar Cookie                3.5
Gls Br Breadstick                 1.25
Blu Cp Chips                       2.8
Lak Br Cheese Stick               2.35

16 rows selected.
*/

--**************************
--Question 9b.

SELECT ROUND(AVG(price), 2) FROM food;

--Results

/*
ROUND(AVG(PRICE),2)
-------------------
               4.49
*/

