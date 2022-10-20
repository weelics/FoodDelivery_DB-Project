
--
-- Create schema delivery
--

CREATE DATABASE IF NOT EXISTS delivery;
USE delivery;

--
-- Definition of table `articoloalimentare`
--

DROP TABLE IF EXISTS `articoloalimentare`;
CREATE TABLE `articoloalimentare` (
  `Codice` int(6) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(10) NOT NULL,
  `Prezzo` float(4,2) NOT NULL,
  `Ingredienti` varchar(100) DEFAULT NULL,
  `Categoria` int(5) NOT NULL,
  `CodiceRistorante` int(5) NOT NULL,
  PRIMARY KEY (`Codice`),
  KEY `Categoria` (`Categoria`),
  KEY `CodiceRistorante` (`CodiceRistorante`),
  CONSTRAINT `articoloalimentare_ibfk_1` FOREIGN KEY (`Categoria`) REFERENCES `categoriaalimentare` (`Codice`),
  CONSTRAINT `articoloalimentare_ibfk_2` FOREIGN KEY (`CodiceRistorante`) REFERENCES `ristorante` (`Codice`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;



--
-- Definition of table `categoriaalimentare`
--

DROP TABLE IF EXISTS `categoriaalimentare`;
CREATE TABLE `categoriaalimentare` (
  `Codice` int(5) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;



--
-- Definition of table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `CAP` int(5) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  PRIMARY KEY (`CAP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Definition of table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `Codice` int(6) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `CodiceCity` int(5) NOT NULL,
  PRIMARY KEY (`Codice`),
  KEY `CodiceCity` (`CodiceCity`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`CodiceCity`) REFERENCES `city` (`CAP`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;


--
-- Definition of table `gestore`
--

DROP TABLE IF EXISTS `gestore`;
CREATE TABLE `gestore` (
  `Codice` int(6) NOT NULL AUTO_INCREMENT,
  `NumeroOperatore` int(2) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `CodiceRistorante` int(6) NOT NULL,
  PRIMARY KEY (`Codice`),
  KEY `CodiceRistorante` (`CodiceRistorante`),
  CONSTRAINT `gestore_ibfk_1` FOREIGN KEY (`CodiceRistorante`) REFERENCES `ristorante` (`Codice`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;


--
-- Definition of table `listinoordine`
--

DROP TABLE IF EXISTS `listinoordine`;
CREATE TABLE `listinoordine` (
  `CodiceOrdine` int(6) NOT NULL,
  `CodiceArticolo` int(6) NOT NULL,
  `Quantità` int(2) DEFAULT 1,
  PRIMARY KEY (`CodiceOrdine`,`CodiceArticolo`),
  KEY `CodiceArticolo` (`CodiceArticolo`),
  CONSTRAINT `listinoordine_ibfk_1` FOREIGN KEY (`CodiceOrdine`) REFERENCES `ordinazione` (`Codice`),
  CONSTRAINT `listinoordine_ibfk_2` FOREIGN KEY (`CodiceArticolo`) REFERENCES `articoloalimentare` (`Codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Definition of table `ordinazione`
--

DROP TABLE IF EXISTS `ordinazione`;
CREATE TABLE `ordinazione` (
  `Codice` int(6) NOT NULL AUTO_INCREMENT,
  `Via` varchar(30) NOT NULL,
  `NumeroCivico` int(2) NOT NULL,
  `Piano` int(2) DEFAULT NULL,
  `Citofono` varchar(30) DEFAULT NULL,
  `OrarioPartenza` time NOT NULL,
  `OrarioConsegna` time DEFAULT NULL,
  `StatoConsegna` varchar(40) NOT NULL,
  `CodiceGestore` int(6) NOT NULL,
  `TotaleConto` float(4,2) DEFAULT 0.00,
  `CostoConsegna` float(4,2) DEFAULT 0.00,
  `Data` datetime NOT NULL,
  `CodiceCliente` int(6) NOT NULL,
  PRIMARY KEY (`Codice`),
  KEY `CodiceGestore` (`CodiceGestore`),
  KEY `CodiceCliente` (`CodiceCliente`),
  CONSTRAINT `ordinazione_ibfk_1` FOREIGN KEY (`CodiceGestore`) REFERENCES `gestore` (`Codice`),
  CONSTRAINT `ordinazione_ibfk_2` FOREIGN KEY (`CodiceCliente`) REFERENCES `cliente` (`Codice`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;


--
-- Definition of table `ristorante`
--

DROP TABLE IF EXISTS `ristorante`;
CREATE TABLE `ristorante` (
  `Codice` int(5) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Tipologia` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;



--
-- Definition of table `sede`
--

DROP TABLE IF EXISTS `sede`;
CREATE TABLE `sede` (
  `CodiceRistorante` int(6) NOT NULL,
  `CodiceCity` int(6) NOT NULL,
  `Via` varchar(30) NOT NULL,
  `NumeroCivico` int(3) NOT NULL,
  PRIMARY KEY (`CodiceRistorante`,`CodiceCity`,`Via`,`NumeroCivico`),
  KEY `CodiceCity` (`CodiceCity`),
  CONSTRAINT `sede_ibfk_1` FOREIGN KEY (`CodiceRistorante`) REFERENCES `ristorante` (`Codice`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `sede_ibfk_2` FOREIGN KEY (`CodiceCity`) REFERENCES `city` (`CAP`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


