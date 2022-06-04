#C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Filip\Documents\Domaca_zadaca\kolokviji5.sql

drop database if exists kolokvij_5;
create database kolokvij_5 default charset utf8mb4;
use kolokvij_5;

create table zarucnik(
sifra int not null primary key auto_increment,
jmbag CHAR(11),
lipa DECIMAL(12,8),
indiferentno bit not null


);

create table mladic(
sifra int not null primary key auto_increment,
kratkamajica varCHAR(48) not null,
haljina VARCHAR(30)not null,
asocijalno bit,
zarucnik int not null


);


create table ostavljena(
sifra int not null primary key auto_increment,
majica varCHAR(11),
ogrlica int not null,
carape VARCHAR(44),
stilfrizura VARCHAR(42),
punica int not null


);

create table punica(
sifra int not null primary key auto_increment,
hlace VARCHAR(43) not null,
nausnica int not null,
ogrlica int,
vesta VARCHAR(49) not null,
modelnaocala VARCHAR(31) not null,
treciputa datetime not null,
punac int not NULL


);


create table punac(
sifra int not null primary key auto_increment,
dukserica VARCHAR(33),
prviputa datetime not null,
majica VARCHAR(36),
svekar int not NULL


);

create table svekar(
sifra int not null primary key auto_increment,
bojakse VARCHAR(33),
majica VARCHAR(31),
carape VARCHAR(31) not null,
haljina VARCHAR(43),
narukvica int,
eura DECIMAL(14,5) not null


);

create table svekar_cura(
sifra int not null primary key auto_increment,
svekar int not NULL,
cura int not NULL


);

create table cura(
sifra int not null primary key auto_increment,
carape VARCHAR(41) not null,
marka DECIMAL(17,10) not null,
asocijalno bit,
vesta VARCHAR(47) not null


);


alter table mladic add foreign key (zarucnik) REFERENCES zarucnik(sifra);

alter table ostavljena add foreign key (punica) REFERENCES punica(sifra);

alter table punica add foreign key (punac) REFERENCES punac(sifra);

alter table punac add foreign key (svekar) REFERENCES svekar(sifra);

alter table svekar_cura add foreign key (svekar) REFERENCES svekar(sifra);

alter table svekar_cura add foreign key (cura) REFERENCES cura(sifra);

-- #UPDATE kolokvij_5.mladic
-- SET kratkamajica='sfafa', haljina='Osijek', asocijalno=NULL, zarucnik=0
-- WHERE sifra=0;


-- DELETE FROM kolokvij_5.ostavljena
-- WHERE ogrlica =17;

-- select majica from punac p ;


