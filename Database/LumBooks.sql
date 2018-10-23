CREATE SCHEMA LumBooks;
DROP TABLE IF EXISTS Utente;
DROP TABLE IF EXISTS Libri_Generali;
DROP TABLE IF EXISTS Libri_Listati;


CREATE TABLE Utente(
Codice_identificativo int (6) primary key,
Matricola char (5) not null,
Nome varchar(30) not null,
Cognome varchar(50)not null,
Sesso char(1) not null,
Data_di_nascita date not null,
Username varchar(30)not null unique,
Pw char(8)not null, /* DA MODIFICARE */
Email varchar(50) not null unique,

unique (Nome,Cognome,Matricola)
);
ALTER TABLE Utente AUTO_INCREMENT=100000;

CREATE TABLE Libri_In_Vendita(
Codice_Vendita int (5) primary key,

Titolo varchar(50) not null,
Autore varchar(50)not null,

Venditore char (6)not null references Utente(Codice_Identificativo),
Acquirente char (6)not null references Utente(Codice_Identificativo),
Prezzo decimal(5,2) not null,

ISBN char(13),
Edizione varchar(20),
Anno_Pubblicazione int(4),
Casa_Editrice varchar(30),

Stato varchar(20) not null,
Tipo varchar(30) not null,
Codice_identificativo_Libro char(5)  REFERENCES Libri_Listati(Codice_identificativo);/* gaurda pontez*/
);
ALTER TABLE Libri_In_Vendita AUTO_INCREMENT=10000;
ALTER TABLE Libri_In_Vendita 
ADD CONSTRAINT PrezzoPos CHECK (Prezzo >= 0),
ADD CONSTRAINT StatoVendita CHECK (Stato IN ("Venduto","In Vendita","Prenotato")),
ADD CONSTRAINT TipoArticolo CHECK (Tipo IN ("Libro","Slide","Appunti","Altro","Dispense"));


CREATE TABLE Libri_Listati(
Codice_identificativo char (5) primary key,
Titolo varchar(50) not null,
Autore varchar(50)not null,
Casa_Editrice varchar(30)not null,

Venditore char (5)not null references Utente(Matricola),
Corso varchar(30) not null
);

ALTER TABLE Libri_Listati AUTO_INCREMENT=50000;