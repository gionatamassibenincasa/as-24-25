CREATE TABLE Corso (
  idCorso TEXT PRIMARY KEY,
  descrizioneBreve TEXT,
  ore INTEGER,
  descrizione TEXT NULL
 );
 
INSERT INTO Corso VALUES
  ('CryptoWithBlocks','Crittografia con un linguaggio a blocchi', 10, 'Il corso è un''introduzione alle "grandi idee" della crittografia. L''approccio didattico procede "per scoperta" con attività che si susseguono con una successione di crittosistemi (dai classici ai più moderni). Lo studente può sperimentare caratteristiche di ciascun crittosistema, realizzado possibili procedure di attacco e valutandone i limiti. Dalle debolezze di un sistema lo studente dovrebbe avere necessità di scoprire il crittosistema successivo, che avrà superato i limiti del sistema precedente ma che potrà presentare altri aspetti limitanti. L''impianto generale del corso si basa su M. Lodi - M. Sbaraglia - S. Martini, "PROGRAMMARE PER IMPARARE LA CRITTOGRAFIA AL LICEO MATEMATICO". I crittosistemi, la loro analisi ed le possibili procedure di attacco sono realizzate in Snap! (un linguaggio di programmazione visuale a blocchi) da Michael Lodi (Università di Bologna).')
, ('CyberSec','Cyber sicurezza', 20, 'Il percorso avvicina le studentesse e gli studenti alla sicurezza informatica tramite attività di gioco (challenge). È propedeutico alla partecipazione alle iniziative sulla sicurezza informatica proposte dalla rete CyberHighSchools (OliCyber, CyberChallenge, CyberTrials). Il laborartorio propone l''uso di un ecosistema hardware (Rasperry Pi 5) e software (sistema operativo GNU/Linux, interprete Python, strumenti per l''analisi del traffico di rete, strumenti per l''analisi dei file eseguibili) a sorgente aperto con il quale scoprire giocando le problematiche di sicurezza, sviluppare una coscienza critica sull''argomento e promuovere comportamenti orientati ad una protezione dei dati personali.')
, ('EduRobot', 'Robotica educativa', 20, 'Il corso coniuga una fase di ricerca ed esposizione ad una o più gare di robotica.')
, ('LabMat1','Laboratorio di matematica 1 -L''ottica geometrica, la matematica e la fisica del "come" vediamo', 10, NULL)
, ('LabMat2','Laboratorio di matematica 2 - Giochi di numeri - La natura ricorsiva delle operazioni', 10, 'Il corso mira a sviluppare il pensiero ricorsivo attraverso lo sviluppo dell''aritmetica. Tra induzione e ricorsione saranno definiti l''insieme dei numeri naturali e, con le sole funzioni primitive di riconoscimento dello zero, successore e predecessore, saranno definiti alcuni operatori di confronto e operazioni di addizione, sottrazione, moltiplicazione e divisione intera. Lo stesso modo di ragionare su problemi numerici può essere applicato alla risoluzione di tutti problemi che l''informatica può risolvere. Sono questi ragionamenti il vero oggetto del corso.')
, ('LabMat3','Laboratorio di matematica 3', 10, NULL)
, ('MIT1B','GTL MIT - Crypto', 6, NULL)
, ('MIT2B','GTL MIT - RelAx', 6, NULL)
, ('PassInf', 'Passione informatica', 20, 'Il corso ha come obiettivo quello di sviluppare competenze algoritmiche e di programmazione.')
, ('PhyComp','Physical Computing', 10, 'Il percorso vuole fornire un''introduzione al Physical computing e usando Micro:bit, Raspberry Pi e Arduino. L''uso delle schede elettroniche programmabili permette l''interazione con il mondo reale e rende visibile l''effetto dell''esecuzione del programma che lo studente andrà a realizzare. Obiettivi del corso sono la ')
, ('RelAx','Algebra delle relazioni', 10, 'Il percorso introduce le basi della teoria delle basi di dati relazionali, un pilastro fondamentale dell''informatica intesa come disciplina che studia i metodi per estrarre informazioni in modo automatico da dati grezzi.' || CHAR(13) || 'La presentazione degli argomenti è declinata in modo rendere evidente come l''informatica sia una disciplina scientifica e ingegneristica. Vengono esposti sia gli aspetti scientifici e formali, come quelli dell''algebra delle relazioni, sia quelli ingegneristici legati all''efficienza computazionale degli algoritmi.' || CHAR(13) || 'I contenuti si collocano in un contesto interdisciplinare, come è proprio dell''informatica, dove la teoria si unisce alla pratica, grazie all''utilizzo di una piattaforma web per la valutazione di espressioni algebriche relazionali.' || CHAR(13) || 'Obiettivi generali:' || CHAR(13) || '  -  cogliere la stretta relazione tra pensiero scientifico e sviluppo tecnologico.' || CHAR(13) || '  - comprendere le strutture fondamentali dei ragionamenti logico-deduttivi e padroneggiare il linguaggio logico-formale per risolvere problemi di varia natura.' || CHAR(13) || '  - utilizzare strumenti informatici per modellare e risolvere problemi.' || CHAR(13) || '  - acquisire una comprensione approfondita della disciplina informatica per orientare le proprie scelte future, sia a livello universitario che professionale.')
, ('RicOp','Ricerca Operativa', 10, 'Il laboratorio introduce, per mezzo di attività laboratoriali, le problematiche affrontate della Ricerca Operativa, una disciplina che si avvale di metodi scientifici, matematici e informatici per risolvere problemi complessi che si presentano in svariati contesti, dalla logistica all''economia, passando per l''ingegneria e la medicina.')
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
  denominazione TEXT
);

INSERT INTO Edizione VALUES
  ('LM1', 'LabMat1', 'LicMat', 'interno', 'LABORATORIO DI MATEMATICA 1') -- Petrella
, ('LM2', 'LabMat2', 'LicMat', 'interno', 'LABORATORIO DI MATEMATICA 2') -- Massi
, ('LM3', 'LabMat3', 'LicMat', 'interno', 'LABORATORIO DI MATEMATICA 3') -- Lillini
, ('MIT1B','MIT1B', 'S1B', 'esterno', 'GTL MIT - Crypto') -- Thomas
, ('MIT2B','MIT2B', 'S2B', 'esterno', 'GTL MIT - RelAlg') -- Thomas
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
  ('Agostinelli', 'Esterno')
, ('Demeio', 'Esterno')
, ('Lillini', 'Interno')
, ('Lorenzoni', 'Interno')
, ('Marinelli', 'Esterno')
, ('Marrucchiello', 'Interno')
, ('Massi', 'Interno')
, ('Petrella', 'Interno')
, ('Pomili', 'Interno')
, ('Rissone', 'Interno')
, ('Sciamanna', 'Interno')
, ('Taccari', 'Esterno')
, ('Thomas', 'MIT')
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
, ('Pomili', 'PhyComp', 'Tutor')

, ('Taccari', 'Crypto1B', 'Formatore')
, ('Sciamanna', 'Crypto1B', 'Tutor')
, ('Taccari', 'Crypto4G', 'Formatore')
, ('Lorenzoni', 'Crypto4G', 'Tutor')
, ('Taccari', 'CyberSec3B', 'Formatore')
, ('Sciamanna', 'CyberSec3B', 'Tutor')
, ('Taccari', 'CyberSec4B', 'Formatore')
, ('Sciamanna', 'CyberSec4B', 'Tutor')

, ('Petrella', 'LM1', 'Formatore')
, ('Marrucchiello', 'LM1', 'Tutor')
, ('Lillini', 'LM3', 'Formatore')
, ('Marrucchiello', 'LM3', 'Tutor')
, ('Thomas', 'MIT1B', 'Esterno')
, ('Thomas', 'MIT2B', 'Esterno')
, ('Agostinelli', 'EduRobot', 'Formatore')
, ('Rissone', 'EduRobot', 'Tutor')
, ('Agostinelli', 'PassInf', 'Formatore')
, ('Rissone', 'PassInf', 'Tutor')
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
, (7, '14:00', '16:00', 2)
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
, ('Spike')
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

CREATE TABLE giorno (
    idGiorno INTEGER PRIMARY KEY,
    giorno TEXT
);

INSERT INTO giorno VALUES
  (0, 'Dom')
, (1, 'Lun')
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
, ('Aperto', 1, 7)
, ('Aperto', 2, 7)
, ('Aperto', 3, 7)
, ('Aperto', 4, 7)
, ('Aperto', 5, 7)
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

CREATE VIEW SovrapposizioniPersonale AS
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
    max(L.data) AS fine, group_concat(distinct substr(L.data, 9, 2) || "/" || substr(L.data, 6, 2)) AS elencoGiorni
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

CREATE VIEW PersonaleInterferente AS SELECT F1.idPersonale, F2.idEdizione || "," || group_concat(DISTINCT F1.idEdizione) AS corsiInterferenti FROM Formatore F1 INNER JOIN Formatore F2 USING(idPersonale) WHERE F1.idEdizione > F2.idEdizione GROUP BY F1.idPersonale;

INSERT INTO Lezione VALUES
-- Solo per controllo delle sovrapposizioni
  (1, 'LM1', '2024-12-13', 5, NULL, NULL)
, (2, 'LM1', '2024-12-13', 6, NULL, NULL)
, (3, 'LM1', '2024-12-20', 5, NULL, NULL)
, (4, 'LM1', '2024-12-20', 6, NULL, NULL)
, (5, 'LM1', '2025-01-10', 5, NULL, NULL)
, (6, 'LM1', '2025-01-10', 6, NULL, NULL)
, (7, 'LM1', '2025-01-17', 5, NULL, NULL)
, (8, 'LM1', '2025-01-17', 6, NULL, NULL)
, (9, 'LM1', '2025-01-24', 5, NULL, NULL)
, (10, 'LM1', '2025-01-24', 6, NULL, NULL)

, (1, 'MIT1B', '2025-01-08', 1, 'AulaClasse', NULL)
, (2, 'MIT1B', '2025-01-09', 5, 'AulaClasse', NULL)
, (3, 'MIT1B', '2025-01-15', 1, 'AulaClasse', NULL)
, (4, 'MIT1B', '2025-01-16', 5, 'AulaClasse', NULL)
, (5, 'MIT1B', '2025-01-22', 1, 'AulaClasse', NULL)
, (6, 'MIT1B', '2025-01-23', 5, 'AulaClasse', NULL)

, (1, 'MIT2B', '2025-01-07', 4, 'AulaClasse', 'Portatile')
, (2, 'MIT2B', '2025-01-08', 4, 'AulaClasse', 'Portatile')
, (3, 'MIT2B', '2025-01-13', 2, 'AulaClasse', 'Portatile')
, (4, 'MIT2B', '2025-01-15', 4, 'AulaClasse', 'Portatile')
, (5, 'MIT2B', '2025-01-20', 2, 'AulaClasse', 'Portatile')
, (6, 'MIT2B', '2025-01-22', 4, 'AulaClasse', 'Portatile')

-- Lillini
, (1, 'LM3', '2025-03-14', 5, NULL, NULL)
, (2, 'LM3', '2025-03-14', 6, NULL, NULL)
, (3, 'LM3', '2025-03-21', 5, NULL, NULL)
, (4, 'LM3', '2025-03-21', 6, NULL, NULL)
, (5, 'LM3', '2025-03-28', 5, NULL, NULL)
, (6, 'LM3', '2025-03-28', 6, NULL, NULL)
, (7, 'LM3', '2025-04-04', 5, NULL, NULL)
, (8, 'LM3', '2025-04-04', 6, NULL, NULL)
, (9, 'LM3', '2025-04-11', 5, NULL, NULL)
, (10, 'LM3', '2025-04-11', 6, NULL, NULL)

-- Solo per aggiungere la riga
, (1, 'EduRobot', '2025-01-08', 7, 'FabLab', 'Spike')
, (1, 'PassInf',  '2025-01-09', 7, 'FabLab', 'Raspberry Pi')

-- COPIA DA QUI
, (1, 'RicOp', '2025-02-03', 1, 'AulaClasse', 'PC')
, (2, 'RicOp', '2025-02-03', 2, 'AulaClasse', 'PC')
, (3, 'RicOp', '2025-02-10', 1, 'AulaClasse', 'PC')
, (4, 'RicOp', '2025-02-10', 2, 'AulaClasse', 'PC')
, (5, 'RicOp', '2025-02-17', 1, 'AulaClasse', 'PC')
, (6, 'RicOp', '2025-02-17', 2, 'AulaClasse', 'PC')
, (7, 'RicOp', '2025-02-24', 1, 'AulaClasse', 'PC')
, (8, 'RicOp', '2025-02-24', 2, 'AulaClasse', 'PC')
, (9, 'RicOp', '2025-03-03', 1, 'AulaClasse', 'PC')
, (10, 'RicOp', '2025-03-03', 2, 'AulaClasse', 'PC')
, (1, 'RelAx5E', '2024-12-11', 3, 'FabLab', 'Raspberry Pi')
, (2, 'RelAx5E', '2024-12-16', 2, 'FabLab', 'Raspberry Pi')
, (3, 'RelAx5E', '2024-12-18', 3, 'FabLab', 'Raspberry Pi')
, (4, 'RelAx5E', '2025-01-08', 3, 'FabLab', 'Raspberry Pi')
, (5, 'RelAx5E', '2025-01-13', 2, 'FabLab', 'Raspberry Pi')
, (6, 'RelAx5E', '2025-01-15', 3, 'FabLab', 'Raspberry Pi')
, (7, 'RelAx5E', '2025-01-20', 2, 'FabLab', 'Raspberry Pi')
, (8, 'RelAx5E', '2025-01-22', 3, 'FabLab', 'Raspberry Pi')
, (9, 'RelAx5E', '2025-01-27', 2, 'FabLab', 'Raspberry Pi')
, (10, 'RelAx5E', '2025-01-29', 3, 'FabLab', 'Raspberry Pi')
, (1, 'RelAx4F', '2024-12-11', 4, 'FabLab', 'Raspberry Pi')
, (2, 'RelAx4F', '2024-12-16', 1, 'FabLab', 'Raspberry Pi')
, (3, 'RelAx4F', '2024-12-18', 4, 'FabLab', 'Raspberry Pi')
, (4, 'RelAx4F', '2025-01-08', 4, 'FabLab', 'Raspberry Pi')
, (5, 'RelAx4F', '2025-01-13', 1, 'FabLab', 'Raspberry Pi')
, (6, 'RelAx4F', '2025-01-15', 4, 'FabLab', 'Raspberry Pi')
, (7, 'RelAx4F', '2025-01-20', 1, 'FabLab', 'Raspberry Pi')
, (8, 'RelAx4F', '2025-01-22', 4, 'FabLab', 'Raspberry Pi')
, (9, 'RelAx4F', '2025-01-27', 1, 'FabLab', 'Raspberry Pi')
, (10, 'RelAx4F', '2025-01-29', 4, 'FabLab', 'Raspberry Pi')
, (1, 'RelAx5LSinf', '2024-12-13', 5, 'FabLab', 'Raspberry Pi')
, (2, 'RelAx5LSinf', '2024-12-20', 5, 'FabLab', 'Raspberry Pi')
, (3, 'RelAx5LSinf', '2025-01-10', 5, 'FabLab', 'Raspberry Pi')
, (4, 'RelAx5LSinf', '2025-01-17', 5, 'FabLab', 'Raspberry Pi')
, (5, 'RelAx5LSinf', '2025-01-24', 5, 'FabLab', 'Raspberry Pi')
, (6, 'RelAx5LSinf', '2025-03-14', 5, 'FabLab', 'Raspberry Pi')
, (7, 'RelAx5LSinf', '2025-03-21', 5, 'FabLab', 'Raspberry Pi')
, (8, 'RelAx5LSinf', '2025-03-28', 5, 'FabLab', 'Raspberry Pi')
, (9, 'RelAx5LSinf', '2025-04-04', 5, 'FabLab', 'Raspberry Pi')
, (10, 'RelAx5LSinf', '2025-04-11', 5, 'FabLab', 'Raspberry Pi')
, (1, 'PhyComp', '2025-03-10', 2, 'Lab', 'Micro:bit')
, (2, 'PhyComp', '2025-03-12', 4, 'Lab', 'Micro:bit')
, (3, 'PhyComp', '2025-03-17', 2, 'Lab', 'Micro:bit')
, (4, 'PhyComp', '2025-03-19', 4, 'Lab', 'Micro:bit')
, (5, 'PhyComp', '2025-03-24', 2, 'Lab', 'Micro:bit')
, (6, 'PhyComp', '2025-03-26', 4, 'Lab', 'Micro:bit')
, (7, 'PhyComp', '2025-03-31', 2, 'Lab', 'Micro:bit')
, (8, 'PhyComp', '2025-04-02', 4, 'Lab', 'Micro:bit')
, (9, 'PhyComp', '2025-04-07', 2, 'Lab', 'Micro:bit')
, (10, 'PhyComp', '2025-04-09', 4, 'Lab', 'Micro:bit')
, (1, 'LM2', '2025-01-31', 5, 'AulaClasse', 'Notebook')
, (2, 'LM2', '2025-01-31', 6, 'AulaClasse', 'Notebook')
, (3, 'LM2', '2025-02-07', 5, 'AulaClasse', 'Notebook')
, (4, 'LM2', '2025-02-07', 6, 'AulaClasse', 'Notebook')
, (5, 'LM2', '2025-02-14', 5, 'AulaClasse', 'Notebook')
, (6, 'LM2', '2025-02-14', 6, 'AulaClasse', 'Notebook')
, (7, 'LM2', '2025-02-21', 5, 'AulaClasse', 'Notebook')
, (8, 'LM2', '2025-02-21', 6, 'AulaClasse', 'Notebook')
, (9, 'LM2', '2025-03-07', 5, 'AulaClasse', 'Notebook')
, (10, 'LM2', '2025-03-07', 6, 'AulaClasse', 'Notebook')
, (1, 'Crypto2B', '2025-02-01', 1, 'Lab', 'PC')
, (2, 'Crypto2B', '2025-02-05', 4, 'Lab', 'PC')
, (3, 'Crypto2B', '2025-02-08', 1, 'Lab', 'PC')
, (4, 'Crypto2B', '2025-02-12', 4, 'Lab', 'PC')
, (5, 'Crypto2B', '2025-02-15', 1, 'Lab', 'PC')
, (6, 'Crypto2B', '2025-02-19', 4, 'Lab', 'PC')
, (7, 'Crypto2B', '2025-02-22', 1, 'Lab', 'PC')
, (8, 'Crypto2B', '2025-03-01', 1, 'Lab', 'PC')
, (9, 'Crypto2B', '2025-03-05', 4, 'Lab', 'PC')
, (10, 'Crypto2B', '2025-03-08', 1, 'Lab', 'PC')
, (1, 'Crypto1B', '2025-02-05', 1, 'Lab', 'PC')
, (2, 'Crypto1B', '2025-02-08', 4, 'Lab', 'PC')
, (3, 'Crypto1B', '2025-02-12', 1, 'Lab', 'PC')
, (4, 'Crypto1B', '2025-02-15', 4, 'Lab', 'PC')
, (5, 'Crypto1B', '2025-02-19', 1, 'Lab', 'PC')
, (6, 'Crypto1B', '2025-02-22', 4, 'Lab', 'PC')
, (7, 'Crypto1B', '2025-02-26', 1, 'Lab', 'PC')
, (8, 'Crypto1B', '2025-03-01', 4, 'Lab', 'PC')
, (9, 'Crypto1B', '2025-03-05', 1, 'Lab', 'PC')
, (10, 'Crypto1B', '2025-03-08', 4, 'Lab', 'PC')
, (1, 'Crypto4G', '2025-02-04', 2, 'FabLab', 'Raspberry Pi')
, (2, 'Crypto4G', '2025-02-11', 2, 'FabLab', 'Raspberry Pi')
, (3, 'Crypto4G', '2025-02-18', 2, 'FabLab', 'Raspberry Pi')
, (4, 'Crypto4G', '2025-02-25', 2, 'FabLab', 'Raspberry Pi')
, (5, 'Crypto4G', '2025-03-04', 2, 'FabLab', 'Raspberry Pi')
, (6, 'Crypto4G', '2025-03-11', 2, 'FabLab', 'Raspberry Pi')
, (7, 'Crypto4G', '2025-03-18', 2, 'FabLab', 'Raspberry Pi')
, (8, 'Crypto4G', '2025-03-25', 2, 'FabLab', 'Raspberry Pi')
, (9, 'Crypto4G', '2025-04-01', 2, 'FabLab', 'Raspberry Pi')
, (10, 'Crypto4G', '2025-04-08', 2, 'FabLab', 'Raspberry Pi')
, (1, 'CyberSec3B', '2025-01-29', 5, 'FabLab', 'Raspberry Pi')
, (2, 'CyberSec3B', '2025-01-31', 6, 'FabLab', 'Raspberry Pi')
, (3, 'CyberSec3B', '2025-02-05', 5, 'FabLab', 'Raspberry Pi')
, (4, 'CyberSec3B', '2025-02-07', 6, 'FabLab', 'Raspberry Pi')
, (5, 'CyberSec3B', '2025-02-12', 5, 'FabLab', 'Raspberry Pi')
, (6, 'CyberSec3B', '2025-02-19', 5, 'FabLab', 'Raspberry Pi')
, (7, 'CyberSec3B', '2025-02-21', 6, 'FabLab', 'Raspberry Pi')
, (8, 'CyberSec3B', '2025-03-05', 5, 'FabLab', 'Raspberry Pi')
, (9, 'CyberSec3B', '2025-03-07', 6, 'FabLab', 'Raspberry Pi')
, (10, 'CyberSec3B', '2025-03-12', 5, 'FabLab', 'Raspberry Pi')
, (11, 'CyberSec3B', '2025-03-14', 6, 'FabLab', 'Raspberry Pi')
, (12, 'CyberSec3B', '2025-03-19', 5, 'FabLab', 'Raspberry Pi')
, (13, 'CyberSec3B', '2025-03-21', 6, 'FabLab', 'Raspberry Pi')
, (14, 'CyberSec3B', '2025-03-26', 5, 'FabLab', 'Raspberry Pi')
, (15, 'CyberSec3B', '2025-03-28', 6, 'FabLab', 'Raspberry Pi')
, (16, 'CyberSec3B', '2025-04-02', 5, 'FabLab', 'Raspberry Pi')
, (17, 'CyberSec3B', '2025-04-04', 6, 'FabLab', 'Raspberry Pi')
, (18, 'CyberSec3B', '2025-04-09', 5, 'FabLab', 'Raspberry Pi')
, (19, 'CyberSec3B', '2025-04-11', 6, 'FabLab', 'Raspberry Pi')
, (20, 'CyberSec3B', '2025-04-16', 5, 'FabLab', 'Raspberry Pi')
, (1, 'CyberSec4B', '2025-01-29', 6, 'FabLab', 'Raspberry Pi')
, (2, 'CyberSec4B', '2025-01-31', 4, 'FabLab', 'Raspberry Pi')
, (3, 'CyberSec4B', '2025-02-05', 6, 'FabLab', 'Raspberry Pi')
, (4, 'CyberSec4B', '2025-02-07', 4, 'FabLab', 'Raspberry Pi')
, (5, 'CyberSec4B', '2025-02-12', 6, 'FabLab', 'Raspberry Pi')
, (6, 'CyberSec4B', '2025-02-19', 6, 'FabLab', 'Raspberry Pi')
, (7, 'CyberSec4B', '2025-02-21', 4, 'FabLab', 'Raspberry Pi')
, (8, 'CyberSec4B', '2025-02-26', 6, 'FabLab', 'Raspberry Pi')
, (9, 'CyberSec4B', '2025-02-28', 4, 'FabLab', 'Raspberry Pi')
, (10, 'CyberSec4B', '2025-03-05', 6, 'FabLab', 'Raspberry Pi')
, (11, 'CyberSec4B', '2025-03-07', 4, 'FabLab', 'Raspberry Pi')
, (12, 'CyberSec4B', '2025-03-12', 6, 'FabLab', 'Raspberry Pi')
, (13, 'CyberSec4B', '2025-03-14', 4, 'FabLab', 'Raspberry Pi')
, (14, 'CyberSec4B', '2025-03-19', 6, 'FabLab', 'Raspberry Pi')
, (15, 'CyberSec4B', '2025-03-21', 4, 'FabLab', 'Raspberry Pi')
, (16, 'CyberSec4B', '2025-03-26', 6, 'FabLab', 'Raspberry Pi')
, (17, 'CyberSec4B', '2025-03-28', 4, 'FabLab', 'Raspberry Pi')
, (18, 'CyberSec4B', '2025-04-02', 6, 'FabLab', 'Raspberry Pi')
, (19, 'CyberSec4B', '2025-04-04', 4, 'FabLab', 'Raspberry Pi')
, (20, 'CyberSec4B', '2025-04-09', 6, 'FabLab', 'Raspberry Pi')
;
