# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Filip\Documents\Domaca_zadaca\kolokvij_3.sql


drop database if exists kolokvij_3;
create database kolokvij_3 default charset utf8mb4;
use kolokvij_3;



create table cura (
sifra int not null primary key auto_increment,
dukserica VARCHAR(49),
marka decimal(13,7),
drugiputa datetime,
majica VARCHAR(49),
novcanica decimal (15,8),
ogrlica int not NULL
);

create table svekar (
sifra int not null primary key auto_increment,
novcanica decimal(16,8) not null,
suknja VARCHAR(44) not null,
bojakose VARCHAR(36),
prsten int,
narukvica int not NULL,
cura int not NULL
);

create table brat (
sifra int not null primary key auto_increment,
jmbg char (11),
ogrlica int not NULL,
ekstrovertno bit not null
);

create table prijatelj_brat (
sifra int not null primary key auto_increment,
prijatelj int not NULL,
brat int not NULL
);

create table punica  (
sifra int not null primary key auto_increment,
asocijalno bit,
kratkamajica VARCHAR(44),
kuna decimal (13,8)not null,
vesta VARCHAR(38)not null,
snasa int
);

create table snasa (
sifra int not null primary key auto_increment,
introvertno bit,
kuna DECIMAL(15,6)not null,
eura DECIMAL(12,9)not NULL,
treciputa datetime,
ostavljena int not NULL
);

create table ostavljena (
sifra int not null primary key auto_increment,
kuna DECIMAL(17,5),
lipa DECIMAL(16,6),
majica VARCHAR(36),
modelnaocala VARCHAR(31) not null,
prijatelj int
);

create table prijatelj (
sifra int not null primary key auto_increment,
kuna DECIMAL(16,10),
haljina VARCHAR(37),
lipa DECIMAL(15,6),
dukserica decimal (13,10),
indiferentno BIT not NULL
);




Alter table svekar add foreign key (cura) REFERENCES cura(sifra);
Alter table punica add foreign key (snasa) REFERENCES snasa(sifra);
Alter table snasa add foreign key (ostavljena) REFERENCES ostavljena(sifra);
Alter table ostavljena  add foreign key (prijatelj) REFERENCES prijatelj(sifra);
Alter table prijatelj_brat add foreign key (brat) REFERENCES brat(sifra);
Alter table prijatelj_brat add foreign key (prijatelj) REFERENCES prijatelj(sifra);


insert into prijatelj (sifra,kuna,haljina, lipa, dukserica, indiferentno  )
values                (null,'15.25', '20.30', 'plava-dugačka', '19.99', 0 ),
                      (null,'16.25', '15.30', 'crna-dugačka', '20.99', 1 ),
                      (null,'13.25', '10.30', 'ljubičasta-dugačka', '99.99', 0 );

insert into ostavljena (sifra,kuna,lipa,majica,modelnaocala,prijatelj)
values                 (null,'92.22', '10.20', 'plava-kratka','ray-ban', 1),
                       (null,'20.22', '30.20', 'crna-kratka','Carrera', 2),
                       (null,'10.22', '99.20', 'smeđa-kratka','Gucci', 3);
insert into brat (sifra,jmbg, ogrlica, ekstrovertno)
values           (null, '12345678912', 1, 1),
                 (null, '12345678912', 2, 0),
                 (null, '12345678912', 3, 0);


insert into prijatelj_brat (sifra, prijatelj, brat)
values                     (null, 1, 2),
                           (null, 2,1 ),
                           (null, 3, 3);


-- UPDATE kolokvij_3.svekar
-- SET novcanica=0, suknja='Osijek', bojakose=NULL, prsten=NULL;

-- select * from svekar;


-- INSERT INTO kolokvij_3.svekar
-- (novcanica, suknja, bojakose, prsten, narukvica, cura)
-- VALUES(16.2, 'kikiriki', NULL, NULL, 1, 5);


-- DELETE FROM kolokvij_3.punica
-- WHERE kratkamajica like '%ab%';

-- select * from ostavljena o ;
-- select majica from ostavljena where lipa != 9 or 10 or 20 or 30 or 35;


-- on a. sifra = b.sifra 
-- inner join prijatelj c 
-- on b.sifra=c.sifra 
-- inner join ostavljena d 
-- on c.sifra=d.sifra 
-- inner join snasa e 
-- on d.sifra =e.sifra 
-- inner join punica f 
-- on e.sifra = f.sifra 
-- where d.lipa !=91 and c.haljina like '%ba%'
-- order by kuna desc,  snasa  ;


-- select a.kuna , a.haljina 
-- from prijatelj a inner join prijatelj_brat b 
-- on a.sifra !=b.sifra ;




