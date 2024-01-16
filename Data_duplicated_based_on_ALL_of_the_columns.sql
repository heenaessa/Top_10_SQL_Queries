/* ##########################################################################
   <<<<>>>> Scenario 2: Data duplicated based on ALL of the columns <<<<>>>>
   ########################################################################## */

-- Requirement: Delete duplicate entry for a car in the CARS table.

drop table if exists cars;
create table if not exists cars
(
    id      int,
    model   varchar(50),
    brand   varchar(40),
    color   varchar(30),
    make    int
);
insert into cars values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into cars values (2, 'EQS', 'Mercedes-Benz', 'Black', 2022);
insert into cars values (3, 'iX', 'BMW', 'Red', 2022);
insert into cars values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);
insert into cars values (1, 'Model S', 'Tesla', 'Blue', 2018);
insert into cars values (4, 'Ioniq 5', 'Hyundai', 'White', 2021);

select * from cars;


-->> SOLUTION 1: Delete using CTID / ROWID (in Oracle)
delete from cars
where ctid in ( select max(ctid)
                from cars
                group by model, brand
                having count(1) > 1);


-->> SOLUTION 2: By creating a temporary unique id column
alter table cars add column row_num int generated always as identity

delete from cars
where row_num not in (select min(row_num)
                      from cars
                      group by model, brand);

alter table cars drop column row_num;


-->> SOLUTION 3: By creating a backup table.
create table cars_bkp as
select distinct * from cars;

drop table cars;
alter table cars_bkp rename to cars;


-->> SOLUTION 4: By creating a backup table without dropping the original table.
create table cars_bkp as
select distinct * from cars;

truncate table cars;

insert into cars
select distinct * from cars_bkp;

drop table cars_bkp;