# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Filip\Documents\Domaca_zadaca\kolokvij_2.sql


drop database if exists kolokvij_2;
create database kolokvij_2 default charset utf8mb4;
use kolokvij_2;



create table neprijatelj (
    sifra int not null primary key auto_increment,
   majica VARCHAR(32),
   haljina VARCHAR(43) not null,
   lipa DECIMAL(16,8),
   modelnaocala VARCHAR(49) not null,
   kuna DECIMAL(12,6) not null,
   jmbag CHAR(11),
   cura int

);

create table cura (
    sifra int not null primary key auto_increment,
    haljina VARCHAR(33) not null,
    drugiputa DATetime not null,
    suknja VARCHAR(38),
    narukvica int,
    introvetno bit,
    majica VARCHAR(40) not null,
    decko int


);

create table decko(
    sifra int not null primary key auto_increment,
    indeferentno bit,
    vesta VARCHAR(34),
    asocijalno bit not null



);

create table decko_zarucnica (
    sifra int not null primary key auto_increment,
    decko int not null,
    zarucnica int not null


);



create table zarucnica (
    sifra int not null primary key auto_increment,
    narukvica int,
    bojakose VARCHAR(37) not null,
    novcanica DECIMAL(15,9),
    lipa DECIMAL(15,8),
    indeferentno bit not null

);

create table brat (
    sifra int not null primary key auto_increment,
    suknja VARCHAR(47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not NULL


);

create table prijatelj (
    sifra int not null primary key auto_increment,
    modelnaocala VARCHAR(37),
    treciputa datetime not null,
    ekstrovertno bit not null,
    prviputa datetime,
    svekar int not null

);

create table svekar (
    sifra int not null primary key auto_increment,
    stilfrizura VARCHAR(48),
    ogrlica int not null,
    asocijalno bit not null


);


Alter table prijatelj add foreign key (svekar) REFERENCES svekar(sifra);


Alter table decko_zarucnica add foreign key (zarucnica) REFERENCES zarucnica(sifra);

Alter table decko_zarucnica add foreign key (decko) REFERENCES decko(sifra);

Alter table cura add foreign key (decko) REFERENCES decko(sifra);

Alter table neprijatelj add foreign  key (cura) REFERENCES cura(sifra);

Alter table brat add foreign  key (neprijatelj) REFERENCES neprijatelj(sifra);

#decko

insert into decko(sifra,  indeferentno ,vesta, asocijalno )
values (null, 1, 'plava-vesta', 1 );

insert into decko(sifra,  indeferentno ,vesta, asocijalno )
values (null, 0, 'plava-vesta', 1 );

insert into decko(sifra,  indeferentno ,vesta, asocijalno )
values (null, 1, 'plava-vesta', 1 );

#cura
insert into cura ( sifra ,haljina,drugiputa ,suknja ,narukvica, introvetno ,majica, decko)
VALUES (null, 'ljetna', '2010-10-10 00:00:00' , 'mini-suknja',2,1, 'plava', 1);

insert into cura ( sifra ,haljina,drugiputa ,suknja ,narukvica, introvetno ,majica, decko)
VALUES (null, 'zimska', '2012-10-10 00:00:01' , 'mini-suknja',3,0, 'plava', 2 );

insert into cura ( sifra ,haljina,drugiputa ,suknja ,narukvica, introvetno ,majica, decko)
VALUES (null, 'proljetna', '2011-10-10 00:02:00' , 'suknja',5,1, 'plava', 3);



# neprijatelj

insert into neprijatelj (haljina, modelnaocala, kuna , cura)
VALUES ('Plava-haljina', 'ray-ban', '99.99', 1);

insert into neprijatelj (haljina, modelnaocala, kuna , cura)
VALUES ('žuta-haljina', 'Gucci', '88.99', 2);

insert into neprijatelj (haljina, modelnaocala, kuna , cura)
VALUES ('crna-haljina', 'Carrera', '120.99', 3);



# zarucnica

insert into zarucnica(narukvica,bojakose,novcanica,lipa,indeferentno)
VALUES (1,'plava', '19.2', '11.99', 0 );

insert into zarucnica(narukvica,bojakose,novcanica,lipa,indeferentno)
VALUES (2,'plava', '19.2', '11.99', 0 );

insert into zarucnica(narukvica,bojakose,novcanica,lipa,indeferentno)
VALUES (2,'plava', '19.2', '11.99', 1 );


-- # decko_zarucnica
INSERT into decko_zarucnica (decko,zarucnica)
values (1, 1);

INSERT into decko_zarucnica (decko,zarucnica)
values (2, 2);

INSERT into decko_zarucnica (decko,zarucnica)
values (3, 3);


#svekar

--  sifra int not null primary key auto_increment,
--     stilfrizura VARCHAR(48),
--     ogrlica int not null,
--     asocijalno bit not null


INSERT into svekar (sifra, ogrlica, asocijalno) 
values(null, 1, 0);


#30. travnja 2020.

INSERT into prijatelj (treciputa, svekar)
values ('2020-04-30 00:00:00', 1);


#neprijatelj


INSERT INTO neprijatelj
(majica, haljina, lipa, modelnaocala, kuna, jmbag, cura)
VALUES(NULL, 'plava', NULL, 'kikiriki', 0, NULL, NULL);


#brat
INSERT INTO brat
(suknja, ogrlica, asocijalno, neprijatelj)
VALUES(NULL, 14, 1, 1);

INSERT INTO kolokvij_2.brat
(suknja, ogrlica, asocijalno, neprijatelj)
VALUES(NULL, 13, 0, 1);


INSERT INTO kolokvij_2.brat
(suknja, ogrlica, asocijalno, neprijatelj)
VALUES(NULL, 14, 0, 1);

INSERT INTO kolokvij_2.brat
(suknja, ogrlica, asocijalno, neprijatelj)
VALUES(NULL, 15, 0, 1);








-- ######. U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica 
--####### različito od 14. 

-- delete from brat
-- where ogrlica != 14;



-- select a.novcanica, f.haljina , g.neprijatelj 
-- from zarucnica a inner join decko_zarucnica b 
-- on a.sifra =b.sifra 
-- inner join decko d 
-- on b.sifra =d.sifra 
-- inner join cura e 
-- on d.sifra =e.sifra 
-- inner join neprijatelj f 
-- on e.sifra = f.sifra 
-- inner join brat g 
-- on f.sifra = g.sifra ;


-- select a.vesta, a.asocijalno 
-- from decko a left join decko_zarucnica b
-- on a.sifra != b.sifra ;


