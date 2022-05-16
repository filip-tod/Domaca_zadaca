# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\Domaca_zadaca\taksi_sluzba.sql

#Taksi tvrtka ima više vozila. Jedno vozilo vozi jedan vozač. U jednoj vožnji vozač može prevesti više putnika. Jedan putnik se naravno može tijekom vremena imati više vožnji.

drop database if exists taksi_sluzba;
create database taksi_sluzba;
use taksi_sluzba;
create table vozac (
    sifra int not null primary key auto_increment,
    osoba int not null, 
    vozilo int not null,
    certificiran varchar(15),
    vrijeme_polaska time,
    vrijeme_dolaska time
);

create table taksi_tvrtka (
    sifra int not null primary key auto_increment,
    vozac int not null,
    vozilo int not null,
    usluga VARCHAR(50),
    cijena decimal(18,2)
);

create table vozilo (
    sifra int not null primary key auto_increment,
    broj_sasije char(17),
    marka_vozila varchar(20),
    datum_proizvodnje date
    
);


create table korisnik (
    sifra int not null PRIMARY key auto_increment,
    osoba int not NULL,
    cijena_voznje decimal(18,2)


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

alter table taksi_tvrtka ADD FOREIGN KEY (vozac) REFERENCES vozac(sifra);

alter table korisnik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);


alter table vozac add FOREIGN KEY (vozilo) REFERENCES vozilo(sifra);

alter table taksi_tvrtka add FOREIGN KEY (vozilo) REFERENCES vozilo(sifra);



# OSOBA #

insert into osoba ( ime ,prezime, email, oib)
values ('ivan', 'Pavao', 'ivan.pavao@gmail.com', '67560128274'); #vozač 1

insert into osoba ( ime ,prezime, email, oib)
values ('Matej', 'Matijević', 'matej.matijevic@gmail.com', '57183746876'); #vozač  2

insert into osoba ( ime ,prezime, email, oib)
values ('Albert', 'Antić', 'albert.antic@gmail.com', '26710099059'); #korisnik 1

insert into osoba ( ime ,prezime, email, oib)
values ('Bruno', 'Brnić', 'bruno.brnic@gmail.com', '87559436057'); #korisnik 2


## VOZILO ##

insert into vozilo ( broj_sasije ,marka_vozila ,datum_proizvodnje)
values ('WF62819H2BMD25619', 'WV', 29-03-2015 );

insert into vozilo ( broj_sasije ,marka_vozila ,datum_proizvodnje)
values ('CD62819H2BMD25618', 'Dacia', 28-04-2015 );

insert into vozilo ( broj_sasije ,marka_vozila ,datum_proizvodnje)
values ('XY62819H2BMD25312', 'Renault', 02-12-2009 );

insert into vozilo ( broj_sasije ,marka_vozila ,datum_proizvodnje)
values ('CL62819H2BMD25000', 'Audu', 20-01-2019 );


## vozač ##

insert into vozac ( osoba, vozilo, certificiran, vrijeme_polaska, vrijeme_dolaska)
values (1, 1,'Profesionalni-vozač', 16-25-00, 16-45-00);
 
 insert into vozac ( osoba, vozilo, certificiran, vrijeme_polaska, vrijeme_dolaska)
values (2,2,'Profesionalni-vozač', 17-00-00, 16-25-00);


## TAXI TVRTKA ##

insert into taksi_tvrtka (vozac, vozilo, usluga, cijena)
values (1, 1, 'Zrinjevac-Retfala', 30.99 );

insert into taksi_tvrtka (vozac, vozilo, usluga, cijena)
values (2, 2, 'Bosutsko-DGO', 40.99 );

# KORISNIK #

insert into korisnik (osoba, cijena_voznje)
values (3, 30.99);

insert into korisnik (osoba, cijena_voznje)
values (4, 40.99);




## nije dobar primjer, tablice bi mogle bit bolje povezane da imaju više smisla ##



