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