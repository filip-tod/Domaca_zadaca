#C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Filip\Documents\Domaca_zadaca\kolokvij4.sql


drop database if exists kolokvij_4;
create database kolokvij_4 default charset utf8mb4;
use kolokvij_4;

create table punac(
sifra int not null primary key auto_increment,
treciputa datetime,
majica VARCHAR(46),
jmbg CHAR(11),
novcanica decimal (18,7)not null,
marka DECIMAL(12,6)not null,
ostavljen int not null

);

CREATE Table ostavljen(
sifra int not null primary key auto_increment,
modelnaocala VARCHAR(43),
introvertno bit ,
kuna decimal (14,10)

);

create table snasa (
    sifra int not null primary key auto_increment,
    introvertno bit ,
    treciputa datetime,
    haljina VARCHAR(44) not null,
    zena int not NULL
);
 
 create table becar (
sifra int not null primary key auto_increment,
novcanica DECIMAL (14,8),
kratkamajica VARCHAR(48) not null,
bojaociju VARCHAR(36) not null,
snasa int not null

 );


CREATE table prijatelj (
sifra int not null primary key auto_increment,
eura decimal (16,9),
prstena int not null,
gustoca decimal (16,5),
jmbag  CHAR(11) not null,
suknja VARCHAR(47)not null,
becar int not NULL


);


CREATE TABLE zena (
sifra int not null primary key auto_increment,
suknja VARCHAR(39) not null,
lipa decimal (18,7),
prsten int not null
);

CREATE Table zena_mladic(
    sifra int not null primary key auto_increment,
    zena int not NULL,
    mladic int not NULL
);

CREATE TABLE mladic (
    sifra int not null primary key auto_increment,
   kuna decimal (15,9),
   lipa DECIMAL (18,5),
   nausnica int,
   stilfrizura VARCHAR( 49),
   vesta VARCHAR(34)
);



alter table punac add foreign key (ostavljen) REFERENCES ostavljen(sifra);

alter table zena_mladic add foreign key (mladic) REFERENCES mladic(sifra);

alter table prijatelj add foreign key (becar) REFERENCES becar(sifra);

alter table becar add foreign key (snasa) REFERENCES snasa(sifra);

alter table snasa add foreign key (zena) REFERENCES zena(sifra);

alter table zena_mladic add foreign key (zena) REFERENCES zena(sifra);

-- INSERT INTO kolokvij_4.zena
-- (suknja, lipa, prsten)
-- VALUES('kikiriki', NULL, 3);


-- INSERT INTO kolokvij_4.snasa
-- (introvertno, treciputa, haljina, zena)
-- VALUES(NULL, NULL, 'smeđa', 3);


-- INSERT INTO kolokvij_4.becar
-- (novcanica, kratkamajica, bojaociju, snasa)
-- VALUES(NULL, 'bordo', 'zelene', 3);

-- UPDATE kolokvij_4.punac
-- SET treciputa=NULL, majica='Osijek', jmbg=NULL, novcanica=0, marka=0, ostavljen=0;

-- select * from prijatelj p;
-- INSERT INTO kolokvij_4.prijatelj
-- (eura, prstena, gustoca, jmbag, suknja, becar)
-- VALUES(NULL, 99, NULL, 'skjda', 'dsadadsa', 3);


-- DELETE FROM kolokvij_4.prijatelj
-- WHERE prstena>=14;

-- select haljina from snasa s ;

-- select f.nausnica, a.jmbag , b.kratkamajica 
-- from  prijatelj a inner join becar b 
-- on a.sifra = b.sifra 
-- inner join snasa c 
-- on b.sifra =c.sifra 
-- inner join zena d 
-- on c.sifra= d.sifra 
-- inner join zena_mladic e 
-- on d.sifra=e.sifra 
-- inner join mladic f 
-- on e.sifra=f.sifra 
-- where d.lipa != 29
-- group by b.kratkamajica desc ;


-- select a.lipa, a.suknja 
-- from zena a left join zena_mladic b
-- on a.sifra = b.sifra;