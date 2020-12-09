ZAD1
a) select avg(waga) from kreatura where rodzaj='wiking';


b) select rodzaj , avg(waga),  count(*) from kreatura group by rodzaj  ;

c) select rodzaj ,avg( 2020-year(dataUr)) from kreatura group by rodzaj ;

ZAD2

a) select rodzaj, count(waga) from zasob group by rodzaj;

b) select nazwa, avg(waga) from zasob where  ilosc>=4  group by nazwa having sum(waga)>10;

c) select distinct  rodzaj,count(nazwa) from zasob group by rodzaj having sum(ilosc)>1;

ZAD3

select k.nazwa,k.idKreatury,e.idKreatur,e.idZasobu from kreatura k  inner join ekwipunek e on  k.idKreatury= e.idKreatur;



a) select k.nazwa,k.idKreatury ,sum(e.ilosc)  from kreatura k join ekwipunek e on k.idKreatury=e.idKreatur group by e.idKreatur;

b) select k.nazwa,z.nazwa from kreatura k join ekwipunek e on k.idKreatury=e.idKreatur join zasob z on  e.idZasobu= z.idZasobu;

c) select k.nazwa, k.idKreatury, e.idKreatur from kreatura k  left join ekwipunek e on k.idKreatury=e.idKreatur where e.idKreatur is  null ;

ZAD4

a)  select k.nazwa, z.nazwa from kreatura k inner  join ekwipunek e on k.idKreatury=e.idKreatur inner join zasob z on e.idZasobu=z.idZasobu where year(k.dataUr) between '1670' and '1679' and k.rodzaj='wiking';



b) select k.nazwa as kreatury from kreatura k inner join ekwipunek e on k.idKreatury=e.idKreatur inner join zasob z on e.idZasobu=z.idZasobu where z.rodzaj='jedzenie' order by k.dataUr desc limit 5;


c) select k.nazwa as kreatura1 , k1.nazwa as kreatura2 from kreatura k inner join kreatura k1 on k1.idKreatury=k.idKreatury-5;


ZAD 5

a) select k.rodzaj, sum(e.ilosc ),sum(e.ilosc*z.waga) from kreatura k  ,ekwipunek e ,zasob z  where k.idkreatury=e.idKreatur and e.idZasobu=z.idZasobu  and k.rodzaj!='waz' and k.rodzaj!='malpa' and sum(e.ilosc<30) group by k.rodzaj ;

b) select k.rodzaj, k.nazwa, u.max, u.min from(select rodzaj, max(dataUr)as 'max', min(dataUr)as 'min' from kreatura group by rodzaj), kreatura k where k.dataUr=u.max or k.dataUr=u.min;





b2) select 'najmlodsza',a.maxData, b.nazwa, a.rodzaj
from (select max(dataUr) maxData, rodzaj from kreatura group by rodzaj) a,
(select nazwa, dataUr from kreatura) b where a.maxData = b.dataUr
union
select 'najstarsza',a.minData, b.nazwa, a.rodzaj
from (select min(dataUr) minData, rodzaj from kreatura group by rodzaj) a,
(select nazwa, dataUr from kreatura) b
where a.minData = b.dataUr;
