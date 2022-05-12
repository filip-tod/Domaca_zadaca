# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\druga_domaca_zadaca\djeciji_vrtic.sql
drop database if exists djeciji_vrtic;

create database djeciji_vrtic;

use djeciji_vrtic;

create table odgajateljica (
    sifra int not null primary key auto_increment,
    osoba int not null,
    oib varchar(15),
    skupina varchar (10) not null,
    strucna_sprema varchar(20)
);

create table skupina (
    sifra int not null primary key auto_increment,
    naziv_skupine varchar(20) not null,
    broj_djece varchar(3),
    odgajateljica int not null
);

create table djete (
    sifra int not null primary key auto_increment,
    osoba int not null,
    skupina int not null
);

create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    oib char(11)
);

# definiranje vanjskih ključeva
alter table
    odgajateljica
add
    foreign key (osoba) REFERENCES osoba(sifra);

ALTER TABLE djete add FOREIGN KEY (osoba) REFERENCES osoba(sifra);

alter table
    djete
add
    FOREIGN KEY (skupina) REFERENCES skupina(sifra);

#alter Table odgajateljica add FOREIGN KEY (skupina) REFERENCES skupina(sifra);

insert into osoba (ime) values ('Anamarija');

insert into osoba (prezime) values ('Perić');