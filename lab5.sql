// LAB 5 //

Zad1.

a)  create table kreatura select * from  wikingowie.kreatura;
	create table zasob  select * from  wikingowie.zasob;
	 create table ekwipunek  select * from  wikingowie.ekwipunek;

	b) select from * zasob;
		
		
		
		c) select * from  zasob where rodzaj='jedzenie';
	
	
	
	d) select idZasobu, ilosc from ekwipunek where idKreatury IN (1,3,5);

ZAD2.


	a) select * from kreatura where rodzaj!='wiedzma' and udzwig>50;
	b) select * from zasob where waga>2 and waga<5;
	c) select * from kreatura where nazwa='%or%' and  udzwig>30 and udzwig<70;

ZAD3.


	a)  select dataPozyskania from zasob where month(dataPozyskania) IN (7,8);

	b) select * from zasob where rodzaj is not null order by waga asc; 
	
	c)  select * from kreatura  order by dataUr asc  limit 5;

ZAD4


	a) select distinct rodzaj from zasob;

	b) select concat(nazwa,rodzaj) from kreatura where rodzaj like 'wi%';
	
	c) select ilosc*waga from zasob where YEAR(dataPozyskania) between 2000 AND 2007 ;
	
ZAD5	

	a) select waga*0.7 as jedzenie_netto, waga*0.3 as smieci from zasob where rodzaj='jedzenie';
	
	b) select *  from zasob where rodzaj is NULL ;

	c) select distinct rodzaj  from zasob where nazwa like 'Ba%' or  nazwa like '%os' ;

