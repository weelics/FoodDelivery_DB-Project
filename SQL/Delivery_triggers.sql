DELIMITER $$

CREATE TRIGGER PrezzoTotale_delete
    AFTER DELETE 
    ON ListinoOrdine
    FOR EACH ROW 
BEGIN 

    DECLARE prezzoTotale FLOAT; 
    SELECT  prezzo 
    INTO    prezzoTotale
    FROM    ArticoloAlimentare a
    WHERE  a.Codice = OLD.CodiceArticolo; 
    UPDATE Ordinazione o
    SET     o.TotaleConto = o.TotaleConto - (prezzoTotale * OLD.Quantità) 
    WHERE   o.Codice = OLD.CodiceOrdine; 

END $$


DELIMITER $$

CREATE TRIGGER PrezzoTotale_update
    AFTER UPDATE 
    ON ListinoOrdine
    FOR EACH ROW 
BEGIN 

    DECLARE prezzoTotale FLOAT; 
    DECLARE prezzoTotale_old FLOAT; 
    DECLARE prezzoTotale_new FLOAT; 
    SELECT  prezzo 
    INTO    prezzoTotale
    FROM    ArticoloAlimentare a
    WHERE   a.code = NEW.codiceArticolo; 
    SET prezzoTotale_old = (prezzoTotale * OLD.Quantità) ;
    SET prezzoTotale_new = (prezzoTotale * NEW.Quantità) ;
    UPDATE  Ordinazione o
    SET    o.TotaleConto = (o.TotaleConto - prezzoTotale_old) + prezzoTotale_new
    WHERE   o.Codice = NEW.CodiceOrdine; 

END $$



DELIMITER $$

CREATE TRIGGER PrezzoTotale_insert
    AFTER INSERT 
    ON ListinoOrdine
    FOR EACH ROW
BEGIN 

    DECLARE prezzoTotale FLOAT; 
    SELECT  prezzo 
    INTO    prezzoTotale
    FROM    ArticoloAlimentare a
    WHERE   a.codice = NEW.CodiceArticolo; 
    UPDATE  Ordinazione o
    SET     o.TotaleConto = o.TotaleConto + (prezzoTotale * NEW.Quantità) 
    WHERE   o.Codice = NEW.CodiceOrdine; 

END $$
