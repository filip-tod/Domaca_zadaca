# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\druga_domaca_zadaca\frizerski_salon.sql


#U frizerskom salonu radi više djelatnica. Jedna djelatnica na dan radi s više korisnika.
# Korisnik tijekom jednog posjeta koristi jednu usluga.


drop database if exists frizerski_salon;
create database frizerski_salon;
use frizerski_salon;
create table djelatnica (
    sifra int not null primary key auto_increment,
    osoba int not null, 
    iban char(21) not null
);

create table musterija (
    sifra int not null primary key auto_increment,
    osoba int not NULL,
    usluga int not null,
    djelatnica int not null,
    termin datetime not null
);

create table usluga (
    sifra int not null primary key auto_increment,
    naziv_usluge VARCHAR(50)not null,
    cijena decimal(18,2),
    trajanje datetime
);


create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    oib char(11) not null
);

# definiranje vanjskih ključeva

alter table musterija add foreign key (djelatnica) REFERENCES djelatnica(sifra);
ALTER TABLE musterija add FOREIGN KEY (usluga) REFERENCES usluga(sifra);

alter table musterija add FOREIGN KEY(osoba) REFERENCES osoba(sifra);

alter table djelatnica ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);



insert into osoba (ime, prezime, email)
values ('Anamarija', 'Anić', 'anamarija.anic@gmail.com');

insert into osoba (ime, prezime, email)
values ('Pero', 'Perić', 'pero.peric@gmail.com');

insert into usluga (naziv_usluge, cijena)
values ('šišanje', '40,99');

insert into usluga ( naziv_usluge, cijena)
VALUES ('brijanje', '30,99');


