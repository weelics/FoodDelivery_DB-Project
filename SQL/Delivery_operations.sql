/*Op1*/
insert into Cliente(Nome,Cognome,Email,Password,CodiceCity)values (
    "Salvatore",
    "Maugeri",
    "prova@gmail.com",
    "123456789",
    95032
);
/*Op2*/
insert into Ristorante(Nome,Tipologia) values (
    "oasi del Panino",
    "street-food"
);

/*Op3*/
insert into Gestore (NumeroOperatore,Email,Password,CodiceRistorante) values (
    4,
    "prova@gmail.com",
    "123456789",
    67
);

/*Op4*/
insert into ListinoOrdine values (
    60,
    1000,
    3
);

/*Op5*/

select o.*,g.NumeroOperatore from Ordinazione o,Gestore g
where o.CodiceGestore = g.Codice;

/*Op6*/
insert into Ordinazione (Via,NumeroCivico,Piano,Citofono,orarioPartenza,orarioConsegna,
StatoConsegna,TotaleOrdine,Data,CostoConsegna,CodiceCliente,CodiceGestore)
values(
    "Via Roma",
    77,
    2,
    "Bianchi",
    NULL,
    NULL,
    "Non consegnato,In elaborazione",
    0,
    02/02/2020,
    1,
    345,
    20
);

/*Op7*/
delete from ArticoloAlimentare a where a.Codice = 30;
