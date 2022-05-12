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
naziv_sponzora int not null,
djelo int not null

);
create table djelo (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    ID_umjetnine varchar(50) not null,
    kustos int not null
    
);

# definiranje vanjskih ključeva

alter table kustos add foreign key (izlozba) REFERENCES izlozba(sifra);
ALTER TABLE izlozba add FOREIGN KEY (djelo) REFERENCES djelo(sifra);
alter table izlozba add FOREIGN KEY (sponzor) REFERENCES sponzor(sifra);

ALTER TABLE sponzor ADD FOREIGN KEY (djelo) REFERENCES djelo(sifra);

ALTER TABLE djelo ADD FOREIGN KEY (kustos) REFERENCES kustos(sifra);

#alter Table odgajateljica add FOREIGN KEY (skupina) REFERENCES skupina(sifra);

