# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\druga_domaca_zadaca\udruga_za_zastitu_zivotinja.sql

drop database if exists udruga_za_zastitu_zivotinja;
create database udruga_za_zastitu_zivotinja;
use udruga_za_zastitu_zivotinja;
create table djelatnik (
    sifra int not null primary key auto_increment,
    osoba int not null, 
    oib varchar(15)
);

create table sticenici (
    sifra int not null primary key auto_increment,
    zivotinja varchar(20) not null,
    prostor int not null,
    djelatnik int not null
);

create table prostor (
    sifra int not null primary key auto_increment,
    naziv_prostorije VARCHAR(50)not null,
    djelatnik int not null
);


create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    oib char(11)
);

# definiranje vanjskih ključeva

alter table djelatnik add foreign key (osoba) REFERENCES osoba(sifra);
ALTER TABLE sticenici add FOREIGN KEY (prostor) REFERENCES prostor(sifra);
alter table prostor add FOREIGN KEY (djelatnik) REFERENCES djelatnik(sifra);


insert into osoba (ime)
values ('Anamarija');

insert into osoba (prezime)
values ('Perić');

