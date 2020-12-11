ZAD 1

a) create table etapy_wyprawy like wikingowie.etapy_wyprawy;
	
	insert into etapy_wyprawy select * from wikingowie.etapy_wyprawy;
	
	create table sektor like wikingowie.sektor;
	
	 insert into sektor select * from wikingowie.sektor;
	
	create table uczestnicy like wikingowie.uczestnicy;
	
	insert into uczestnicy select * from wikingowie.uczestnicy;
	
	create table wyprawa like wikingowie.wyprawa;
	
	insert into wyprawa select * from wikingowie.wyprawa;
	
	\\ jeszcze klucze obce trzeba dodac
	
b) 	select k.nazwa, u.id_wyprawy from kreatura k left join uczestnicy u on k.idKreatury=u.id_wyprawy where id_wyprawy IS NULL ;




c) 


ZAD 2

a) select w.nazwa, group_concat(k.nazwa separator " ") from kreatura k join uczestnicy u on u.id_uczestnika=k.idKreatury join wyprawa w on w.id_wyprawy=u.id_wyprawy group by w.nazwa;


b) select ew.idEtapu , s.nazwa,w.kierownik,w.data_rozpoczecia from etapy_wyprawy ew join sektor s on s.id_sektora= ew.sektor join wyprawa w on w.id_wyprawy=ew.idWyprawy join kreatura k on k.idKreatury= w.kolejnosc group by ew.idEtapu order by w.data_rozpoczecia desc, ew.idEtapu;


ZAD 3

a) select s.nazwa ,count(ew.sektor) from etapy_wyprawy ew right  join sektor s on ew.sektor=s.id_sektora group by s.nazwa ;


b) select k.nazwa , if(count(w.id_wyprawy)>0," bral udzial","nie bral udzialu") from kreatura k left join wyprawa w on w.kierownik=k.idKreatury group by k.nazwa ;

ZAD 4

a) select w.nazwa, sum(length(et.dziennik)) from wyprawa w join etapy_wyprawy et on w.id_wyprawy=et.idWyprawy group by w.nazwa having sum(length(et.dziennik))<400;

b) select w.nazwa, sum(z.waga*e.ilosc)/count(distinct u.id_uczestnika) as srednia_waga_zasobow from wyprawa w left join uczestnicy u on u.id_wyprawy=w.id_wyprawy left join ekwipunek e on e.idKreatur=u.id_uczestnika left join zasob z on z.idZasobu=e.idZasobu group by w.id_wyprawy;


ZAD.5 

a) select k.nazwa, datediff(w.data_rozpoczecia,k.dataUr) from kreatura k join uczestnicy u on u.id_uczestnika=k.idKreatury join wyprawa w on w.id_wyprawy=u.id_wyprawy join etapy_wyprawy ew on ew.idWyprawy=w.id_wyprawy join sektor s on s.idSektora=ew.sektor where s.nazwa="Chatka Dziadka";




