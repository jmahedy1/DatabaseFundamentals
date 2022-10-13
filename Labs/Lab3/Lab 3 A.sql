/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

***************
Question 1
*/

select*
from FOOD_SUPPLIER;

-- Results

/*
SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Ard Arnoldo Deli                   Glencoe                       
Hsd Harper Street Deli             Chicago                       
Crm Crystal Market                 Hinsdale                      
Foi Fontinas Italian               Chicago                       
Fas Framer and Samson              Orland Park                   
Jd6 Justin's Deli at 652           Oak Brook                     
Jmd Jebston Montrose Deli          Chicago                       
Rby Rosemont Bakery                Glencoe                       
Lss Lucias Sub Shop                Aurora                        
Har Harold Bakery                  Hinsdale                      
Dpz Downtowner Pizza               Chicago                       

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Gls Great Lakes Station            Wilmette                      
Gio Giovana and Sons               Chicago                       
Blu Blue Sky Deli                  Oak Brook                     
Lak Lakeshore Bakery               Chicago                       
Met Under the Metra                Chicago                       

16 rows selected.
*/

--*****************************
--Question 2

select FIRST_NAME, LAST_NAME, DEPT_CODE, HIRE_DATE
from WORKER;

desc WORKER;

--Results

/*
FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Dana       Shreve               Exe 18-MAR-04
Carole     Sumner               Tch 17-JUL-16
Rita       Gradle               Leg 23-MAR-14
Melody     Campbell             Hmn 24-MAY-18
Tom        Neal                 Srv 01-APR-13
Jared      Ridgeman             Aud 01-OCT-12
Maria      Bensen                   15-SEP-07
Jose       Sanchez              Com 01-JUL-12
Trey       Vought               Acc 01-NOV-13
James      Kingman              Sal 17-DEC-06
Latesha    Cross                Tch 15-FEB-04

FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Tami       Tevona               Hmn 21-AUG-19
Darius     Richards             Leg 12-JAN-14
Taylor     Young                    12-NOV-07
Blair      Reynolds             Fin 07-FEB-13
Avery      Trance               Aud 19-JUN-18
Skyler     Harris               Hmn 28-MAR-05
Chase      Johnson                  11-DEC-12
Cleo       White                Aud 22-MAY-11
Cassie     Irwin                    13-SEP-03
Shawn      Smith                Fin 19-APR-12
Keyanna    Jones                Tch 15-MAR-19

FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Carey      Martin               Sal 19-NOV-19
Katelynn   Rayner               Tch 07-OCT-11
Yvonne     Rivera                   13-NOV-15
Roy        Gonzalez             Acc 19-DEC-11
Brooks     Walsh                Srv 21-APR-07
Angie      Templeton            Acc 19-JUN-07
Tonya      Montre                   07-MAR-12
Tyler      Harney               Tch 07-MAR-18
Sam        Frank                Srv 22-JUL-16
Jodie      Williams                 16-MAR-19
Kerry      Alveral              Leg 22-MAY-18

FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Gail       Walsh                    22-MAR-21

34 rows selected. 

Name         Null?    Type         
------------ -------- ------------ 
WORKER_ID    NOT NULL CHAR(3)      
FIRST_NAME            VARCHAR2(10) 
LAST_NAME             VARCHAR2(20) 
CITY                  VARCHAR2(30) 
DEPT_CODE             VARCHAR2(3)  
HIRE_DATE             DATE         
CREDIT_LIMIT          NUMBER(4,2)  
PHONE_NUMBER          CHAR(4)      
MANAGER_ID            CHAR(3)
*/

--*******************
--Question 3A

select WORKER_ID, LAST_NAME, DEPT_CODE, CITY
from WORKER
where DEPT_CODE = 'Fin' or CITY = 'Chicago';

--Results

/*
WOR LAST_NAME            DEP CITY                          
--- -------------------- --- ------------------------------
560 Ridgeman             Aud Chicago                       
564 Kingman              Sal Chicago                       
569 Reynolds             Fin Evanston                      
571 Harris               Hmn Chicago                       
575 Smith                Fin Glencoe                       
584 Harney               Tch Chicago                       
588 Walsh                    Chicago                       

7 rows selected.
*/

--*********************
--Question 3B

select WORKER_ID, LAST_NAME, DEPT_CODE, CITY
from WORKER
where CITY = 'Chicago' and (DEPT_CODE = 'Sal' or DEPT_CODE = 'Aud');

--Results

/*
WOR LAST_NAME            DEP CITY                          
--- -------------------- --- ------------------------------
560 Ridgeman             Aud Chicago                       
564 Kingman              Sal Chicago
*/

--*********************
--Question 4A

select DEPT_CODE
from WORKER;

select DEPT_CODE
from DEPARTMENT;

/*
DEPT_CODE in the Department table is the primary key so all of the codes will
be unique. The DEPT_CODE in the worker table is the foreign key and there can
be multiple workers with the same department code.
*/

--Results

/*
DEP
---
Exe
Tch
Leg
Hmn
Srv
Aud

Com
Acc
Sal
Tch

DEP
---
Hmn
Leg

Fin
Aud
Hmn

Aud

Fin
Tch

DEP
---
Sal
Tch

Acc
Srv
Acc

Tch
Srv

Leg

DEP
---


34 rows selected. 


DEP
---
Acc
Aud
Com
Exe
Fac
Fin
Hmn
Leg
Mkt
Pur
Sal

DEP
---
Shp
Srv
Tch

14 rows selected.
*/

--******************
--Question 4B

SELECT DISTINCT DEPT_CODE
FROM WORKER;

/*
The numbers are not the same, the table from this question gets 11 rows and the
table from 4A gets 14 rows. The numbers are different it lists becasue they are
from different tables.
*/

--Results

/*
DEP
---
Aud
Sal
Leg
Hmn
Acc
Tch

Fin
Exe
Com
Srv

11 rows selected.
*/

--************************
--Question 5

SELECT supplier_name
FROM food_supplier
WHERE supplier_name LIKE '%B%' OR supplier_name LIKE '%b%';

--Results

/*
SUPPLIER_NAME                 
------------------------------
Jebston Montrose Deli
Rosemont Bakery
Lucias Sub Shop
Harold Bakery
Blue Sky Deli
Lakeshore Bakery

6 rows selected.
*/

--***********************
--Question 6

select worker_id, last_name, hire_date, dept_code
from worker
where hire_date >= '01-JAN-2015' and hire_date <= '31-DEC-2020';

select worker_id, last_name, hire_date, dept_code
from worker
where hire_date between '01-JAN-2015' and '31-DEC-2020';

--Results

/*
WOR LAST_NAME            HIRE_DATE DEP
--- -------------------- --------- ---
556 Sumner               17-JUL-16 Tch
558 Campbell             24-MAY-18 Hmn
566 Tevona               21-AUG-19 Hmn
570 Trance               19-JUN-18 Aud
576 Jones                15-MAR-19 Tch
577 Martin               19-NOV-19 Sal
579 Rivera               13-NOV-15    
584 Harney               07-MAR-18 Tch
585 Frank                22-JUL-16 Srv
586 Williams             16-MAR-19    
587 Alveral              22-MAY-18 Leg

11 rows selected.
*/

--***************************
--Question 7

select worker_id, last_name, dept_code, credit_limit, (credit_limit * 1.15) AS new_limit
FROM WORKER
WHERE dept_code IS NOT NULL;

--Results

/*
WOR LAST_NAME            DEP CREDIT_LIMIT  NEW_LIMIT
--- -------------------- --- ------------ ----------
555 Shreve               Exe           45      51.75
556 Sumner               Tch           35      40.25
557 Gradle               Leg           32       36.8
558 Campbell             Hmn           28       32.2
559 Neal                 Srv           26       29.9
560 Ridgeman             Aud           22       25.3
562 Sanchez              Com           22       25.3
563 Vought               Acc           30       34.5
564 Kingman              Sal           33      37.95
565 Cross                Tch           25      28.75
566 Tevona               Hmn           21      24.15

WOR LAST_NAME            DEP CREDIT_LIMIT  NEW_LIMIT
--- -------------------- --- ------------ ----------
567 Richards             Leg           22       25.3
569 Reynolds             Fin           28       32.2
570 Trance               Aud           25      28.75
571 Harris               Hmn           17      19.55
573 White                Aud           22       25.3
575 Smith                Fin           20         23
576 Jones                Tch           25      28.75
577 Martin               Sal           20         23
578 Rayner               Tch           25      28.75
580 Gonzalez             Acc           18       20.7
581 Walsh                Srv           33      37.95

WOR LAST_NAME            DEP CREDIT_LIMIT  NEW_LIMIT
--- -------------------- --- ------------ ----------
582 Templeton            Acc           24       27.6
584 Harney               Tch           27      31.05
585 Frank                Srv           30       34.5
587 Alveral              Leg           33      37.95

26 rows selected.
*/

--********************
--Question 8

SELECT worker_id, (last_name ||', '|| first_name) AS FULL_NAME, city
FROM WORKER
WHERE city NOT IN ('Oak Brook','Chicago','Evanston');

--Results

/*
WOR FULL_NAME                        CITY                          
--- -------------------------------- ------------------------------
555 Shreve, Dana                     Aurora                        
556 Sumner, Carole                   Hinsdale                      
557 Gradle, Rita                     Wilmette                      
559 Neal, Tom                        Hinsdale                      
561 Bensen, Maria                    Wilmette                      
562 Sanchez, Jose                    Glencoe                       
568 Young, Taylor                    Wilmette                      
570 Trance, Avery                    Aurora                        
572 Johnson, Chase                   Hinsdale                      
575 Smith, Shawn                     Glencoe                       
576 Jones, Keyanna                   Hinsdale                      

WOR FULL_NAME                        CITY                          
--- -------------------------------- ------------------------------
577 Martin, Carey                    Wilmette                      
582 Templeton, Angie                 Hinsdale                      
583 Montre, Tonya                    Aurora                        
586 Williams, Jodie                  Glencoe                       

15 rows selected.
*/