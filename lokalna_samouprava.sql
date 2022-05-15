# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\Domaca_zadaca\lokalna_samouprava.sql

drop database if exists lokalna_samouprava;

create database lokalna_samouprava;

use lokalna_samouprava;

create table zupanija (
    sifra int not null primary key auto_increment,
    naziv VARCHAR(50),
    zupan int not null
);

create table opcina (
    sifra int not null primary key auto_increment,
    zupanija int not null,
    naziv VARCHAR(50) 
);

create table zupan (
    sifra int not null primary key auto_increment,
    ime VARCHAR(50),
    prezime VARCHAR(50) 
);

create table mjesto (
    sifra int not null primary key auto_increment,
    opcina int not null,
    naziv VARCHAR(50)
);

# definiranje vanjskih ključeva

alter table
    zupanija
add
    foreign key (zupan) REFERENCES zupan(sifra) ON DELETE CAscade;

ALTER TABLE opcina add FOREIGN KEY (zupanija) REFERENCES zupanija(sifra) ON DELETE CASCADE;

alter table
    mjesto
add
    FOREIGN KEY (opcina) REFERENCES opcina(sifra) ON DELETE CASCADE;


##  župan  ##

insert into zupan (ime, prezime)
VALUES ('Ivan','Anušić');

insert into zupan (ime, prezime)
VALUES ('Danijel','Marušić');

insert into zupan (ime, prezime)
VALUES ('Antonija','Jozić');

## županija ##

INSERT into zupanija (naziv, zupan)
values ('Osječko-Baranjska', 1);

insert into zupanija (naziv,zupan)
values ('Brodsko-Posavska', 1);

insert into zupanija (naziv, zupan)
values ('Požeško-Slavonska',2);

insert into zupanija (naziv, zupan)
values ('Splitsko-Dalmatinska',2);

insert into zupanija (naziv, zupan)
VALUES('krapinsko-zagorska', 2);

insert into zupanija (naziv, zupan)
values ('Splitsko-Dalmatinska',3);

insert into zupanija (naziv, zupan)
VALUES('Sisačko-Moslavačka', 3);

## OPĆINA ##
insert into opcina(naziv, zupanija)
values ('Kneževi-Vinogradi',1);

insert into opcina(naziv, zupanija)
values ('Darda',1);

insert into opcina(naziv, zupanija)
values ('Bilje',2);

insert into opcina(naziv, zupanija)
values ('Josipovac-Punitovački',2);

insert into opcina(naziv, zupanija)
values ('Banovci',3);

insert into opcina(naziv, zupanija)
values ('Draž',3);

## Mjesta ##

INSERT INTO mjesto (naziv, opcina)
values ('Kneževi-Vinograd', 1);

INSERT INTO mjesto (naziv, opcina)
values ('Zmajevac', 1);

## OPĆINA ##

insert into opcina(naziv, zupanija)
values ('Suza',1);

insert into opcina(naziv, zupanija)
values ('Mirkovac',1);

insert into opcina(naziv, zupanija)
values ('Jasenovac',1);

insert into opcina(naziv, zupanija)
values ('Banovci',3);

insert into opcina(naziv, zupanija)
values ('Draž',3);

insert into opcina(naziv, zupanija)
values ('Batina',3);

insert into opcina(naziv, zupanija)
values ('Gajić',3);

insert into opcina(naziv, zupanija)
values ('Topolje',3);

insert into opcina(naziv, zupanija)
values ('Karanac',1);

insert into opcina(naziv, zupanija)
values ('Grabovac',1);

## Update ##

update mjesto
set naziv = 'Belišće'
Where sifra='1';

update mjesto
set naziv = 'Valpovo'
Where sifra='2';

## DELETE ## 

DELETE FROM opcina 
WHERE 'Grabovac';  

DELETE FROM opcina 
WHERE 'Belišće';  



## ZADATAK ZAVRŠEN :)






