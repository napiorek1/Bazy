ZAD 2
c) insert into postac values  (7,'Gertruda_nieszczera','syrena','1900-11-08','65',NULL,NULL,1235433234);


ZAD 3
a) select nazwa from postac where nazwa like '%a%';
	update postac set osoba_do_statku='pogromca' where nazwa like '%a%';

b) update statek set max_ladownosc= max_ladownosc*0.7 where data_wodowania between '1900-01-01' and '2001-01-01';
	
	
c) alter table postac add  check ( 'wiek' <= 1000 )

	
ZAD 4

a) alter table postac modify rodzaj enum('waz', 'kobieta', 'ptak', 'wiking', 'syrena') ;


	insert into postac values ('9','Loko','waz','1998-09-17',28 ,null ,null , 12358930321)


b)  create table marynarz like postac;
		insert into marynarz select * from postac where osoba_do_statku 'pogromca' ;
		insert into marynarz select * from postac where osoba_do_statku = 'drakkar' ;
		
		
		
		
ZAD 5		

	a) delete from statek where nazwa= 'Pogromca';
		delete from statek where nazwa= 'Zdobywca';

	b)  delete from postac where nazwa= 'Klanb';
		c)  w sumie to jest zrobione
		d) drop table statek;
		e) create table zwierz (id int primary key auto_increment,nazwa varchar(50),wiek int);
		f) insert into zwierz values (default, 'Loko' , 28);
			insert into zwierz values (default, 'Drozd' , 64);
