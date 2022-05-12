# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\druga_domaca_zadaca\muzej.sql

drop database if exists muzej;
create database muzej;
use muzej;
create table kustos (
    sifra int not null primary key auto_increment,
    osoba int not null, 
    oib varchar(15),
    izlozba varchar (10) not null,
    strucna_sprema varchar(20)
);

create table izlozba (
    sifra int not null primary key auto_increment,
    naziv_izlozbe varchar(20) not null,
    broj_umjetnina varchar(3),
    kustos int not null,
    sponzor int not null
);

create table sponzor (
sifra int not null primary key auto_increment,
naziv_sponzora int not null,
umjetnina int not null

);
create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    oib char(11)
);

# definiranje vanjskih ključeva

alter table kustos add foreign key (osoba) REFERENCES osoba(sifra);
ALTER TABLE izlozba add FOREIGN KEY (sponzor) REFERENCES sponzor(sifra);
alter table izlozba add FOREIGN KEY (kustos) REFERENCES kustos(sifra);

#alter Table odgajateljica add FOREIGN KEY (skupina) REFERENCES skupina(sifra);


insert into osoba (ime)
values ('Anamarija');

insert into osoba (prezime)
values ('Perić');
