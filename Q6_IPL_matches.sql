--- Q6 : IPL Matches --- 

drop table teams;
create table teams
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );

insert into teams values ('RCB', 'Royal Challengers Bangalore');
insert into teams values ('MI', 'Mumbai Indians');
insert into teams values ('CSK', 'Chennai Super Kings');
insert into teams values ('DC', 'Delhi Capitals');
insert into teams values ('RR', 'Rajasthan Royals');
insert into teams values ('SRH', 'Sunrisers Hyderbad');
insert into teams values ('PBKS', 'Punjab Kings');
insert into teams values ('KKR', 'Kolkata Knight Riders');
insert into teams values ('GT', 'Gujarat Titans');
insert into teams values ('LSG', 'Lucknow Super Giants');
commit;

-- Solution for 1: Each team plays with every other team JUST ONCE.
WITH matches AS
    (SELECT row_number() over(order by team_name) AS id, t.*
     FROM teams t)
SELECT team.team_name AS team, opponent.team_name AS opponent
FROM matches team
JOIN matches opponent ON team.id < opponent.id
ORDER BY team;

-- Solution for 2: Each team plays with every other team TWICE.
WITH matches AS
    (SELECT row_number() over(order by team_name) AS id, t.*
     FROM teams t)
SELECT team.team_name AS team, opponent.team_name AS opponent
FROM matches team
JOIN matches opponent ON team.id <> opponent.id
ORDER BY team;