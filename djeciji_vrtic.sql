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
    pocetak_smjene datetime,
    kraj_smjene datetime,
    skupina int not null
);

create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
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


alter Table odgajateljica add FOREIGN KEY (osoba) REFERENCES osoba(sifra);

## ODGAJATELJICE I DJECA ##


insert into osoba (ime, prezime, oib )
values ('Marija', 'Marić', '81274523049'); ## ODgajateljica ##

insert into osoba (ime, prezime, oib )
values ('Melita', 'Milić','Marija', '61274553021'); ## Odgajateljica ##


insert into osoba (ime, prezime, oib )
values ('Marko', 'Marušić','21274523010'); ## djete ## 


insert into osoba (ime, prezime, oib )
values ('Magdalena', 'Brkić' '11274523029'); ## djete ##





