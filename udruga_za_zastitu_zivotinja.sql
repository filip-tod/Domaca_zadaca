# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\Domaca_zadaca\udruga_za_zastitu_zivotinja.sql

#U udruzu radi više osoba. Jedna osoba se brine za jednog ili više štićenika udruge. Štićenici udruge su životinje. Svaki štićenik se nalazi u jednom prostoru.


drop database if exists udruga_za_zastitu_zivotinja;
create database udruga_za_zastitu_zivotinja;
use udruga_za_zastitu_zivotinja;
create table djelatnik (
    sifra int not null primary key auto_increment,
    ime VARCHAR(30) not NULL,
    prezime VARCHAR(30) not NULL,
    email VARCHAR(50),
    oib char(11),
    pocetak_radnog_vremena datetime,
    zavrsetak_radnog_vremena datetime

   
);

create table sticenik (
    sifra int not null primary key auto_increment,
    djelatnik int not NULL,
    vrsta_sticenika int not null,
    prostor int not null
  
);

create table prostor (
    sifra int not null primary key auto_increment,
dimenzije_prostorije VARCHAR (50),
naziv VARCHAR(50)
    

);


create TABLE vrsta_sticenika (
sifra int not null PRIMARY key auto_increment,
ime VARCHAR(30),
vrsta_zivotinje VARCHAR(30),
rasa VARCHAR (30)
);



create table udruga  (
    sifra int not null primary key auto_increment,
    adresa VARCHAR(50),
    djelatnik int not null

    
);

#

alter table sticenik add foreign key (djelatnik) REFERENCES djelatnik(sifra);

alter table sticenik add foreign key (vrsta_sticenika) REFERENCES vrsta_sticenika(sifra);

alter table sticenik add foreign key (prostor) REFERENCES prostor(sifra);

alter table udruga add foreign key (djelatnik) REFERENCES djelatnik(sifra);

