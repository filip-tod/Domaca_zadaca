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
    opcina int not NULL,
    naziv VARCHAR(50)
);

# definiranje vanjskih ključeva
alter table
    zupanija
add
    foreign key (zupan) REFERENCES zupan(sifra);

ALTER TABLE opcina add FOREIGN KEY (zupanija) REFERENCES zupanija(sifra);

alter table
    mjesto
add
    FOREIGN KEY (opcina) REFERENCES opcina(sifra);


#  zupan

insert into zupan (ime, prezime)
VALUES ('Ivan','Anušić');

insert into zupan (ime, prezime)
VALUES ('Danijel','Marušić');

insert into zupan (ime, prezime)
VALUES ('Antonija','Jozić');

# zupanija

INSERT into zupanija (naziv, zupan)
values ('Osječko-Baranjska', 1);

insert into zupanija (naziv,zupan)
values ('Brodsko-Posavska', 2);

insert into zupanija (naziv, zupan)
values ('Požeško-Slavonska',3);







