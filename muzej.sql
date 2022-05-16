# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\Domaca_zadaca\muzej.sql

#U muzeju postoji više izložaba. Jedna izložba ima više djela. Svaki kustos je zadužen za jednu izložbu. Svaka izložba ima jednog sponzora.


drop database if exists muzej;
create database muzej;
use muzej;
create table kustos (
    sifra int not null primary key auto_increment,
    ime VARCHAR(20),
    prezime VARCHAR(20),
    oib varchar(15),
    djelo int not null,
    izlozba int not null

);

create table izlozba (
    sifra int not null primary key auto_increment,
    naziv_izlozbe varchar(20) not null,
    broj_umjetnina varchar(50),
    djelo int not null,
    sponzor int not null
);

create table sponzor (
sifra int not null primary key auto_increment,
naziv_sponzora varchar (50),
djelo int not null

);
create table djelo (
    sifra int not null primary key auto_increment,
    ime varchar(50),
    ID_umjetnine char(10) 
    
);

# definiranje vanjskih ključeva

alter table kustos add foreign key (izlozba) REFERENCES izlozba(sifra);
ALTER TABLE izlozba add FOREIGN KEY (djelo) REFERENCES djelo(sifra);
alter table izlozba add FOREIGN KEY (sponzor) REFERENCES sponzor(sifra);

ALTER TABLE sponzor ADD FOREIGN KEY (djelo) REFERENCES djelo(sifra);


##Djelo##

INSERT into djelo ( ime, ID_umjetnine)
values ('Monalisa', '#283719287');

INSERT into djelo ( ime, ID_umjetnine)
values ('Pogled-na-more-u-Scheveningenu', '#123719295');

INSERT into djelo ( ime, ID_umjetnine)
values ('Vrisak', '#162319212');

INSERT into djelo ( ime, ID_umjetnine)
values ('Vampir', '#292319234');

INSERT into djelo ( ime, ID_umjetnine)
values ('Vrisak', '#162319212');

INSERT into djelo ( ime, ID_umjetnine)
values ('Golub-sa-graškom', '#632319219');

# SPONZOR #

INSERT into sponzor ( djelo, naziv_sponzora)
values (1, 'Adidas');

INSERT into sponzor ( djelo, naziv_sponzora)
values (2, 'Nike');

INSERT into sponzor ( djelo, naziv_sponzora)
values (3, 'Monster');

INSERT into sponzor ( djelo, naziv_sponzora)
values (4, 'Nike');

INSERT into sponzor ( djelo, naziv_sponzora)
values (5, 'Redbull');

## IZLOŽBA ##

INSERT into izlozba ( naziv_izlozbe, broj_umjetnina, djelo, sponzor)
values ('Apstraktna-umjetnost', '1', 1, 1);

INSERT into izlozba ( naziv_izlozbe, broj_umjetnina, djelo, sponzor)
values ('Apstraktna-umjetnost', '2', 2, 2);

INSERT into izlozba ( naziv_izlozbe, broj_umjetnina, djelo, sponzor)
values ('Apstraktna-umjetnost', '1', 3, 3);

INSERT into izlozba ( naziv_izlozbe, broj_umjetnina, djelo, sponzor)
values ('Apstraktna-umjetnost', '2', 4, 2);

INSERT into izlozba ( naziv_izlozbe, broj_umjetnina, djelo, sponzor)
values ('Apstraktna-umjetnost', '1', 5, 5);

## KUSTOS ##

INSERT into kustos ( ime, prezime, oib, djelo, izlozba)
values ('Pero', 'Perić', '38762485738', 1, 1);

INSERT into kustos ( ime, prezime, oib, djelo, izlozba)
values ('Ante', 'Antić', '67560128274', 2, 2);

INSERT into kustos ( ime, prezime, oib, djelo, izlozba)
values ('Mario', 'Marić', '82774076083', 3, 3);

INSERT into kustos ( ime, prezime, oib, djelo, izlozba)
values ('Branko', 'Brnić', '82774076083', 4, 4);

INSERT into kustos ( ime, prezime, oib, djelo, izlozba)
values ('Marija', 'Kikiriki', '82774076083', 5, 5);

## GG ##


