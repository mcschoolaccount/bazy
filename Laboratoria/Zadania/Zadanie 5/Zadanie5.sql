drop database podzapytania;
create database podzapytania;
use podzapytania;
create table Kraje (nazwa varchar(10) primary key, obszar float, ludnosc float, kontynent text);
insert into Kraje values ( 'Argentyna', 2766, 26, 'Ameryka'), ( 'Polska', 313, 39, 'Europa'), ('USA', 9363, 230, 'Ameryka'),('Kanada', 9363, 230, 'Ameryka'),('Albania', 28, 3, 'Europa'),('Francja', 547, 55, 'Europa'),('Angola', 1246, 9, 'Afryka');

-- 1
select kontynent, srednia
from (select kontynent, avg(obszar) as srednia from kraje group by kontynent) as idk
where kontynent like "A%";

-- 2
select kontynent, avg(obszar) from (
	select kontynent, obszar from kraje where nazwa = "Polska"
) as idk;

-- 3
select max(num) from (
	select count(*) as num from kraje group by kontynent
) as idk;

-- 4,5
select kontynent, srednia, round((select avg(ludnosc) from kraje), 2) as swiat from (
	select kontynent, avg(ludnosc) as srednia from kraje group by kontynent
) as idk;
