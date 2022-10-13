/*
Jack Mahedy
CNIT 27200 Fall 2021
Lab Time: Thusday 
Duration: 1:30-3:20pm

**************************************
Question 1
*/

SELECT supplier_ID
FROM food
WHERE supplier_ID = 'Blu' AND product_code = 'Ds';

INSERT into food (supplier_ID, product_code, menu_item, description, price, price_upcharge)
    VALUES('Blu', 'Sd', 10, 'Cobb Salad', 6.5, .6);

INSERT into food (supplier_ID, product_code, menu_item, description, price, price_upcharge)
    VALUES('Blu', 'Ab', 6, 'Cheese', 2.8, .5);

SELECT *
FROM food
WHERE supplier_ID = 'Blu';

--Results
/*
no rows selected

1 row inserted.

1 row inserted.

SUP PR  MENU_ITEM DESCRIPTION               PRICE PRICE_UPCHARGE
--- -- ---------- -------------------- ---------- --------------
Blu Ab          6 Cheese                      2.8             .5
Blu Cp          6 Chips                       2.8               
Blu Sd         10 Cobb Salad                  6.5             .6
Blu Sw         20 Turkey Club                 7.5             .5
*/
--**************************************
--Question 2

SELECT worker_id, first_name, last_name, city, dept_code, manager_id
FROM worker
WHERE first_name = 'Gail' AND last_name = 'Walsh';

UPDATE worker
SET city = 'Evanston', dept_code = 'Srv', manager_id = '585'
WHERE first_name = 'Gail' AND last_name = 'Walsh';

COMMIT;

SELECT worker_id, first_name, last_name, city, dept_code, manager_id
FROM worker
WHERE first_name = 'Gail' AND last_name = 'Walsh';

--Results
/*
WOR FIRST_NAME LAST_NAME            CITY                           DEP MAN
--- ---------- -------------------- ------------------------------ --- ---
588 Gail       Walsh                Chicago                            582

1 row updated.

Commit complete.

WOR FIRST_NAME LAST_NAME            CITY                           DEP MAN
--- ---------- -------------------- ------------------------------ --- ---
588 Gail       Walsh                Evanston                       Srv 585
*/
--**************************************
--Question 3

SELECT supplier_ID, description, price
FROM food
WHERE product_code = 'Ds';

UPDATE food
SET price = price * 1.05
WHERE product_code = 'Ds';

SELECT supplier_ID, description, price
FROM food
WHERE product_code = 'Ds';

--Results
/*
SUP DESCRIPTION               PRICE
--- -------------------- ----------
Ard PB Cookie                  1.25
Foi Apple Pie                   4.5
Gls Sugar Cookie                3.5
Hsd Yellow Cake                 4.5
Jd6 Brownie                    3.45

5 rows updated.

SUP DESCRIPTION               PRICE
--- -------------------- ----------
Ard PB Cookie                  1.31
Foi Apple Pie                  4.73
Gls Sugar Cookie               3.68
Hsd Yellow Cake                4.73
Jd6 Brownie                    3.62
*/
--**************************************
--Question 4a

SELECT worker_ID
FROM lunch
WHERE worker_ID = '562';

INSERT into lunch(lunch_ID, lunch_date, worker_ID)
    VALUES(53, '12-OCT-2021', 562);
    
SELECT *
FROM lunch
WHERE worker_ID = '562';

--Results
/*
WOR
---
562
562
562

1 row inserted.

  LUNCH_ID LUNCH_DAT WOR
---------- --------- ---
         4 22-MAY-21 562
        16 01-JUN-21 562
        49 22-JUN-21 562
        53 12-OCT-21 562
*/
--**************************************
--Question 4b

INSERT INTO lunch_item(lunch_id, item_number, supplier_id, product_code, quantity)
    VALUES(53, 1, 'Hsd', 'Cs', 1);
    
INSERT INTO lunch_item(lunch_id, item_number, supplier_id, product_code, quantity)
    VALUES(53, 2, 'Hsd', 'Sp', 1);
    
INSERT INTO lunch_item(lunch_id, item_number, supplier_id, product_code, quantity)
    VALUES(53, 3, 'Hsd', 'Pp', 1);
    
SELECT worker_id, l.lunch_id, lunch_date, item_number, supplier_id, product_code, quantity
FROM lunch l INNER JOIN lunch_item li
ON l.lunch_id = li.lunch_id
WHERE worker_id = '562';

rollback;
--Results
/*
1 row inserted.

1 row inserted.

1 row inserted.

WOR   LUNCH_ID LUNCH_DAT ITEM_NUMBER SUP PR   QUANTITY
--- ---------- --------- ----------- --- -- ----------
562          4 22-MAY-21           1 Foi Sp          2
562          4 22-MAY-21           2 Crm Hb          2
562          4 22-MAY-21           3 Foi Vt          1
562          4 22-MAY-21           4 Jd6 Ds          2
562         16 01-JUN-21           1 Hsd Ds          1
562         16 01-JUN-21           2 Crm Ps          1
562         16 01-JUN-21           3 Foi Ff          1
562         16 01-JUN-21           4 Jd6 Vr          1
562         16 01-JUN-21           5 Jd6 Ds          1
562         49 22-JUN-21           1 Hsd Ds          1
562         49 22-JUN-21           2 Crm Ps          1

WOR   LUNCH_ID LUNCH_DAT ITEM_NUMBER SUP PR   QUANTITY
--- ---------- --------- ----------- --- -- ----------
562         49 22-JUN-21           3 Foi Ff          1
562         49 22-JUN-21           4 Jd6 Vr          1
562         49 22-JUN-21           5 Jd6 Ds          1
562         53 12-OCT-21           1 Hsd Cs          1
562         53 12-OCT-21           2 Hsd Sp          1
562         53 12-OCT-21           3 Hsd Pp          1

17 rows selected.

Rollback complete.
*/
--**************************************
--Question 4c

SELECT *
FROM lunch
WHERE worker_id = '562';

SELECT *
FROM lunch
WHERE lunch_id = '53';

SELECT supplier_ID, description, price
FROM food
WHERE product_code = 'Ds';

SELECT worker_id, first_name, last_name, city, dept_code, manager_id
FROM worker
WHERE first_name = 'Gail' AND last_name = 'Walsh';

SELECT *
FROM food
WHERE supplier_ID = 'Blu';

--Results
/*
  LUNCH_ID LUNCH_DAT WOR
---------- --------- ---
         4 22-MAY-21 562
        16 01-JUN-21 562
        49 22-JUN-21 562

no rows selected

SUP DESCRIPTION               PRICE
--- -------------------- ----------
Ard PB Cookie                  1.25
Foi Apple Pie                   4.5
Gls Sugar Cookie                3.5
Hsd Yellow Cake                 4.5
Jd6 Brownie                    3.45

WOR FIRST_NAME LAST_NAME            CITY                           DEP MAN
--- ---------- -------------------- ------------------------------ --- ---
588 Gail       Walsh                Evanston                       Srv 585


SUP PR  MENU_ITEM DESCRIPTION               PRICE PRICE_UPCHARGE
--- -- ---------- -------------------- ---------- --------------
Blu Ab          6 Cheese                      2.8             .5
Blu Cp          6 Chips                       2.8               
Blu Sd         10 Cobb Salad                  6.5             .6
Blu Sw         20 Turkey Club                 7.5             .5
*/
--**************************************
--Question 5

SELECT dept_code, department_name
FROM department
WHERE dept_code NOT IN (SELECT dept_code
                        FROM worker
                        WHERE dept_code IS NOT NULL);
                      
DELETE FROM department
WHERE dept_code NOT IN (SELECT dept_code
                        FROM worker
                        WHERE dept_code IS NOT NULL);
                        
SELECT dept_code, department_name
FROM department
WHERE dept_code NOT IN (SELECT dept_code
                        FROM worker
                        WHERE dept_code IS NOT NULL);
                        
COMMIT;

SELECT dept_code, department_name
FROM department;

--Results
/*
DEP DEPARTMENT_NAME               
--- ------------------------------
Fac Facilities                    
Mkt Marketing                     
Pur Purchasing                    
Shp Shipping

4 rows deleted.

no rows selected

Commit complete.

DEP DEPARTMENT_NAME               
--- ------------------------------
Acc Accounting                    
Exe Executive                     
Hmn Human Resources               
Sal Sales                         
Tch Technology                    
Srv Service                       
Fin Finance                       
Aud Auditing                      
Leg Legal                         
Com Compliance                    

10 rows selected.
*/
--**************************************
--Question 6

DROP TABLE CateringOrder CASCADE CONSTRAINTS;

CREATE TABLE CateringOrder
(Supplier_id VARCHAR2(3),
Product_Code VARCHAR2(2),
Menu_Item NUMBER(2),
Description VARCHAR2(20),
Catering_Price NUMBER (9,2),
CONSTRAINT CateringOrder_PK PRIMARY KEY (Supplier_id, Product_Code));

ALTER TABLE CateringOrder
    ADD CONSTRAINT fo_FK FOREIGN KEY (Supplier_id, Product_Code) REFERENCES FOOD (Supplier_id, Product_Code);
    
INSERT INTO CateringOrder (Supplier_ID, Product_Code, Menu_Item, Description, Catering_Price)
    SELECT Supplier_ID, Product_Code, Menu_Item, Description, Price * 1.10
    FROM food;
    
COMMIT;

SELECT f.supplier_id, f.product_code, f.description, price, catering_price
FROM food f INNER JOIN CateringOrder co
ON f.supplier_id = co.supplier_id AND f.product_code = co.product_code;

--Results
/*
Error starting at line : 301 in command -
DROP TABLE CateringOrder CASCADE CONSTRAINTS
Error report -
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Table CATERINGORDER created.

Table CATERINGORDER altered.

37 rows inserted.

Commit complete.

SUP PR  MENU_ITEM DESCRIPTION          PRICE*1.10
--- -- ---------- -------------------- ----------
Ard Pz         17 Veggie Pizza              6.875
Ard Ds         20 PB Cookie                 1.375
Ard Sw         12 Chicken Wrap              5.775
Hsd Cs          1 Chef Salad                6.325
Hsd Sp          2 Chicken Soup              4.675
Hsd Ds         12 Yellow Cake                4.95
Hsd Pp          1 Protein Box                 9.9
Crm Sw          3 Grilled Cheese            5.775
Crm Ps          4 Philly Melt                9.46
Crm Hb          5 Ham Melt                   7.92
Crm Br         21 Wheat Bagel                 4.4

SUP PR  MENU_ITEM DESCRIPTION          PRICE*1.10
--- -- ---------- -------------------- ----------
Foi Vt          6 Broccoli Salad              4.4
Foi Ff          7 French Fries               1.65
Foi Sp         15 Barley Soup               5.225
Foi Ds         20 Apple Pie                  4.95
Jd6 Vr          8 Soda                      2.475
Jd6 Cf          9 Coffee                    1.705
Jd6 Ds         12 Brownie                   3.795
Jmd Sp         11 Potato Soup               6.875
Jmd Vr         13 Iced Tea                  3.135
Jmd Vt         14 Cole Slaw                  1.65
Jmd Pz         17 Mushroom Pizza              8.8

SUP PR  MENU_ITEM DESCRIPTION          PRICE*1.10
--- -- ---------- -------------------- ----------
Lss Sw          3 Grilled Cheese            6.545
Lss Sp         11 Veggie Soup               5.335
Dpz Pz         17 Cheese Pizza               9.35
Dpz Br         18 Dinner Roll                 1.1
Dpz Sc         19 Cheese Sauce               .825
Gls Ds         10 Sugar Cookie               3.85
Gls Vr         16 Mango Smoothie            5.445
Gls Br         16 Breadstick                1.375
Blu Sw         20 Turkey Club                8.25
Blu Cp          6 Chips                      3.08
Lak Sw          7 Caprese                    6.05

SUP PR  MENU_ITEM DESCRIPTION          PRICE*1.10
--- -- ---------- -------------------- ----------
Lak Sd          2 Spinach Salad             6.875
Lak Br         18 Cheese Stick              2.585
Blu Sd         10 Cobb Salad                 7.15
Blu Ab          6 Cheese                     3.08

37 rows selected.
*/
