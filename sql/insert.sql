\c grocery
-- CUSTOMER


insert into CUSTOMER (cust_id, name, phone, email) values (1, 'Tarun', '7666154196', 'tbacup0@imdb.com');
insert into CUSTOMER (cust_id, name, phone, email) values (2, 'Narine', '1780195225', 'nstpaul1@goodreads.com');
insert into CUSTOMER (cust_id, name, phone, email) values (3, 'Shubhman', '8864067619', 'gvaz2@skype.com');
insert into CUSTOMER (cust_id, name, phone, email) values (4, 'Anatola', '1600783466', 'aagutter3@etsy.com');
insert into CUSTOMER (cust_id, name, phone, email) values (5, 'Philis', '5573609280', 'pfranzetti4@blog.com');
insert into CUSTOMER (cust_id, name, phone, email) values (6, 'Gabriel', '6577832517', 'gradbourn5@addthis.com');
insert into CUSTOMER (cust_id, name, phone, email) values (7, 'Madan', '4982854791', 'mdeppe6@parallels.com');
insert into CUSTOMER (cust_id, name, phone, email) values (8, 'Barbi', '4603941230','btoffolo7@yellowbook.com');
insert into CUSTOMER (cust_id, name, phone, email) values (9, 'Kamlesh', '2714878583', 'kritmeyer8@tumblr.com');
insert into CUSTOMER (cust_id, name, phone, email) values (10, 'Suraj', '1926052010', 'cfilinkov9@issuu.com');

--Store

insert into STORE (store_id, address) values (1, '100ft Ring Road, BSK 3rd stage, Bangalore');
insert into STORE (store_id, address) values (2, 'Ward 6, 2nd cross, Chikkaballapur');
insert into STORE (store_id, address) values (3, 'Vidyanagar, D block,Belgaum');
insert into STORE (store_id, address) values (4, '486 Algoma Crossing,Belgaum');
insert into STORE (store_id, address) values (5, '6486 Oakridge Center,Bangalore');
insert into STORE (store_id, address) values (6, '94957 Talmadge Street,Kolar');
insert into STORE (store_id, address) values (7, '22 Cordelia Center,Mandya');
insert into STORE (store_id, address) values (8, 'Suttagalli, BSK 3rd stage, Bangalore');
insert into STORE (store_id, address) values (9, '61 Lien Junction,Miraj');
insert into STORE (store_id, address) values (10, '651 Lake View Junction,Miraj');


--checkout

insert into CHECKOUT (checkout_id, cust_id, date, total_cost, tax, store_id) values (1, 1, '2021-01-21', 550, 7, 1);
insert into CHECKOUT (checkout_id, cust_id, date, total_cost, tax, store_id) values (2, 2, '2021-09-17', 73, 15, 2);
insert into CHECKOUT (checkout_id, cust_id, date, total_cost, tax, store_id) values (3, 3, '2021-10-02', 376, 1, 3);
insert into CHECKOUT (checkout_id, cust_id, date, total_cost, tax, store_id) values (4, 4, '2021-04-03', 96, 6, 4);
insert into CHECKOUT (checkout_id, cust_id, date, total_cost, tax, store_id) values (5, 5, '2021-02-16', 338, 9, 5);
insert into CHECKOUT (checkout_id, cust_id, date, total_cost, tax, store_id) values (6, 6, '2021-05-19', 242, 2, 6);
insert into CHECKOUT (checkout_id, cust_id, date, total_cost, tax, store_id) values (7, 7, '2021-10-04', 546, 11, 7);
insert into CHECKOUT (checkout_id, cust_id, date, total_cost, tax, store_id) values (8, 8, '2021-04-16', 986, 14, 8);
insert into CHECKOUT (checkout_id, cust_id, date, total_cost, tax, store_id) values (9, 9, '2021-06-06', 949, 14, 9);
insert into CHECKOUT (checkout_id, cust_id, date, total_cost, tax, store_id) values (10, 10, '2021-08-05', 441, 3, 10);

--items

insert into ITEMS (item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values (1, 6, 'Fruits', 'Apple,banana', false, 599, 75, 1, 1);
insert into ITEMS (item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values (2, 6, 'Nandini Milk', 'Milk,fresh and healthy', false, 314, 10, 2, 2);
insert into ITEMS (item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values (3, 10, 'Egg','big and healthy', true, 945, 8, 3, 3);
insert into ITEMS (item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values (4, 5, 'Bread', 'healthy', true, 412, 5, 4, 4);
insert into ITEMS (item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values (5, 2, 'Cereals', 'Healthy', true, 970, 78, 5, 5);
insert into ITEMS (item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values (6, 5, 'Vegetables', 'Healthy', true, 679, 88, 6, 6);
insert into ITEMS (item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values (7, 7, 'Bottles', 'Red color,500ml', false, 128, 51, 7, 7);
insert into ITEMS (item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values (8, 6, 'Oil', 'Healthy', true, 873, 21, 8, 8);
insert into ITEMS (item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values (9, 8, 'Coconut', 'Fresh,cheap', true, 966, 76, 9, 9);
insert into ITEMS (item_id, qty, item_name, description, taxable, price, weight, store_id, checkout_id) values (10, 6, 'Noodles', '2 minutes-Maggie', false, 252, 85, 10, 10);

--Feedback

insert into FEEDBACK (feedback_id, rating, cust_feedback, cust_id, item_id) values (1, 7.5, 'Quality is not soo good', 1, 1);
insert into FEEDBACK (feedback_id, rating, cust_feedback, cust_id, item_id) values (2, 7, 'it was tasy', 2, 2);
insert into FEEDBACK (feedback_id, rating, cust_feedback, cust_id, item_id) values (3, 2, 'not worth', 3, 3);
insert into FEEDBACK (feedback_id, rating, cust_feedback, cust_id, item_id) values (4, 6, 'it was not so good', 4, 4);
insert into FEEDBACK (feedback_id, rating, cust_feedback, cust_id, item_id) values (5, 2, 'horrible', 5, 5);
insert into FEEDBACK (feedback_id, rating, cust_feedback, cust_id, item_id) values (6, 9.8, 'Fantastic', 6, 6);
insert into FEEDBACK (feedback_id, rating, cust_feedback, cust_id, item_id) values (7, 1.4, 'Bad', 7, 7);
insert into FEEDBACK (feedback_id, rating, cust_feedback, cust_id, item_id) values (8, 3, 'Normal', 8, 8);
insert into FEEDBACK (feedback_id, rating, cust_feedback, cust_id, item_id) values (9, 7, 'healthy and good', 9, 9);
insert into FEEDBACK (feedback_id, rating, cust_feedback, cust_id, item_id) values (10, 9, 'Awsome', 10, 10);

--Supplier


insert into SUPPLIER (supplier_id, name, phone, item_id) values (1, 'Rama', '7354804623', 1);
insert into SUPPLIER (supplier_id, name, phone, item_id) values (2, 'hanamant', '9933844827', 2);
insert into SUPPLIER (supplier_id, name, phone, item_id) values (3, 'Krishna', '6079906012', 3);
insert into SUPPLIER (supplier_id, name, phone, item_id) values (4, 'Lakshman', '7507503642', 4);
insert into SUPPLIER (supplier_id, name, phone, item_id) values (5, 'Birbal', '9774589942', 5);
insert into SUPPLIER (supplier_id, name, phone, item_id) values (6, 'Sardar', '7416887735', 6);
insert into SUPPLIER (supplier_id, name, phone, item_id) values (7, 'Saishankar', '9727124712', 7);
insert into SUPPLIER (supplier_id, name, phone, item_id) values (8, 'Anil', '1185520362', 8);
insert into SUPPLIER (supplier_id, name, phone, item_id) values (9, 'Pramod', '1217540092', 9);
insert into SUPPLIER (supplier_id, name, phone, item_id) values (10, 'Sohan', '9497812469', 10);


--supplies

insert into SUPPLIES (supplier_id, store_id) values (1, 1);
insert into SUPPLIES (supplier_id, store_id) values (2, 2);
insert into SUPPLIES (supplier_id, store_id) values (3, 3);
insert into SUPPLIES (supplier_id, store_id) values (4, 4);
insert into SUPPLIES (supplier_id, store_id) values (5, 5);
insert into SUPPLIES (supplier_id, store_id) values (6, 6);
insert into SUPPLIES (supplier_id, store_id) values (7, 7);
insert into SUPPLIES (supplier_id, store_id) values (8, 8);
insert into SUPPLIES (supplier_id, store_id) values (9, 9);


--Employee

insert into EMPLOYEE (emp_id, name, ssn, phone, store_id) values (1, 'Guruprasad', '7681105318', '3069028594', 1);
insert into EMPLOYEE (emp_id, name, ssn, phone, store_id) values (2, 'Ishwar', '7606246034', '3385644297', 2);
insert into EMPLOYEE (emp_id, name, ssn, phone, store_id) values (3, 'Sashi', '2585306802', '9946761135', 3);
insert into EMPLOYEE (emp_id, name, ssn, phone, store_id) values (4, 'Ravi', '6005981159', '2057304566', 4);
insert into EMPLOYEE (emp_id, name, ssn, phone, store_id) values (5, 'Jay', '7703029825', '7316882775', 5);
insert into EMPLOYEE (emp_id, name, ssn, phone, store_id) values (6, 'Rajesh', '6081428752', '9274385648', 6);
insert into EMPLOYEE (emp_id, name, ssn, phone, store_id) values (7, 'Kiran', '1857181472', '6512821145', 7);
insert into EMPLOYEE (emp_id, name, ssn, phone, store_id) values (8, 'Siddhart', '9614103433', '2041997319', 8);
insert into EMPLOYEE (emp_id, name, ssn, phone, store_id) values (9, 'Shiva', '2582868370', '1924635394', 9);
insert into EMPLOYEE (emp_id, name, ssn, phone, store_id) values (10, 'Usha', '9709039374', '9643755685', 10);


--Cancellation


insert into CANCELLATION (cancellation_id, item_id, price, total) values (1, 1, 627, 208);
insert into CANCELLATION (cancellation_id, item_id, price, total) values (2, 2, 745, 34);
insert into CANCELLATION (cancellation_id, item_id, price, total) values (3, 3, 867, 637);
insert into CANCELLATION (cancellation_id, item_id, price, total) values (4, 4, 954, 765);
insert into CANCELLATION (cancellation_id, item_id, price, total) values (5, 5, 546, 610);
insert into CANCELLATION (cancellation_id, item_id, price, total) values (6, 6, 538, 705);
insert into CANCELLATION (cancellation_id, item_id, price, total) values (7, 7, 886, 450);
insert into CANCELLATION (cancellation_id, item_id, price, total) values (8, 8, 28, 143);
insert into CANCELLATION (cancellation_id, item_id, price, total) values (9, 9, 123, 382);
insert into CANCELLATION (cancellation_id, item_id, price, total) values (10, 10, 177, 546);

--Finance

insert into FINANCE(f_id,store_id,expense,income,tax) values(1,2,10000,32000,100);
insert into FINANCE(f_id,store_id,expense,income,tax) values(2,4,20000,43000,190);
insert into FINANCE(f_id,store_id,expense,income,tax) values(3,5,32000,34000,140);
insert into FINANCE(f_id,store_id,expense,income,tax) values(4,6,45000,54000,120);
insert into FINANCE(f_id,store_id,expense,income,tax) values(5,8,40030,39000,130);
insert into FINANCE(f_id,store_id,expense,income,tax) values(6,9,46000,23000,120);
insert into FINANCE(f_id,store_id,expense,income,tax) values(7,10,39000,43000,100);
insert into FINANCE(f_id,store_id,expense,income,tax) values(8,1,29000,35000,90);
insert into FINANCE(f_id,store_id,expense,income,tax) values(9,3,12000,25000,80);
insert into FINANCE(f_id,store_id,expense,income,tax) values(10,7,43200,40000,86);