CREATE TABLE Corso (
  idCorso TEXT PRIMARY KEY,
  descrizioneBreve TEXT,
  ore INTEGER,
  descrizione TEXT NULL
 );

INSERT INTO Corso (idCorso, descrizioneBreve, ore, descrizione) VALUES
  ('CryptoWithBlocks','Crittografia con un linguaggio a blocchi', 10, 'Il corso fornisce un''introduzione alle "grandi idee" della crittografia tramite un approccio didattico che procede "per scoperta" e “per necessità”. Partendo da attività progettate per la comprensione dei crittosistemi classici si procede per tappe fino alla crittografia moderna. Ogni attività prevede la sperimentazione del crittosistema, una realizzazione di quelle grandi idee, e richiede agli studenti la costruzione di possibili procedure di attacco. Gli studenti saranno quindi in grado di valutare i limiti del sistema stesso e la consapevolezza delle debolezze dovrebbe indurre la necessità di scoprire un crittosistema successivo  (approccio didattico orientato dalla necessità, Necessity Learning Design).' || CHAR(10) || 'Il corso si basa sul lavoro di M. Lodi - M. Sbaraglia - S. Martini, "PROGRAMMARE PER IMPARARE LA CRITTOGRAFIA AL LICEO MATEMATICO" e usa il materiale didattico realizzato in Snap! (un linguaggio di programmazione visuale a blocchi) da Michael Lodi (Università di Bologna) che consiste in procedure di codifica e decodifica, di analisi e di attacco e attività guidate')
, ('CyberSec','Cyber sicurezza', 20, 'Il percorso avvicina le studentesse e gli studenti alla sicurezza informatica tramite attività di gioco (challenge) ed è propedeutico alla partecipazione alle iniziative sulla sicurezza informatica proposte dalla rete CyberHighSchools (OliCyber, CyberChallenge, CyberTrials).' | CHAR(10) || 'Il laboratorio propone l''uso di un ecosistema hardware e software libero e/o a sorgente aperto con il quale scoprire giocando le problematiche di sicurezza, sviluppare una coscienza critica sull''argomento e promuovere comportamenti orientati ad una protezione dei dati personali.')
, ('EduRobot', 'Robotica educativa', 20, 'Il corso coniuga una fase di ricerca ed esposizione ad una o più gare di robotica.')
, ('LabMat1','Laboratorio di matematica 1 -L''ottica geometrica, la matematica e la fisica del "come" vediamo', 10, NULL)
, ('LabMat2','Laboratorio di matematica 2 - Giochi di numeri - La natura ricorsiva delle operazioni', 10, 'Il corso mira a sviluppare il pensiero ricorsivo attraverso lo sviluppo dell''aritmetica. Tra induzione e ricorsione saranno definiti l''insieme dei numeri naturali e, con le sole funzioni primitive di riconoscimento dello zero, successore e predecessore, saranno definiti alcuni operatori di confronto e operazioni di addizione, sottrazione, moltiplicazione e divisione intera. Lo stesso modo di ragionare su problemi numerici può essere applicato alla risoluzione di tutti problemi che l''informatica può risolvere. Sono questi ragionamenti il vero oggetto del corso.')
, ('LabMat3','Laboratorio di matematica 3', 10, NULL)
, ('MIT1B','GTL MIT - Crypto', 6, NULL)
, ('MIT2B','GTL MIT - RelAx', 6, NULL)
, ('PassInf', 'Passione informatica', 20, 'Il corso ha come obiettivo quello di sviluppare competenze algoritmiche e di programmazione.')
, ('PhyComp','Physical Computing', 10, 'Il percorso vuole fornire un''introduzione al Physical computing e usando Micro:bit, Raspberry Pi e Arduino. L''uso delle schede elettroniche programmabili permette l''interazione con il mondo reale e rende visibile l''effetto dell''esecuzione del programma che lo studente andrà a realizzare. Obiettivi del corso sono la ')
, ('RelAx','Algebra delle relazioni', 10, 'Il percorso introduce le basi della teoria delle basi di dati relazionali, un pilastro fondamentale dell''informatica intesa come disciplina che studia i metodi per estrarre informazioni in modo automatico da dati grezzi.' || CHAR(10) || 'La presentazione degli argomenti è declinata in modo rendere evidente come l''informatica sia una disciplina scientifica e ingegneristica. Vengono esposti sia gli aspetti scientifici e formali, come quelli dell''algebra delle relazioni, sia quelli ingegneristici legati all''efficienza computazionale degli algoritmi.' || CHAR(10) || 'I contenuti si collocano in un contesto interdisciplinare, come è proprio dell''informatica, dove la teoria si unisce alla pratica, grazie all''utilizzo di una piattaforma web per la valutazione di espressioni algebriche relazionali.' || CHAR(10) || 'Obiettivi generali:' || CHAR(10) || '  -  cogliere la stretta relazione tra pensiero scientifico e sviluppo tecnologico.' || CHAR(10) || '  - comprendere le strutture fondamentali dei ragionamenti logico-deduttivi e padroneggiare il linguaggio logico-formale per risolvere problemi di varia natura.' || CHAR(10) || '  - utilizzare strumenti informatici per modellare e risolvere problemi.' || CHAR(10) || '  - acquisire una comprensione approfondita della disciplina informatica per orientare le proprie scelte future, sia a livello universitario che professionale.')
, ('RicOp','Ricerca Operativa', 10, 'Il corso, articolato in 10 ore e rivolto agli studenti delle classi quinte, intende offrire un’esperienza formativa rivolta principalmente alla comprensione del valore pratico della matematica, attraverso lo sviluppo di competenze di problem solving scientifico e un approccio critico alla realtà.' || CHAR(10) || 'Uno degli aspetti centrali del corso è insegnare a risolvere problemi complessi in modo sistematico, incoraggiando gli studenti a riflettere sui dati, sui metodi e sui criteri che stanno alla base delle soluzioni proposte. Questo esercizio favorisce lo sviluppo del senso critico e, dal punto di vista delle competenze, della capacità di modellare problemi reali attraverso strumenti matematici, qualità indispensabili per valutare l’efficacia e la robustezza delle scelte decisionali in ogni contesto applicativo.' || CHAR(10) || 'Il corso illustra metodi e strumenti a cavallo tra matematica e informatica. La Ricerca Operativa sarà utilizzata per mostrare il ruolo complementare delle due discipline: da un lato, la matematica come strumento per costruire modelli e analizzarne le proprietà; dall’altro, l’informatica come mezzo per sviluppare algoritmi e implementare soluzioni. Questa sinergia non solo arricchisce il bagaglio culturale degli studenti, offrendo una visione interdisciplinare dove la matematica non è un fine a sé stessa, ma getta nuova luce sull’importanza di discipline tradizionali come algebra, geometria e analisi.' || CHAR(10) || 'Infine, l’obiettivo generale del corso è accrescere la motivazione allo studio della matematica, specialmente per quegli studenti che spesso incontrano difficoltà e percepiscono questa disciplina come arida o distante. Attraverso esempi concreti e significativi, il corso vuole mostrare come la matematica possa essere uno strumento utile e appassionante, contribuendo così a ridurre il divario di rendimento tra gli studenti.')
;

CREATE TABLE Classe (
  idClasse TEXT PRIMARY KEY
);

INSERT INTO Classe VALUES
  ('Aperto')
, ('E2B')
, ('E5ASIA')
, ('LicMat')
, ('S1B')
, ('S2B')
, ('S3B')
, ('S4B')
, ('S4E')
, ('S4F')
, ('S4G')
, ('S5B+S5D')
, ('S5E')
, ('S5F')
;

CREATE TABLE Edizione
(
  idEdizione TEXT PRIMARY KEY,
  idCorso TEXT REFERENCES Corso(idCorso),
  idClasse TEXT REFERENCES Classe(idClasse),
  bando TEXT CHECK (bando IN ('interno', 'esterno')),
  denominazione TEXT,
  stato TEXT DEFAULT "NON AVVIATO" CHECK (stato IN ('CHIUSO', 'DA CHIUDERE', 'INCOMPLETO', 'IN CORSO', 'NON AVVIATO'))
);

INSERT INTO Edizione (idEdizione, idCorso, idClasse, bando, denominazione) VALUES
--  ('LM1', 'LabMat1', 'LicMat', 'interno', 'LABORATORIO DI MATEMATICA 1') -- Petrella
  ('LM2', 'LabMat2', 'LicMat', 'interno', 'LABORATORIO DI MATEMATICA 2') -- Massi
-- , ('LM3', 'LabMat3', 'LicMat', 'interno', 'LABORATORIO DI MATEMATICA 3') -- Lillini
-- , ('MIT1B','MIT1B', 'S1B', 'esterno', 'GTL MIT - Crypto') -- Thomas
-- , ('MIT2B','MIT2B', 'S2B', 'esterno', 'GTL MIT - RelAlg') -- Thomas
, ('Crypto1B','CryptoWithBlocks', 'S1B', 'esterno', 'CRITTOGRAFIA CON BLOCCHI 1') -- Taccari
, ('Crypto2B','CryptoWithBlocks', 'S2B', 'interno', 'CRITTOGRAFIA CON LINGUAGGIO A BLOCCHI') -- Massi
, ('Crypto4G','CryptoWithBlocks', 'S4G', 'esterno', 'CRITTOGRAFIA CON BLOCCHI 2') -- Taccari, Lorenzoni
, ('CyberSec3B', 'CyberSec', 'S3B', 'esterno', 'CYBER SICUREZZA 1')  -- Taccari
, ('CyberSec4B', 'CyberSec', 'S4B', 'esterno', 'CYBER SICUREZZA 2')  -- Taccari
, ('RelAx4E', 'RelAx', 'S4E', 'interno', 'ALGEBRA DELLE RELAZIONI 2') -- Massi
, ('RelAx4F', 'RelAx', 'S4F', 'interno', 'ALGEBRA DELLE RELAZIONI 4') -- Massi
, ('RelAx5LSinf', 'RelAx', 'S5B+S5D', 'interno', 'ALGEBRA DELLE RELAZIONI 1') -- Massi
, ('RelAx5E', 'RelAx', 'S5E', 'interno', 'ALGEBRA DELLE RELAZIONI 3') -- Massi
, ('RicOp5A', 'RicOp', 'E5ASIA', 'esterno', 'RICERCA OPERATIVA') -- Marinelli, Massi
, ('PhyComp', 'PhyComp', 'E2B', 'interno', 'PHYSICAL COMPUTING')  -- Massi
, ('EduRobot', 'EduRobot', 'Aperto', 'esterno', 'ROBOTICA EDUCATIVA')  -- Agostinelli
, ('PassInf', 'PassInf', 'Aperto', 'esterno', 'PASSIONE INFORMATICA')  -- Agostinelli
;

CREATE TABLE Personale (
    idPersonale TEXT PRIMARY KEY,
    tipo TEXT CHECK (tipo IN ('Esterno', 'Interno', 'MIT'))
);

INSERT INTO Personale VALUES
--  ('Agostinelli', 'Esterno')
-- , ('Demeio', 'Esterno')
-- , ('Lillini', 'Interno')
  ('Lorenzoni', 'Interno')
, ('Marinelli', 'Esterno')
, ('Marrucchiello', 'Interno')
, ('Massi', 'Interno')
, ('Petrella', 'Interno')
, ('Pomili', 'Interno')
, ('Rissone', 'Interno')
, ('Sciamanna', 'Interno')
, ('Taccari', 'Esterno')
-- , ('Thomas', 'MIT')
;

CREATE TABLE Formatore (
    idPersonale TEXT REFERENCES Personale(idPersonale),
    idEdizione TEXT REFERENCES Edizione(idEdizione),
    ruolo TEXT CHECK (ruolo IN ('Formatore', 'Tutor', 'Esterno')),
    PRIMARY KEY(idPersonale, idEdizione)
);

INSERT INTO Formatore VALUES
  ('Massi', 'RelAx4E', 'Formatore')
, ('Pomili', 'RelAx4E', 'Tutor')
, ('Massi', 'RelAx4F', 'Formatore')
, ('Sciamanna', 'RelAx4F', 'Tutor')
, ('Massi', 'RelAx5E', 'Formatore')
, ('Sciamanna', 'RelAx5E', 'Tutor')
, ('Massi', 'RelAx5LSinf', 'Formatore')
, ('Pomili', 'RelAx5LSinf', 'Tutor')
,  ('Massi', 'Crypto2B', 'Formatore')
, ('Pomili', 'Crypto2B', 'Tutor')
, ('Massi', 'LM2', 'Formatore')
, ('Marrucchiello', 'LM2', 'Tutor')
, ('Marinelli', 'RicOp5A', 'Formatore')
, ('Massi', 'RicOp5A', 'Tutor')
, ('Massi', 'PhyComp', 'Formatore')
, ('Sciamanna', 'PhyComp', 'Tutor')
, ('Taccari', 'Crypto1B', 'Formatore')
, ('Sciamanna', 'Crypto1B', 'Tutor')
, ('Taccari', 'Crypto4G', 'Formatore')
, ('Lorenzoni', 'Crypto4G', 'Tutor')
, ('Taccari', 'CyberSec3B', 'Formatore')
, ('Sciamanna', 'CyberSec3B', 'Tutor')
, ('Taccari', 'CyberSec4B', 'Formatore')
, ('Sciamanna', 'CyberSec4B', 'Tutor')

-- , ('Petrella', 'LM1', 'Formatore')
-- , ('Marrucchiello', 'LM1', 'Tutor')
-- , ('Lillini', 'LM3', 'Formatore')
--, ('Marrucchiello', 'LM3', 'Tutor')
-- , ('Thomas', 'MIT1B', 'Esterno')
-- , ('Thomas', 'MIT2B', 'Esterno')
-- , ('Agostinelli', 'EduRobot', 'Formatore')
-- , ('Rissone', 'EduRobot', 'Tutor')
-- , ('Agostinelli', 'PassInf', 'Formatore')
-- , ('Rissone', 'PassInf', 'Tutor')
;

CREATE TABLE FasciaOraria (
    idFasciaOraria INTEGER PRIMARY KEY,
    inizio TEXT,
    fine TEXT,
    durata INTEGER
);

INSERT INTO FasciaOraria VALUES
  (1, '08:00', '09:56', 1)
, (2, '08:56', '09:52', 1)
, (3, '09:52', '10:48', 1)
, (4, '11:00', '11:56', 1)
, (5, '11:56', '12:52', 1)
, (6, '12:52', '13:48', 1)
-- , (7, '14:00', '16:00', 2)
;

CREATE TABLE Aula (
    idAula TEXT PRIMARY KEY
);

INSERT INTO Aula VALUES
  ('AulaClasse')
, ('FabLab')
, ('Lab')
;

CREATE TABLE Materiale (
    idMateriale TEXT PRIMARY KEY
);

INSERT INTO Materiale VALUES
  ('Arduino')
, ('Raspberry Pi')
, ('Micro:bit')
, ('Notebook')
, ('Portatile')
-- , ('Spike')
;

CREATE TABLE Lezione (
    idLezione INTEGER,
    idEdizione TEXT REFERENCES Edizione(idEdizione),
    data TEXT CHECK (data IS date(data, '0 days')),
    idFasciaOraria INTEGER REFERENCES FasciaOraria(idFasciaOraria),
    idAula TEXT NULL REFERENCES Aula(idAula),
    idMateriale TEXT NULL REFERENCES Materiale(idMateriale),
    PRIMARY KEY(idLezione, idEdizione),
    UNIQUE(idEdizione,data,idFasciaOraria)
);

CREATE INDEX orario_lezioni ON Lezione(data, idFasciaOraria);

CREATE TABLE Giorno (
    idGiorno INTEGER PRIMARY KEY,
    giorno TEXT
);

INSERT INTO Giorno VALUES
--  (0, 'Dom')
  (1, 'Lun')
, (2, 'Mar')
, (3, 'Mer')
, (4, 'Gio')
, (5, 'Ven')
, (6, 'Sab')
;

CREATE TABLE festivita (
    data TEXT PRIMARY KEY
);
INSERT INTO festivita VALUES
  ('2024-12-15')
, ('2024-12-22')
, ('2024-12-23')
, ('2024-12-24')
, ('2024-12-25')
, ('2024-12-26')
, ('2024-12-27')
, ('2024-12-28')
, ('2024-12-29')
, ('2024-12-30')
, ('2024-12-31')
, ('2025-01-01')
, ('2025-01-02')
, ('2025-01-03')
, ('2025-01-04')
, ('2025-01-05')
, ('2025-01-06')
, ('2025-01-12')
, ('2025-01-19')
, ('2025-01-26')
, ('2025-02-02')
, ('2025-02-09')
, ('2025-02-16')
, ('2025-02-23')
, ('2025-03-02')
, ('2025-03-09')
, ('2025-03-16')
, ('2025-03-23')
, ('2025-03-30')
, ('2025-04-06')
, ('2025-04-13')
, ('2025-04-17')
, ('2025-04-18')
, ('2025-04-19')
, ('2025-04-20')
, ('2025-04-21')
, ('2025-04-22')
, ('2025-04-25')
, ('2025-04-26')
, ('2025-04-27')
, ('2025-05-01')
, ('2025-05-02')
, ('2025-05-03')
, ('2025-05-04')
, ('2025-05-11')
, ('2025-05-18')
, ('2025-05-25')
, ('2025-06-01')
, ('2025-06-02')
;

CREATE TABLE OrarioAmmissibile (
    idClasse TEXT REFERENCES Classe(idClasse),
    idGiorno INTEGER REFERENCES Giorno(idGiorno),
    idFasciaOraria INTEGER REFERENCES FasciaOraria(idFasciaOraria)
);
INSERT INTO OrarioAmmissibile VALUES
  ('LicMat', 5, 5)
, ('LicMat', 5, 6)
, ('E2B', 1, 2)
, ('E2B', 3, 4)
, ('S1B', 3, 1)
, ('S1B', 6, 4)
, ('S2B', 3, 4)
, ('S2B', 6, 1)
, ('S3B', 3, 5)
, ('S3B', 5, 6)
, ('S4B', 3, 6)
, ('S4B', 5, 4)
, ('S4E', 3, 2)
, ('S4E', 4, 4)
, ('S4F', 1, 1)
, ('S4F', 3, 4)
, ('S4G', 2, 2)
, ('S4G', 5, 1)
, ('S5B+S5D', 2, 5)
, ('S5B+S5D', 5, 5)
, ('S5E', 1, 2)
, ('S5E', 3, 3)
, ('S5F', 4, 3)
, ('S5F', 5, 3)
-- Vedere gli altri corsi!!!
-- , ('Aperto', 1, 7)
-- , ('Aperto', 2, 7)
-- , ('Aperto', 3, 7)
-- , ('Aperto', 4, 7)
-- , ('Aperto', 5, 7)
;

CREATE TABLE Obiettivo(
  idObiettivo TEXT PRIMARY KEY,
  elenco TEXT NOT NULL
);

INSERT INTO Obiettivo VALUES
  ('generaliScientifici', '- Stimolare l’interesse verso le materie tecnico scientifiche e, in particolare, verso l’informatica.' || CHAR(10) || '- Cogliere la stretta relazione tra pensiero scientifico e sviluppo tecnologico.' || CHAR(10) || '- Comprendere le strutture fondamentali dei ragionamenti logico-deduttivi e padroneggiare il linguaggio logico-formale per risolvere problemi di varia natura.' || CHAR(10) || '- Utilizzare strumenti informatici per modellizzare e risolvere problemi.')
, ('generaliInformatica', '- Comprendre meno superficialmente gli oggetti di studio e i metodi della disciplina informatica per poter orientare com maggior consapevolezza le proprie scelte future.')
, ('generaliCybersicurezza', '- Diventare consapevoli delle problematiche di sicurezza nell''uso di strumenti e tecnologie informatiche' || CHAR(10) || '- Possedere le conoscenze di base necessarie a operare in sicurezza nel digitale, con responsabile attenzione per la sicurezza dei dati personali' || CHAR(10) || '- Rafforzare le competenze nell’affrontare i rischi legati all’uso di social network, al trattamento dei dati e alle truffe online.')
;

CREATE TABLE ObiettivoCorso(
  idCorso TEXT REFERENCES Corso(idCorso),
  idObiettivo TEXT REFERENCES Obiettivo(id),
  PRIMARY KEY(idCorso, idObiettivo)
);

INSERT INTO ObiettivoCorso VALUES 
  ('CryptoWithBlocks', 'generaliScientifici')
, ('CryptoWithBlocks', 'generaliCybersicurezza')
, ('CyberSec', 'generaliScientifici')
, ('CyberSec', 'generaliCybersicurezza')
, ('EduRobot', 'generaliScientifici')
, ('LabMat2', 'generaliScientifici')
, ('LabMat2', 'generaliInformatica')
-- , ('PassInf', 'generaliScientifici')
-- , ('PassInf', 'generaliInformatica')
, ('PhyComp', 'generaliScientifici')
, ('PhyComp', 'generaliInformatica')
, ('RelAx', 'generaliScientifici')
, ('RelAx', 'generaliInformatica')
, ('RicOp', 'generaliScientifici')
, ('RicOp', 'generaliInformatica')
;

CREATE VIEW OrariAttesi AS
SELECT
    idClasse,
    group_concat(Giorno || ' ' || idFasciaOraria, ', ') AS orariAttesi
FROM
    OrarioAmmissibile O INNER JOIN
    Giorno G ON O.idGiorno=G.idGiorno
GROUP BY idClasse;

CREATE VIEW Calendario AS
SELECT
      E.idClasse
    , L.data
	, giorno
    , L.idFasciaOraria
    , F.idPersonale
    , E.idCorso
    , L.idLezione
    , F.ruolo
FROM 
    Formatore F INNER JOIN
    Personale P ON F.idPersonale=P.idPersonale INNER JOIN
    Edizione E ON F.idEdizione=E.idEdizione INNER JOIN
    Lezione L ON E.idEdizione=L.idEdizione INNER JOIN
    Giorno G ON cast (strftime('%w', L.data) as integer)=G.idGiorno
ORDER BY E.idEdizione, L.data, L.idFasciaOraria, P.idPersonale
;

CREATE VIEW SovrapposizionePersonale AS
SELECT L1.idEdizione, F1.idPersonale, L2.idEdizione, F2.idPersonale, L1.data, L1.idFasciaOraria
FROM
	Lezione L1 INNER JOIN
	Lezione L2 ON (L1.idEdizione < L2.idEdizione AND L1.data=L2.data AND L1.idFasciaOraria=L2.idFasciaOraria) INNER JOIN
	Formatore F1 ON (L1.idEdizione=F1.idEdizione) INNER JOIN
	Formatore F2 ON (L2.idEdizione=F2.idEdizione)
WHERE
	F1.idPersonale=F2.idPersonale;

CREATE VIEW RiepilogoCorsi AS
SELECT
    -- E.idEdizione AS edizione,
    E.denominazione,
    bando,
    E.idClasse AS classe,
    group_concat(distinct F.idPersonale) AS personale,
     group_concat(distinct (giorno || ' ' || L.idFasciaOraria)) AS orarioSettimanale,
    orariAttesi,
    min(L.data) AS inizio,
    max(L.data) AS fine, group_concat(distinct substr(L.data, 9, 2) || '/' || substr(L.data, 6, 2)) AS elencoGiorni
FROM 
    Formatore F INNER JOIN
    Personale P ON F.idPersonale=P.idPersonale INNER JOIN
    Edizione E ON F.idEdizione=E.idEdizione INNER JOIN
    Lezione L ON E.idEdizione=L.idEdizione INNER JOIN
    Giorno G ON strftime('%w', L.data)=G.idGiorno INNER JOIN
    OrariAttesi O ON E.idClasse=O.idClasse
GROUP BY E.idEdizione
ORDER BY E.idEdizione, L.data, L.idFasciaOraria;

CREATE VIEW SovrapposizioneCorsi AS
SELECT L1.data, L1.idFasciaOraria, E1.idEdizione, E2.idEdizione, E1.idClasse, E2.idClasse
FROM
	Lezione L1 INNER JOIN
	Lezione L2 ON (L1.data = L2.data AND L1.idFasciaOraria = L2.idFasciaOraria AND L1.idEdizione < L2.idEdizione) INNER JOIN
	Edizione E1 ON L1.idEdizione= E1.idEdizione INNER JOIN
	Edizione E2 ON L2.idEdizione= E2.idEdizione 
WHERE 
	E1.idClasse = E2.idClasse;

CREATE VIEW EdizioniIncomplete AS
SELECT
    idEdizione,
    count(idLezione) AS oreEffettive,
    ore
FROM
    Lezione INNER JOIN
    Edizione USING(idEdizione) INNER JOIN
    Corso USING(idCorso)
GROUP BY idEdizione
HAVING oreEffettive <> ore;

CREATE VIEW CorsiInterni AS
SELECT * FROM RiepilogoCorsi WHERE bando='interno' ORDER BY inizio, denominazione;

CREATE VIEW LezioniInGiorniFestivi AS
SELECT * FROM Lezione INNER JOIN festivita USING(data);

CREATE VIEW RiepilogoCorsiInterniMattutini AS
SELECT denominazione, classe, personale, orarioSettimanale, inizio, fine, elencoGiorni FROM RiepilogoCorsi WHERE bando='interno';

CREATE VIEW PersonaleInterferente AS SELECT F1.idPersonale, F2.idEdizione || ',' || group_concat(DISTINCT F1.idEdizione) AS corsiInterferenti FROM Formatore F1 INNER JOIN Formatore F2 USING(idPersonale) WHERE F1.idEdizione > F2.idEdizione GROUP BY F1.idPersonale;

CREATE VIEW ObiettiviFormativi AS
SELECT idCorso, group_concat(elenco, CHAR(10)) AS elenco
FROM 
    Corso INNER JOIN
    ObiettivoCorso USING (idCorso) INNER JOIN 
    Obiettivo USING (idObiettivo)
GROUP BY idCorso;

-- Solo per controllo delle sovrapposizioni
INSERT INTO Lezione VALUES
--   (1, 'LM1', '2024-12-13', 5, NULL, NULL)
-- , (2, 'LM1', '2024-12-13', 6, NULL, NULL)
-- , (3, 'LM1', '2024-12-20', 5, NULL, NULL)
-- , (4, 'LM1', '2024-12-20', 6, NULL, NULL)
-- , (5, 'LM1', '2025-01-10', 5, NULL, NULL)
-- , (6, 'LM1', '2025-01-10', 6, NULL, NULL)
-- , (7, 'LM1', '2025-01-17', 5, NULL, NULL)
-- , (8, 'LM1', '2025-01-17', 6, NULL, NULL)
-- , (9, 'LM1', '2025-01-24', 5, NULL, NULL)
-- , (10, 'LM1', '2025-01-24', 6, NULL, NULL)

-- , (1, 'MIT1B', '2025-01-08', 1, 'AulaClasse', NULL)
-- , (2, 'MIT1B', '2025-01-09', 5, 'AulaClasse', NULL)
-- , (3, 'MIT1B', '2025-01-15', 1, 'AulaClasse', NULL)
-- , (4, 'MIT1B', '2025-01-16', 5, 'AulaClasse', NULL)
-- , (5, 'MIT1B', '2025-01-22', 1, 'AulaClasse', NULL)
-- , (6, 'MIT1B', '2025-01-23', 5, 'AulaClasse', NULL)

-- , (1, 'MIT2B', '2025-01-07', 4, 'AulaClasse', 'Portatile')
-- , (2, 'MIT2B', '2025-01-08', 4, 'AulaClasse', 'Portatile')
-- , (3, 'MIT2B', '2025-01-13', 2, 'AulaClasse', 'Portatile')
-- , (4, 'MIT2B', '2025-01-15', 4, 'AulaClasse', 'Portatile')
-- , (5, 'MIT2B', '2025-01-20', 2, 'AulaClasse', 'Portatile')
-- , (6, 'MIT2B', '2025-01-22', 4, 'AulaClasse', 'Portatile')

-- Lillini
-- , (1, 'LM3', '2025-03-14', 5, NULL, NULL)
-- , (2, 'LM3', '2025-03-14', 6, NULL, NULL)
-- , (3, 'LM3', '2025-03-21', 5, NULL, NULL)
-- , (4, 'LM3', '2025-03-21', 6, NULL, NULL)
-- , (5, 'LM3', '2025-03-28', 5, NULL, NULL)
-- , (6, 'LM3', '2025-03-28', 6, NULL, NULL)
-- , (7, 'LM3', '2025-04-04', 5, NULL, NULL)
-- , (8, 'LM3', '2025-04-04', 6, NULL, NULL)
-- , (9, 'LM3', '2025-04-11', 5, NULL, NULL)
-- , (10, 'LM3', '2025-04-11', 6, NULL, NULL)

-- Solo per aggiungere la riga
-- , (1, 'EduRobot', '2025-01-08', 7, 'FabLab', 'Spike')
-- , (1, 'PassInf',  '2025-01-09', 7, 'FabLab', 'Raspberry Pi')

  (1, 'RicOp5A', '2025-02-03', 1, 'AulaClasse', 'PC')
, (2, 'RicOp5A', '2025-02-03', 2, 'AulaClasse', 'PC')
, (3, 'RicOp5A', '2025-02-10', 1, 'AulaClasse', 'PC')
, (4, 'RicOp5A', '2025-02-10', 2, 'AulaClasse', 'PC')
, (5, 'RicOp5A', '2025-02-17', 1, 'AulaClasse', 'PC')
, (6, 'RicOp5A', '2025-02-17', 2, 'AulaClasse', 'PC')
, (7, 'RicOp5A', '2025-02-24', 1, 'AulaClasse', 'PC')
, (8, 'RicOp5A', '2025-02-24', 2, 'AulaClasse', 'PC')
, (9, 'RicOp5A', '2025-03-03', 1, 'AulaClasse', 'PC')
, (10, 'RicOp5A', '2025-03-03', 2, 'AulaClasse', 'PC') -- OK

, (1, 'RelAx5E', '2024-12-11', 3, 'FabLab', 'Raspberry Pi')
, (2, 'RelAx5E', '2024-12-16', 2, 'FabLab', 'Raspberry Pi')
, (3, 'RelAx5E', '2024-12-18', 3, 'FabLab', 'Raspberry Pi')
, (4, 'RelAx5E', '2025-01-08', 3, 'FabLab', 'Raspberry Pi')
, (5, 'RelAx5E', '2025-01-13', 2, 'FabLab', 'Raspberry Pi')
, (6, 'RelAx5E', '2025-01-15', 3, 'FabLab', 'Raspberry Pi')
, (7, 'RelAx5E', '2025-01-20', 2, 'FabLab', 'Raspberry Pi')
, (8, 'RelAx5E', '2025-01-22', 3, 'FabLab', 'Raspberry Pi')
, (9, 'RelAx5E', '2025-01-29', 3, 'FabLab', 'Raspberry Pi')
, (10, 'RelAx5E', '2025-02-05', 3, 'FabLab', 'Raspberry Pi') -- OK

, (1, 'RelAx4F', '2024-12-11', 4, 'FabLab', 'Raspberry Pi')
, (2, 'RelAx4F', '2024-12-16', 1, 'FabLab', 'Raspberry Pi')
, (3, 'RelAx4F', '2024-12-18', 4, 'FabLab', 'Raspberry Pi')
, (4, 'RelAx4F', '2025-01-08', 4, 'FabLab', 'Raspberry Pi')
, (5, 'RelAx4F', '2025-01-13', 1, 'FabLab', 'Raspberry Pi')
, (6, 'RelAx4F', '2025-01-15', 4, 'FabLab', 'Raspberry Pi')
, (7, 'RelAx4F', '2025-01-20', 1, 'FabLab', 'Raspberry Pi')
, (8, 'RelAx4F', '2025-01-22', 4, 'FabLab', 'Raspberry Pi')
, (9, 'RelAx4F', '2025-01-29', 4, 'FabLab', 'Raspberry Pi')
, (10, 'RelAx4F', '2025-02-26', 4, 'FabLab', 'Raspberry Pi') -- OK

-- COPIA DA QUI

, (1, 'RelAx5LSinf', '2024-12-13', 5, 'FabLab', 'Raspberry Pi')
, (2, 'RelAx5LSinf', '2024-12-20', 5, 'FabLab', 'Raspberry Pi')
, (3, 'RelAx5LSinf', '2025-01-10', 5, 'FabLab', 'Raspberry Pi')
, (4, 'RelAx5LSinf', '2025-01-17', 5, 'FabLab', 'Raspberry Pi')
, (5, 'RelAx5LSinf', '2025-01-24', 5, 'FabLab', 'Raspberry Pi')  -- OK
-- , (6, 'RelAx5LSinf', '2025-03-14', 5, 'FabLab', 'Raspberry Pi') -- Assemblea
, (7, 'RelAx5LSinf', '2025-03-21', 5, 'FabLab', 'Raspberry Pi')
-- , (8, 'RelAx5LSinf', '2025-03-28', 5, 'FabLab', 'Raspberry Pi')
, (9, 'RelAx5LSinf', '2025-04-04', 5, 'FabLab', 'Raspberry Pi')
, (10, 'RelAx5LSinf', '2025-04-11', 5, 'FabLab', 'Raspberry Pi')
, (11, 'RelAx5LSinf', '2025-05-09', 5, 'FabLab', 'Raspberry Pi')
, (12, 'RelAx5LSinf', '2025-05-09', 6, 'FabLab', 'Raspberry Pi')

, (1, 'RelAx4E', '2025-02-05', 2, 'FabLab', 'Raspberry Pi')
, (2, 'RelAx4E', '2025-02-12', 2, 'FabLab', 'Raspberry Pi')
, (3, 'RelAx4E', '2025-02-19', 2, 'FabLab', 'Raspberry Pi')
, (4, 'RelAx4E', '2025-02-26', 2, 'FabLab', 'Raspberry Pi')
, (5, 'RelAx4E', '2025-03-05', 2, 'FabLab', 'Raspberry Pi') -- OK
, (6, 'RelAx4E', '2025-03-12', 2, 'FabLab', 'Raspberry Pi')
, (7, 'RelAx4E', '2025-03-19', 2, 'FabLab', 'Raspberry Pi')
, (8, 'RelAx4E', '2025-03-26', 2, 'FabLab', 'Raspberry Pi')
, (9, 'RelAx4E', '2025-04-02', 2, 'FabLab', 'Raspberry Pi')
, (10, 'RelAx4E', '2025-04-09', 2, 'FabLab', 'Raspberry Pi')

, (1, 'PhyComp', '2025-03-10', 2, 'Lab', 'Micro:bit')
--, (2, 'PhyComp', '2025-03-12', 4, 'Lab', 'Micro:bit')
, (2, 'PhyComp', '2025-03-17', 2, 'Lab', 'Micro:bit')
--, (4, 'PhyComp', '2025-03-19', 4, 'Lab', 'Micro:bit')
, (3, 'PhyComp', '2025-03-24', 2, 'Lab', 'Micro:bit')
--, (6, 'PhyComp', '2025-03-26', 4, 'Lab', 'Micro:bit')
, (4, 'PhyComp', '2025-03-31', 2, 'Lab', 'Micro:bit')
--, (8, 'PhyComp', '2025-04-02', 4, 'Lab', 'Micro:bit')
, (5, 'PhyComp', '2025-04-07', 2, 'Lab', 'Micro:bit')
--, (10, 'PhyComp', '2025-04-09', 4, 'Lab', 'Micro:bit')
, (6, 'PhyComp', '2025-04-14', 2, 'Lab', 'Micro:bit')
-- , (7, 'PhyComp', '2025-04-16', 4, 'Lab', 'Micro:bit')
, (7, 'PhyComp', '2025-04-23', 4, 'Lab', 'Micro:bit')
, (8, 'PhyComp', '2025-04-28', 2, 'Lab', 'Micro:bit')
, (9, 'PhyComp', '2025-05-07', 2, 'Lab', 'Micro:bit')
, (10, 'PhyComp', '2025-05-07', 4, 'Lab', 'Micro:bit')
-- , (12, 'PhyComp', '2025-05-14', 4, 'Lab', 'Micro:bit')

, (1, 'LM2', '2025-01-31', 5, 'AulaClasse', 'Notebook')
, (2, 'LM2', '2025-01-31', 6, 'AulaClasse', 'Notebook')
, (3, 'LM2', '2025-02-07', 5, 'AulaClasse', 'Notebook')
, (4, 'LM2', '2025-02-07', 6, 'AulaClasse', 'Notebook')
, (5, 'LM2', '2025-02-14', 5, 'AulaClasse', 'Notebook')
, (6, 'LM2', '2025-02-14', 6, 'AulaClasse', 'Notebook') -- OK
, (7, 'LM2', '2025-03-07', 5, 'AulaClasse', 'Notebook')
, (8, 'LM2', '2025-03-07', 6, 'AulaClasse', 'Notebook')
, (9, 'LM2', '2025-03-14', 5, 'AulaClasse', 'Notebook')
, (10, 'LM2', '2025-03-14', 6, 'AulaClasse', 'Notebook')

, (1, 'Crypto1B', '2025-02-05', 1, 'Lab', 'PC')
, (2, 'Crypto1B', '2025-02-08', 4, 'Lab', 'PC')
, (3, 'Crypto1B', '2025-02-12', 1, 'Lab', 'PC')
, (4, 'Crypto1B', '2025-02-15', 4, 'Lab', 'PC')
, (5, 'Crypto1B', '2025-02-19', 1, 'Lab', 'PC')
, (6, 'Crypto1B', '2025-02-22', 4, 'Lab', 'PC')
, (7, 'Crypto1B', '2025-02-26', 1, 'Lab', 'PC')
, (8, 'Crypto1B', '2025-03-01', 4, 'Lab', 'PC')
, (9, 'Crypto1B', '2025-03-05', 1, 'Lab', 'PC') -- OK
, (10, 'Crypto1B', '2025-03-08', 4, 'Lab', 'PC')
-- , (11, 'Crypto1B', '2025-03-12', 1, 'Lab', 'PC')

, (1, 'Crypto4G', '2025-02-04', 2, 'FabLab', 'Raspberry Pi')
, (2, 'Crypto4G', '2025-02-11', 2, 'FabLab', 'Raspberry Pi')
, (3, 'Crypto4G', '2025-02-18', 2, 'FabLab', 'Raspberry Pi')
-- , (4, 'Crypto4G', '2025-02-25', 2, 'FabLab', 'Raspberry Pi') -- Settimana bianca
, (5, 'Crypto4G', '2025-03-04', 2, 'FabLab', 'Raspberry Pi')
, (6, 'Crypto4G', '2025-03-11', 2, 'FabLab', 'Raspberry Pi')
, (7, 'Crypto4G', '2025-03-18', 2, 'FabLab', 'Raspberry Pi')
, (8, 'Crypto4G', '2025-03-25', 2, 'FabLab', 'Raspberry Pi')
, (9, 'Crypto4G', '2025-04-01', 2, 'FabLab', 'Raspberry Pi')
, (10, 'Crypto4G', '2025-04-08', 2, 'FabLab', 'Raspberry Pi')
, (11, 'Crypto4G', '2025-04-15', 2, 'FabLab', 'Raspberry Pi')

, (1, 'CyberSec3B', '2025-01-29', 5, 'FabLab', 'Raspberry Pi')
, (2, 'CyberSec3B', '2025-01-31', 6, 'FabLab', 'Raspberry Pi')
, (3, 'CyberSec3B', '2025-02-05', 5, 'FabLab', 'Raspberry Pi')
, (4, 'CyberSec3B', '2025-02-12', 5, 'FabLab', 'Raspberry Pi')
, (5, 'CyberSec3B', '2025-02-14', 6, 'FabLab', 'Raspberry Pi')
, (6, 'CyberSec3B', '2025-02-19', 5, 'FabLab', 'Raspberry Pi')
, (7, 'CyberSec3B', '2025-03-05', 5, 'FabLab', 'Raspberry Pi') -- OK
, (8, 'CyberSec3B', '2025-03-07', 6, 'FabLab', 'Raspberry Pi')
, (10, 'CyberSec3B', '2025-03-12', 5, 'FabLab', 'Raspberry Pi')
-- , (11, 'CyberSec3B', '2025-03-14', 6, 'FabLab', 'Raspberry Pi')
, (12, 'CyberSec3B', '2025-03-19', 5, 'FabLab', 'Raspberry Pi')
, (13, 'CyberSec3B', '2025-03-21', 6, 'FabLab', 'Raspberry Pi')
, (14, 'CyberSec3B', '2025-03-26', 5, 'FabLab', 'Raspberry Pi')
, (15, 'CyberSec3B', '2025-03-28', 6, 'FabLab', 'Raspberry Pi')
, (16, 'CyberSec3B', '2025-04-02', 5, 'FabLab', 'Raspberry Pi')
, (17, 'CyberSec3B', '2025-04-04', 6, 'FabLab', 'Raspberry Pi')
, (18, 'CyberSec3B', '2025-04-09', 5, 'FabLab', 'Raspberry Pi')
, (19, 'CyberSec3B', '2025-04-11', 6, 'FabLab', 'Raspberry Pi')
, (20, 'CyberSec3B', '2025-04-16', 5, 'FabLab', 'Raspberry Pi')
, (21, 'CyberSec3B', '2025-04-23', 5, 'FabLab', 'Raspberry Pi')
-- , (22, 'CyberSec3B', '2025-04-30', 5, 'FabLab', 'Raspberry Pi')
, (23, 'CyberSec3B', '2025-05-07', 5, 'FabLab', 'Raspberry Pi')

, (1, 'CyberSec4B', '2025-01-29', 6, 'FabLab', 'Raspberry Pi')
, (2, 'CyberSec4B', '2025-01-31', 4, 'FabLab', 'Raspberry Pi')
--, (3, 'CyberSec4B', '2025-02-05', 6, 'FabLab', 'Raspberry Pi')
--, (4, 'CyberSec4B', '2025-02-07', 4, 'FabLab', 'Raspberry Pi')
--, (5, 'CyberSec4B', '2025-02-12', 6, 'FabLab', 'Raspberry Pi')
, (3, 'CyberSec4B', '2025-02-14', 4, 'FabLab', 'Raspberry Pi')
, (4, 'CyberSec4B', '2025-02-19', 6, 'FabLab', 'Raspberry Pi')
--, (7, 'CyberSec4B', '2025-02-21', 4, 'FabLab', 'Raspberry Pi')
--, (8, 'CyberSec4B', '2025-02-26', 6, 'FabLab', 'Raspberry Pi')
--, (9, 'CyberSec4B', '2025-02-28', 4, 'FabLab', 'Raspberry Pi')
, (5, 'CyberSec4B', '2025-03-05', 6, 'FabLab', 'Raspberry Pi') -- OK
, (6, 'CyberSec4B', '2025-03-07', 4, 'FabLab', 'Raspberry Pi')
, (7, 'CyberSec4B', '2025-03-07', 5, 'FabLab', 'Raspberry Pi')
, (8, 'CyberSec4B', '2025-03-12', 6, 'FabLab', 'Raspberry Pi')
--, (13, 'CyberSec4B', '2025-03-14', 4, 'FabLab', 'Raspberry Pi')
, (9, 'CyberSec4B', '2025-03-19', 6, 'FabLab', 'Raspberry Pi')
, (10, 'CyberSec4B', '2025-03-21', 4, 'FabLab', 'Raspberry Pi')
, (11, 'CyberSec4B', '2025-03-26', 6, 'FabLab', 'Raspberry Pi')
, (12, 'CyberSec4B', '2025-03-28', 4, 'FabLab', 'Raspberry Pi')
, (13, 'CyberSec4B', '2025-04-02', 6, 'FabLab', 'Raspberry Pi')
, (14, 'CyberSec4B', '2025-04-04', 4, 'FabLab', 'Raspberry Pi')
, (15, 'CyberSec4B', '2025-04-09', 6, 'FabLab', 'Raspberry Pi')
, (16, 'CyberSec4B', '2025-04-11', 4, 'FabLab', 'Raspberry Pi')
, (17, 'CyberSec4B', '2025-04-16', 6, 'FabLab', 'Raspberry Pi')
-- , (23, 'CyberSec4B', '2025-04-18', 4, 'FabLab', 'Raspberry Pi')
, (18, 'CyberSec4B', '2025-04-23', 6, 'FabLab', 'Raspberry Pi')
-- , (25, 'CyberSec4B', '2025-04-25', 4, 'FabLab', 'Raspberry Pi')
-- , (19, 'CyberSec4B', '2025-04-30', 6, 'FabLab', 'Raspberry Pi')
-- , (27, 'CyberSec4B', '2025-05-02', 4, 'FabLab', 'Raspberry Pi') 
, (19, 'CyberSec4B', '2025-05-07', 6, 'FabLab', 'Raspberry Pi')
, (20, 'CyberSec4B', '2025-05-09', 4, 'FabLab', 'Raspberry Pi')
-- , (30, 'CyberSec4B', '2025-05-14', 6, 'FabLab', 'Raspberry Pi')

, (1, 'Crypto2B', '2025-02-05', 1, 'Lab', 'PC')
, (2, 'Crypto2B', '2025-02-05', 4, 'Lab', 'PC')
, (3, 'Crypto2B', '2025-02-12', 4, 'Lab', 'PC')
, (4, 'Crypto2B', '2025-02-19', 4, 'Lab', 'PC')
, (5, 'Crypto2B', '2025-03-05', 4, 'Lab', 'PC') -- OK
, (6, 'Crypto2B', '2025-03-12', 4, 'Lab', 'PC')
, (7, 'Crypto2B', '2025-03-19', 4, 'Lab', 'PC')
-- , (8, 'Crypto2B', '2025-03-26', 4, 'Lab', 'PC') -- Prove comuni classi seconde
, (8, 'Crypto2B', '2025-04-02', 4, 'Lab', 'PC')
, (9, 'Crypto2B', '2025-04-09', 4, 'Lab', 'PC')
, (10, 'Crypto2B', '2025-04-16', 4, 'Lab', 'PC')
;

-- UPDATE Edizione
-- SET stato = 'DA CHIUDERE'
-- WHERE idEdizione IN (
--
-- );

UPDATE Edizione
SET stato = 'CHIUSO'
WHERE idEdizione IN (
 'RelAx5E',
 'RelAx4F',
 'EduRobot',
 'PassInf'
);

UPDATE Edizione
SET stato = 'IN CORSO'
WHERE idEdizione IN (
   'Crypto1B' -- 90 %
 , 'Crypto2B' -- 50 %
 , 'Crypto4G' -- 40 %
 , 'CyberSec3B' -- 40 % (7)
 , 'CyberSec4B' -- 20 % (5)
 , 'LM2' -- 60 %
 , 'RelAx5LSinf' -- 50 %
 , 'RelAx4E' -- 50 %
);

-- NON AVVIATO
-- PhyComp
