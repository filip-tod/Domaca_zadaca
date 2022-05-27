# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Filip\Documents\Domaca_zadaca\kolokvij_2.sql


drop database if exists kolokvij_2;
create database kolokvij_2 default charset utf8mb4;
use kolokvij_2;



create table neprijatelj (
    sifra int not null primary key auto_increment,
   majica VARCHAR(32),
   haljina VARCHAR(43) not null,
   lipa DECIMAL(16,8),
   modelnaocala VARCHAR(49) not null,
   kuna DECIMAL(12,6) not null,
   jmbag CHAR(11),
   cura int

);

create table cura (
    sifra int not null primary key auto_increment,
    haljina VARCHAR(33) not null,
    drugiputa DATetime not null,
    suknja VARCHAR(38),
    narukvica int,
    introvetno bit,
    majica VARCHAR(40) not null,
    decko int


);

create table decko(
    sifra int not null primary key auto_increment,
    indeferentno bit,
    vesta VARCHAR(34),
    asocijalno bit not null



);

create table decko_zarucnica (
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null


);



create table zarucnica (
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose VARCHAR(37) not null,
    novcanica DECIMAL(15,9),
    lipa DECIMAL(15,8),
    indeferentno bit not null

);

create table brat (
    sifra int not null primary key auto_increment,
    suknja VARCHAR(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not NULL


);

create table prijatelj (
    sifra int not null primary key auto_increment,
    modelnaocala VARCHAR(37),
    treciputa datetime not null,
    ekstrovertno bit not null,
    prviputa datetime,
    svekar int not null

);

create table svekar (
    sifra int not null primary key auto_increment,
    stilfrizura VARCHAR(48),
    ogrlica int not null,
    asocijalno bit not null


);


Alter table prijatelj add foreign key (svekar) REFERENCES svekar(sifra);


Alter table decko_zarucnica add foreign key (zarucnica) REFERENCES zarucnica(sifra);

Alter table decko_zarucnica add foreign key (decko) REFERENCES decko(sifra);

Alter table cura add foreign key (decko) REFERENCES decko(sifra);

Alter table neprijatelj add foreign  key (cura) REFERENCES cura(sifra);

Alter table brat add foreign  key (neprijatelj) REFERENCES neprijatelj(sifra);





