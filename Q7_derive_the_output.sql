-- Q7 : Derive the output --- 

drop table sales_data;
create table sales_data
    (
        sales_date      date,
        customer_id     varchar(30),
        amount          varchar(30)
    );
insert into sales_data values ('01-Jan-2021', 'Cust-1', '50$');
insert into sales_data values ('02-Jan-2021', 'Cust-1', '50$');
insert into sales_data values ('03-Jan-2021', 'Cust-1', '50$');
insert into sales_data values ('01-Jan-2021', 'Cust-2', '100$');
insert into sales_data values ('02-Jan-2021', 'Cust-2', '100$');
insert into sales_data values ('03-Jan-2021', 'Cust-2', '100$');
insert into sales_data values ('01-Feb-2021', 'Cust-2', '-100$');
insert into sales_data values ('02-Feb-2021', 'Cust-2', '-100$');
insert into sales_data values ('03-Feb-2021', 'Cust-2', '-100$');
insert into sales_data values ('01-Mar-2021', 'Cust-3', '1$');
insert into sales_data values ('01-Apr-2021', 'Cust-3', '1$');
insert into sales_data values ('01-May-2021', 'Cust-3', '1$');
insert into sales_data values ('01-Jun-2021', 'Cust-3', '1$');
insert into sales_data values ('01-Jul-2021', 'Cust-3', '-1$');
insert into sales_data values ('01-Aug-2021', 'Cust-3', '-1$');
insert into sales_data values ('01-Sep-2021', 'Cust-3', '-1$');
insert into sales_data values ('01-Oct-2021', 'Cust-3', '-1$');
insert into sales_data values ('01-Nov-2021', 'Cust-3', '-1$');
insert into sales_data values ('01-Dec-2021', 'Cust-3', '-1$');

select * from sales_data;

-- Solution using CASE statement in PostgreSQL
select customer_id
, sum(case when to_char(sales_date,'Mon-YY') = 'Jan-21' then replace(amount,'$','')::int else 0 end) as "Jan-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Feb-21' then replace(amount,'$','')::int else 0 end) as "Feb-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Mar-21' then replace(amount,'$','')::int else 0 end) as "Mar-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Apr-21' then replace(amount,'$','')::int else 0 end) as "Apr-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'May-21' then replace(amount,'$','')::int else 0 end) as "May-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Jun-21' then replace(amount,'$','')::int else 0 end) as "Jun-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Jul-21' then replace(amount,'$','')::int else 0 end) as "Jul-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Aug-21' then replace(amount,'$','')::int else 0 end) as "Aug-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Sep-21' then replace(amount,'$','')::int else 0 end) as "Sep-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Oct-21' then replace(amount,'$','')::int else 0 end) as "Oct-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Nov-21' then replace(amount,'$','')::int else 0 end) as "Nov-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Dec-21' then replace(amount,'$','')::int else 0 end) as "Dec-21"
, sum(replace(amount,'$','')::int) as total
from sales_data
group by customer_id
    union
select 'Total' as customer_id
, sum(case when to_char(sales_date,'Mon-YY') = 'Jan-21' then replace(amount,'$','')::int else 0 end) as "Jan-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Feb-21' then replace(amount,'$','')::int else 0 end) as "Feb-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Mar-21' then replace(amount,'$','')::int else 0 end) as "Mar-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Apr-21' then replace(amount,'$','')::int else 0 end) as "Apr-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'May-21' then replace(amount,'$','')::int else 0 end) as "May-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Jun-21' then replace(amount,'$','')::int else 0 end) as "Jun-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Jul-21' then replace(amount,'$','')::int else 0 end) as "Jul-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Aug-21' then replace(amount,'$','')::int else 0 end) as "Aug-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Sep-21' then replace(amount,'$','')::int else 0 end) as "Sep-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Oct-21' then replace(amount,'$','')::int else 0 end) as "Oct-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Nov-21' then replace(amount,'$','')::int else 0 end) as "Nov-21"
, sum(case when to_char(sales_date,'Mon-YY') = 'Dec-21' then replace(amount,'$','')::int else 0 end) as "Dec-21"
, null as total
from sales_data
order by 1;
