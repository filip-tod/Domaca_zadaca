# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\Domaca_zadaca\udruga_za_zastitu_zivotinja.sql


#U udruzu radi više osoba. Jedna osoba se brine za jednog ili više štićenika udruge. 
#Štićenici udruge su životinje. Svaki štićenik se nalazi u jednom prostoru.



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
    adresa VARCHAR(100),
    djelatnik int not null

    
);

#

alter table sticenik add foreign key (djelatnik) REFERENCES djelatnik(sifra);

alter table sticenik add foreign key (vrsta_sticenika) REFERENCES vrsta_sticenika(sifra);

alter table sticenik add foreign key (prostor) REFERENCES prostor(sifra);

alter table udruga add foreign key (djelatnik) REFERENCES djelatnik(sifra);


#!# VRSTA ŠTIĆENIKA #!#
insert into vrsta_sticenika (ime, vrsta_zivotinje, rasa)
values ('Laki', 'Pas','Bull-dog'); 

insert into vrsta_sticenika (ime, vrsta_zivotinje, rasa)
values ('Bobi', 'Mačak','Main-coon');

insert into vrsta_sticenika (ime, vrsta_zivotinje, rasa)
values ('Rex', 'Pas','Njemački-Ovčar'); 

insert into vrsta_sticenika (ime, vrsta_zivotinje, rasa)
values ('BOB-Marley', 'Gušter','Iguana'); 

## PROSTOR ŠTIĆENIKA ##

insert into prostor (dimenzije_prostorije,naziv)
values ('20x50', 'A');

insert into prostor (dimenzije_prostorije,naziv)
values ('20x50', 'B');

insert into prostor (dimenzije_prostorije,naziv)
values ('20x50', 'C');

insert into prostor (dimenzije_prostorije,naziv)
values ('20x50', 'D');

## Djelatnik ##

INSERT into djelatnik (ime, prezime, email, oib, pocetak_radnog_vremena, zavrsetak_radnog_vremena)
values ('Jozo', 'Jozić', 'Jozo.joz@gmail,com', '81052446312', '2022-05-22 06:15:00', '2022-05-22 15:10:00');

INSERT into djelatnik (ime, prezime, email, oib, pocetak_radnog_vremena, zavrsetak_radnog_vremena)
values ('Maja', 'Majić', 'Maja.Ma@gmail,com', '71052248512', '2022-05-22 15:15:00', '2022-05-22 22:00:00');

INSERT into djelatnik (ime, prezime, email, oib, pocetak_radnog_vremena, zavrsetak_radnog_vremena)
values ('Ante', 'Pavlović', 'Doktor.CHIROPRACTIC@gmail,com', '26052666312', '2022-05-22 10:15:00', '2022-05-22 06:00:00');

## Adresa udruge i njihovi djelatnici ##

insert into udruga (adresa, djelatnik)
values ('Nemetin 171A', 1);

insert into udruga (adresa, djelatnik)
values ('Nemetin 171A', 2);

insert into udruga (adresa, djelatnik)
values ('Nemetin 171A', 3);

## Štićenik i njegov njegovatelj ##

insert into sticenik (djelatnik, vrsta_sticenika, prostor)
values (1, 1, 1);

insert into sticenik (djelatnik, vrsta_sticenika, prostor)
values (3, 2, 2);

insert into sticenik (djelatnik, vrsta_sticenika, prostor)
values (2, 3, 3);

insert into sticenik (djelatnik, vrsta_sticenika, prostor)
values (3, 4, 4);

## GG ##





