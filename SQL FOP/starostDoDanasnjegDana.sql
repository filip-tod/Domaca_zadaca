DELIMITER $$
CREATE FUNCTION vrijeme(

) RETURNS Datetime
begin
return DATE_FORMAT(now(), '1995-03-29 00:00:00');
end;
$$
DELIMITER ;