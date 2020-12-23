create table tor_kreglowy(idtoru int primary key auto_increment);
create table wyniki(idwynikow int primary key, punkty int unsigned, zbite_kregle_lacznie int unsigned);
create table kula(idkuli int primary key , rozmiar int unsigned, kolor enum('zielony','czerwony','niebieski','teczowy','zolty'));
create table rozgrywka(idrozgrywki int primary key auto_increment,czas time,torkreglowy int);
create table kreglarz(idkreglarza int primary key auto_increment,imie varchar(40), nazwisko varchar(40),wiek int ,wyniki int, kula int , rozgrywka int);




insert into tor_kreglowy values (default);
insert into tor_kreglowy values (default);
insert into tor_kreglowy values (default);
insert into tor_kreglowy values (default);
insert into tor_kreglowy values (default);
insert into tor_kreglowy values (default);
insert into tor_kreglowy values (default);
insert into tor_kreglowy values (default);


insert into wyniki values (1,89,60);
insert into wyniki values (2,60,51);
insert into wyniki values (3,104,70);
insert into wyniki values (4,44,33);
insert into wyniki values (5,89,60);
insert into wyniki values (6,87,58);
insert into wyniki values (7,55,49);
insert into wyniki values (8,106,72);
insert into wyniki values (9,77,55);
insert into wyniki values (10,42,31);
insert into wyniki values (11,10,6);

insert into kula values (1,10,'niebieski');
insert into kula values (2,14,'teczowy');
insert into kula values (3,12,'niebieski');
insert into kula values (4,13,'czerwony');
insert into kula values (5,8,'teczowy');
insert into kula values (6,9,'zielony');
insert into kula values (7,10,'niebieski');
insert into kula values (8,11,'zolty');
insert into kula values (9,10,'zielony');

insert into rozgrywka (idrozgrywki,czas) values (default,'00:45:30',2);
insert into rozgrywka (idrozgrywki,czas) values (default,'00:56:45',3);
insert into rozgrywka (idrozgrywki,czas) values (default,'01:00:05',4);
insert into rozgrywka (idrozgrywki,czas) values (default,'00:59:47',1);


insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Jerzy','Janowicz',34,1,2,1);
insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Krzysztof','Rybak',45,2,4,2);
insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Norbert','Nikiel',25,3,5,1);
insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Krystian','Jan',23,4,3,2);
insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Julia','Kreska',27,5,1,1);
insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Tymon','Kostantin',54,6,9,2);
insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Kamil','Nuskała',34,7,2,3);
insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Karolina','Pistacja',28,8,7,1);
insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Bartosz','Huncwot',26,9,8,3);
insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Zdzisław','Krzesło',40,10,8,4);
insert into kreglarz (idkreglarza,imie,nazwisko,wiek) values (default,'Robert','Natulski',37,11,1,4);

alter table rozgrywka add foreign key (torkreglowy) references tor_kreglowy(idtoru);
alter table kreglarz add foreign key (wyniki) references wyniki(idwynikow);
alter table kreglarz add foreign key (kula) references kula(idkuli);
alter table kreglarz add foreign key (rozgrywka) references rozgrywka(idrozgrywki);


delimiter //
create trigger wiek_nowego_zawodnika
before insert on kreglarz 
for each row
begin
if
	new.wiek < 18
then
set new.wiek=NULL;
end if;
end
//
delimiter ;

delimiter %%
create trigger 
  on 

begin


end
%%
delimiter ;

delimiter $$
create procedure gracze_w_rozgrywkach(in id int)
begin

select imie,nazwisko  from kreglarz k where rozgrywka=id;

end
$$
delimiter ;

call gracze_w_rozgrywkach(3);


delimiter &&
create function ile_lacznie_zbitych_kregli()
	returns int
begin
declare ilosc int;
select sum(zbite_kregle_lacznie) into ilosc from wyniki;
return ilosc;
end
&&
delimiter ;


select ile_lacznie_zbitych_kregli();
