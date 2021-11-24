\c grocery


/*display name and email from customer*/
select name || ' ' || email from customer;
/*display the items whose price >400 and taxable*/
select * from items where price > 400 AND taxable = 't' AND qty > 5;
/*display the total expenses,income and tax in finance*/
select sum(finance.expense) as expenses,sum(finance.income) as income,sum(finance.tax) as tax from finance;
/*displying items with rating less then 5*/
select distinct item_name 
from item as i,feedback as f
where i.item_id=f.item_id and rating<5;

/*delete feedback whose feedback_id is 7*/
delete * from feedback where (feedback_id='7' and cust_id in (select cust_id from feedback where item_id ='7'));
select * from feedback where feedback_id ='7';
/*delete a row and return the deleted row */
delete * from feedback where item_id = '5' returning *;


/*update */
update items set description ='gava,apple,mango' where item_id = '1';
select * from items where item_id ='1';

/*like. count the number of stores in banglore*/
select count(store_id) from store where address like '%Bangalore';
/* display the store_id and address which in are in bagalore using like*/
select store_id,address from store where address like '%Bangalore';
/*select the details of suppliers whose name starts with S */
select supplier_id,name,phone from supplier where name like='S%' 

/*Order by*/
select item_name,price from items order by price;
select item_name,price,weight from items order by weight desc;


/*Nested  details of the suppplier whose store id=8*/
select name,phone from supplier  where supplier_id=(select supplier_id from supplies where store_id=8);

/* details of the supplier who supplies goods to store in Chiballapur*/
select name,phone from supplier where supplier_id=
(select supplier_id from supplies where store_id=
(select store_id from store where address like '%Chikkaballapur'));

/*find the feedback and rating for the items that are cancelled  with minimum price*/
select rating,cust_feedback from feedback where item_id=
(select item_id from cancellation where price=
(select min(price) from cancellation));

/*intersect*/
/*items with rating less than 5 and cust_feedback negative*/
select item_id from feedback where rating<5
intersect 
select item_id from feedback where cust_feedback like '%Bad' or cust_feedback like '%horrible%' or cust_feedback like '%not worth';

/*minus*/
/*item id of the product with postive reviews = all items - items with negative customer feedback*/
select item_id from feedback
minus
select item_id from feedback where cust_feedback like '%Bad%' or  cust_feedback like '%not worth%' or cust_feedback like '%horrible%';


/*union*/
/*items with no tax and price les than 600*/
select item_name from items where taxable='f'
union
select item_name from items where price<600;
