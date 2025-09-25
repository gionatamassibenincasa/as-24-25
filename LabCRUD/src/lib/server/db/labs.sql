/*****************************************************************************
 Title:          Laboratori didattici innovativi per la scuola
 RDBMS:          SQLite
 Create Date:    2025-07-30
 Author:         Gionata Massi
 Description:    Crea e popola con dati iniziali la base di dati per un'applicazione web per la gestione di laboratori didattici.
 Note:           Lo script è compatibile con SQLite 3 ed è conforme a specifiche aggiuntive per essere usato con Remult e Remult-kit.
 
 Specificazioni aggiuntive:
 
 - Primary key: il nome dell'attributo deve essere: `id`
 - Foreign key: il nome dell'attributo deve essere: `id<NomeTabellaEsterna>` e le regole di aggiornamento devono essere `ON UPDATE CASCADE ON DELETE CASCADE`
 - Tipo "Date": il tipo dell'attributo deve essere:
 - `DATE` per date senza ora
 - `DATETIME` per date con ora
 - Attributo di tipo `DATETIME`: il nome dell'attributo deve essere:
 - `createdAt` quando deve essere memorizzata la data di creazione
 - `updatedAt` quando deve essere memorizzata la data di ultima modifica 
 - La base di dati deve includere uno sottoschema per gestire l'utente e le sue interazioni con l'applicazione (tabelle: Utente, Sessione, TipoPreferenza, Preferenza, Ruolo, RuoloUtente).
 *****************************************************************************/
PRAGMA foreign_keys = ON;
--
-- Autenticazione e sessione
--

--
-- Tabella Utente
--
-- L'utente è identificato da un numero
-- L'utente ha un username e una password
-- La password viene memorizzata come hash usando argon2id
CREATE TABLE Utente (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL,
  password_hash TEXT NOT NULL,
  -- email TEXT DEFAULT NULL UNIQUE,
  -- email_verified INTEGER NOT NULL DEFAULT 0,
  -- recovery_code BLOB DEFAULT NULL,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
--
-- Tabella Ruolo
--
-- Gli utente possono avere zero o piú ruoli
-- I ruoli descrivono le autorizzazioni dell'utente
-- L'id minore indica il livello di autorizzazione più elevato, che consente di eseguire tutte le operazioni dei livelli successivi
-- Per esempio: 'admin', 'crud', 'delete', 'insert', 'update', 'read'.
CREATE TABLE Ruolo (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  ruolo TEXT NOT NULL UNIQUE
);
--
-- Tabella RuoloUtente
--
-- Associazione molti a molti tra utenti e ruoli
CREATE TABLE RuoloUtente (
  idUtente INTEGER NOT NULL,
  idRuolo INTEGER NOT NULL,
  PRIMARY KEY (idUtente, idRuolo),
  FOREIGN KEY (idUtente) REFERENCES Utente(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idRuolo) REFERENCES Ruolo(id) ON UPDATE CASCADE ON DELETE CASCADE
);
--
-- Tabella Preferenza
--
-- Tipi di preferenze configurabili per ciascun utente
-- Per esempio: 'tema', 'lingua'
CREATE TABLE TipoPreferenza (
  id INTEGER NOT NULL,
  nome TEXT NOT NULL UNIQUE
);
--
-- Tabella PreferenzaUtente
--
-- Associazione molti a molti tra utenti e tipi preferenze
CREATE TABLE PreferenzaUtente (
  idUtente INTEGER NOT NULL,
  idPreferenza INTEGER NOT NULL,
  valore TEXT NOT NULL,
  PRIMARY KEY (idUtente, idPreferenza),
  FOREIGN KEY (idUtente) REFERENCES Utente(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idPreferenza) REFERENCES TipoPreferenza(id) ON UPDATE CASCADE ON DELETE CASCADE
);
--
-- Tabella Sessione
--
-- La sessione è identificata da un id testuale
-- La sessione ha un id e un segreto
-- L'applicazione invia un token al client che viene usato per autenticare la sessione che include sia l'id che l'hash del segreto: <SESSION_ID>.<SESSION_SECRET>
-- Il segreto viene memorizzato come hash usando SHA-256
-- La gestione avviene tramite cookie inviato al client: 'Set-Cookie: session_token=SESSION_TOKEN; Max-Age=86400; HttpOnly; Secure; Path=/; SameSite=Lax'
CREATE TABLE Sessione (
  id TEXT NOT NULL PRIMARY KEY,
  secretHash TEXT NOT NULL,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  expiresAt DATETIME,
  idUtente INTEGER NOT NULL,
  FOREIGN KEY (idUtente) REFERENCES Utente(id) ON UPDATE CASCADE ON DELETE CASCADE
);
--
-- Dominio applicativo
--

--
-- Tabella Ordinamento
--
-- Il sistema di istruzione secondaria italiano è diviso in: 'Licei', 'Istituti Tecnici', 'Istituti Professionali', 'Istituti Tecnici Superiori'
CREATE TABLE Ordinamento (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ordinamento TEXT UNIQUE NOT NULL
);
--
-- Tabella Corso
--
-- Rappresenta un corso di studi specifico associato ad un ordinamento
-- Ad esempio: 'Liceo Classico' è un tipo di 'Liceo'
CREATE TABLE Corso (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idOrdinamento INTEGER NOT NULL,
  corso TEXT UNIQUE,
  -- abbreviazione TEXT UNIQUE,
  FOREIGN KEY (idOrdinamento) REFERENCES Ordinamento(id) ON UPDATE CASCADE ON DELETE CASCADE
);
--
-- Tabella Indirizzo
--
-- Specifica l'indirizzo di un corso di studi. E' associato ad un corso e potrebbe avere un biennio. Potrebbe essere ulteriomente diviso in articolazioni
-- E' la tabella principale per classificare i curriculum
CREATE TABLE Indirizzo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idCorso INTEGER NOT NULL,
  indirizzo TEXT NOT NULL,
  FOREIGN KEY (idCorso) REFERENCES Corso(id)
);
-- 
-- Tabella Articolazione
--
-- Sotto-articolazione (opzionale) di un indirizzo di studi
CREATE TABLE Articolazione (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idIndirizzo INTEGER NOT NULL,
  articolazione TEXT NOT NULL UNIQUE,
  -- abbreviazione TEXT UNIQUE,
  FOREIGN KEY (idIndirizzo) REFERENCES Indirizzo(id) ON UPDATE CASCADE ON DELETE CASCADE
);
--
-- Tabella Curriculum
--
-- Rappresenta un curriculum di studio associato ad un indirizzo di studi ed eventualmente ad una sua articolazione
CREATE TABLE Curriculum (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  codice TEXT UNIQUE NOT NULL,
  idIndirizzo INTEGER NOT NULL,
  idArticolazione INTEGER DEFAULT NULL,
  curriculum TEXT NOT NULL UNIQUE,
  FOREIGN KEY (idIndirizzo) REFERENCES Indirizzo(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idArticolazione) REFERENCES Articolazione(id) ON UPDATE CASCADE ON DELETE SET NULL --,
  -- UNIQUE (idIndirizzo, idArticolazione)
);
--
-- Tabella Istituto
--
CREATE TABLE Istituto (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  istituto TEXT UNIQUE
);
-- Tabella Target
CREATE TABLE Target (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idCurriculum INTEGER NOT NULL,
  idIstituto INTEGER NOT NULL,
  abbreviazione TEXT UNIQUE,
  target TEXT,
  FOREIGN KEY (idCurriculum) REFERENCES Curriculum(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idIstituto) REFERENCES Istituto(id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- Tabella Plesso
CREATE TABLE Plesso (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  plesso TEXT,
  idIstituto INTEGER NOT NULL,
  FOREIGN KEY (idIstituto) REFERENCES Istituto(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Finanziamento (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  tipo TEXT DEFAULT NULL,
  denominazione TEXT DEFAULT NULL,
  urlAvviso TEXT DEFAULT NULL,
  importo REAL DEFAULT 0
);
-- Tabella Laboratorio
CREATE TABLE Laboratorio (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idPlesso INTEGER NOT NULL DEFAULT 1,
  laboratorio TEXT UNIQUE,
  aula TEXT,
  idFinanziamento INTEGER NOT NULL DEFAULT 1,
  modificatoDa INTEGER NOT NULL,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (modificatoDa) REFERENCES Utente(id) ON UPDATE CASCADE ON DELETE
  SET NULL,
    FOREIGN KEY (idPlesso) REFERENCES Plesso(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idFinanziamento) REFERENCES Finanziamento(id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- Tabella Modulo
CREATE TABLE Modulo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idLaboratorio INTEGER NOT NULL,
  idTarget INTEGER NOT NULL,
  modulo TEXT UNIQUE,
  descrizione TEXT,
  discipline TEXT,
  professione TEXT,
  modificatoDa INTEGER NOT NULL,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (idTarget) REFERENCES Target(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idLaboratorio) REFERENCES Laboratorio(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (modificatoDa) REFERENCES Utente(id) ON UPDATE CASCADE ON DELETE
  SET NULL
);
-- Tabella TipoObiettivo
CREATE TABLE TipoObiettivo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  tipoObiettivo TEXT NOT NULL UNIQUE,
  descrizione TEXT
);
-- Tabella Obiettivo
CREATE TABLE Obiettivo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idTipoObiettivo INTEGER NOT NULL,
  obiettivo TEXT,
  FOREIGN KEY (idTipoObiettivo) REFERENCES TipoObiettivo(id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- Tabella ObiettiviModulo (tabella di giunzione)
CREATE TABLE ObiettiviModulo (
  idModulo INTEGER NOT NULL,
  idObiettivo INTEGER NOT NULL,
  PRIMARY KEY (idModulo, idObiettivo),
  FOREIGN KEY (idModulo) REFERENCES Modulo(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idObiettivo) REFERENCES Obiettivo(id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- Tabella Voce
CREATE TABLE Voce (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  lettera TEXT UNIQUE NOT NULL,
  voce TEXT UNIQUE NOT NULL,
  descrizione TEXT,
  minimale INTEGER,
  massimale INTEGER
);
-- Tabella Fornitore
CREATE TABLE Fornitore (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  fornitore TEXT,
  PIVA TEXT,
  indirizzo TEXT,
  telefono TEXT
);
-- Tabella TipoFornitura
CREATE TABLE TipoFornitura (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  tipoFornitura TEXT UNIQUE
);
-- Tabella Fornitura
CREATE TABLE Fornitura (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idTipoFornitura INTEGER NOT NULL DEFAULT 1,
  idFornitore INTEGER NOT NULL DEFAULT 1,
  fornitura TEXT,
  prezzo REAL,
  codiceMepa TEXT DEFAULT NULL,
  link TEXT DEFAULT NULL,
  SKU TEXT DEFAULT NULL,
  modificatoDa INTEGER NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idTipoFornitura) REFERENCES TipoFornitura(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (idFornitore) REFERENCES Fornitore(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (modificatoDa) REFERENCES Utente(id) ON UPDATE CASCADE ON DELETE
  SET NULL
);
-- Tabella Costo
CREATE TABLE Costo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  idVoce INTEGER NOT NULL DEFAULT 3,
  idLaboratorio INTEGER NOT NULL,
  idFornitura INTEGER NOT NULL,
  descrizione TEXT DEFAULT NULL,
  quantita INTEGER,
  FOREIGN KEY (idVoce) REFERENCES Voce(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idLaboratorio) REFERENCES Laboratorio(id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (idFornitura) REFERENCES Fornitura(id) ON UPDATE CASCADE ON DELETE CASCADE
);
--
-- Viste
--
CREATE VIEW CostoTotalePerLaboratorio AS
SELECT 
  l.id AS idLaboratorio,
  l.laboratorio,
  IFNULL(SUM(c.quantita * f.prezzo), 0) AS costoTotale
FROM Laboratorio l
LEFT JOIN Costo c ON l.id = c.idLaboratorio
LEFT JOIN Fornitura f ON c.idFornitura = f.id
GROUP BY l.id;

-- Costo per voce per ogni laboratorio
CREATE VIEW CostoPerVoce AS
SELECT 
  l.id AS idLaboratorio,
  l.laboratorio,
  v.voce,
  IFNULL(SUM(c.quantita * f.prezzo), 0) AS costoTotaleVoce
FROM Laboratorio l
JOIN Costo c ON l.id = c.idLaboratorio
JOIN Voce v ON c.idVoce = v.id
JOIN Fornitura f ON c.idFornitura = f.id
GROUP BY l.id, v.id;

-- Dettaglio costi per laboratorio
CREATE VIEW DettaglioForniture AS
SELECT 
  l.laboratorio,
  v.voce,
  f.fornitura,
  c.descrizione,
  c.quantita,
  f.prezzo,
  (c.quantita * f.prezzo) AS costoTotale
FROM Costo c
JOIN Laboratorio l ON c.idLaboratorio = l.id
JOIN Voce v ON c.idVoce = v.id
JOIN Fornitura f ON c.idFornitura = f.id
ORDER BY l.laboratorio, v.voce;
/*
CREATE VIEW v_Target AS
SELECT idTarget,
  ordinamento,
  Indirizzo,
  articolazione,
  target,
  Target.abbreviazione AS abbreviazione
FROM Ordinamento
  INNER JOIN Indirizzo USING (idOrdinamento)
  INNER JOIN Articolazione USING (idIndirizzo)
  INNER JOIN Target USING (idArticolazione);
CREATE VIEW v_Laboratorio AS
SELECT idLaboratorio,
  laboratorio,
  modulo,
  abbreviazione AS target,
  descrizione
FROM Target
  INNER JOIN Modulo USING (idTarget)
  INNER JOIN Laboratorio USING (idLaboratorio);
CREATE VIEW v_Fornitura AS
SELECT fornitura,
  tipoFornitura,
  prezzo,
  link
FROM TipoFornitura
  INNER JOIN fornitura USING (idTipoFornitura);
CREATE VIEW v_DettagliCostoLaboratorio AS
SELECT laboratorio,
  fornitura,
  quantita,
  prezzo,
  prezzo * quantita AS totale,
  prezzo * 1.22 AS prezzoConIVA,
  prezzo * quantita * 1.22 AS totaleConIVA
FROM Laboratorio
  INNER JOIN Costo USING (idLaboratorio)
  INNER JOIN Fornitura USING (idFornitura);
CREATE VIEW v_CostoLaboratorio AS WITH t_dettagli AS (
  SELECT laboratorio,
    fornitura,
    quantita,
    prezzo,
    prezzo * quantita AS totale,
    prezzo * 1.22 AS prezzoConIVA,
    prezzo * quantita * 1.22 AS totaleConIVA
  FROM Laboratorio
    INNER JOIN Costo USING (idLaboratorio)
    INNER JOIN Fornitura USING (idFornitura)
)
SELECT laboratorio,
  group_concat(fornitura),
  SUM(totale) AS granTotale,
  sum(totaleConIVA) AS granTotaleConIVA
FROM t_dettagli
GROUP BY laboratorio
UNION
SELECT 'TOTALE',
  group_concat(fornitura),
  SUM(prezzo * quantita) AS totale,
  SUM(prezzo * quantita * 1.22) AS totaleConIVA
FROM Laboratorio
  INNER JOIN Costo USING (idLaboratorio)
  INNER JOIN Fornitura USING (idFornitura);
*/

BEGIN;
INSERT INTO Utente (username, password_hash)
VALUES (
    'g.massi',
    '$argon2id$v=19$m=65536,t=2,p=1$rCr+5QGepF+CgCp74DVBxORkUZifqaS2RYSwscBJUGA$8S/MsVPWo0onGNl5RjPt1SYwi7NKpGvYQOT7IPSqL7Y'
  ),
  (
    'a.bernacchia',
    '$argon2id$v=19$m=65536,t=2,p=1$mKiajtXTzkdpqG7kcw0xG09IgF+Vig2H6bs8mTTVs9c$zjFOHJerh7FRKVnzsy2IVN+CVMqbZAfL1+aPcn3eKg8|1752591877179'
  );
INSERT INTO Ruolo (ruolo)
VALUES ('admin'),
  ('crud'),
  ('delete'),
  ('insert'),
  ('update'),
  ('read');
INSERT INTO RuoloUtente
VALUES (1, 1),
  (1, 2),
  (2, 6);
-- Ordinamento
INSERT INTO Ordinamento
VALUES (1, 'Liceo'),
  (2, 'Istituto Tecnico'),
  (3, 'Istituto Professionale'),
  (4, 'Istituto Tecnico Superiore');
INSERT INTO Corso (idOrdinamento, corso)
VALUES -- Licei
  (
    (
      SELECT id
      FROM Ordinamento
      WHERE ordinamento = 'Liceo'
    ),
    'Liceo Classico'
  ),
  (
    (
      SELECT id
      FROM Ordinamento
      WHERE ordinamento = 'Liceo'
    ),
    'Liceo Scientifico'
  ),
  (
    (
      SELECT id
      FROM Ordinamento
      WHERE ordinamento = 'Liceo'
    ),
    'Liceo Linguistico'
  ),
  (
    (
      SELECT id
      FROM Ordinamento
      WHERE ordinamento = 'Liceo'
    ),
    'Liceo Artistico'
  ),
  (
    (
      SELECT id
      FROM Ordinamento
      WHERE ordinamento = 'Liceo'
    ),
    'Liceo Musicale e Coreutico'
  ),
  (
    (
      SELECT id
      FROM Ordinamento
      WHERE ordinamento = 'Liceo'
    ),
    'Liceo delle Scienze Umane'
  ),
  (
    (
      SELECT id
      FROM Ordinamento
      WHERE ordinamento = 'Istituto Tecnico'
    ),
    'Istituto Tecnico settore Economico'
  ),
  (
    (
      SELECT id
      FROM Ordinamento
      WHERE ordinamento = 'Istituto Tecnico'
    ),
    'Istituto Tecnico settore Tecnologico'
  ),
  (
    (
      SELECT id
      FROM Ordinamento
      WHERE ordinamento = 'Istituto Professionale'
    ),
    'Istituto Professionale settore Servizi'
  ),
  (
    (
      SELECT id
      FROM Ordinamento
      WHERE ordinamento = 'Istituto Professionale'
    ),
    'Istituto Professionale settore Industria e Artigianato'
  );
INSERT INTO Indirizzo (idCorso, indirizzo)
VALUES (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Liceo Classico'
    ),
    'Liceo Classico'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Liceo Scientifico'
    ),
    'Liceo Scientifico'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Liceo Linguistico'
    ),
    'Liceo Linguistico'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Liceo Artistico'
    ),
    'Liceo Artistico'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Liceo Musicale e Coreutico'
    ),
    'Liceo Musicale e Coreutico'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Liceo delle Scienze Umane'
    ),
    'Liceo delle Scienze Umane'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Economico'
    ),
    'AMMINISTRAZIONE, FINANZA E MARKETING'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Economico'
    ),
    'TURISMO'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Tecnologico'
    ),
    'MECCANICA, MECCATRONICA ED ENERGIA'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Tecnologico'
    ),
    'TRASPORTI E LOGISTICA'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Tecnologico'
    ),
    'ELETTRONICA ED ELETTROTECNICA'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Tecnologico'
    ),
    'INFORMATICA E TELECOMUNICAZIONI'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Tecnologico'
    ),
    'GRAFICA E COMUNICAZIONE'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Tecnologico'
    ),
    'CHIMICA, MATERIALI E BIOTECNOLOGIE'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Tecnologico'
    ),
    'SISTEMA MODA'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Tecnologico'
    ),
    'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Tecnico settore Tecnologico'
    ),
    'COSTRUZIONI, AMBIENTE E TERRITORIO'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Professionale settore Servizi'
    ),
    'SERVIZI PER L''AGRICOLTURA E LO SVILUPPO RURALE'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Professionale settore Servizi'
    ),
    'SERVIZI SOCIO-SANITARI'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Professionale settore Servizi'
    ),
    'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Professionale settore Servizi'
    ),
    'SERVIZI COMMERCIALI'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Professionale settore Industria e Artigianato'
    ),
    'PRODUZIONI INDUSTRIALI E ARTIGIANALI'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Professionale settore Industria e Artigianato'
    ),
    'MANUTENZIONE E ASSISTENZA TECNICA'
  ),
  (
    (
      SELECT id
      FROM Corso
      WHERE corso = 'Istituto Professionale settore Industria e Artigianato'
    ),
    'GESTIONE DELLE ACQUE E RISANAMENTO AMBIENTALE'
  );
INSERT INTO Articolazione (idIndirizzo, articolazione)
VALUES (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Scientifico'
    ),
    'opzione Scienze Applicate'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Scientifico'
    ),
    'Sezione ad indirizzo sportivo'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    'indirizzo "Arti figurative"'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    'indirizzo "Architettura e ambiente"'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    'indirizzo "Design"'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    'indirizzo "Audiovisivo e multimediale"'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    'indirizzo "Grafica"'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    'indirizzo "Scenografia"'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Musicale e Coreutico'
    ),
    'sezione Musicale'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Musicale e Coreutico'
    ),
    'sezione Coreutica'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo delle Scienze Umane'
    ),
    'opzione Economico-sociale'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AMMINISTRAZIONE, FINANZA E MARKETING'
    ),
    'SISTEMI INFORMATIVI AZIENDALI'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AMMINISTRAZIONE, FINANZA E MARKETING'
    ),
    'RELAZIONI INTERNAZIONALI PER IL MARKETING'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'MECCANICA, MECCATRONICA ED ENERGIA'
    ),
    'MECCANICA E MECCATRONICA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'MECCANICA, MECCATRONICA ED ENERGIA'
    ),
    'ENERGIA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'TRASPORTI E LOGISTICA'
    ),
    'COSTRUZIONE DEL MEZZO'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'TRASPORTI E LOGISTICA'
    ),
    'CONDUZIONE DEL MEZZO'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'TRASPORTI E LOGISTICA'
    ),
    'LOGISTICA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'ELETTRONICA ED ELETTROTECNICA'
    ),
    'ELETTRONICA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'ELETTRONICA ED ELETTROTECNICA'
    ),
    'ELETTROTECNICA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'ELETTRONICA ED ELETTROTECNICA'
    ),
    'AUTOMAZIONE'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'INFORMATICA E TELECOMUNICAZIONI'
    ),
    'INFORMATICA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'INFORMATICA E TELECOMUNICAZIONI'
    ),
    'TELECOMUNICAZIONI'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'CHIMICA, MATERIALI E BIOTECNOLOGIE'
    ),
    'CHIMICA E MATERIALI'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'CHIMICA, MATERIALI E BIOTECNOLOGIE'
    ),
    'BIOTECNOLOGIE AMBIENTALI'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'CHIMICA, MATERIALI E BIOTECNOLOGIE'
    ),
    'BIOTECNOLOGIE SANITARIE'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SISTEMA MODA'
    ),
    'TESSILE, ABBIGLIAMENTO E MODA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SISTEMA MODA'
    ),
    'CALZATURE E MODA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
    ),
    'PRODUZIONI E TRASFORMAZIONI'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
    ),
    'GESTIONE DELL''AMBIENTE E DEL TERRITORIO'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
    ),
    'VITICOLTURA ED ENOLOGIA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'COSTRUZIONI, AMBIENTE E TERRITORIO'
    ),
    'TECNOLOGIE DEL LEGNO NELLE COSTRUZIONI'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI SOCIO-SANITARI'
    ),
    'ARTI AUSILIARIE DELLE PROFESSIONI SANITARIE: ODONTOTECNICO'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI SOCIO-SANITARI'
    ),
    'ARTI AUSILIARI DELLE PROFESSIONI SANITARIE: OTTICO'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
    ),
    'ENOGASTRONOMIA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
    ),
    'SALA E VENDITA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
    ),
    'ACCOGLIENZA TURISTICA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'PRODUZIONI INDUSTRIALI E ARTIGIANALI'
    ),
    'INDUSTRIA'
  ),
  (
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'PRODUZIONI INDUSTRIALI E ARTIGIANALI'
    ),
    'ARTIGIANATO'
  );
INSERT INTO Curriculum (codice, idIndirizzo, idArticolazione, curriculum)
VALUES (
    'LI01',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Classico'
    ),
    NULL,
    'LICEO CLASSICO'
  ),
  (
    'LI02',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Scientifico'
    ),
    NULL,
    'LICEO SCIENTIFICO'
  ),
  (
    'LI03',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Scientifico'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'opzione Scienze Applicate'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo Scientifico'
        )
    ),
    'LICEO SCIENTIFICO - opzione Scienze Applicate'
  ),
  (
    'LI04',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Scientifico'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'Sezione ad indirizzo sportivo'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo Scientifico'
        )
    ),
    'LICEO SCIENTIFICO - Sezione ad indirizzo sportivo'
  ),
  (
    'LI05',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Linguistico'
    ),
    NULL,
    'LICEO LINGUISTICO'
  ),
  (
    'LI06',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    NULL,
    'LICEO ARTISTICO'
  ),
  (
    'LI07',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'indirizzo "Arti figurative"'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo Artistico'
        )
    ),
    'Liceo Artistico - indirizzo "Arti figurative"'
  ),
  (
    'LI08',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'indirizzo "Architettura e ambiente"'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo Artistico'
        )
    ),
    'Liceo Artistico - indirizzo "Architettura e ambiente"'
  ),
  (
    'LI09',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'indirizzo "Design"'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo Artistico'
        )
    ),
    'Liceo Artistico - indirizzo "Design"'
  ),
  (
    'LI10',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'indirizzo "Audiovisivo e multimediale"'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo Artistico'
        )
    ),
    'Liceo Artistico - indirizzo "Audiovisivo e multimediale"'
  ),
  (
    'LI11',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'indirizzo "Grafica"'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo Artistico'
        )
    ),
    'Liceo Artistico - indirizzo "Grafica"'
  ),
  (
    'LI12',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Artistico'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'indirizzo "Scenografia"'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo Artistico'
        )
    ),
    'Liceo Artistico - indirizzo "Scenografia"'
  ),
  (
    'LI13',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Musicale e Coreutico'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'sezione Musicale'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo Musicale e Coreutico'
        )
    ),
    'LICEO MUSICALE E COREUTICO - sezione Musicale'
  ),
  (
    'LI14',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo Musicale e Coreutico'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'sezione Coreutica'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo Musicale e Coreutico'
        )
    ),
    'LICEO MUSICALE E COREUTICO - sezione Coreutica'
  ),
  (
    'LI15',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo delle Scienze Umane'
    ),
    NULL,
    'LICEO DELLE SCIENZE UMANE'
  ),
  (
    'LI16',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'Liceo delle Scienze Umane'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'opzione Economico-sociale'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'Liceo delle Scienze Umane'
        )
    ),
    'LICEO DELLE SCIENZE UMANE - opzione Economico-sociale'
  ),
  (
    'TE01',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AMMINISTRAZIONE, FINANZA E MARKETING'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE ECONOMICO INDIRIZZO "AMMINISTRAZIONE, FINANZA E MARKETING"'
  ),
  (
    'TE02',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AMMINISTRAZIONE, FINANZA E MARKETING'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'SISTEMI INFORMATIVI AZIENDALI'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'AMMINISTRAZIONE, FINANZA E MARKETING'
        )
    ),
    'ISTITUTO TECNICO SETTORE ECONOMICO INDIRIZZO "AMMINISTRAZIONE, FINANZA E MARKETING" ARTICOLAZIONE "SISTEMI INFORMATIVI AZIENDALI"'
  ),
  (
    'TE03',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AMMINISTRAZIONE, FINANZA E MARKETING'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'RELAZIONI INTERNAZIONALI PER IL MARKETING'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'AMMINISTRAZIONE, FINANZA E MARKETING'
        )
    ),
    'ISTITUTO TECNICO SETTORE ECONOMICO INDIRIZZO "AMMINISTRAZIONE, FINANZA E MARKETING" ARTICOLAZIONE "RELAZIONI INTERNAZIONALI PER IL MARKETING"'
  ),
  (
    'TE04',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'TURISMO'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE ECONOMICO INDIRIZZO "TURISMO"'
  ),
  (
    'TE05',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'MECCANICA, MECCATRONICA ED ENERGIA'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "MECCANICA, MECCATRONICA ED ENERGIA"'
  ),
  (
    'TE06',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'MECCANICA, MECCATRONICA ED ENERGIA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'MECCANICA E MECCATRONICA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'MECCANICA, MECCATRONICA ED ENERGIA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "MECCANICA, MECCATRONICA ED ENERGIA" ARTICOLAZIONE "MECCANICA E MECCATRONICA"'
  ),
  (
    'TE07',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'MECCANICA, MECCATRONICA ED ENERGIA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'ENERGIA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'MECCANICA, MECCATRONICA ED ENERGIA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "MECCANICA, MECCATRONICA ED ENERGIA" ARTICOLAZIONE "ENERGIA"'
  ),
  (
    'TE08',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'TRASPORTI E LOGISTICA'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "TRASPORTI E LOGISTICA"'
  ),
  (
    'TE09',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'TRASPORTI E LOGISTICA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'COSTRUZIONE DEL MEZZO'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'TRASPORTI E LOGISTICA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "TRASPORTI E LOGISTICA" ARTICOLAZIONE "COSTRUZIONE DEL MEZZO"'
  ),
  (
    'TE10',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'TRASPORTI E LOGISTICA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'CONDUZIONE DEL MEZZO'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'TRASPORTI E LOGISTICA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "TRASPORTI E LOGISTICA" ARTICOLAZIONE "CONDUZIONE DEL MEZZO"'
  ),
  (
    'TE11',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'TRASPORTI E LOGISTICA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'LOGISTICA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'TRASPORTI E LOGISTICA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "TRASPORTI E LOGISTICA" ARTICOLAZIONE "LOGISTICA"'
  ),
  (
    'TE12',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'ELETTRONICA ED ELETTROTECNICA'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "ELETTRONICA ED ELETTROTECNICA"'
  ),
  (
    'TE13',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'ELETTRONICA ED ELETTROTECNICA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'ELETTRONICA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'ELETTRONICA ED ELETTROTECNICA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "ELETTRONICA ED ELETTROTECNICA" ARTICOLAZIONE "ELETTRONICA"'
  ),
  (
    'TE14',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'ELETTRONICA ED ELETTROTECNICA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'ELETTROTECNICA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'ELETTRONICA ED ELETTROTECNICA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "ELETTRONICA ED ELETTROTECNICA" ARTICOLAZIONE "ELETTROTECNICA"'
  ),
  (
    'TE15',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'ELETTRONICA ED ELETTROTECNICA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'AUTOMAZIONE'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'ELETTRONICA ED ELETTROTECNICA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "ELETTRONICA ED ELETTROTECNICA" ARTICOLAZIONE "AUTOMAZIONE"'
  ),
  (
    'TE16',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'INFORMATICA E TELECOMUNICAZIONI'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "INFORMATICA E TELECOMUNICAZIONI"'
  ),
  (
    'TE17',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'INFORMATICA E TELECOMUNICAZIONI'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'INFORMATICA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'INFORMATICA E TELECOMUNICAZIONI'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "INFORMATICA E TELECOMUNICAZIONI" ARTICOLAZIONE "INFORMATICA"'
  ),
  (
    'TE18',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'INFORMATICA E TELECOMUNICAZIONI'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'TELECOMUNICAZIONI'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'INFORMATICA E TELECOMUNICAZIONI'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "INFORMATICA E TELECOMUNICAZIONI" ARTICOLAZIONE "TELECOMUNICAZIONI"'
  ),
  (
    'TE19',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'GRAFICA E COMUNICAZIONE'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "GRAFICA E COMUNICAZIONE"'
  ),
  (
    'TE20',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'CHIMICA, MATERIALI E BIOTECNOLOGIE'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "CHIMICA, MATERIALI E BIOTECNOLOGIE"'
  ),
  (
    'TE21',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'CHIMICA, MATERIALI E BIOTECNOLOGIE'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'CHIMICA E MATERIALI'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'CHIMICA, MATERIALI E BIOTECNOLOGIE'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "CHIMICA, MATERIALI E BIOTECNOLOGIE" ARTICOLAZIONE "CHIMICA E MATERIALI"'
  ),
  (
    'TE22',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'CHIMICA, MATERIALI E BIOTECNOLOGIE'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'BIOTECNOLOGIE AMBIENTALI'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'CHIMICA, MATERIALI E BIOTECNOLOGIE'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "CHIMICA, MATERIALI E BIOTECNOLOGIE" ARTICOLAZIONE "BIOTECNOLOGIE AMBIENTALI"'
  ),
  (
    'TE23',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'CHIMICA, MATERIALI E BIOTECNOLOGIE'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'BIOTECNOLOGIE SANITARIE'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'CHIMICA, MATERIALI E BIOTECNOLOGIE'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "CHIMICA, MATERIALI E BIOTECNOLOGIE" ARTICOLAZIONE "BIOTECNOLOGIE SANITARIE"'
  ),
  (
    'TE24',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SISTEMA MODA'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "SISTEMA MODA"'
  ),
  (
    'TE25',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SISTEMA MODA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'TESSILE, ABBIGLIAMENTO E MODA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'SISTEMA MODA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "SISTEMA MODA" ARTICOLAZIONE "TESSILE, ABBIGLIAMENTO E MODA"'
  ),
  (
    'TE26',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SISTEMA MODA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'CALZATURE E MODA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'SISTEMA MODA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "SISTEMA MODA" ARTICOLAZIONE "CALZATURE E MODA"'
  ),
  (
    'TE27',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "AGRARIA, AGROALIMENTARE E AGROINDUSTRIA"'
  ),
  (
    'TE28',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'PRODUZIONI E TRASFORMAZIONI'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "AGRARIA, AGROALIMENTARE E AGROINDUSTRIA" ARTICOLAZIONE "PRODUZIONI E TRASFORMAZIONI"'
  ),
  (
    'TE29',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'GESTIONE DELL''AMBIENTE E DEL TERRITORIO'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "AGRARIA, AGROALIMENTARE E AGROINDUSTRIA" ARTICOLAZIONE "GESTIONE DELL''AMBIENTE E DEL TERRITORIO"'
  ),
  (
    'TE30',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'VITICOLTURA ED ENOLOGIA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'AGRARIA, AGROALIMENTARE E AGROINDUSTRIA'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "AGRARIA, AGROALIMENTARE E AGROINDUSTRIA" ARTICOLAZIONE "VITICOLTURA ED ENOLOGIA"'
  ),
  (
    'TE31',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'COSTRUZIONI, AMBIENTE E TERRITORIO'
    ),
    NULL,
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "COSTRUZIONI, AMBIENTE E TERRITORIO"'
  ),
  (
    'TE32',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'COSTRUZIONI, AMBIENTE E TERRITORIO'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'TECNOLOGIE DEL LEGNO NELLE COSTRUZIONI'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'COSTRUZIONI, AMBIENTE E TERRITORIO'
        )
    ),
    'ISTITUTO TECNICO SETTORE TECNOLOGICO INDIRIZZO "COSTRUZIONI, AMBIENTE E TERRITORIO" ARTICOLAZIONE "TECNOLOGIE DEL LEGNO NELLE COSTRUZIONI"'
  ),
  (
    'PR01',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI PER L''AGRICOLTURA E LO SVILUPPO RURALE'
    ),
    NULL,
    'ISTITUTO PROFESSIONALE SETTORE SERVIZI INDIRIZZO "SERVIZI PER L''AGRICOLTURA E LO SVILUPPO RURALE"'
  ),
  (
    'PR02',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI SOCIO-SANITARI'
    ),
    NULL,
    'ISTITUTO PROFESSIONALE SETTORE SERVIZI INDIRIZZO "SERVIZI SOCIO-SANITARI"'
  ),
  (
    'PR03',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI SOCIO-SANITARI'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'ARTI AUSILIARIE DELLE PROFESSIONI SANITARIE: ODONTOTECNICO'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'SERVIZI SOCIO-SANITARI'
        )
    ),
    'ISTITUTO PROFESSIONALE SETTORE SERVIZI INDIRIZZO "SERVIZI SOCIO-SANITARI" ARTICOLAZIONE "ARTI AUSILIARIE DELLE PROFESSIONI SANITARIE: ODONTOTECNICO"'
  ),
  (
    'PR04',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI SOCIO-SANITARI'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'ARTI AUSILIARI DELLE PROFESSIONI SANITARIE: OTTICO'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'SERVIZI SOCIO-SANITARI'
        )
    ),
    'ISTITUTO PROFESSIONALE SETTORE SERVIZI INDIRIZZO "SERVIZI SOCIO-SANITARI" ARTICOLAZIONE "ARTI AUSILIARI DELLE PROFESSIONI SANITARIE: OTTICO"'
  ),
  (
    'PR05',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
    ),
    NULL,
    'ISTITUTO PROFESSIONALE SETTORE SERVIZI INDIRIZZO "SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA"'
  ),
  (
    'PR06',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'ENOGASTRONOMIA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
        )
    ),
    'ISTITUTO PROFESSIONALE SETTORE SERVIZI INDIRIZZO "SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA" ARTICOLAZIONE "ENOGASTRONOMIA"'
  ),
  (
    'PR07',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'SALA E VENDITA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
        )
    ),
    'ISTITUTO PROFESSIONALE SETTORE SERVIZI INDIRIZZO "SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA" ARTICOLAZIONE "SALA E VENDITA"'
  ),
  (
    'PR08',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'ACCOGLIENZA TURISTICA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA'
        )
    ),
    'ISTITUTO PROFESSIONALE SETTORE SERVIZI INDIRIZZO "SERVIZI PER L''ENOGASTRONOMIA E L''OSPITALITÀ ALBERGHIERA" ARTICOLAZIONE "ACCOGLIENZA TURISTICA"'
  ),
  (
    'PR09',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'SERVIZI COMMERCIALI'
    ),
    NULL,
    'ISTITUTO PROFESSIONALE SETTORE SERVIZI INDIRIZZO "SERVIZI COMMERCIALI"'
  ),
  (
    'PR10',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'PRODUZIONI INDUSTRIALI E ARTIGIANALI'
    ),
    NULL,
    'ISTITUTO PROFESSIONALE SETTORE INDUSTRIA E ARTIGIANATO INDIRIZZO "PRODUZIONI INDUSTRIALI E ARTIGIANALI"'
  ),
  (
    'PR11',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'PRODUZIONI INDUSTRIALI E ARTIGIANALI'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'INDUSTRIA'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'PRODUZIONI INDUSTRIALI E ARTIGIANALI'
        )
    ),
    'ISTITUTO PROFESSIONALE SETTORE INDUSTRIA E ARTIGIANATO INDIRIZZO "PRODUZIONI INDUSTRIALI E ARTIGIANALI" ARTICOLAZIONE "INDUSTRIA"'
  ),
  (
    'PR12',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'PRODUZIONI INDUSTRIALI E ARTIGIANALI'
    ),
    (
      SELECT id
      FROM Articolazione
      WHERE articolazione = 'ARTIGIANATO'
        AND idIndirizzo = (
          SELECT id
          FROM Indirizzo
          WHERE indirizzo = 'PRODUZIONI INDUSTRIALI E ARTIGIANALI'
        )
    ),
    'ISTITUTO PROFESSIONALE SETTORE INDUSTRIA E ARTIGIANATO INDIRIZZO "PRODUZIONI INDUSTRIALI E ARTIGIANALI" ARTICOLAZIONE "ARTIGIANATO"'
  ),
  (
    'PR13',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'MANUTENZIONE E ASSISTENZA TECNICA'
    ),
    NULL,
    'ISTITUTO PROFESSIONALE SETTORE INDUSTRIA E ARTIGIANATO INDIRIZZO "MANUTENZIONE E ASSISTENZA TECNICA"'
  ),
  (
    'PR14',
    (
      SELECT id
      FROM Indirizzo
      WHERE indirizzo = 'GESTIONE DELLE ACQUE E RISANAMENTO AMBIENTALE'
    ),
    NULL,
    'ISTITUTO PROFESSIONALE SETTORE INDUSTRIA E ARTIGIANATO INDIRIZZO "GESTIONE DELLE ACQUE E RISANAMENTO AMBIENTALE"'
  );
INSERT INTO Istituto
VALUES (1, 'IIS Savoia Benincasa');
-- Target
INSERT INTO Target (idCurriculum, idIstituto, abbreviazione, target)
VALUES (
    (
      SELECT id
      FROM Curriculum
      WHERE curriculum = 'ISTITUTO TECNICO SETTORE ECONOMICO INDIRIZZO "AMMINISTRAZIONE, FINANZA E MARKETING" ARTICOLAZIONE "SISTEMI INFORMATIVI AZIENDALI"'
    ),
    (
      SELECT id
      FROM Istituto
      WHERE istituto = 'IIS Savoia Benincasa'
    ),
    'ITE SIA triennio',
    'SIA'
  ),
  (
    (
      SELECT id
      FROM Curriculum
      WHERE curriculum = 'ISTITUTO TECNICO SETTORE ECONOMICO INDIRIZZO "AMMINISTRAZIONE, FINANZA E MARKETING"'
    ),
    (
      SELECT id
      FROM Istituto
      WHERE istituto = 'IIS Savoia Benincasa'
    ),
    'ITE AFM biennio comune',
    'ITE AFM I-II'
  ),
  (
    (
      SELECT id
      FROM Curriculum
      WHERE curriculum = 'ISTITUTO TECNICO SETTORE ECONOMICO INDIRIZZO "AMMINISTRAZIONE, FINANZA E MARKETING"'
    ),
    (
      SELECT id
      FROM Istituto
      WHERE istituto = 'IIS Savoia Benincasa'
    ),
    'ITE AFM triennio',
    'ITE AFM III-IV-V'
  ),
  (
    (
      SELECT id
      FROM Curriculum
      WHERE curriculum = 'ISTITUTO TECNICO SETTORE ECONOMICO INDIRIZZO "TURISMO"'
    ),
    (
      SELECT id
      FROM Istituto
      WHERE istituto = 'IIS Savoia Benincasa'
    ),
    'ITE Tur biennio comune',
    'ITE Tur I-II'
  );
INSERT INTO Plesso
VALUES (1, 'Via Vecchini, 2', 1),
  (2, 'Via Marini, 33', 1);
INSERT INTO TipoObiettivo
VALUES (
    1,
    'Generale',
    'Sono obiettivi ampi e di lungo respiro, che definiscono la direzione generale del percorso formativo. Ad esempio, "sviluppare capacità di pensiero critico".'
  ),
  (
    2,
    'Specifico',
    'Sono obiettivi più dettagliati e concreti, che descrivono cosa si intende raggiungere in termini di conoscenze, abilità e comportamenti specifici. Ad esempio, "essere in grado di analizzare un testo argomentativo identificando tesi e argomenti".'
  );
INSERT INTO TipoFornitura
VALUES (1, 'Computer fisso e periferiche indispensabili'),
  (2, 'Computer portatile'),
  (
    3,
    'Single Board Computer e periferiche indispensabili'
  ),
  (4, 'Microcontrollore'),
  (5, 'Stampante'),
  (6, 'Visore 3D'),
  (7, 'Altre periferiche computer'),
  (8, 'Sensori ed attuatori'),
  (9, 'Armadi e carrelli'),
  (10, 'Digital board'),
  (
    11,
    'Dispositivi per l''Intelligenza Artificiale e l''Industria 5.0'
  ),
  (12, 'Infrastruttura di rete'),
  (13, 'Licenze Software'),
  (100, 'Installazione');
INSERT INTO Fornitore (id, fornitore)
VALUES (1, 'Orsetti');
INSERT INTO Voce
VALUES (
    1,
    'A',
    'Progettazione',
    'La progettazione consiste nell’insieme delle attività propedeutiche all’emanazione dell’avviso pubblico/richiesta di offerta/trattativa diretta/ordine di acquisto (nel rispetto del codice dei contratti) e del relativo disciplinare e capitolato tecnico per l’acquisto dei beni e dei servizi ed è assicurata da personale interno o esterno all’istituzione scolastica in possesso di adeguata professionalità per la realizzazione della relativa azione ammessa a finanziamento.',
    0,
    2
  ),
  (
    2,
    'B',
    'Spese organizzative e gestionali',
    'Si tratta di spese funzionali alla gestione e all’attuazione del progetto e includono:\n -compensi per il personale scolastico e per i soggetti coinvolti a vario titolo nell’attuazione dei progetti (es. gestione del sistema informativo, attività connesse alla stesura degli atti di gara, adempimenti operativi, relazioni con l’Ufficio dell’Autorità di Gestione);\n - spese per la copertura assicurativa dei beni acquistati; • spese per le spedizioni postali;\n - contributo ANAC per la richiesta del CIG.',
    0,
    5
  ),
  (
    3,
    'C',
    'Fornitura di beni e attrezzature (e relativa installazione)',
    'Oggetto del presente avviso è la fornitura di beni e attrezzature per la realizzazione di laboratori professionalizzanti.',
    85,
    100
  ),
  (
    4,
    'D',
    'Piccoli interventi di sistemazione edilizia/terreno',
    'È prevista la possibilità di effettuare piccoli interventi di adattamento edilizio e impiantistico funzionali all’installazione e all’utilizzo dei beni e delle attrezzature acquistati.',
    0,
    5
  ),
  (
    5,
    'E',
    'Pubblicità',
    'Il corretto adempimento rispetto agli obblighi di pubblicità costituisce una condizione imprescindibile di ogni intervento finanziato con i Fondi Strutturali e deve essere programmata a livello di singolo intervento. Per ogni progetto cofinanziato dal Fondo Sociale Europeo o del Fondo Europeo di Sviluppo Regionale, il beneficiario è tenuto a svolgere una specifica azione di informazione, sensibilizzazione e pubblicità. Sussiste, altresì, l’obbligo di apposizione di targhette con logo, codice progetto e indicazione del fondo su tutti i beni acquistati con il FESR. Le relative specifiche tecniche sono disponibili al seguente link: https://www.istruzione.it/pon/ponkit.html.',
    0,
    1
  ),
  (
    6,
    'F',
    'Certificato di collaudo, verifica di conformità o di regolare esecuzione',
    'A seguito della realizzazione dei laboratori, l’istituzione scolastica provvede al rilascio dei certificati di collaudo, di verifica di conformità o dei certificati di regolare esecuzione.',
    0,
    1
  ),
  (
    7,
    'G',
    'Addestramento all''uso delle attrezzature',
    '...',
    0,
    1
  );
INSERT INTO Finanziamento
VALUES (
    1,
    'POC',
    'Per la scuola',
    'https://www.mim.gov.it/documents/20182/8938100/m_pi.AOOGABMI.REGISTRO+UFFICIALE%28U%29.0088643.03-06-2025.pdf/25e5ef54-2a3f-4fda-b4c4-b9a0cb52d2b4?t=1748959520204',
    201000
  ),
  (
    2,
    'PNRR',
    'Scuola 4.0: scuole innovative, cablaggio, nuovi ambienti di apprendimento e laboratori',
    'https://www.mim.gov.it/documents/8099600/8783257/m_pi.AOOGABMI.REGISTRO-UFFICIALEU.0089057.03-06-2025.pdf/02b9f70d-7237-4bf5-59e9-cd63569fb061?version=1.0&t=1749458687505',
    750000
  );
INSERT INTO Laboratorio (
    idPlesso,
    laboratorio,
    aula,
    idFinanziamento,
    modificatoDa
  )
VALUES (
    1,
    'Management and Operations',
    'Laboratorio Informatica',
    1,
    1
  ),
  (
    1,
    'Data Science and Artificial Intelligence',
    'Aula sdoppiamento',
    1,
    1
  ),
  (
    1,
    'Cybersecurity and Physical Computing',
    'Aula sdoppiamento',
    1,
    1
  ),
  (
    1,
    'Multimedia and Videogame Development',
    'Aula sdoppiamento',
    1,
    1
  ),
  (
    1,
    'Digital Travels and Digital Art',
    'Aula "Viviana Giovannetti"',
    1,
    1
  );
INSERT INTO Modulo (
    idLaboratorio,
    idTarget,
    modulo,
    descrizione,
    discipline,
    professione,
    modificatoDa
  )
VALUES (
    1,
    1,
    'Management and Operations',
    'Laboratorio per lo sviluppo di competenze nella gestione aziendale, ottimizzazione dei processi e implementazione di soluzioni informatiche. Per semplificare le operazioni di manutenzione, un server mantiene l''immagine aggiornata del sistema operativo, che viene caricata dai PC all''avvio (netboot). I dati degli utenti sono salvati su un server Samba. Il disco locale è usato come cache per il sistema operativo e come eventuale partizione di swap. Le credenziali di accesso sono memorizzare al fine di consentire un accesso con singola password (Single Sign-On)',
    'Il modulo di Management e Operations permette di svolgere percorsi didattici multidisciplinari di Economia Aziendale, Informatica, Matematica e altre discipline del triennio SIA',
    'Ragioniere programmatore',
    1
  ),
  (
    2,
    3,
    'Data Science and Artificial Intelligence',
    'Laboratorio per lo sviluppo di competenze nell''analisi dei dati aziendali, la definizione di azioni a partire da modelli quantitativi e l''uso di strumenti d''inferenza statistica quali i recenti modelli delle reti neurali artificiali. Il modulo prevede anche l''interazione con oggetti del mondo fisico attraverso sensori d''immagine e casi applicativi legati all''intelligenza artificiale legati alla regressione, alla classificazione e alla clusterizzazione. Al fine di aumentare il coinvolgimento verranno utilizzati esempi di Computer Vision.',
    'Percorsi didattici multidisciplinari di Economia Aziendale, Informatica, Matematica e altre discipline del triennio SIA',
    'Data analyst',
    1
  ),
  (
    3,
    2,
    'Cybersecurity and Physical Computing',
    'Modulo per lo sviluppo di competenze informatiche attraverso la sperimentazione pratica di dispositivi e sistemi informatici, con particolare enfasi sugli aspetti di: protezione dei dati, sicurezza dei sistemi e sicurezza dei dispositivi.',
    'Informatica, Matematica, Diritto',
    'Ruoli connessi alla gestione delle sicurezza informatica',
    1
  ),
  (
    4,
    1,
    'Multimedia and Videogame Development',
    'Negli ultimi anni, la progettazione di videogiochi è diventata una delle aree più affascinanti e dinamiche del panorama tecnologico. È noto che il mondo dei (video)giochi può alimentare il desiderio di una persona nell''impegnarsi in attività spesso considerate di ridotto interesse. Questo aspetto porta a dover introdurre aspetti anche complessi nello sviluppo di applicazioni multimediali. A tal proposito linguaggi di programmazione come Python consentono di ridurre la complessità nelle fasi di sviluppo di applicazioni grazie anche alla ridotta complessità nell''apprendere concetti della programmazione che spaziano dalle istruzioni condizionali alle strutture dati. Programmare videogame in Python oggi è molto semplice grazie alla disponibilità di diverse librerie e framework che consentono di ridurre anche in questo caso la complessità tipica di questo mondo. L''idea  di insegnare la programmazione attraverso la creazione dei giochi non è nuova ed è stata ampiamente sviluppata negli anni ''80, quando le cassette con i videogiochi per gli home computer dell''epoca erano accompagnate da riviste che introducevano alla programmazione. Negli anni recenti, con l''introduzione del Python e di Single-board computer (SBC) come Raspberry Pi, si sono aperte nuove frontiere educative. Il laboratorio sviluppa le competenze di produzione di artefatti multimediali e di programmazione nel contesto dei videogame sotto differenti punti di vista che spaziano dalle interfacce al mondo dell''audio e del video.',
    '',
    '',
    1
  ),
  (
    5,
    4,
    'Digital Travels and Digital Art',
    '',
    '',
    '',
    1
  );
INSERT INTO Fornitura (fornitura, prezzo, idTipoFornitura, link, modificatoDa)
VALUES
('Workstation Studente I5 o I7/16/512/15.6 + Scheda grafica 4GB, Monitor 24 pollici, tastiera e mouse', 1200, 1, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi 500 Desktop Kit', 110, 1, 'https://www.melopero.com/shop/boards/pi500/raspberry-pi-500-desktop-kit-it/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi Monitor Red/White', 108, 1, 'https://www.melopero.com/shop/displays/raspberry-pi-monitor-red-white/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi 15,5W USB-C Power Supply (WhiteEU)', 8, 1, 'https://www.melopero.com/shop/accessories/power-accessories/raspberry-pi-12-5w-psu-eu/', (SELECT id FROM Utente WHERE username='g.massi')),
('NOTEBOOK STANDARD I5/16/512/15.6', 500, 2, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('NOTEBOOK ALTE PRESTAZIONI I5 o I7/16/512/15.6 + Scheda grafica 4GB', 1500, 2, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Melopero Raspberry Pi 5 16GB Starter Kit Black', 166, 3, 'https://www.melopero.com/shop/kit/melopero-raspberry-pi-5-16gb-starter-kit-black/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi Monitor Black', 108, 3, 'https://www.melopero.com/shop/displays/raspberry-pi-monitor-black/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi Official Mouse (Black)', 8, 3, 'https://www.melopero.com/shop/accessories/mouse-keyboard/raspberrypiofficialmouseblack/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi Official Keyboard (Black) - ITA Layout', 18, 3, 'https://www.melopero.com/shop/accessories/mouse-keyboard/official-keyboard-black-ita-layout/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi 4 Official Power Supply (5.1V - 3A) Black with EU Plug', 8, 11, 'https://www.melopero.com/shop/components/power/raspberrypi4officialpowersupply5dot1v3ablackwitheuplug/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi SSD Kit 512', 59, 3, 'https://www.melopero.com/shop/accessories/microsd_hard_disk/raspberry-pi-ssd-kit-512/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi Bumper', 3, 3, 'https://www.melopero.com/shop/accessories/case/raspberry-pi-bumper/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi 5 Active Cooler', 5, 3, 'https://www.melopero.com/it/shop/accessories/case/raspberry-pi-5-active-cooler/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi AI Hat 26T', 100, 3, 'https://www.melopero.com/shop/hat/raspberry-pi-ai-hat-26t/', (SELECT id FROM Utente WHERE username='g.massi')),
('Arduino Starter Kit Classroom Pack', 500, 4, 'https://store.arduino.cc/products/arduino-starter-kit-classroom-pack?srsltid=AfmBOop9Ityo-ocRkhjHb-wp-xKjPRUoX7Encw33ipIAWNBNgr5_QKGS', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi Pico 2 W with header', 7, 4, 'https://www.melopero.com/shop/boards/pico/raspberry-pi-pico-2-w-with-header/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi Zero 2 W con header pre-saldati', 16, 4, 'https://www.melopero.com/it/shop/boards/zero/raspberry-pi-zero-2-wh/', (SELECT id FROM Utente WHERE username='g.massi')),
('BBC Micro:Bit V2 Club (kit 10 schede)', 230, 11, 'https://www.robotstore.it/micro-bit-V2-CLUB', (SELECT id FROM Utente WHERE username='g.massi')),
('Stampante LASER a colori', 450, 5, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Visore 3D MetaQuest 3 4GB', 400, 6, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Cuffie collegamento USB-C a conduzione ossea', 30, 7, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Microfono USB a condensatore', 40, 7, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Armadio', 1000, 9, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Carrello 32 portatili', 900, 9, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Digital Board', 1700, 10, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Mini Nastro Trasportatore da Tavolo 5x70cm', 36, 11, 'https://www.amazon.it/Trasportatore-Sullattrito-Dispositivo-Esperimenti-Scientifici/dp/B0D62YPN5T/ref=asc_df_B0D62YPN5T?mcid=a4cab7fc06103dbba2be3c56fb49d605&tag=googshopit-21&linkCode=df0&hvadid=700884512772&hvpos=&hvnetw=g&hvrand=16666221039167349633&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9220598&hvtargid=pla-2373816327006&psc=1&hvocijid=16666221039167349633-B0D62YPN5T-&hvexpln=0', (SELECT id FROM Utente WHERE username='g.massi')),
('LISIPAROIWHT-01 Light Ring Board, anello luminoso LED bianco, per fotocamera Raspberry Pi', 13.93, 11, 'https://it.farnell.com/cyntech-components/lisiparoiwht-01/flash-anello-led-camera-raspberry/dp/3401756', (SELECT id FROM Utente WHERE username='g.massi')),
('LISIPAROIIR-01 Light Ring Board, anello luminoso IR, per fotocamera Raspberry Pi', 13.93, 11, 'https://it.farnell.com/cyntech-components/lisiparoiir-01/rpi-ir-board-for-pi-camera/dp/3401755', (SELECT id FROM Utente WHERE username='g.massi')),
('Lampada a LED da tavolo con dimmer e fissaggio a clip SKU: 8220-VTLLAMP15', 30, 11, 'https://futuranet.it/prodotto/lampada-a-led-da-tavolo-con-dimmer-e-fissaggio-a-clip/?srsltid=AfmBOopetPjXkaSTLAzK-czxbpZYWdolbKDWsPpSSoMFF6hOyDPxuGqx', (SELECT id FROM Utente WHERE username='g.massi')),
('Tripode 360 gradi', 5, 11, 'https://www.melopero.com/shop/accessories/portable-mini-tripod-360-rotation-ideal-for-raspberry-pi-hq-camera', (SELECT id FROM Utente WHERE username='g.massi')),
('Tripode per Telecamera Raspberry Pi', 3, 11, 'https://www.kubii.com/it/obiettivi-supporti/2053-supporto-tripode-per-telecamera-rpi-3272496009134.html', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi Camera Module 3', 27, 11, 'https://www.melopero.com/shop/accessories/cameras/camera-module-3/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi Camera Module 3 Noir', 27, 11, 'https://www.melopero.com/shop/accessories/cameras/camera-module-3-noir/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi Global Shutter Camera', 54, 11, 'https://www.melopero.com/shop/accessories/cameras/global-shutter-camera/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi AI Camera', 76, 11, 'https://www.melopero.com/shop/accessories/raspberry-pi-ai-camera/', (SELECT id FROM Utente WHERE username='g.massi')),
('The Official Raspberry Pi Camera Guide', 4, 11, 'https://www.melopero.com/shop/accessories/theofficialraspberrypicameraguide/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi 6mm Wide Angle Lens for Raspberry Pi HQ Camera', 27, 11, 'https://www.melopero.com/shop/accessories/cameras/6mmwideanglelensforraspberrypihqcamera/', (SELECT id FROM Utente WHERE username='g.massi')),
('Raspberry Pi 16mm Telephoto Lens for Raspberry Pi HQ Camera', 54, 11, 'https://www.melopero.com/shop/accessories/cameras/16mmtelephotolensforraspberrypihqcamera/', (SELECT id FROM Utente WHERE username='g.massi')),
('Lente Microscopio 100x per Camera Officiale HQ', 19, 11, 'https://www.kubii.com/it/obiettivi-supporti/4041-lente-microscopio-100x-per-camera-officiale-hq-3272496315181.html', (SELECT id FROM Utente WHERE username='g.massi')),
('OAK-D-Lite AF', 134.1, 11, 'https://www.mouser.it/ProductDetail/Luxonis/OAK-D-Lite-AF?qs=Znm5pLBrcAKOqyMVx9BJ9A%3D%3D&srsltid=AfmBOoo7AK-CpkmJYUbqJD1xO2F3mDexMk6smwppUpnXCxS5D428u_y0', (SELECT id FROM Utente WHERE username='g.massi')),
('Kit di filtri ottici attacco passo C o CS', 100, 11, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Workstation/Server E3/E5 o equivalente AMD EPYC 64 GB RAM DDR4 (espandibile),SSD/NVMe da 1 TB per il sistema operativo e applicazioni,Scheda di rete Gigabit Ethernet dual-port,Sistema di alimentazione ridondante (consigliato)', 2500, 11, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Switch Gigabit gestibile con almeno 24 porte', 200, 11, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Switch Gigabit con almeno 8 porte', 10, 11, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('NAS 24 TB', 1500, 12, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Veyon Licenza perpetua add-on pack', 1123, 13, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Installazione sistema operativo e servizi di rete', 1000, 100, NULL, (SELECT id FROM Utente WHERE username='g.massi')),
('Gruppo di continuità', 80, 7, NULL, (SELECT id FROM Utente WHERE username='g.massi'));

INSERT INTO Costo (idLaboratorio, idFornitura, quantita)
VALUES -- 1	Management and Operations	Laboratorio Informatica
  (1, 1, 30),
  (1, 43, 1),
  (1, 44, 1),
  (1, 46, 1),
  (1, 26, 1),
  (1, 20, 2),
  (1, 48, 1),
  (1, 49, 5) -- 2	Data Science and Artificial Intelligence	Aula sdoppiamento
,
  (2, 6, 10),
  (2, 7, 5),
  (2, 8, 5),
  (2, 9, 5),
  (2, 10, 5),
  (2, 11, 5),
  (2, 12, 5),
  (2, 13, 2),
  (2, 14, 2),
  (2, 15, 2),
  (2, 24, 1),
  (2, 26, 1),
  (2, 27, 1),
  (2, 28, 1),
  (2, 29, 1),
  (2, 30, 1),
  (2, 31, 1),
  (2, 32, 1),
  (2, 33, 1),
  (2, 34, 1),
  (2, 35, 1),
  (2, 36, 1),
  (2, 37, 1),
  (2, 38, 1),
  (2, 39, 1),
  (2, 40, 1),
  (2, 41, 1),
  (2, 42, 1),
  (2, 45, 3),
  (1, 26, 1) -- 3    Cybersecurity and Physical Computing	Aula sdoppiamento
,
  (3, 2, 25),
  (3, 3, 25),
  (3, 4, 25),
  (3, 16, 1),
  (3, 17, 6),
  (3, 18, 6),
  (3, 19, 1),
  (3, 24, 1),
  (3, 26, 1) -- 4	Multimedia and Videogame Development	Aula sdoppiamento
,
  (4, 5, 32),
  (4, 22, 32),
  (4, 23, 5),
  (4, 25, 1),
  (4, 26, 1) -- 5	Digital Travels and Digital Art	Aula "Viviana Giovannetti"
,
  (5, 5, 32),
  (5, 6, 10),
  (5, 25, 1),
  (5, 26, 1);
COMMIT;
