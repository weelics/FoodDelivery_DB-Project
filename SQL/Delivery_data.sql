
USE delivery;



--
-- Dumping data for table `articoloalimentare`
--

/*!40000 ALTER TABLE `articoloalimentare` DISABLE KEYS */;
INSERT INTO `articoloalimentare` (`Codice`,`Nome`,`Prezzo`,`Ingredienti`,`Categoria`,`CodiceRistorante`) VALUES 
 (1,'pane',23.30,'farina,acqua',1,1),
 (2,'polpette d',23.30,'farina,acqua',1,1),
 (3,'acqua',1.30,'acqua',1,1);
/*!40000 ALTER TABLE `articoloalimentare` ENABLE KEYS */;



--
-- Dumping data for table `categoriaalimentare`
--

/*!40000 ALTER TABLE `categoriaalimentare` DISABLE KEYS */;
INSERT INTO `categoriaalimentare` (`Codice`,`Nome`) VALUES 
 (1,'bene primario');
/*!40000 ALTER TABLE `categoriaalimentare` ENABLE KEYS */;


--
-- Dumping data for table `city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`CAP`,`Nome`) VALUES 
 (95100,'catania');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;



--
-- Dumping data for table `cliente`
--

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`Codice`,`Nome`,`Cognome`,`Email`,`Password`,`CodiceCity`) VALUES 
 (1,'pippo','pippo surname','pippo@gmail.com','123pippo',95100);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;



--
-- Dumping data for table `gestore`
--

/*!40000 ALTER TABLE `gestore` DISABLE KEYS */;
INSERT INTO `gestore` (`Codice`,`NumeroOperatore`,`Email`,`Password`,`CodiceRistorante`) VALUES 
 (1,1,'emailoperatore@gmail.com','passOperatore',1);
/*!40000 ALTER TABLE `gestore` ENABLE KEYS */;




--
-- Dumping data for table `listinoordine`
--

/*!40000 ALTER TABLE `listinoordine` DISABLE KEYS */;
INSERT INTO `listinoordine` (`CodiceOrdine`,`CodiceArticolo`,`Quantità`) VALUES 
 (1,1,3),
 (1,2,2);
/*!40000 ALTER TABLE `listinoordine` ENABLE KEYS */;


--
-- Dumping data for table `ordinazione`
--

/*!40000 ALTER TABLE `ordinazione` DISABLE KEYS */;
INSERT INTO `ordinazione` (`Codice`,`Via`,`NumeroCivico`,`Piano`,`Citofono`,`OrarioPartenza`,`OrarioConsegna`,`StatoConsegna`,`CodiceGestore`,`TotaleConto`,`CostoConsegna`,`Data`,`CodiceCliente`) VALUES 
 (1,'via delle mandragore',12,2,'pippo','12:30:00',NULL,'',1,0.00,10.00,'2020-04-02 00:00:00',1),
 (2,'via delle mandragore',12,2,'pippo','12:30:00',NULL,'in elaborazione',1,0.00,10.00,'2020-04-02 00:00:00',1);
/*!40000 ALTER TABLE `ordinazione` ENABLE KEYS */;



--
-- Dumping data for table `ristorante`
--

/*!40000 ALTER TABLE `ristorante` DISABLE KEYS */;
INSERT INTO `ristorante` (`Codice`,`Nome`,`Tipologia`) VALUES 
 (1,'ristorante la pratoria animata','street food');
/*!40000 ALTER TABLE `ristorante` ENABLE KEYS */;




insert into sede
values(1, 95100, "prova",32);



