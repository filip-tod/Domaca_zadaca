# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\Domaca_zadaca\samostan.sql

#U samostanu se nalaze svećenici. Svaki svećenik je zadužen za više poslova. 
#Jedan posao u isto vrijeme može obavljati više svećenika. Svaki svećenik ima samo jednog nadređenog svećenika.

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



insert into osoba ( ime ,prezime, email, oib)
values ('ivan', 'Pavao', 'ivan.pavao@gmail.com', '67560128274'); #SVEĆENIK # 1 #

insert into osoba ( ime ,prezime, email, oib)
values ('Matej', 'Matijević', 'matej.matijevic@gmail.com', '57183746876'); #Svećenik # 2 #

insert into osoba ( ime ,prezime, email, oib)
values ('Albert', 'Antić', 'albert.antic@gmail.com', '26710099059'); #nadređeni svećenik # 3 #

insert into osoba ( ime ,prezime, email, oib)
values ('Bruno', 'Brnić', 'bruno.brnic@gmail.com', '87559436057'); #nadređeni svećenik # 4 #


## POSLOVI ##

insert into poslovi (vrsta_posla, termin)   
values ('Misa', 2022-05-22-20-11-23);   ## posao 1 ##

insert into poslovi (vrsta_posla, termin)
values ('sahrana', 2022-05-22-14-11-23);  ## posao 2 ##


## Svećenik ##

INSERT into svecenik ( osoba, poslovi, certificiran)
values (1, 1, 'Svećenik');

INSERT into svecenik ( osoba, poslovi, certificiran)
values (2, 2, 'Svećenik');

 ## Nadređeni svećenik ##

 insert into nadredeni_svecenik ( osoba, svecenik, poslovi)
 values (3,1,1);


 insert into nadredeni_svecenik ( osoba, svecenik, poslovi)
 values (4,2,2);

 ## GG ##