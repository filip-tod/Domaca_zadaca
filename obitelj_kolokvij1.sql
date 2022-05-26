# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Filip\Documents\Domaca_zadaca\obitelj_kolokvij1.sql


drop database if exists obitelj;
create database obitelj default charset utf8mb4;
use obitelj;


create table Muskarac (
    sifra int not null primary key auto_increment,
    bojaociju VARCHAR(50)not null,
    hlace VARCHAR(30),
    modelnaocala VARCHAR(43),
    marka DECIMAL(14, 5) NOT NULL,
    zena int not null


);

create table mladic (
    sifra int not null primary key auto_increment,
    suknja VARCHAR (48) not null,
    kuna DECIMAL(16,8)  not NULL,
    drugiputa datetime,
    asocijalno BIT,
    ekstroventno bit  not null,
    dukserica VARCHAR(48)  not NULL,
    muskarac int
);

create table zena (
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace VARCHAR(46),
    kratkamajica VARCHAR(31) not null,
    jmbag CHAR(11)not null,
    bojaociju VARCHAR(39)not NULL,
    haljina VARCHAR(44),
    sestra int not null


);

create table svekar (
    sifra int not null primary key auto_increment,
    bojaociju VARCHAR(40) not null,
    prstena int,
     dukserica VARCHAR(41),
    lipa DECIMAL(13,8),
    eura decimal (12,7),
    majica VARCHAR(35)


);
create table sestra_svekar (
    sifra int not null primary key auto_increment,
    sestra int not NULL,
    svekar int not NULL


);

create table sestra (
   sifra int not null primary key auto_increment,
    introvento int not null,
    haljina bit not null,
    marka decimal (16, 6),
    hlace VARCHAR(46) not null,
    narukvica int not NULL

);

create table punac (
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca DECIMAL(14.9),
    hlace VARCHAR(41)
    

);


create table cura  (
   sifra int not null primary key auto_increment,
    novcica decimal not null,
    gustoca decimal (18,6),
    lipa DECIMAL(13, 10),
    ogrlica int not null,
    bojakose VARCHAR(38),
    suknja VARCHAR(36),
    punac int
    
);


alter table zena add foreign key (sestra) REFERENCES sestra(sifra);
alter table muskarac add foreign key (zena) REFERENCES zena(sifra);

alter table sestra_svekar add foreign key (sestra) REFERENCES sestra(sifra);
alter table sestra_svekar add foreign key (svekar) REFERENCES svekar(sifra);

alter table mladic add foreign key (muskarac) REFERENCES muskarac(sifra);

alter table cura add foreign key (punac) REFERENCES punac(sifra);

insert into cura (gustoca)
VALUES (15.77);

INSERT into mladic(kuna)
values (10.70),
       (15.80),
       (7.21),
       (20.02),
       (14.02);

delete from mladic WHERE kuna<15.78;


-- select * from mladic ;
-- select * from zena where hlace and kratkamajica ='%ana%';
