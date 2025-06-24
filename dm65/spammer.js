// Dati estratti da "Piattaforma STEM" https://pnrr.pubblica.istruzione.it/pns5-stem-public-web/private/percorsi/index
// https://pnrr.pubblica.istruzione.it/pns5-stem-public-web/private/percorsi/dettaglio?edizioneId=...
// fetch("https://pnrr.pubblica.istruzione.it/pns5-stem-public-web/private/percorsi/dettaglio?edizioneId=708459", {
//  "headers": {
//    "accept": "application/json, text/javascript, */*; q=0.01",
//    "accept-language": "it-IT,it;q=0.9,en-US;q=0.8,en;q=0.7",
//    "sec-ch-ua": "\"Google Chrome\";v=\"135\", \"Not-A.Brand\";v=\"8\", \"Chromium\";v=\"135\"",
//    "sec-ch-ua-mobile": "?0",
//    "sec-ch-ua-platform": "\"Linux\"",
//    "sec-fetch-dest": "empty",
//    "sec-fetch-mode": "cors",
//    "sec-fetch-site": "same-origin",
//    "sec-gpc": "1",
//    "x-requested-with": "XMLHttpRequest",
//    "cookie": "JSESSIONID=27D983F071165EA1762A6FFEB92B69F2; miur_reg=yes; PNRRP=pnrrp5; iPlanetDirectoryPro=AQIC5wM2LY4Sfcy780F7wk10E03bS2PMFUyGi9Et5CBEsIQ.*AAJTSQACMDIAAlNLABQtMzg4MTI4MDExNDM3NjQ3NzE4OQACUzEAAjAz*",
//    "Referer": "https://pnrr.pubblica.istruzione.it/pns5-stem-public-web/private/percorsi/index",
//    "Referrer-Policy": "strict-origin-when-cross-origin"
//  },
//  "body": null,
//  "method": "GET"
// });
const corsi = [
  {
    "id": 638124,
    "codice": "1224-ATT-827-E-5",
    "titolo": "RICERCA OPERATIVA",
    "attivita": "Percorsi di orientamento e formazione per il potenziamento delle competenze STEM, digitali e di innovazione",
    "dataInizio": "2025-02-03",
    "dataFine": "2025-03-10",
    "numPersonale": 2,
    "numPartecipanti": 16,
    "stato": "CHIUSO",
    "codScuUt": null,
    "codForScuApp": null,
    "desIntervento": "Citizen scientists of  the future",
    "personaleStr": "GIONATA            MASSI                     , FABRIZIO MARINELLI",
    "numPartConAttestato": 15,
    "tipoScuola": "Scuola statale",
    "tipoDestinatari": "STUDENTE",
    "durata": 10,
    "statoPercorsoDes": "Chiuso",
    "statoPercorsoCssClass": "bg-danger",
    "elencoPartecipanti": [
      {
        "codiceStudente": "16D9FDEF00",
        "nome": "CHIARA",
        "cognome": "BALDINELLI",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "BALDINELLI CHIARA"
      },
      {
        "codiceStudente": "6424B36C00",
        "nome": "MICHELA",
        "cognome": "CAROTTI",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "CAROTTI MICHELA"
      },
      {
        "codiceStudente": "7ED420E300",
        "nome": "GIORGIA",
        "cognome": "CECCHI",
        "fasciaEta": "19-29",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "CECCHI GIORGIA"
      },
      {
        "codiceStudente": "F821CF0900",
        "nome": "ANDREA",
        "cognome": "CIALONE",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "CIALONE ANDREA"
      },
      {
        "codiceStudente": "2347E75E00",
        "nome": "GIULIA",
        "cognome": "DE ANGELIS",
        "fasciaEta": "19-29",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "DE ANGELIS GIULIA"
      },
      {
        "codiceStudente": "927A61E300",
        "nome": "GIACOMO",
        "cognome": "GAGLIARDINI",
        "fasciaEta": "14-18",
        "percPresenza": "80,00",
        "hasAttestato": true,
        "fullName": "GAGLIARDINI GIACOMO"
      },
      {
        "codiceStudente": "0AE2D09500",
        "nome": "MARCO",
        "cognome": "GIROLIMINI",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "GIROLIMINI MARCO"
      },
      {
        "codiceStudente": "AD09536000",
        "nome": "DANIELE",
        "cognome": "MARINELLI",
        "fasciaEta": "19-29",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "MARINELLI DANIELE"
      },
      {
        "codiceStudente": "D46451FE00",
        "nome": "DIEGO",
        "cognome": "MARTELLA",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "MARTELLA DIEGO"
      },
      {
        "codiceStudente": "FA77AA5200",
        "nome": "NICOLA",
        "cognome": "MARZUOLO",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "MARZUOLO NICOLA"
      },
      {
        "codiceStudente": "F6C8DEDA00",
        "nome": "GIUSY",
        "cognome": "MATARESE",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "MATARESE GIUSY"
      },
      {
        "codiceStudente": "8767B3B900",
        "nome": "SOFIA",
        "cognome": "MORETTI",
        "fasciaEta": "14-18",
        "percPresenza": "60,00",
        "hasAttestato": false,
        "fullName": "MORETTI SOFIA"
      },
      {
        "codiceStudente": "500C262800",
        "nome": "YAN YAN",
        "cognome": "NI",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "NI YAN YAN"
      },
      {
        "codiceStudente": "7FC09DE800",
        "nome": "EMANUELE",
        "cognome": "PEDINI",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "PEDINI EMANUELE"
      },
      {
        "codiceStudente": "E2AB67B700",
        "nome": "RICCARDO",
        "cognome": "PLESCIA",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "PLESCIA RICCARDO"
      },
      {
        "codiceStudente": "D43E274100",
        "nome": "FRANCESCO",
        "cognome": "RIVELLINI",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "RIVELLINI FRANCESCO"
      }
    ],
    "desEdi": "Il corso, articolato in 10 ore e rivolto agli studenti delle classi quinte, intende offrire un’esperienza formativa rivolta principalmente alla comprensione del valore pratico della matematica, attraverso lo sviluppo di competenze di problem solving scientifico e un approccio critico alla realtà.\nUno degli aspetti centrali del corso è insegnare a risolvere problemi complessi in modo sistematico, incoraggiando gli studenti a riflettere sui dati, sui metodi e sui criteri che stanno alla base delle soluzioni proposte. Questo esercizio favorisce lo sviluppo del senso critico e, dal punto di vista delle competenze, della capacità di modellare problemi reali attraverso strumenti matematici, qualità indispensabili per valutare l’efficacia e la robustezza delle scelte decisionali in ogni contesto applicativo.\nIl corso illustra metodi e strumenti a cavallo tra matematica e informatica. La Ricerca Operativa sarà utilizzata per mostrare il ruolo complementare delle due discipline: da un lato, la matematica come strumento per costruire modelli e analizzarne le proprietà; dall'altro, l’informatica come mezzo per sviluppare algoritmi e implementare soluzioni. Questa sinergia non solo arricchisce il bagaglio culturale degli studenti, offrendo una visione interdisciplinare dove la matematica non è un fine a sé stessa, ma getta nuova luce sull'importanza di discipline tradizionali come algebra, geometria e analisi.\nInfine, l’obiettivo generale del corso è accrescere la motivazione allo studio della matematica, specialmente per quegli studenti che spesso incontrano difficoltà e percepiscono questa disciplina come arida o distante. Attraverso esempi concreti e significativi, il corso vuole mostrare come la matematica possa essere uno strumento utile e appassionante, contribuendo così a ridurre il divario di rendimento tra gli studenti.",
    "numPartSenzaAttestato": 1,
    "durataStr": "10,00",
    "dataInizioStr": "03/02/2025",
    "dataFineStr": "10/03/2025"
  },
  {
    "id": 708438,
    "codice": "1224-ATT-827-E-19",
    "titolo": "Algebra delle relazioni - Edizione 3 - Classe 5E opzione Scienze Applicate",
    "attivita": "Percorsi di orientamento e formazione per il potenziamento delle competenze STEM, digitali e di innovazione",
    "dataInizio": "2024-12-11",
    "dataFine": "2025-02-05",
    "numPersonale": 2,
    "numPartecipanti": 16,
    "stato": "CHIUSO",
    "codScuUt": null,
    "codForScuApp": null,
    "desIntervento": "Citizen scientists of  the future",
    "personaleStr": "GIONATA            MASSI                     , DANIELA SCIAMANNA",
    "numPartConAttestato": 15,
    "tipoScuola": "Scuola statale",
    "tipoDestinatari": "STUDENTE",
    "durata": 10,
    "statoPercorsoDes": "Chiuso",
    "statoPercorsoCssClass": "bg-danger",
    "elencoPartecipanti": [
      {
        "codiceStudente": "00D6B3DD00",
        "nome": "HAOJUN",
        "cognome": "JIN",
        "fasciaEta": "19-29",
        "percPresenza": "80,00",
        "hasAttestato": true,
        "fullName": "JIN HAOJUN"
      },
      {
        "codiceStudente": "1144A63200",
        "nome": "FEDERICO",
        "cognome": "RONCHITELLI",
        "fasciaEta": "19-29",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "RONCHITELLI FEDERICO"
      },
      {
        "codiceStudente": "AE352C4E00",
        "nome": "FRANCESCA GIULIA",
        "cognome": "ACUNA GUARDIA",
        "fasciaEta": "14-18",
        "percPresenza": "80,00",
        "hasAttestato": true,
        "fullName": "ACUNA GUARDIA FRANCESCA GIULIA"
      },
      {
        "codiceStudente": "87DAE5C200",
        "nome": "MATTIA",
        "cognome": "MARINELLI",
        "fasciaEta": "14-18",
        "percPresenza": "40,00",
        "hasAttestato": false,
        "fullName": "MARINELLI MATTIA"
      },
      {
        "codiceStudente": "1CD2E13800",
        "nome": "MATTEO",
        "cognome": "VENANZONI",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "VENANZONI MATTEO"
      },
      {
        "codiceStudente": "F10C47E000",
        "nome": "ELINA",
        "cognome": "XIE",
        "fasciaEta": "19-29",
        "percPresenza": "80,00",
        "hasAttestato": true,
        "fullName": "XIE ELINA"
      },
      {
        "codiceStudente": "34495CA400",
        "nome": "GIOVANNI",
        "cognome": "GAROFALO",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "GAROFALO GIOVANNI"
      },
      {
        "codiceStudente": "84BE7B3F00",
        "nome": "LUCIO",
        "cognome": "ASTOLFI",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "ASTOLFI LUCIO"
      },
      {
        "codiceStudente": "1B66935300",
        "nome": "PIETRO",
        "cognome": "CANTARINI",
        "fasciaEta": "19-29",
        "percPresenza": "80,00",
        "hasAttestato": true,
        "fullName": "CANTARINI PIETRO"
      },
      {
        "codiceStudente": "32635C6800",
        "nome": "ANDREA",
        "cognome": "CORRADO",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "CORRADO ANDREA"
      },
      {
        "codiceStudente": "FC711C3000",
        "nome": "TAMARA KELLY",
        "cognome": "CRESCINI",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "CRESCINI TAMARA KELLY"
      },
      {
        "codiceStudente": "6A8EDDF800",
        "nome": "ADEME",
        "cognome": "DJEBBARI",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "DJEBBARI ADEME"
      },
      {
        "codiceStudente": "EFBAF81D00",
        "nome": "FILIPPO",
        "cognome": "FIORINI",
        "fasciaEta": "14-18",
        "percPresenza": "70,00",
        "hasAttestato": true,
        "fullName": "FIORINI FILIPPO"
      },
      {
        "codiceStudente": "96C5BCBA00",
        "nome": "GIULIA",
        "cognome": "MIRIMAO",
        "fasciaEta": "14-18",
        "percPresenza": "70,00",
        "hasAttestato": true,
        "fullName": "MIRIMAO GIULIA"
      },
      {
        "codiceStudente": "5472D9A700",
        "nome": "FRANCESCO",
        "cognome": "URBISAGLIA",
        "fasciaEta": "14-18",
        "percPresenza": "80,00",
        "hasAttestato": true,
        "fullName": "URBISAGLIA FRANCESCO"
      },
      {
        "codiceStudente": "542991F900",
        "nome": "MARIKA",
        "cognome": "NEKIC",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "NEKIC MARIKA"
      }
    ],
    "desEdi": "Il percorso introduce le basi della teoria delle basi di dati relazionali, un pilastro fondamentale dell'informatica intesa come disciplina che studia i metodi per estrarre informazioni in modo automatico da dati grezzi.\n\nLa presentazione degli argomenti è declinata in modo rendere evidente come l'informatica sia una disciplina scientifica e ingegneristica. Vengono esposti sia gli aspetti scientifici e formali, come quelli dell'algebra delle relazioni, sia quelli ingegneristici legati all'efficienza computazionale degli algoritmi.\n\nI contenuti si collocano in un contesto interdisciplinare, come è proprio dell'informatica, dove la teoria si unisce alla pratica, grazie all'utilizzo di una piattaforma web per la valutazione di espressioni algebriche relazionali.\n\nObiettivi generali:\n\n-  cogliere la stretta relazione tra pensiero scientifico e sviluppo tecnologico.\n- comprendere le strutture fondamentali dei ragionamenti logico-deduttivi e padroneggiare il linguaggio logico-formale per risolvere problemi di varia natura.\n- utilizzare strumenti informatici per modellare e risolvere problemi.\n- acquisire una comprensione approfondita della disciplina informatica per orientare le proprie scelte future, sia a livello universitario che professionale.",
    "numPartSenzaAttestato": 1,
    "durataStr": "10,00",
    "dataInizioStr": "11/12/2024",
    "dataFineStr": "05/02/2025"
  },
  {
    "id": 708459,
    "codice": "1224-ATT-827-E-20",
    "titolo": "Algebra delle relazioni - Edizione 4 - Classe 4F opzione Scienze Applicate",
    "attivita": "Percorsi di orientamento e formazione per il potenziamento delle competenze STEM, digitali e di innovazione",
    "dataInizio": "2024-12-11",
    "dataFine": "2025-03-10",
    "numPersonale": 2,
    "numPartecipanti": 14,
    "stato": "CHIUSO",
    "codScuUt": null,
    "codForScuApp": null,
    "desIntervento": "Citizen scientists of  the future",
    "personaleStr": "GIONATA            MASSI                     , DANIELA SCIAMANNA",
    "numPartConAttestato": 13,
    "tipoScuola": "Scuola statale",
    "tipoDestinatari": "STUDENTE",
    "durata": 10,
    "statoPercorsoDes": "Chiuso",
    "statoPercorsoCssClass": "bg-danger",
    "elencoPartecipanti": [
      {
        "codiceStudente": "5161918500",
        "nome": "FEDERICO",
        "cognome": "AGARBATI",
        "fasciaEta": "14-18",
        "percPresenza": "70,00",
        "hasAttestato": true,
        "fullName": "AGARBATI FEDERICO"
      },
      {
        "codiceStudente": "7A30CF4900",
        "nome": "MARCO",
        "cognome": "CHIRIATTI",
        "fasciaEta": "14-18",
        "percPresenza": "30,00",
        "hasAttestato": false,
        "fullName": "CHIRIATTI MARCO"
      },
      {
        "codiceStudente": "89575D2000",
        "nome": "GIADA",
        "cognome": "CONTINI",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "CONTINI GIADA"
      },
      {
        "codiceStudente": "5204D26500",
        "nome": "IVAN",
        "cognome": "GALEANDRO",
        "fasciaEta": "14-18",
        "percPresenza": "80,00",
        "hasAttestato": true,
        "fullName": "GALEANDRO IVAN"
      },
      {
        "codiceStudente": "EF467F8700",
        "nome": "GIOVANNI",
        "cognome": "GARBUGLIA",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "GARBUGLIA GIOVANNI"
      },
      {
        "codiceStudente": "0A2C697100",
        "nome": "MATILDE",
        "cognome": "GIGLI",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "GIGLI MATILDE"
      },
      {
        "codiceStudente": "F340D8FE00",
        "nome": "MICHELE GIOVANNI",
        "cognome": "MARINOZZI",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "MARINOZZI MICHELE GIOVANNI"
      },
      {
        "codiceStudente": "BC409C8C00",
        "nome": "MANUEL",
        "cognome": "MARZIANI",
        "fasciaEta": "14-18",
        "percPresenza": "70,00",
        "hasAttestato": true,
        "fullName": "MARZIANI MANUEL"
      },
      {
        "codiceStudente": "ACAA999800",
        "nome": "MOHAMED HUSSEIN MOHAMED HUSSEIN",
        "cognome": "MOHAMED",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "MOHAMED MOHAMED HUSSEIN MOHAMED HUSSEIN"
      },
      {
        "codiceStudente": "3AF4C1E600",
        "nome": "FILIPPO",
        "cognome": "MONDAINI",
        "fasciaEta": "14-18",
        "percPresenza": "80,00",
        "hasAttestato": true,
        "fullName": "MONDAINI FILIPPO"
      },
      {
        "codiceStudente": "D6B89C7700",
        "nome": "ISABELLA",
        "cognome": "ORSINI",
        "fasciaEta": "14-18",
        "percPresenza": "80,00",
        "hasAttestato": true,
        "fullName": "ORSINI ISABELLA"
      },
      {
        "codiceStudente": "A5C67CA800",
        "nome": "AURORA",
        "cognome": "PERUCCI",
        "fasciaEta": "14-18",
        "percPresenza": "100,00",
        "hasAttestato": true,
        "fullName": "PERUCCI AURORA"
      },
      {
        "codiceStudente": "8D61477B00",
        "nome": "CHRISTIAN",
        "cognome": "POLENTA",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "POLENTA CHRISTIAN"
      },
      {
        "codiceStudente": "F4A64E4C00",
        "nome": "GIOVANNI",
        "cognome": "ZICHELLA",
        "fasciaEta": "14-18",
        "percPresenza": "90,00",
        "hasAttestato": true,
        "fullName": "ZICHELLA GIOVANNI"
      }
    ],
    "desEdi": "Il percorso introduce le basi della teoria delle basi di dati relazionali, un pilastro fondamentale dell'informatica intesa come disciplina che studia i metodi per estrarre informazioni in modo automatico da dati grezzi.\n\nLa presentazione degli argomenti è declinata in modo rendere evidente come l'informatica sia una disciplina scientifica e ingegneristica. Vengono esposti sia gli aspetti scientifici e formali, come quelli dell'algebra delle relazioni, sia quelli ingegneristici legati all'efficienza computazionale degli algoritmi.\n\nI contenuti si collocano in un contesto interdisciplinare, come è proprio dell'informatica, dove la teoria si unisce alla pratica, grazie all'utilizzo di una piattaforma web per la valutazione di espressioni algebriche relazionali.\n\nObiettivi generali:\n\n-  cogliere la stretta relazione tra pensiero scientifico e sviluppo tecnologico.\n- comprendere le strutture fondamentali dei ragionamenti logico-deduttivi e padroneggiare il linguaggio logico-formale per risolvere problemi di varia natura.\n- utilizzare strumenti informatici per modellare e risolvere problemi.\n- acquisire una comprensione approfondita della disciplina informatica per orientare le proprie scelte future, sia a livello universitario che professionale.",
    "numPartSenzaAttestato": 1,
    "durataStr": "10,00",
    "dataInizioStr": "11/12/2024",
    "dataFineStr": "10/03/2025"
  },
  {
    "id": 695147,
    "codice": "1224-ATT-827-E-16",
    "titolo": "LABORATORIO DI MATEMATICA II",
    "attivita": "Percorsi di orientamento e formazione per il potenziamento delle competenze STEM, digitali e di innovazione",
    "dataInizio": "2025-01-31",
    "dataFine": "2025-03-21",
    "numPersonale": 2,
    "numPartecipanti": 15,
    "stato": "CHIUSO",
    "codScuUt": null,
    "codForScuApp": null,
    "desIntervento": "Citizen scientists of  the future",
    "personaleStr": "GIONATA            MASSI                     , IDA MARRUCCHIELLO",
    "numPartConAttestato": 0,
    "tipoScuola": "Scuola statale",
    "tipoDestinatari": "STUDENTE",
    "durata": 10,
    "statoPercorsoDes": "Chiuso",
    "statoPercorsoCssClass": "bg-danger",
    "elencoPartecipanti": [
      {
        "codiceStudente": "A1F544BC00",
        "nome": "MATTEO",
        "cognome": "CICCARINI",
        "fasciaEta": "14-18",
        "percPresenza": null,
        "hasAttestato": true,
        "fullName": "CICCARINI MATTEO"
      },
      {
        "codiceStudente": "A4AD648300",
        "nome": "SOFIA",
        "cognome": "CASONI",
        "fasciaEta": "14-18",
        "percPresenza": null,
        "hasAttestato": true,
        "fullName": "CASONI SOFIA"
      },
      {
        "codiceStudente": "018FC06A00",
        "nome": "LEONARDO",
        "cognome": "BELLI",
        "fasciaEta": "14-18",
        "percPresenza": null,
        "hasAttestato": true,
        "fullName": "BELLI LEONARDO"
      },
      {
        "codiceStudente": "E7BF739F00",
        "nome": "ALESSIO",
        "cognome": "BALDONI",
        "fasciaEta": "14-18",
        "percPresenza": null,
        "hasAttestato": true,
        "fullName": "BALDONI ALESSIO"
      },
      {
        "codiceStudente": "5A041B7B00",
        "nome": "ALESSIO",
        "cognome": "PIGNOTTI",
        "fasciaEta": "14-18",
        "percPresenza": null,
        "hasAttestato": true,
        "fullName": "PIGNOTTI ALESSIO"
      },
      {
        "codiceStudente": "5466D4A500",
        "nome": "FILIPPO",
        "cognome": "MARTELLI",
        "fasciaEta": "14-18",
        "percPresenza": null,
        "hasAttestato": true,
        "fullName": "MARTELLI FILIPPO"
      },
      {
        "codiceStudente": "CB359C9F00",
        "nome": "VALENTINA",
        "cognome": "PICCIONI",
        "fasciaEta": "14-18",
        "percPresenza": null,
        "hasAttestato": true,
        "fullName": "PICCIONI VALENTINA"
      },
      {
        "codiceStudente": "4791CCE800",
        "nome": "FILIPPO",
        "cognome": "MANINI",
        "fasciaEta": "14-18",
        "percPresenza": null,
        "hasAttestato": true,
        "fullName": "MANINI FILIPPO"
      },
      {
        "codiceStudente": "D550531400",
        "nome": "ANNA",
        "cognome": "DAVANZALI",
        "fasciaEta": "14-18",
        "percPresenza": null,
        "hasAttestato": true,
        "fullName": "DAVANZALI ANNA"
      }
    ],
    "desEdi": "Progetto di lezioni in modalità laboratoriale, in cui si approfondiscono alcuni aspetti della Matematica che generalmente non vengono affrontati nella progettazione curricolare e che si prestano ad applicazioni interdisciplinari in altri ambiti (Fisica, Matematica, Informatica).",
    "numPartSenzaAttestato": 15,
    "durataStr": "10,00",
    "dataInizioStr": "31/01/2025",
    "dataFineStr": "21/03/2025"
  }
];

function addEmails () {
  corsi.forEach((corso) => {
    corso.elencoPartecipanti.forEach((partecipante) => {
      partecipante.email =
        partecipante.nome.toLocaleLowerCase().split(" ").join("") +
        "." +
        partecipante.cognome.toLocaleLowerCase().split(" ").join("") +
        "@savoiabenincasa.it";
    });
  });
}

addEmails();

corsi.forEach((corso) => {
  console.log(corso);
});