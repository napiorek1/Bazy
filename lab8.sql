ZAD.1

a) create trigger kreatura_before_in 
 before insert on kreatura
for each row
    begin
     if new.waga<0
    then set new.waga=0 ;
     end if;
     end
     //
	delimiter ;
	
	
	
ZAD.2

a) 
	delimiter &&
    create trigger uczestnicy_after_usun_wyp 
    before delete on wyprawa 
    for each row 
    begin
    insert into archiwum_wypraw values (old.id_wyprawy,old.nazwa,old.data_rozpoczecia,old.data_zakonczenia,(select nazwa as kirownik from kreatura where kreatura.idKreatury=old.kierownik));
    end
    && delimiter ;
	
	
ZAD.3 


a) 	 delimiter &&
    create procedure eliskirsily(in id int )
    begin
	update kreatura set udzwig=1.2*udzwig where idKreatury=id;
    end
    &&
    delimiter ;
	
	call eliskirsily(12)
	
	
b)  		
     	delimiter //
    create function wielkielitery(tekst varchar(100))
		returns varchar(100)
        begin
		return upper(tekst);
        end
		//
    delimiter ;
	
	select wielkielitery("siema");
    
	
	
ZAD.4 

a)  create table system_alarmowy(id_alarmu int primary key auto_increment,wiadomosc varchar(150))


b) delimiter &&
    create trigger alarm
    after insert on uczestnicy
    for each row
    begin
    if(select id_uczestnika=14 from uczestnicy where id_wyprawy=new.id_wyprawy) and (select sektor=7 from etapy_wyprawy where idWyprawy=new.id_wyprawy)
    then
    insert into system_alarmowy values (default,'Tesciowa nadchodzi!!!');
    end if;
    end
    &&
    delimiter ;

ZAD.5

a)  delimiter &&
    create procedure zkreatury(out srednia double,out suma double, out max double)
    begin
    select avg(udzwig),sum(udzwig),max(udzwig) into srednia,suma,max from kreatura ;
    
    
    end
    &&
    delimiter ;
    




	
	