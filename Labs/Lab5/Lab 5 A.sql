/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

**************************************
Question 1 
*/

SELECT supplier_id, product_code, price, description
FROM food
WHERE supplier_id IN (SELECT supplier_id 
                    FROM food_supplier
                    WHERE supplier_name LIKE '%Bakery%');


--Results
/*
SUP PR      PRICE DESCRIPTION         
--- -- ---------- --------------------
Lak Sw        5.5 Caprese             
Lak Sd       6.25 Spinach Salad       
Lak Br       2.35 Cheese Stick
*/
--**********************************
--Question 2

SET linesize 200
SELECT supplier_id, supplier_name, supplier_city
FROM food_supplier
WHERE supplier_id NOT IN (SELECT supplier_id 
                          FROM food)
ORDER BY supplier_city;

--Results
/*
SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Met Under the Metra                Chicago                       
Gio Giovana and Sons               Chicago                       
Rby Rosemont Bakery                Glencoe                       
Har Harold Bakery                  Hinsdale                      
Fas Framer and Samson              Orland Park
*/
--**********************************
--Question 3

SET linesize 200
SELECT f.supplier_id, supplier_name, description, price
FROM food_supplier fs inner join food f
ON fs.supplier_id = f.supplier_id
WHERE supplier_city LIKE 'Chicago' AND price < 6
ORDER BY price;

--Results
/*
SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Dpz Downtowner Pizza               Cheese Sauce                .75
Dpz Downtowner Pizza               Dinner Roll                   1
Jmd Jebston Montrose Deli          Cole Slaw                   1.5
Foi Fontinas Italian               French Fries                1.5
Lak Lakeshore Bakery               Cheese Stick               2.35
Jmd Jebston Montrose Deli          Iced Tea                   2.85
Foi Fontinas Italian               Broccoli Salad                4
Hsd Harper Street Deli             Chicken Soup               4.25
Foi Fontinas Italian               Apple Pie                   4.5
Hsd Harper Street Deli             Yellow Cake                 4.5
Foi Fontinas Italian               Barley Soup                4.75

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Lak Lakeshore Bakery               Caprese                     5.5
Hsd Harper Street Deli             Chef Salad                 5.75

13 rows selected.
*/
--**********************************
--Question 4a

SELECT last_name, first_name, hire_date, dept_code, credit_limit, lunch_id, lunch_date
FROM worker w inner join lunch l
ON w.worker_id = l.worker_id
WHERE lunch_date BETWEEN '01-MAY-21' AND '31-MAY-21'
ORDER BY lunch_date, lunch_id;

--Results
/*
LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT
-------------------- ---------- --------- --- ------------ ---------- ---------
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21
Young                Taylor     12-NOV-07               25          3 22-MAY-21
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21
Williams             Jodie      16-MAR-19               25          7 27-MAY-21
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT
-------------------- ---------- --------- --- ------------ ---------- ---------
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21
Young                Taylor     12-NOV-07               25         13 27-MAY-21

13 rows selected.
*/
--**********************************
--Question 4b

SELECT last_name, first_name, hire_date, dept_code, credit_limit, l.lunch_id, lunch_date, item_number
FROM worker w inner join lunch l
ON w.worker_id = l.worker_id
INNER JOIN lunch_item li
ON l.lunch_id = li.lunch_id
WHERE lunch_date BETWEEN '01-MAY-21' AND '31-MAY-21'
ORDER BY lunch_date, l.lunch_id, item_number;

--Results
/*
LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           1
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           2
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           3
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           1
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           2
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           3
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           4
Young                Taylor     12-NOV-07               25          3 22-MAY-21           1
Young                Taylor     12-NOV-07               25          3 22-MAY-21           2
Young                Taylor     12-NOV-07               25          3 22-MAY-21           3
Young                Taylor     12-NOV-07               25          3 22-MAY-21           4

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
Young                Taylor     12-NOV-07               25          3 22-MAY-21           5
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           1
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           2
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           3
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           4
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           1
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           2
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           3
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           4
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           5
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           1

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           2
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           3
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           4
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           5
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           1
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           2
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           3
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           1
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           2
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           3
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           4

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           5
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           6
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           1
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           2
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           3
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           4
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           1
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           2
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           3
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           4
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           1

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           2
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           3
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           4
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           1
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           2
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           3
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           4
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           5
Young                Taylor     12-NOV-07               25         13 27-MAY-21           1
Young                Taylor     12-NOV-07               25         13 27-MAY-21           2
Young                Taylor     12-NOV-07               25         13 27-MAY-21           3

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
Young                Taylor     12-NOV-07               25         13 27-MAY-21           4
Young                Taylor     12-NOV-07               25         13 27-MAY-21           5

57 rows selected.
*/
--**********************************
--Question 4c

SELECT last_name, first_name, hire_date, dept_code, credit_limit, l.lunch_id, lunch_date, item_number, price
FROM worker w inner join lunch l
ON w.worker_id = l.worker_id
INNER JOIN lunch_item li
ON l.lunch_id = li.lunch_id
INNER JOIN food f
ON f.supplier_id = li.supplier_id AND f.product_code = li.product_code
WHERE lunch_date BETWEEN '01-MAY-21' AND '31-MAY-21'
ORDER BY lunch_date, l.lunch_id, item_number;

--Results
/*
LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           1       5.75
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           2       4.25
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           3       2.25
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           1          8
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           2        1.5
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           3       2.25
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           4        4.5
Young                Taylor     12-NOV-07               25          3 22-MAY-21           1       5.75
Young                Taylor     12-NOV-07               25          3 22-MAY-21           2        8.6
Young                Taylor     12-NOV-07               25          3 22-MAY-21           3        1.5
Young                Taylor     12-NOV-07               25          3 22-MAY-21           4       2.85

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
Young                Taylor     12-NOV-07               25          3 22-MAY-21           5        4.5
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           1       4.75
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           2        7.2
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           3          4
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           4       3.45
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           1       4.25
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           2        7.2
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           3       4.75
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           4       1.55
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           5        4.5
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           1       5.75

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           2       4.25
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           3        8.6
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           4       2.25
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           5       2.25
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           1       5.75
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           2        8.6
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           3       3.45
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           1       5.75
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           2       4.25
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           3        7.2
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           4        1.5

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           5       2.25
Shreve               Dana       18-MAR-04 Exe           45          8 27-MAY-21           6       3.45
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           1       5.75
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           2        8.6
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           3       1.55
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           4        3.5
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           1       4.25
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           2       5.25
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           3        1.5
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           4       3.45
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           1       4.25

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           2       5.95
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           3        1.5
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           4        3.5
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           1       5.75
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           2       5.25
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           3        7.2
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           4       2.25
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           5        4.5
Young                Taylor     12-NOV-07               25         13 27-MAY-21           1       4.25
Young                Taylor     12-NOV-07               25         13 27-MAY-21           2        8.6
Young                Taylor     12-NOV-07               25         13 27-MAY-21           3        1.5

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
Young                Taylor     12-NOV-07               25         13 27-MAY-21           4       2.25
Young                Taylor     12-NOV-07               25         13 27-MAY-21           5        4.5

57 rows selected.
*/
--**********************************
--Question 5

COL TOTAL format $999.99;
SELECT l.lunch_id, lunch_date, sum(price)AS TOTAL
FROM lunch l inner join lunch_item li
ON l.lunch_id = li.lunch_id
INNER JOIN food f
ON f.supplier_id = li.supplier_id AND f.product_code = li.product_code
WHERE lunch_date BETWEEN '01-JUN-21' AND '15-JUN-21'
GROUP BY l.lunch_id, lunch_date
ORDER BY lunch_date, l.lunch_id;

--Results
/*
LUNCH_ID LUNCH_DAT    TOTAL
---------- --------- --------
        14 01-JUN-21   $23.55
        15 01-JUN-21   $16.25
        16 01-JUN-21   $20.30
        17 01-JUN-21    $9.55
        18 01-JUN-21    $8.60
        19 01-JUN-21   $12.25
        20 03-JUN-21   $10.30
        25 07-JUN-21   $16.20
        28 10-JUN-21    $8.50
        30 10-JUN-21   $13.45
        32 10-JUN-21    $9.50

  LUNCH_ID LUNCH_DAT    TOTAL
---------- --------- --------
        34 15-JUN-21   $10.80
        35 15-JUN-21    $5.75
        36 15-JUN-21   $10.95
        37 15-JUN-21   $14.05
        38 15-JUN-21    $6.50
        39 15-JUN-21   $12.35
        40 15-JUN-21    $8.60
        41 15-JUN-21   $11.75

19 rows selected.
*/
--**********************************
--Question 6a

SELECT COUNT(*) AS LUNCH_COUNT, TO_CHAR(lunch_date, 'fmMONTH-YYYY') AS MONTH
FROM worker w inner join lunch l
ON w.worker_id = l.worker_id
WHERE dept_code NOT IN 'Tch'
GROUP BY TO_CHAR(lunch_date, 'fmMONTH-YYYY')
ORDER BY MONTH;

--Results
/*
LUNCH_COUNT MONTH         
----------- --------------
          8 MAY-2021      
         28 JUNE-2021
*/
--**********************************
--Question 6b

SELECT COUNT(*) AS LUNCH_COUNT, TO_CHAR(lunch_date, 'fmMONTH-YYYY') AS MONTH
FROM worker w inner join lunch l
ON w.worker_id = l.worker_id
WHERE dept_code NOT IN 'Tch'
GROUP BY TO_CHAR(lunch_date, 'fmMONTH-YYYY')
HAVING COUNT(*) <= 10
ORDER BY TO_CHAR(lunch_date, 'fmMONTH-YYYY');


--Results
/*
LUNCH_COUNT MONTH         
----------- --------------
          8 MAY-2021
*/