# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\druga_domaca_zadaca\taksi_sluzba.sql

drop database if exists taksi_sluzba;
create database taksi_sluzba;
use taksi_sluzba;
create table vozac (
    sifra int not null primary key auto_increment,
    osoba int not null, 
    vozilo int not null,
    korisnik int not null,
    certificiran varchar(15)
);

create table taksi_tvrtka (
    sifra int not null primary key auto_increment,
    vozac int not null,
    usluga VARCHAR(20),
    cijena decimal(3,2)
);

create table vozilo (
    sifra int not null primary key auto_increment,
    broj_sasije int not null,
    vozac int not null,
    marka_vozila varchar(20),
    datum_proizvodnje datetime
    
);


create table korisnik (
    sifra int not null PRIMARY key auto_increment,
    osoba int not NULL,
    vozac int not null,
    cijena_voznje decimal(3,2)

);


create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    oib char(11)
);

# definiranje vanjskih ključeva

alter table vozac add foreign key (osoba) REFERENCES osoba(sifra);
ALTER TABLE vozac add FOREIGN KEY (korisnik) REFERENCES korisnik(sifra);

alter table taksi_tvrtka ADD FOREIGN KEY (vozac) REFERENCES vozilo(sifra);

alter table korisnik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);


alter table vozac add FOREIGN KEY (vozilo) REFERENCES vozilo(sifra);



# unos podataka
insert into osoba (ime)
values ('Anamarija');

insert into osoba (prezime)
values ('Perić');

