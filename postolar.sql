# linija koja počne s hash (shift + 3) je komentar
# Ovo je SQL skripta
# naredba za izvođenje
# C:\xampp\mysql\bin\mysql -uroot < C:\Users\Filip\Documents\Domaca_zadaca\postolar.sql


#Postolar popravlja obuću. Jedan korisnik može postolaru donijeti više komada obuće na popravak dok jedan komad obuće može biti više puta na popravku. 
#Postolar ima šegrta koji sudjeluje u određenim popravcima obuće.

drop database if exists postolar;
create database postolar;
use postolar;
create table majstor (
    sifra int not null primary key auto_increment,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    oib CHAR (11)
 
);

create table postolarska_radnja (
    sifra int not null primary key auto_increment,
    racun decimal(18,2),
    vrijeme_zavrsetka_obuce datetime,
    majstor int not NULL,
    musterija int not null   # dva vanjska ključa musterija i majstor ##


);

create table poslovi (
    sifra int not null primary key auto_increment,
majstor int not null, 
musterija int not null,
cijena decimal

    
);


create table musterija (
    sifra int not null PRIMARY key auto_increment,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    oib char(11),
   obuca_za_popravak VARCHAR(50)



);


# definiranje vanjskih ključeva

alter table postolarska_radnja add foreign key (musterija) REFERENCES musterija(sifra);
alter table postolarska_radnja add foreign key (majstor) REFERENCES majstor(sifra);

alter table poslovi add foreign key (majstor) REFERENCES majstor(sifra);

alter table poslovi add foreign key (musterija) REFERENCES musterija(sifra);


## MAJSTORI ##

INSERT into majstor ( ime, prezime, oib)
values ('Branko', 'Brnić', '82774076083');

INSERT into majstor ( ime, prezime, oib)
values ('Miro', 'Šimić', '92774336083');


## MUŠTERIJE ##

INSERT into musterija ( ime, prezime, oib, obuca_za_popravak)
values ('Ante', 'Brnić', '58545415554', 'Tenisice');


INSERT into musterija ( ime, prezime, oib, obuca_za_popravak)
values ('Ante', 'Buljbašić', '35814864838', 'remen');

INSERT into musterija ( ime, prezime, oib, obuca_za_popravak)
values ('Anita', 'Anić', '10557094145', 'Štikkle');

INSERT into musterija ( ime, prezime, oib, obuca_za_popravak)
values ('Marija', 'Marić', '74484441827', 'Štikkle');                      # 4 mušterije  #



## Postolarska radnja ##



INSERT into postolarska_radnja ( racun, vrijeme_zavrsetka_obuce, majstor, musterija)  # prvi posao uz cijenu i vrijeme završetka tog posla ##
values (29.99, 2022-05-22-16-15-23, 1, 1);


INSERT into postolarska_radnja ( racun, vrijeme_zavrsetka_obuce, majstor, musterija)  # drugi osao uz cijenu i vrijeme završetka tog posla ##
values (10.99, 2022-05-22-17-15-23, 1, 2);


INSERT into postolarska_radnja ( racun, vrijeme_zavrsetka_obuce, majstor, musterija)  # treći posao uz cijenu i vrijeme završetka tog posla ##
values (50.99, 2022-05-22-18-15-23, 2, 3);


INSERT into postolarska_radnja ( racun, vrijeme_zavrsetka_obuce, majstor, musterija)  # prvi posao uz cijenu i vrijeme završetka tog posla ##
values (50.99, 2022-05-22-15-15-23, 2, 4);



## POSLOVI ##

insert into poslovi (majstor, musterija, cijena)
values (1, 1, 29.99);


insert into poslovi (majstor, musterija, cijena) 
values (1, 2, 10.99);

insert into poslovi (majstor, musterija, cijena)     #### KOD PROLAZI ALI MI SE NESVIĐA OVAJ DIO, MOGU BOLJE ODRADITI "POSLOVI" JER U POSTOLARSKA RADNJA POSTOJI TAJ KOD ####
values (2, 3, 50.99);

insert into poslovi (majstor, musterija, cijena)
values (2, 4, 50.99);





