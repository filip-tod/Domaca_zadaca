# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\druga_domaca_zadaca\salon_za_uljepsavanje.sql
#Salon za uljepšavanje
#U salonu za uljepšavanje radi više djelatnica. Jedna djelatnica na dan radi s više korisnika. Korisnik tijekom jednog posjeta koristi jednu usluga.

drop database if exists salon_za_uljepsavanje;
create database salon_za_uljepsavanje;
use salon_za_uljepsavanje;
create table djelatnica (
    sifra int not null primary key auto_increment,
    osoba int not null, 
    iban varchar(15)
);

create table musterija (
    sifra int not null primary key auto_increment,
    osoba varchar(20) not null,
    usluga int not null,
    djelatnica int not null,
    termin datetime
);

create table usluga (
    sifra int not null primary key auto_increment,
    naziv_usluge VARCHAR(50)not null,
    cijena decimal(3,2),
    trajanje int not null
);


create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    oib char(11)
);

# definiranje vanjskih ključeva

alter table musterija add foreign key (djelatnica) REFERENCES djelatnica(sifra);
ALTER TABLE musterija add FOREIGN KEY (usluga) REFERENCES usluga(sifra);
alter table musterija add FOREIGN KEY (usluga) REFERENCES usluga(sifra);


alter table djelatnica ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);



insert into osoba (ime)
values ('Anamarija');

insert into osoba (prezime)
values ('Perić');

