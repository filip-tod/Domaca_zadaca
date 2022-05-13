# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\Domaca_zadaca\djeciji_vrtic.sql

#U dječjem vrtiću postoji više odgojnih skupina. Svaka odgojna skupina ima više djece i vodi ih jedna odgajateljica. Odgajateljica ima jednu stručnu spremu.


drop database if exists djeciji_vrtic;

create database djeciji_vrtic;

use djeciji_vrtic;

create table odgajateljica (
    sifra int not null primary key auto_increment,
    osoba int not null,
    oib char(11),
    email VARCHAR(50),
    strucna_sprema varchar(20),
    pocetak_smjene datetime,
    kraj_smjene datetime
);

create table skupina (
    sifra int not null primary key auto_increment,
    naziv_skupine varchar(20) not null,
    broj_djece varchar(20),
    odgajateljica int not null
);

create table djete (
    sifra int not null primary key auto_increment,
    osoba int not null,
    oib VARCHAR(50),
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

insert into osoba (ime, prezime)
 values ('Anamarija', 'Antić');

insert into osoba (ime,prezime) 
values ('Pero','Perić');
