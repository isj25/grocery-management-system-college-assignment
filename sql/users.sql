create user manager with password 'manager@123';
grant select,insert,update,delete on all tables in schema public to manager;
revoke update on finance from manager;
-- create check1 with password "check1";

create user checkout1 with password 'checkout1';
grant select,insert,update,delete  on table checkout,cancellation to checkout1;
grant select on table customer to checkout1;
grant select,update on table items to checkout1;
grant insert on table customer to checkout1;


create user checkout2 with password 'checkout2';
grant select,insert,update,delete on table checkout,cancellation to checkout2;
grant select,update on table customer to checkout2;
grant select,update on table items to checkout2;
grant insert on table customer to checkout2;



create user checkout3 with password 'checkout3';
grant select,insert,update,delete  on table checkout,cancellation to checkout3;
grant select,update on table customer to checkout3;
grant select,update on table items to checkout3;
grant insert on table customer to checkout3;




create user user1 with password 'user1';
grant update,select on table feedback,items to user1;