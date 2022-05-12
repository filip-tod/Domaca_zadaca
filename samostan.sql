# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\Domaca_zadaca\samostan.sql

#U samostanu se nalaze svećenici. Svaki svećenik je zadužen za više poslova. Jedan posao u isto vrijeme može obavljati više svećenika. Svaki svećenik ima samo jednog nadređenog svećenika.

drop database if exists samostan;
create database samostan;
use samostan;
create table svecenik (
    sifra int not null primary key auto_increment,
    osoba int not null, 
    poslovi int not null,
    certificiran varchar(15)
);

create table poslovi (
    sifra int not null primary key auto_increment,
    vrsta_posla VARCHAR(50),
    termin datetime
);

create table nadredeni_svecenik (
    sifra int not null primary key auto_increment,
    osoba int not null,
    svecenik int not null,
    poslovi int not null
    
);


create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    oib char(11)
);

# definiranje vanjskih ključeva

alter table svecenik add foreign key (osoba) REFERENCES osoba(sifra);
ALTER TABLE svecenik add FOREIGN KEY (poslovi) REFERENCES poslovi(sifra);

alter table nadredeni_svecenik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);

alter table nadredeni_svecenik ADD FOREIGN KEY (svecenik) REFERENCES svecenik(sifra);

alter table nadredeni_svecenik ADD FOREIGN KEY (poslovi) REFERENCES poslovi(sifra);



#insert into osoba (ime)
#values ('Anamarija');

#insert into osoba (prezime)
#values ('Perić');
