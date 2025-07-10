-- Creazione della tabella Ordinamento
CREATE TABLE Ordinamento (
    idOrdinamento INTEGER PRIMARY KEY AUTOINCREMENT,
    ordinamento TEXT UNIQUE
);

-- Creazione della tabella Indirizzo
CREATE TABLE Indirizzo (
    idIndirizzo INTEGER PRIMARY KEY AUTOINCREMENT,
    idOrdinamento INTEGER NOT NULL,
    indirizzo TEXT UNIQUE,
    abbreviazione TEXT UNIQUE,
    FOREIGN KEY (idOrdinamento) REFERENCES Ordinamento(idOrdinamento)
);

-- Creazione della tabella Articolazione
CREATE TABLE Articolazione (
    idArticolazione INTEGER PRIMARY KEY AUTOINCREMENT,
    idIndirizzo INTEGER NOT NULL,
    articolazione TEXT UNIQUE,
    abbreviazione TEXT UNIQUE,
    FOREIGN KEY (idIndirizzo) REFERENCES Indirizzo(idIndirizzo)
);

CREATE TABLE Istituto (
  idIstituto INTEGER PRIMARY KEY AUTOINCREMENT,
  istituto TEXT UNIQUE
);

-- Creazione della tabella Target
CREATE TABLE Target (
    idTarget INTEGER PRIMARY KEY AUTOINCREMENT,
    idArticolazione INTEGER NOT NULL,
    abbreviazione TEXT UNIQUE,
    target TEXT,
    FOREIGN KEY (idArticolazione) REFERENCES Articolazione(idArticolazione)
);

-- Creazione della tabella Plesso
CREATE TABLE Plesso (
    idPlesso INTEGER PRIMARY KEY AUTOINCREMENT,
    plesso TEXT,
    idIstituto INTEGER NOT NULL,
    FOREIGN KEY (idIstituto) REFERENCES Istituto(idIstituto)
);

CREATE TABLE Finanziamento (
	idFinanziamento INTEGER PRIMARY KEY AUTOINCREMENT,
	urlAvviso TEXT DEFAULT NULL,
	importo REAL DEFAULT 0
);

-- Creazione della tabella Laboratorio
CREATE TABLE Laboratorio (
    idLaboratorio INTEGER PRIMARY KEY AUTOINCREMENT,
    idPlesso INTEGER NOT NULL,
    laboratorio TEXT UNIQUE,
    aula TEXT,
    idFinanziamento INTEGER DEFAULT 1,
    FOREIGN KEY (idPlesso) REFERENCES Plesso(idPlesso),
    FOREIGN KEY (idFinanziamento) REFERENCES Finanziamento(idFinanziamento)
);

-- Creazione della tabella Modulo
CREATE TABLE Modulo (
    idModulo INTEGER PRIMARY KEY AUTOINCREMENT,
    idLaboratorio INTEGER NOT NULL,
    idTarget INTEGER NOT NULL,
    modulo TEXT UNIQUE,
    descrizione TEXT,
    discipline TEXT,
    professione TEXT,
    FOREIGN KEY (idTarget) REFERENCES Target(idTarget),
    FOREIGN KEY (idLaboratorio) REFERENCES Laboratorio(idLaboratorio)
);

-- Creazione della tabella TipoObiettivo
CREATE TABLE TipoObiettivo (
    idTipoObiettivo INTEGER PRIMARY KEY AUTOINCREMENT,
    tipoObiettivo TEXT,
    descrizione TEXT
);

-- Creazione della tabella Obiettivo
CREATE TABLE Obiettivo (
    idObiettivo INTEGER PRIMARY KEY AUTOINCREMENT,
    idTipoObiettivo INTEGER NOT NULL,
    obiettivo TEXT,
    FOREIGN KEY (idTipoObiettivo) REFERENCES TipoObiettivo(idTipoObiettivo)
);

-- Creazione della tabella ObiettiviModulo (tabella di giunzione)
CREATE TABLE ObiettiviModulo (
    idModulo INTEGER NOT NULL,
    idObiettivo INTEGER NOT NULL,
    PRIMARY KEY (idModulo, idObiettivo),
    FOREIGN KEY (idModulo) REFERENCES Modulo(idModulo),
    FOREIGN KEY (idObiettivo) REFERENCES Obiettivo(idObiettivo)
);

-- Creazione della tabella Voce
CREATE TABLE Voce (
    idVoce INTEGER PRIMARY KEY AUTOINCREMENT,
    lettera TEXT UNIQUE,
    voce TEXT,
    descrizione TEXT,
    minimale INTEGER,
    massimale INTEGER
);

-- Creazione della tabella Fornitore
CREATE TABLE Fornitore (
    idFornitore INTEGER PRIMARY KEY AUTOINCREMENT,
    fornitore TEXT
);

-- Creazione della tabella TipoFornitura
CREATE TABLE TipoFornitura (
    idTipoFornitura INTEGER PRIMARY KEY AUTOINCREMENT,
    tipoFornitura TEXT UNIQUE
);

-- Creazione della tabella Fornitura
CREATE TABLE Fornitura (
    idFornitura INTEGER PRIMARY KEY AUTOINCREMENT,
    idTipoFornitura INTEGER NOT NULL DEFAULT 1,
    idFornitore INTEGER NOT NULL DEFAULT 1,
    fornitura TEXT,
    prezzo REAL,
    codiceMepa TEXT DEFAULT NULL,
    link TEXT DEFAULT NULL,
    SKU TEXT DEFAULT NULL,
    FOREIGN KEY (idTipoFornitura) REFERENCES TipoFornitura(idTipoFornitura),
    FOREIGN KEY (idFornitore) REFERENCES Fornitore(idFornitore)
);

-- Creazione della tabella Costo
CREATE TABLE Costo (
    idCosto INTEGER PRIMARY KEY AUTOINCREMENT,
    idVoce INTEGER NOT NULL DEFAULT 3,
    idLaboratorio INTEGER NOT NULL,
    idFornitura INTEGER NOT NULL,
    descrizione TEXT DEFAULT NULL,
    quantita INTEGER,
    FOREIGN KEY (idVoce) REFERENCES Voce(idVoce),
    FOREIGN KEY (idLaboratorio) REFERENCES Laboratorio(idLaboratorio),
    FOREIGN KEY (idFornitura) REFERENCES Fornitura(idFornitura)
);

--
-- Viste
--
CREATE VIEW v_Target AS
SELECT idTarget, ordinamento, Indirizzo, articolazione, target, Target.abbreviazione AS abbreviazione
FROM
	Ordinamento INNER JOIN
	Indirizzo USING (idOrdinamento) INNER JOIN 
	Articolazione USING (idIndirizzo) INNER JOIN
	Target USING (idArticolazione);

CREATE VIEW v_Laboratorio AS
SELECT idLaboratorio, laboratorio, modulo, abbreviazione AS target, descrizione
FROM
	Target INNER JOIN
	Modulo USING (idTarget) INNER JOIN
	Laboratorio USING (idLaboratorio);

CREATE VIEW v_Fornitura AS
SELECT fornitura, tipoFornitura, prezzo, link
FROM
	TipoFornitura INNER JOIN
	fornitura USING (idTipoFornitura);

CREATE VIEW v_DettagliCostoLaboratorio AS
SELECT laboratorio, fornitura, quantita, prezzo, prezzo * quantita AS totale, prezzo * 1.22 AS prezzoConIVA, prezzo * quantita * 1.22 AS totaleConIVA
FROM
	Laboratorio INNER JOIN
	Costo USING (idLaboratorio) INNER JOIN
	Fornitura USING (idFornitura);

CREATE VIEW v_CostoLaboratorio AS
WITH t_dettagli AS
	(SELECT laboratorio, fornitura, quantita, prezzo, prezzo * quantita AS totale, prezzo * 1.22 AS prezzoConIVA, prezzo * quantita * 1.22 AS totaleConIVA
	FROM
		Laboratorio INNER JOIN
		Costo USING (idLaboratorio) INNER JOIN
		Fornitura USING (idFornitura))
SELECT laboratorio, group_concat(fornitura), SUM(totale) AS granTotale, sum(totaleConIVA) AS granTotaleConIVA
FROM t_dettagli
GROUP BY laboratorio
UNION
SELECT 'TOTALE', group_concat(fornitura), SUM(prezzo * quantita) AS totale, SUM(prezzo * quantita * 1.22) AS totaleConIVA
 FROM
		Laboratorio INNER JOIN
		Costo USING (idLaboratorio) INNER JOIN
		Fornitura USING (idFornitura);

BEGIN;
-- Ordinamento
INSERT INTO Ordinamento VALUES
  (1,'Liceo')
, (2,'Istituto Tecnico')
;

-- Indirizzo
INSERT INTO Indirizzo VALUES
  (1,1,'Scientifico', 'LS')
, (2,1,'Linguistico', 'LL')
, (3,2,'Economico', 'ITE')
;

-- Articolazione
INSERT INTO Articolazione VALUES
  (1, 3, 'Sistemi Informativi Aziendali', 'ITE SIA')
, (2, 3, 'Amministrazione Finanza e Marketing', 'ITE AFM')
, (3, 3, 'Turismo', 'ITE Tur')
;


INSERT INTO Istituto VALUES
  (1, 'IIS Savoia Benincasa')
;

-- Target
INSERT INTO Target VALUES
  (1, 1, 'ITE SIA triennio', 'SIA')
, (2, 2, 'ITE AFM biennio comune', 'ITE AFM I-II')
, (3, 2, 'ITE AFM triennio', 'ITE AFM III-IV-V')
, (4, 3, 'ITE Tur biennio comune', 'ITE Tur I-II')
;

INSERT INTO Plesso VALUES
  (1, 'Via Vecchini, 2', 1)
, (2, 'Via Marini, 33', 1)
;

INSERT INTO TipoObiettivo VALUES
  (1, 'Generale', 'Sono obiettivi ampi e di lungo respiro, che definiscono la direzione generale del percorso formativo. Ad esempio, "sviluppare capacità di pensiero critico".')
, (2, 'Specifico', 'Sono obiettivi più dettagliati e concreti, che descrivono cosa si intende raggiungere in termini di conoscenze, abilità e comportamenti specifici. Ad esempio, "essere in grado di analizzare un testo argomentativo identificando tesi e argomenti".')
;

INSERT INTO TipoFornitura VALUES
  (1, 'Computer fisso e periferiche indispensabili')
, (2, 'Computer portatile')
, (3, 'Single Board Computer e periferiche indispensabili')
, (4, 'Microcontrollore')
, (5, 'Stampante')
, (6, 'Visore 3D')
, (7, 'Altre periferiche computer')
, (8, 'Sensori ed attuatori')
, (9, 'Armadi e carrelli')
, (10, 'Digital board')
, (11, 'Dispositivi per l''Intelligenza Artificiale e l''Industria 5.0')
, (12, 'Infrastruttura di rete')
, (13, 'Licenze Software')
, (100, 'Installazione')

;

INSERT INTO Fornitore VALUES
  (1, 'Orsetti')
;

INSERT INTO Voce VALUES
  (1, 'A', 'Progettazione', 'La progettazione consiste nell’insieme delle attività propedeutiche all’emanazione dell’avviso pubblico/richiesta di offerta/trattativa diretta/ordine di acquisto (nel rispetto del codice dei contratti) e del relativo disciplinare e capitolato tecnico per l’acquisto dei beni e dei servizi ed è assicurata da personale interno o esterno all’istituzione scolastica in possesso di adeguata professionalità per la realizzazione della relativa azione ammessa a finanziamento.', 0, 2)
, (2, 'B', 'Spese organizzative e gestionali', 'Si tratta di spese funzionali alla gestione e all’attuazione del progetto e includono:\n -compensi per il personale scolastico e per i soggetti coinvolti a vario titolo nell’attuazione dei progetti (es. gestione del sistema informativo, attività connesse alla stesura degli atti di gara, adempimenti operativi, relazioni con l’Ufficio dell’Autorità di Gestione);\n - spese per la copertura assicurativa dei beni acquistati; • spese per le spedizioni postali;\n - contributo ANAC per la richiesta del CIG.', 0, 5)
, (3, 'C', 'Fornitura di beni e attrezzature (e relativa installazione)', 'Oggetto del presente avviso è la fornitura di beni e attrezzature per la realizzazione di laboratori professionalizzanti.', 85, 100)
, (4, 'D', 'Piccoli interventi di sistemazione edilizia/terreno', 'È prevista la possibilità di effettuare piccoli interventi di adattamento edilizio e impiantistico funzionali all’installazione e all’utilizzo dei beni e delle attrezzature acquistati.', 0, 5)
, (5, 'E', 'Pubblicità', 'Il corretto adempimento rispetto agli obblighi di pubblicità costituisce una condizione imprescindibile di ogni intervento finanziato con i Fondi Strutturali e deve essere programmata a livello di singolo intervento. Per ogni progetto cofinanziato dal Fondo Sociale Europeo o del Fondo Europeo di Sviluppo Regionale, il beneficiario è tenuto a svolgere una specifica azione di informazione, sensibilizzazione e pubblicità. Sussiste, altresì, l’obbligo di apposizione di targhette con logo, codice progetto e indicazione del fondo su tutti i beni acquistati con il FESR. Le relative specifiche tecniche sono disponibili al seguente link: https://www.istruzione.it/pon/ponkit.html.', 0, 1)
, (6, 'F', 'Certificato di collaudo, verifica di conformità o di regolare esecuzione', 'A seguito della realizzazione dei laboratori, l’istituzione scolastica provvede al rilascio dei certificati di collaudo, di verifica di conformità o dei certificati di regolare esecuzione.', 0, 1)
, (7, 'G', 'Addestramento all''uso delle attrezzature', '...', 0, 1)
;

INSERT INTO Finanziamento VALUES
  (1, 'https://www.mim.gov.it/documents/20182/8938100/m_pi.AOOGABMI.REGISTRO+UFFICIALE%28U%29.0088643.03-06-2025.pdf/25e5ef54-2a3f-4fda-b4c4-b9a0cb52d2b4?t=1748959520204', 201000)
, (2, 'https://www.mim.gov.it/documents/8099600/8783257/m_pi.AOOGABMI.REGISTRO-UFFICIALEU.0089057.03-06-2025.pdf/02b9f70d-7237-4bf5-59e9-cd63569fb061?version=1.0&t=1749458687505', 750000)
;

INSERT INTO Laboratorio VALUES 
  (1, 1, 'Management and Operations', 'Laboratorio Informatica', 1)
, (2, 1, 'Data Science and Artificial Intelligence', 'Aula sdoppiamento', 1)
, (3, 1, 'Cybersecurity and Physical Computing', 'Aula sdoppiamento', 1)
, (4, 1, 'Multimedia and Videogame Development', 'Aula sdoppiamento', 1)
, (5, 1, 'Digital Travels and Digital Art', 'Aula "Viviana Giovannetti"', 1)
;

INSERT INTO Modulo (idLaboratorio, idTarget, modulo, descrizione, discipline, professione) VALUES 
  (1, 1, 'Management and Operations', 'Laboratorio per lo sviluppo di competenze nella gestione aziendale, ottimizzazione dei processi e implementazione di soluzioni informatiche. Per semplificare le operazioni di manutenzione, un server mantiene l''immagine aggiornata del sistema operativo, che viene caricata dai PC all''avvio (netboot). I dati degli utenti sono salvati su un server Samba. Il disco locale è usato come cache per il sistema operativo e come eventuale partizione di swap. Le credenziali di accesso sono memorizzare al fine di consentire un accesso con singola password (Single Sign-On)', 'Il modulo di Management e Operations permette di svolgere percorsi didattici multidisciplinari di Economia Aziendale, Informatica, Matematica e altre discipline del triennio SIA', 'Ragioniere programmatore')
  , (2, 3, 'Data Science and Artificial Intelligence', 'Laboratorio per lo sviluppo di competenze nell''analisi dei dati aziendali, la definizione di azioni a partire da modelli quantitativi e l''uso di strumenti d''inferenza statistica quali i recenti modelli delle reti neurali artificiali. Il modulo prevede anche l''interazione con oggetti del mondo fisico attraverso sensori d''immagine e casi applicativi legati all''intelligenza artificiale legati alla regressione, alla classificazione e alla clusterizzazione. Al fine di aumentare il coinvolgimento verranno utilizzati esempi di Computer Vision.', 'Percorsi didattici multidisciplinari di Economia Aziendale, Informatica, Matematica e altre discipline del triennio SIA', 'Data analyst')
, (3, 2, 'Cybersecurity and Physical Computing', 'Modulo per lo sviluppo di competenze informatiche attraverso la sperimentazione pratica di dispositivi e sistemi informatici, con particolare enfasi sugli aspetti di: protezione dei dati, sicurezza dei sistemi e sicurezza dei dispositivi.', 'Informatica, Matematica, Diritto', 'Ruoli connessi alla gestione delle sicurezza informatica')
, (4, 1, 'Multimedia and Videogame Development', 'Negli ultimi anni, la progettazione di videogiochi è diventata una delle aree più affascinanti e dinamiche del panorama tecnologico. È noto che il mondo dei (video)giochi può alimentare il desiderio di una persona nell''impegnarsi in attività spesso considerate di ridotto interesse. Questo aspetto porta a dover introdurre aspetti anche complessi nello sviluppo di applicazioni multimediali. A tal proposito linguaggi di programmazione come Python consentono di ridurre la complessità nelle fasi di sviluppo di applicazioni grazie anche alla ridotta complessità nell''apprendere concetti della programmazione che spaziano dalle istruzioni condizionali alle strutture dati. Programmare videogame in Python oggi è molto semplice grazie alla disponibilità di diverse librerie e framework che consentono di ridurre anche in questo caso la complessità tipica di questo mondo. L''idea  di insegnare la programmazione attraverso la creazione dei giochi non è nuova ed è stata ampiamente sviluppata negli anni ''80, quando le cassette con i videogiochi per gli home computer dell''epoca erano accompagnate da riviste che introducevano alla programmazione. Negli anni recenti, con l''introduzione del Python e di Single-board computer (SBC) come Raspberry Pi, si sono aperte nuove frontiere educative. Il laboratorio sviluppa le competenze di produzione di artefatti multimediali e di programmazione nel contesto dei videogame sotto differenti punti di vista che spaziano dalle interfacce al mondo dell''audio e del video.', '', '')
, (5, 4, 'Digital Travels and Digital Art', '', '', '')
;

INSERT INTO Fornitura (fornitura, prezzo, idTipoFornitura, link) VALUES

--
-- 1, 'Computer fisso e periferiche indispensabili
--
  ('Workstation Studente I5 o I7/16/512/15.6 + Scheda grafica 4GB, Monitor 24 pollici, tastiera e mouse', 1200, 1, NULL)

, ('Raspberry Pi 500 Desktop Kit', 110, 1, 'https://www.melopero.com/shop/boards/pi500/raspberry-pi-500-desktop-kit-it/')
, ('Raspberry Pi Monitor Red/White', 108, 1, 'https://www.melopero.com/shop/displays/raspberry-pi-monitor-red-white/')
, ('Raspberry Pi 15,5W USB-C Power Supply (WhiteEU)', 8, 1, 'https://www.melopero.com/shop/accessories/power-accessories/raspberry-pi-12-5w-psu-eu/')

--
-- 2, 'Computer portatile'
--
, ('NOTEBOOK STANDARD I5/16/512/15.6', 500, 2, NULL)
, ('NOTEBOOK ALTE PRESTAZIONI I5 o I7/16/512/15.6 + Scheda grafica 4GB', 1500, 2, NULL)

--
-- 3, 'Single Board Computer e periferiche indispensabili'
--
-- Computer e periferiche Lab. Visione
, ('Melopero Raspberry Pi 5 16GB Starter Kit Black', 166, 3, 'https://www.melopero.com/shop/kit/melopero-raspberry-pi-5-16gb-starter-kit-black/')
, ('Raspberry Pi Monitor Black', 108, 3, 'https://www.melopero.com/shop/displays/raspberry-pi-monitor-black/')
, ('Raspberry Pi Official Mouse (Black)', 8, 3, 'https://www.melopero.com/shop/accessories/mouse-keyboard/raspberrypiofficialmouseblack/')
, ('Raspberry Pi Official Keyboard (Black) - ITA Layout', 18, 3, 'https://www.melopero.com/shop/accessories/mouse-keyboard/official-keyboard-black-ita-layout/')
, ('Raspberry Pi 4 Official Power Supply (5.1V - 3A) Black with EU Plug', 8, 11, 'https://www.melopero.com/shop/components/power/raspberrypi4officialpowersupply5dot1v3ablackwitheuplug/')
, ('Raspberry Pi SSD Kit 512', 59, 3, 'https://www.melopero.com/shop/accessories/microsd_hard_disk/raspberry-pi-ssd-kit-512/')
, ('Raspberry Pi Bumper', 3, 3, 'https://www.melopero.com/shop/accessories/case/raspberry-pi-bumper/')
, ('Raspberry Pi 5 Active Cooler', 5, 3, 'https://www.melopero.com/it/shop/accessories/case/raspberry-pi-5-active-cooler/')
, ('Raspberry Pi AI Hat 26T', 100, 3, 'https://www.melopero.com/shop/hat/raspberry-pi-ai-hat-26t/')

--
-- 4, 'Microcontrollore'
--
, ('Arduino Starter Kit Classroom Pack', 500, 4, 'https://store.arduino.cc/products/arduino-starter-kit-classroom-pack?srsltid=AfmBOop9Ityo-ocRkhjHb-wp-xKjPRUoX7Encw33ipIAWNBNgr5_QKGS')
 , ('Raspberry Pi Pico 2 W with header', 7, 4, 'https://www.melopero.com/shop/boards/pico/raspberry-pi-pico-2-w-with-header/')
 , ('Raspberry Pi Zero 2 W con header pre-saldati', 16, 4, 'https://www.melopero.com/it/shop/boards/zero/raspberry-pi-zero-2-wh/')
, ('BBC Micro:Bit V2 Club (kit 10 schede)', 230, 11, 'https://www.robotstore.it/micro-bit-V2-CLUB')

--
-- 5, 'Stampante'
--
, ('Stampante LASER a colori', 450, 5, NULL)
--
-- 6, 'Visore 3D'
--

, ('Visore 3D MetaQuest 3 4GB', 400, 6, NULL)

--
-- 7, 'Altre periferiche computer'
--
, ('Cuffie collegamento USB-C a conduzione ossea', 30, 7, NULL)
, ('Microfono USB a condensatore', 40, 7, NULL)

--
-- 8, 'Sensori ed attuatori'
--

--
-- 9, 'Armadi e carrelli'
--
, ('Armadio', 1000, 9, NULL)
, ('Carrello 32 portatili', 900, 9, NULL)

--
-- 10, 'Digital board'
--
, ('Digital Board', 1700, 10, NULL)

--
-- 11, 'Dispositivi per l''Intelligenza Artificiale e l''Industria 5.0'
--
--
-- Visione delle Macchine e Robotica
--
-- Sistemi di movimentazione
, ('Mini Nastro Trasportatore da Tavolo 5x70cm', 36, 11, 'https://www.amazon.it/Trasportatore-Sullattrito-Dispositivo-Esperimenti-Scientifici/dp/B0D62YPN5T/ref=asc_df_B0D62YPN5T?mcid=a4cab7fc06103dbba2be3c56fb49d605&tag=googshopit-21&linkCode=df0&hvadid=700884512772&hvpos=&hvnetw=g&hvrand=16666221039167349633&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9220598&hvtargid=pla-2373816327006&psc=1&hvocijid=16666221039167349633-B0D62YPN5T-&hvexpln=0')

-- Illuminatori
, ('LISIPAROIWHT-01 Light Ring Board, anello luminoso LED bianco, per fotocamera Raspberry Pi', 13.93, 11, 'https://it.farnell.com/cyntech-components/lisiparoiwht-01/flash-anello-led-camera-raspberry/dp/3401756')
, ('LISIPAROIIR-01 Light Ring Board, anello luminoso IR, per fotocamera Raspberry Pi', 13.93, 11, 'https://it.farnell.com/cyntech-components/lisiparoiir-01/rpi-ir-board-for-pi-camera/dp/3401755')
, ('Lampada a LED da tavolo con dimmer e fissaggio a clip SKU: 8220-VTLLAMP15', 30, 11, 'https://futuranet.it/prodotto/lampada-a-led-da-tavolo-con-dimmer-e-fissaggio-a-clip/?srsltid=AfmBOopetPjXkaSTLAzK-czxbpZYWdolbKDWsPpSSoMFF6hOyDPxuGqx')


-- Supporti sensori
, ('Tripode 360 gradi', 5, 11, 'https://www.melopero.com/shop/accessories/portable-mini-tripod-360-rotation-ideal-for-raspberry-pi-hq-camera')
, ('Tripode per Telecamera Raspberry Pi', 3, 11, 'https://www.kubii.com/it/obiettivi-supporti/2053-supporto-tripode-per-telecamera-rpi-3272496009134.html')

-- Sensori e manuale
, ('Raspberry Pi Camera Module 3', 27, 11, 'https://www.melopero.com/shop/accessories/cameras/camera-module-3/')
, ('Raspberry Pi Camera Module 3 Noir', 27, 11, 'https://www.melopero.com/shop/accessories/cameras/camera-module-3-noir/')
, ('Raspberry Pi Global Shutter Camera', 54, 11, 'https://www.melopero.com/shop/accessories/cameras/global-shutter-camera/')
, ('Raspberry Pi AI Camera', 76, 11, 'https://www.melopero.com/shop/accessories/raspberry-pi-ai-camera/')
, ('The Official Raspberry Pi Camera Guide', 4, 11, 'https://www.melopero.com/shop/accessories/theofficialraspberrypicameraguide/')

-- Ottiche
, ('Raspberry Pi 6mm Wide Angle Lens for Raspberry Pi HQ Camera', 27, 11, 'https://www.melopero.com/shop/accessories/cameras/6mmwideanglelensforraspberrypihqcamera/')
, ('Raspberry Pi 16mm Telephoto Lens for Raspberry Pi HQ Camera', 54, 11, 'https://www.melopero.com/shop/accessories/cameras/16mmtelephotolensforraspberrypihqcamera/')
, ('Lente Microscopio 100x per Camera Officiale HQ', 19, 11, 'https://www.kubii.com/it/obiettivi-supporti/4041-lente-microscopio-100x-per-camera-officiale-hq-3272496315181.html')

-- Sistemi di visione
, ('OAK-D-Lite AF', 134.1, 11, 'https://www.mouser.it/ProductDetail/Luxonis/OAK-D-Lite-AF?qs=Znm5pLBrcAKOqyMVx9BJ9A%3D%3D&srsltid=AfmBOoo7AK-CpkmJYUbqJD1xO2F3mDexMk6smwppUpnXCxS5D428u_y0')


-- Filtri
, ('Kit di filtri ottici attacco passo C o CS', 100, 11, NULL)


-- 12, 'Infrastruttura di rete'
, ('Workstation/Server E3/E5 o equivalente AMD EPYC 64 GB RAM DDR4 (espandibile),SSD/NVMe da 1 TB per il sistema operativo e applicazioni,Scheda di rete Gigabit Ethernet dual-port,Sistema di alimentazione ridondante (consigliato)', 2500, 11, NULL)

, ('Switch Gigabit gestibile con almeno 24 porte', 200, 11, NULL)
, ('Switch Gigabit con almeno 8 porte', 10, 11, NULL)
, ('NAS 24 TB', 1500, 12, NULL)

-- 13, 'Licenze Software'
, ('Veyon Licenza perpetua add-on pack', 1123, 13, NULL)

-- 100, 'Installazione'

, ('Installazione sistema operativo e servizi di rete', 1000, 100, NULL)

-- Altro
, ('Gruppo di continuità', 80, 7, NULL)
-- Aggiungere una decina di tastiere e mouse per la segreteria


;


INSERT INTO Costo (idLaboratorio, idFornitura, quantita) VALUES
-- 1	Management and Operations	Laboratorio Informatica
  (1, 1, 30)
, (1, 43, 1)
, (1, 44, 1)
, (1, 46, 1)
, (1, 26, 1)
, (1, 20, 2)
, (1, 48, 1)
, (1, 49, 5)

-- 2	Data Science and Artificial Intelligence	Aula sdoppiamento
, (2, 6, 10)
, (2, 7, 5)
, (2, 8, 5)
, (2, 9, 5)
, (2, 10, 5)
, (2, 11, 5)
, (2, 12, 5)
, (2, 13, 2)
, (2, 14, 2)
, (2, 15, 2)
, (2, 24, 1)
, (2, 26, 1)
, (2, 27, 1)
, (2, 28, 1)
, (2, 29, 1)
, (2, 30, 1)
, (2, 31, 1)
, (2, 32, 1)
, (2, 33, 1)
, (2, 34, 1)
, (2, 35, 1)
, (2, 36, 1)
, (2, 37, 1)
, (2, 38, 1)
, (2, 39, 1)
, (2, 40, 1)
, (2, 41, 1)
, (2, 42, 1)
, (2, 45, 3)
, (1, 26, 1)

-- 3    Cybersecurity and Physical Computing	Aula sdoppiamento
, (3, 2, 25)
, (3, 3, 25)
, (3, 4, 25)
, (3, 16, 1)
, (3, 17, 6)
, (3, 18, 6)
, (3, 19, 1)

, (3, 24, 1)
, (3, 26, 1)

-- 4	Multimedia and Videogame Development	Aula sdoppiamento
, (4, 5, 32)
, (4, 22, 32)
, (4, 23, 5)
, (4, 25, 1)
, (4, 26, 1)


-- 5	Digital Travels and Digital Art	Aula "Viviana Giovannetti"
, (5, 5, 32)
, (5, 6, 10)
, (5, 25, 1)
, (5, 26, 1)
;

COMMIT;
