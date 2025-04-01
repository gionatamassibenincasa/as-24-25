/* SCHEMA */
CREATE TABLE Qualifica (
    idQualifica INTEGER PRIMARY KEY,
    descrizione TEXT NOT NULL,
    orario INTEGER NULL DEFAULT NULL
);

CREATE TABLE TipoOra (
  idTipoOra INTEGER PRIMARY KEY,
  descrizione TEXT
);

CREATE TABLE PagaBase (
    idQualifica INTEGER NOT NULL REFERENCES Qualifica (idQualifica),
    scattoAnzianita INTEGER DEFAULT 0,
    lordoAnnuale REAL,
    nMensilita INTEGER DEFAULT 12,
    idTipoOra INTEGER DEFAULT 1 REFERENCES TipoOra(idTipoOra),
    pagaOraria REAL DEFAULT 0,
    PRIMARY KEY (idQualifica, scattoAnzianita, idTipoOra)
);

CREATE TABLE Dipendente (
    CF TEXT PRIMARY KEY
        CHECK (length(CF) = 16),
    cognome TEXT NOT NULL,
    nome TEXT NOT NULL,
    idQualifica INTEGER,
    scattoAnzianita INTEGER,
    sesso TEXT
        CHECK (sesso IN ('M', 'F')),
    CONSTRAINT sesso_codicefiscale CHECK (
        (sesso = 'M' AND CAST (substr(CF, 10, 2) AS INTEGER) BETWEEN 1 AND 31) OR
        (sesso = 'F' AND CAST (substr(CF, 10, 2) AS INTEGER) BETWEEN 41 AND 71)
    ),
    CONSTRAINT paga FOREIGN KEY (idQualifica, scattoAnzianita) REFERENCES PagaBase (idQualifica, scattoAnzianita)
);

CREATE TABLE Presenza (
    CF TEXT REFERENCES Dipendente (CF),
    anno INTEGER CHECK (anno BETWEEN 2020 AND 2030),
    mese INTEGER CHECK (mese BETWEEN 1 AND 12),
    idTipoOra INTEGER DEFAULT 1 REFERENCES TipoOra (idTipoOra),
    ore REAL DEFAULT 0,
    PRIMARY KEY (CF, anno, mese, idTipoOra)
);

CREATE TABLE TipoTrattenuta (
    
    idTipoTrattenuta INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,  
    tipo TEXT CHECK (tipo IN ('assicurativa', 'fiscale', 'previdenziale'))
);

CREATE TABLE ScaglioniTrattenute (
    idTipoTrattenuta INTEGER REFERENCES TipoTrattenuta (idTipoTrattenuta),
    minimo INTEGER DEFAULT 0,
    massimo INTEGER DEFAULT NULL,
    aliquota REAL,
    PRIMARY KEY(idTipoTrattenuta, minimo)
);

CREATE TABLE BustaPaga (
    idBustaPaga INTEGER PRIMARY KEY,
    dataEsigibilita TEXT,
    CF TEXT REFERENCES Dipendente (CF),
    anno INTEGER NOT NULL,
    mese INTEGER NOT NULL CHECK (mese BETWEEN 1 AND 12)
);

/* DATI */

INSERT INTO Qualifica (descrizione) VALUES
  ('Progettista della sicurezza informatica digitale')
, ('Sviluppatore ICT')
, ('Tecnico della sicurezza informatica digitale')
, ('Sistemista informatico')
, ('Progettista di applicazioni web e multimediali')
, ('Tecnico del controllo di gestione e contabilità analitica')
, ('Tecnico della contabilità e amministrazione')
, ('Tecnico della gestione di magazzino')
, ('Tecnico degli acquisti')
;


INSERT INTO TipoOra VALUES
  (1, 'Ordinario')
, (2, 'Straordinario feriale')
, (3, 'Straordinario festivo')
, (4, 'Reperibilità diurna feriale')
, (5, 'Reperibilità notturna feriale')
, (6, 'Reperibilità diurna festiva')
, (7, 'Reperibilità notturna festiva')
;

INSERT INTO PagaBase (idQualifica, scattoAnzianita, lordoAnnuale) VALUES
  (1, 1, 22730)
, (2, 1, 21531)
, (3, 1, 23690)
, (4, 1, 23533)
, (5, 1, 20981)
, (6, 1, 24940)
, (7, 1, 24278)
, (8, 1, 23441)
, (9, 1, 23365)
, (1, 2, 24321)
, (2, 2, 23038)
, (3, 2, 25348)
, (4, 2, 25180)
, (5, 2, 22450)
, (6, 2, 26686)
, (7, 2, 25977)
, (8, 2, 25082)
, (9, 2, 25001)
, (1, 3, 26023)
, (2, 3, 24651)
, (3, 3, 27122)
, (4, 3, 26943)
, (5, 3, 24022)
, (6, 3, 28554)
, (7, 3, 27795)
, (8, 3, 26838)
, (9, 3, 26751)
, (1, 4, 27845)
, (2, 4, 26377)
, (3, 4, 29021)
, (4, 4, 28829)
, (5, 4, 25704)
, (6, 4, 30553)
, (7, 4, 29741)
, (8, 4, 28717)
, (9, 4, 28624)
, (1, 5, 29794)
, (2, 5, 28223)
, (3, 5, 31052)
, (4, 5, 30847)
, (5, 5, 27503)
, (6, 5, 32692)
, (7, 5, 31823)
, (8, 5, 30727)
, (9, 5, 30628);

INSERT INTO Dipendente (CF, cognome, nome, scattoAnzianita, idQualifica, sesso)
VALUES
('RSSMRO80A01F152X', 'Rossi', 'Mario', 3, 5, 'M'),
('SLLGNN90B02M123Y', 'Sella', 'Gennaio', 1, 2, 'M'),
('VRDLCA85C03F204Z', 'Verdi', 'Luca', 5, 9, 'M'),
('BNCFRN75D44A305W', 'Bianchi', 'Francesca', 2, 7, 'F'),
('RZZLNA88E45G406V', 'Rizzo', 'Anna', 4, 1, 'F'),
('MTRLSS92H06S507U', 'Martino', 'Alessio', 3, 3, 'M'),
('LNTSTF80L07T608Q', 'Lentini', 'Stefano', 1, 6, 'M'),
('FCRRCH78M48R709P', 'Ferrara', 'Chiara', 5, 8, 'F'),
('NGRBRT95P09V810O', 'Negri', 'Roberto', 2, 4, 'M'),
('CNLCTR82R50Z911N', 'Canale', 'Caterina', 4, 5, 'F');

UPDATE PagaBase SET pagaOraria = ROUND(lordoAnnuale / 960) / 2;

INSERT INTO Presenza VALUES
  ('RSSMRO80A01F152X', 2025, 1, 1, 180);
  
INSERT INTO TipoTrattenuta (nome, tipo) VALUES
  ('INPS', 'previdenziale')
, ('INAIL', 'assicurativa')
, ('IRPEF', 'fiscale')
, ('Addizionale Regionale IRPEF', 'fiscale')
, ('Addizionale Comunale IRPEF', 'fiscale');
SELECT * FROM TipoTrattenuta;

INSERT INTO ScaglioniTrattenute VALUES
  (1, 0, NULL, 9.19)
, (2, 0, 28000, 23)
, (2, 28000, 50000, 35)
, (2, 50000, NULL, 43);

