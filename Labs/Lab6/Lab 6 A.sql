/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

**************************************
Question 1a
*/

SELECT fs.supplier_id, fs.supplier_name, f.product_code, f.description, f.price
FROM food_supplier fs RIGHT JOIN food f
ON fs.supplier_id = f.supplier_id
WHERE fs.supplier_name LIKE '%Bakery%'
GROUP BY fs.supplier_id, fs.supplier_name, f.product_code, f.description, f.price
ORDER BY fs.supplier_id;

--Results
/*
SUP SUPPLIER_NAME                  PR DESCRIPTION               PRICE
--- ------------------------------ -- -------------------- ----------
Lak Lakeshore Bakery               Br Cheese Stick               2.35
Lak Lakeshore Bakery               Sd Spinach Salad              6.25
Lak Lakeshore Bakery               Sw Caprese                     5.5
*/
--**********************************
--Question 1b

SELECT fs.supplier_id, fs.supplier_name, f.product_code, f.description, f.price
FROM food_supplier fs LEFT JOIN food f
ON fs.supplier_id = f.supplier_id
WHERE fs.supplier_name LIKE '%Bakery%'
GROUP BY fs.supplier_id, fs.supplier_name, f.product_code, f.description, f.price
ORDER BY fs.supplier_id;

--Results
/*
SUP SUPPLIER_NAME                  PR DESCRIPTION               PRICE
--- ------------------------------ -- -------------------- ----------
Har Harold Bakery                                                    
Lak Lakeshore Bakery               Br Cheese Stick               2.35
Lak Lakeshore Bakery               Sd Spinach Salad              6.25
Lak Lakeshore Bakery               Sw Caprese                     5.5
Rby Rosemont Bakery
*/
--**********************************
--Question 1c

SELECT fs.supplier_id, fs.supplier_name, f.product_code, f.description, f.price
FROM food_supplier fs LEFT JOIN food f
ON fs.supplier_id = f.supplier_id
WHERE fs.supplier_name LIKE '%Bakery%' AND f.supplier_id IS NULL
GROUP BY fs.supplier_id, fs.supplier_name, f.product_code, f.description, f.price
ORDER BY fs.supplier_id;

--Results
/*
SUP SUPPLIER_NAME                  PR DESCRIPTION               PRICE
--- ------------------------------ -- -------------------- ----------
Har Harold Bakery                                                    
Rby Rosemont Bakery
*/
--**********************************
--Question 2a

SELECT f.product_code, f.description, COUNT(li.product_code), SUM(f.price * li.quantity) AS TOTAL_PURCHASE
FROM food f LEFT JOIN lunch_item li
ON f.supplier_id = li.supplier_id AND f.product_code = li.product_code
GROUP BY f.product_code, f.description;

--Results
/*
PR DESCRIPTION          COUNT(LI.PRODUCT_CODE) TOTAL_PURCHASE
-- -------------------- ---------------------- --------------
Cp Chips                                     1            5.6
Sw Turkey Club                               1            7.5
Br Dinner Roll                               4              8
Ps Philly Melt                              12          103.2
Sw Grilled Cheese                            9          60.55
Vr Mango Smoothie                            0               
Cs Chef Salad                               13           80.5
Ds Yellow Cake                               6             27
Vr Iced Tea                                  8           28.5
Br Wheat Bagel                               1              4
Vt Broccoli Salad                            1              4

PR DESCRIPTION          COUNT(LI.PRODUCT_CODE) TOTAL_PURCHASE
-- -------------------- ---------------------- --------------
Sp Chicken Soup                             10          55.25
Ds Brownie                                   9           34.5
Sw Chicken Wrap                              0               
Pz Cheese Pizza                              2             34
Ff French Fries                             11           16.5
Cf Coffee                                    4            9.3
Pz Mushroom Pizza                            2             24
Ds Apple Pie                                 3           13.5
Sp Barley Soup                               3             19
Ds Sugar Cookie                              5           31.5
Pp Protein Box                               2             18

PR DESCRIPTION          COUNT(LI.PRODUCT_CODE) TOTAL_PURCHASE
-- -------------------- ---------------------- --------------
Hb Ham Melt                                  7             72
Vr Soda                                     19          56.25
Sp Potato Soup                               1           6.25
Sp Veggie Soup                               2            9.7
Ds PB Cookie                                 0               
Pz Veggie Pizza                              2             25
Br Breadstick                                1           1.25
Vt Cole Slaw                                 0               
Br Cheese Stick                              2          11.75
Sd Spinach Salad                             2           12.5
Sc Cheese Sauce                              2            1.5

PR DESCRIPTION          COUNT(LI.PRODUCT_CODE) TOTAL_PURCHASE
-- -------------------- ---------------------- --------------
Sw Caprese                                   2             11

34 rows selected.
*/
--**********************************
--Question 2b

SELECT f.product_code, f.description, COUNT(li.product_code), SUM(f.price * li.quantity) AS TOTAL_PURCHASE
FROM food f INNER JOIN lunch_item li
ON f.supplier_id = li.supplier_id AND f.product_code = li.product_code
GROUP BY f.product_code, f.description;

--Results
/*
PR DESCRIPTION          COUNT(LI.PRODUCT_CODE) TOTAL_PURCHASE
-- -------------------- ---------------------- --------------
Cp Chips                                     1            5.6
Sw Turkey Club                               1            7.5
Br Dinner Roll                               4              8
Ps Philly Melt                              12          103.2
Sw Grilled Cheese                            9          60.55
Cs Chef Salad                               13           80.5
Ds Yellow Cake                               6             27
Vr Iced Tea                                  8           28.5
Br Wheat Bagel                               1              4
Vt Broccoli Salad                            1              4
Sp Chicken Soup                             10          55.25

PR DESCRIPTION          COUNT(LI.PRODUCT_CODE) TOTAL_PURCHASE
-- -------------------- ---------------------- --------------
Ds Brownie                                   9           34.5
Pz Cheese Pizza                              2             34
Ff French Fries                             11           16.5
Cf Coffee                                    4            9.3
Pz Mushroom Pizza                            2             24
Ds Apple Pie                                 3           13.5
Sp Barley Soup                               3             19
Ds Sugar Cookie                              5           31.5
Pp Protein Box                               2             18
Hb Ham Melt                                  7             72
Vr Soda                                     19          56.25

PR DESCRIPTION          COUNT(LI.PRODUCT_CODE) TOTAL_PURCHASE
-- -------------------- ---------------------- --------------
Sp Potato Soup                               1           6.25
Sp Veggie Soup                               2            9.7
Pz Veggie Pizza                              2             25
Br Breadstick                                1           1.25
Br Cheese Stick                              2          11.75
Sd Spinach Salad                             2           12.5
Sc Cheese Sauce                              2            1.5
Sw Caprese                                   2             11

30 rows selected.
*/
--**********************************
--Question 3a

SET linesize 200;
SELECT w.worker_id, w.last_name, w.phone_number, d.dept_code, d.department_name
FROM department d INNER JOIN worker w
ON d.dept_code = w.dept_code
GROUP BY w.worker_id, w.last_name, w.phone_number, d.dept_code, d.department_name
ORDER BY w.last_name;

--Results
/*
WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
587 Alveral              7667 Leg Legal                         
558 Campbell             7591 Hmn Human Resources               
565 Cross                2974 Tch Technology                    
585 Frank                7655 Srv Service                       
580 Gonzalez             4455 Acc Accounting                    
557 Gradle               8438 Leg Legal                         
584 Harney               2349 Tch Technology                    
571 Harris               5543 Hmn Human Resources               
576 Jones                3359 Tch Technology                    
564 Kingman              3357 Sal Sales                         
577 Martin               2977 Sal Sales                         

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
559 Neal                 6830 Srv Service                       
578 Rayner               2347 Tch Technology                    
569 Reynolds             3830 Fin Finance                       
567 Richards             4446 Leg Legal                         
560 Ridgeman             5286 Aud Auditing                      
562 Sanchez              5799 Com Compliance                    
555 Shreve               3484 Exe Executive                     
575 Smith                3831 Fin Finance                       
556 Sumner               8722 Tch Technology                    
582 Templeton            4465 Acc Accounting                    
566 Tevona               2346 Hmn Human Resources               

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
570 Trance               3358 Aud Auditing                      
563 Vought               1752 Acc Accounting                    
581 Walsh                4460 Srv Service                       
573 White                2976 Aud Auditing                      

26 rows selected.
*/
--**********************************
--Question 3b

SET linesize 200;
SELECT w.worker_id, w.last_name, w.phone_number, d.dept_code, d.department_name
FROM department d RIGHT JOIN worker w
ON d.dept_code = w.dept_code
GROUP BY w.worker_id, w.last_name, w.phone_number, d.dept_code, d.department_name
ORDER BY w.last_name;

--Results
/*
WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
587 Alveral              7667 Leg Legal                         
561 Bensen               3829                                   
558 Campbell             7591 Hmn Human Resources               
565 Cross                2974 Tch Technology                    
585 Frank                7655 Srv Service                       
580 Gonzalez             4455 Acc Accounting                    
557 Gradle               8438 Leg Legal                         
584 Harney               2349 Tch Technology                    
571 Harris               5543 Hmn Human Resources               
574 Irwin                5800                                   
572 Johnson              5544                                   

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
576 Jones                3359 Tch Technology                    
564 Kingman              3357 Sal Sales                         
577 Martin               2977 Sal Sales                         
583 Montre               3832                                   
559 Neal                 6830 Srv Service                       
578 Rayner               2347 Tch Technology                    
569 Reynolds             3830 Fin Finance                       
567 Richards             4446 Leg Legal                         
560 Ridgeman             5286 Aud Auditing                      
579 Rivera               4450                                   
562 Sanchez              5799 Com Compliance                    

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
555 Shreve               3484 Exe Executive                     
575 Smith                3831 Fin Finance                       
556 Sumner               8722 Tch Technology                    
582 Templeton            4465 Acc Accounting                    
566 Tevona               2346 Hmn Human Resources               
570 Trance               3358 Aud Auditing                      
563 Vought               1752 Acc Accounting                    
588 Walsh                2350                                   
581 Walsh                4460 Srv Service                       
573 White                2976 Aud Auditing                      
586 Williams             5801                                   

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
568 Young                2975                                   

34 rows selected.
*/
--**********************************
--Question 3c

SET linesize 200;
SELECT w.worker_id, w.last_name, w.phone_number, d.dept_code, d.department_name
FROM department d LEFT JOIN worker w
ON d.dept_code = w.dept_code
GROUP BY w.worker_id, w.last_name, w.phone_number, d.dept_code, d.department_name
ORDER BY w.last_name;

--Results
/*
WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
587 Alveral              7667 Leg Legal                         
558 Campbell             7591 Hmn Human Resources               
565 Cross                2974 Tch Technology                    
585 Frank                7655 Srv Service                       
580 Gonzalez             4455 Acc Accounting                    
557 Gradle               8438 Leg Legal                         
584 Harney               2349 Tch Technology                    
571 Harris               5543 Hmn Human Resources               
576 Jones                3359 Tch Technology                    
564 Kingman              3357 Sal Sales                         
577 Martin               2977 Sal Sales                         

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
559 Neal                 6830 Srv Service                       
578 Rayner               2347 Tch Technology                    
569 Reynolds             3830 Fin Finance                       
567 Richards             4446 Leg Legal                         
560 Ridgeman             5286 Aud Auditing                      
562 Sanchez              5799 Com Compliance                    
555 Shreve               3484 Exe Executive                     
575 Smith                3831 Fin Finance                       
556 Sumner               8722 Tch Technology                    
582 Templeton            4465 Acc Accounting                    
566 Tevona               2346 Hmn Human Resources               

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
570 Trance               3358 Aud Auditing                      
563 Vought               1752 Acc Accounting                    
581 Walsh                4460 Srv Service                       
573 White                2976 Aud Auditing                      
                              Fac Facilities                    
                              Mkt Marketing                     
                              Pur Purchasing                    
                              Shp Shipping                      

30 rows selected.
*/
--**********************************
--Question 3d

SELECT dept_code, department_name
FROM department
WHERE dept_code NOT IN (SELECT dept_code
                        FROM worker
                        WHERE dept_code IS NOT NULL);

--Results
/*
DEP DEPARTMENT_NAME               
--- ------------------------------
Fac Facilities                    
Mkt Marketing                     
Pur Purchasing                    
Shp Shipping
*/
--**********************************
--Question 4

SELECT supplier_name, supplier_city
FROM food_supplier
WHERE supplier_city IN ('Chicago', 'Naperville', 'Aurora')
UNION
SELECT (first_name || ' ' || last_name) AS NAME, city
FROM worker
WHERE city IN ('Chicago', 'Naperville', 'Aurora')
ORDER BY supplier_city;


--Results
/*
SUPPLIER_NAME                   SUPPLIER_CITY                 
------------------------------- ------------------------------
Avery Trance                    Aurora                        
Dana Shreve                     Aurora                        
Lucias Sub Shop                 Aurora                        
Tonya Montre                    Aurora                        
Downtowner Pizza                Chicago                       
Fontinas Italian                Chicago                       
Gail Walsh                      Chicago                       
Giovana and Sons                Chicago                       
Harper Street Deli              Chicago                       
James Kingman                   Chicago                       
Jared Ridgeman                  Chicago                       

SUPPLIER_NAME                   SUPPLIER_CITY                 
------------------------------- ------------------------------
Jebston Montrose Deli           Chicago                       
Lakeshore Bakery                Chicago                       
Skyler Harris                   Chicago                       
Tyler Harney                    Chicago                       
Under the Metra                 Chicago                       

16 rows selected.                     

16 rows selected.
*/
--**********************************
--Question 5

SELECT supplier_city
FROM food_supplier
INTERSECT
SELECT city
FROM worker;

--Results
/*
SUPPLIER_CITY                 
------------------------------
Aurora
Chicago
Glencoe
Hinsdale
Oak Brook
Wilmette

6 rows selected.
*/
--**********************************
--Question 6a

SELECT DISTINCT supplier_city, NVL(supplier_city, 'Missing City')
FROM food_supplier;

--Results
/*
SUPPLIER_CITY                  NVL(SUPPLIER_CITY,'MISSINGCITY
------------------------------ ------------------------------
Hinsdale                       Hinsdale                      
Glencoe                        Glencoe                       
Orland Park                    Orland Park                   
Oak Brook                      Oak Brook                     
Aurora                         Aurora                        
Wilmette                       Wilmette                      
Chicago                        Chicago                       

7 rows selected.
*/
--**********************************
--Question 6b

SELECT DISTINCT city, NVL(city, 'Missing City')
FROM worker;

--Results
/*
CITY                           NVL(CITY,'MISSINGCITY')       
------------------------------ ------------------------------
Hinsdale                       Hinsdale                      
                               Missing City                  
Glencoe                        Glencoe                       
Oak Brook                      Oak Brook                     
Aurora                         Aurora                        
Wilmette                       Wilmette                      
Evanston                       Evanston                      
Chicago                        Chicago                       

8 rows selected.
*/
--**********************************
--Question 6c

SELECT DISTINCT supplier_city, NVL(supplier_city, 'Missing City')
FROM food_supplier
MINUS
SELECT DISTINCT city, NVL(city, 'Missing City')
FROM worker;

--Results
/*
SUPPLIER_CITY                  NVL(SUPPLIER_CITY,'MISSINGCITY
------------------------------ ------------------------------
Orland Park                    Orland Park
*/
--**********************************
--Question 6d

SELECT DISTINCT city, NVL(city, 'Missing City')
FROM worker
MINUS
SELECT DISTINCT supplier_city, NVL(supplier_city, 'Missing City')
FROM food_supplier;

--Results
/*
CITY                           NVL(CITY,'MISSINGCITY')       
------------------------------ ------------------------------
Evanston                       Evanston                      
                               Missing City
*/