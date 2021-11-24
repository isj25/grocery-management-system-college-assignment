drop database grocery ;
create database grocery;
\c grocery

CREATE TABLE CUSTOMER(
cust_id INTEGER NOT NULL,
name TEXT NOT NULL,
phone varchar check(phone ~ '^[1-9]{1}[0-9]{9}$'),
email text unique,
CONSTRAINT P1 PRIMARY KEY(cust_id)
);




CREATE TABLE STORE(
store_id INTEGER NOT NULL,
address TEXT,
CONSTRAINT P4 PRIMARY KEY(store_id) 
);


CREATE TABLE CHECKOUT(
checkout_id INTEGER NOT NULL,
cust_id INTEGER,
date DATE,
total_cost INTEGER NOT NULL,
tax REAL,
store_id INTEGER,
CONSTRAINT F2 FOREIGN KEY(cust_id) REFERENCES CUSTOMER(cust_id),
CONSTRAINT P3 PRIMARY KEY(checkout_id),
CONSTRAINT FK2 FOREIGN KEY(store_id) REFERENCES STORE(store_id)
);

CREATE TABLE ITEMS(item_id INTEGER NOT NULL,
Qty INTEGER,
item_name TEXT,
description TEXT,
taxable BOOLEAN,
price REAL,
weight REAL,
store_id INTEGER,
checkout_id INTEGER,
CONSTRAINT P5 PRIMARY KEY(item_id),
CONSTRAINT F3 FOREIGN KEY(store_id) REFERENCES STORE(store_id)
);


CREATE TABLE FEEDBACK(feedback_id INTEGER NOT NULL,
rating numeric(2,1) check(Rating >= 1.0 and Rating <= 10.0) default 1.0,
cust_feedback TEXT,
cust_id INTEGER,
item_id INTEGER,
CONSTRAINT F1 FOREIGN KEY(cust_id) REFERENCES CUSTOMER(cust_id),
CONSTRAINT P10 PRIMARY KEY(feedback_id),
CONSTRAINT FK1 FOREIGN KEY(item_id) REFERENCES ITEMS(item_id)
);

CREATE TABLE SUPPLIER(supplier_id INTEGER NOT NULL,
name TEXT,
phone BIGINT,
item_id INTEGER,
CONSTRAINT F4 FOREIGN KEY(item_id) REFERENCES ITEMS(item_id),
CONSTRAINT P6 PRIMARY KEY(supplier_id)
);

CREATE TABLE SUPPLIES(supplier_id INTEGER NOT NULL,
store_id INTEGER NOT NULL,
CONSTRAINT F5 FOREIGN KEY(supplier_id) REFERENCES SUPPLIER(supplier_id),
CONSTRAINT F6 FOREIGN KEY(store_id) REFERENCES STORE(store_id)
);

CREATE TABLE EMPLOYEE(emp_id INTEGER NOT NULL,
name TEXT,
SSN BIGINT NOT NULL,
phone varchar check(phone ~ '^[1-9]{1}[0-9]{9}$'),
store_id INTEGER,
CONSTRAINT P7 PRIMARY KEY(emp_id),
CONSTRAINT F7 FOREIGN KEY(store_id) REFERENCES STORE(store_id)
 );




 CREATE TABLE CANCELLATION(cancellation_id INTEGER NOT NULL,
 item_id INTEGER,
 price REAL not null,
 total REAL not null,
 CONSTRAINT P8 PRIMARY KEY(cancellation_id),
 CONSTRAINT F9 FOREIGN KEY(item_id) REFERENCES ITEMS(item_id)
 );

CREATE TABLE FINANCE(
    f_id INTEGER NOT NULL,
    store_id INTEGER NOT NULL,
    expense REAL,
    income REAL,
    tax REAL,
    CONSTRAINT P9 PRIMARY KEY(f_id),
     CONSTRAINT F10 FOREIGN KEY(store_id) REFERENCES STORE(store_id)
    );
