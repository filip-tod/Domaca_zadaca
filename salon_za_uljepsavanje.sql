# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\Domaca_zadaca\salon_za_uljepsavanje.sql

#U salonu za uljepšavanje radi više djelatnica. Jedna djelatnica na dan radi s više korisnika. Korisnik tijekom jednog posjeta koristi jednu usluga.

drop database if exists salon_za_uljepsavanje;
create database salon_za_uljepsavanje;
use salon_za_uljepsavanje;
create table djelatnica (
    sifra int not null primary key auto_increment,
    osoba int not null, 
    iban varchar(21)
);

create table musterija (
    sifra int not null primary key auto_increment,
    osoba int not null,
    usluga int not null,
    djelatnica int not null,
    termin datetime
);

create table usluga (
    sifra int not null primary key auto_increment,
    naziv_usluge VARCHAR(50)not null,
    cijena decimal(3,2),
    trajanje int 
);


create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(20) not null,
    prezime varchar(20) not null,
    email varchar(40),
    oib char(11)
);

# definiranje vanjskih ključeva

alter table musterija add foreign key (djelatnica) REFERENCES djelatnica(sifra);
ALTER TABLE musterija add FOREIGN KEY (usluga) REFERENCES usluga(sifra);

alter TABLE musterija add FOREIGN KEY (osoba) REFERENCES osoba(sifra);

alter table djelatnica ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);



#!# OSOBA #!#
insert into osoba (ime, prezime, email, oib)
values ('Anamarija', 'Anić', 'anamarija.anic@gmail.com','27230195827');

insert into osoba (ime, prezime, email, oib)
values ('Pero', 'Perić', 'pero.peric@gmail.com','37281487492');

## USLUGA ##

insert into usluga (naziv_usluge, cijena)
values ('šišanje', '40,99');

insert into usluga ( naziv_usluge, cijena)
VALUES ('brijanje', '30,99');

## DJELATNICA ##

INSERT into djelatnica (osoba, iban)
values (1,'HR8200041242845847023');

INSERT into djelatnica (osoba, iban)
values (2,'HR0500041242515847023');

## Mušterija ##

INSERT into musterija (osoba, djelatnica, usluga, termin)
values (1,1,1,'2022-05-22 16:15:23');

INSERT into musterija (osoba, djelatnica, usluga, termin)
values (1,1,2,'2022-05-22 15:11:23');

INSERT into musterija (osoba, djelatnica, usluga, termin)
values (2,2,1,'2022-05-22 17:15:23');


