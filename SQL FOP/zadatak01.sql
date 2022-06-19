


--  Kreirajte tablice i veze između tablica.

DROP DATABASE IF EXISTS primjer1;
CREATE DATABASE primjer1;
USE primjer1;

CREATE TABLE muskarac(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    maraka DECIMAL(17,7) NOT NULL,
    hlace VARCHAR(45) NOT NULL,
    prstena INT(11) NOT NULL,
    nausnica INT(11),
    neprijateljica INT(11) NOT NULL
);

CREATE TABLE neprijateljica(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    indiferentno TINYINT(1) NOT NULL,
    modelnaocala VARCHAR(39) NOT NULL,
    maraka DECIMAL(12,10) NOT NULL,
    kratkamajica VARCHAR(32) NOT NULL,
    ogrlica INT(11)
);

CREATE TABLE sestra(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    introvertno TINYINT(1) NOT NULL,
    carape VARCHAR(41),
    suknja VARCHAR(40),
    narukvica INT(11) NOT NULL
);

CREATE TABLE punac(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    modelnaocala VARCHAR(39),
    treciputa DATETIME,
    drugiputa DATETIME,
    novcica DECIMAL(14,6) NOT NULL,
    narukvica INT(11)
);

CREATE TABLE zarucnica(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    stilfrizura VARCHAR(40),
    prstena INT(11) NOT NULL,
    gustoca DECIMAL(14,5),
    modelnaocala VARCHAR(35) NOT NULL,
    nausnica INT(11) NOT NULL
);

ALTER TABLE muskarac ADD FOREIGN KEY (neprijateljica) REFERENCES neprijateljica(id);

# 1. Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 980 i 5098. 
# Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču.

DELIMITER $$

CREATE FUNCTION zadatak1(broj int) RETURNS int
BEGIN
if (broj < 980 and broj > 5098) then RETURN
broj;
else return null;
end if;
end $$
DELIMITER;

INSERT INTO neprijateljica
(id, indiferentno, modelnaocala, maraka, kratkamajica, ogrlica)
VALUES
(NULL, 1, 'Police', 1, 'Ray-ban', zadatak1(1000));

-- # 2. Kreirajte proceduru zadatak2 koja unosi 56872 zapisa u tablicu zarucnica. Izvesti proceduru jednom
-- # tako da u tablici bude točno 56872 zapisa.
delimiter $$
CREATE PROCEDURE zadatak2()
BEGIN
declare a int default 0
while (a<56872)
 do insert into 
 zarucnica
(id, prstena, modelnaocala, nausnica)
    VALUES
    (NULL, zadatak1(1000), 'Ray Ban', zadatak1(2000));
    SET A = A + 1;
    END WHILE;
    end$$
    DELIMITER;

    call zadatak2;


--      3. Kreirajte okidač zadatak3 nakon insert-a u tablicu zarucnica tako da za svaki unos u tablicu zarucnica
-- napravi po dva unosa u tablicu punac. Okidač je u funkciji, tablica punac ima dvostruko više zapisa od
-- tablice zarucnica.


delimiter $$
create trigger zadatak3 after insert on zarucnica for each row 
begin insert int  punac
 (id, novcica)
    VALUES
    (NULL, 28.635),
    (NULL, 32.7136);
END
$$
DELIMITER ;


# 4. Kreirajte proceduru zadatak4 koja iz tablice zarucnica zbraja svaku 7 vrijednost id-a (1,7,14,...). U tablicu
# muskarac se unosi broj zapisa koji odgovaraju izračunatoj sumi. Izvesti proceduru jednom tako da u
# tablici muskarac bude točan broj zapisa koji odgovaraju sumi odabranih brojeva.

DELIMITER $$
CREATE PROCEDURE zadatak4(IN brojRedova INT)
BEGIN
    DECLARE a INT DEFAULT 0;
    DECLARE b INT DEFAULT 0;
    DECLARE c INT DEFAULT 1;
    DECLARE d INT DEFAULT 0;
    WHILE (a < brojRedova) DO
    SET a = a + 1;
    SET b = b + 1;
    IF (b = 7) THEN
    SET b = 0;
    SET c = c + a;
    END IF;
    END WHILE;
    IF (a = brojRedova) THEN
    WHILE (d < c) DO
    INSERT INTO muskarac
    (id, maraka, hlace, prstena, neprijateljica)
    VALUES
    (NULL, 12.2, 'Domaće', zadatak1(1200), 1);
    SET d = d + 1;
    END WHILE;
    END IF;
END
$$
DELIMITER ;

# CALL zadatak4(56872);