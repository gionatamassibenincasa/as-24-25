class FasciaOrariaGionaliera {
    data: string;
    fasciaOraria: number;

    constructor(data: string, fasciaOraria: number) {
        this.data = data;
        this.fasciaOraria = fasciaOraria;
    }
    toString() {
        const [aaaa, mm, gg] = this.data.split("-");
        return "" + gg + "/" + mm + "/" + aaaa + " ora n. " + this.fasciaOraria;
    }

    dataISO() {
        return this.data;
    }

    toNumber() {
        const [yyyy, mm, dd] = this.data.split("-");
        return parseInt(yyyy) % 10 * 100000 + parseInt(mm) * 1000 + parseInt(dd) * 10 + this.fasciaOraria;
    }
    prossimaSettimana() {
        let d = new Date(this.data + "T10:00:00");
        d.setDate(d.getDate() + 7);
        const d7 = d.toISOString().split("T")[0];
        return new FasciaOrariaGionaliera(d7, this.fasciaOraria);
    }
}

class Lezione {
    id?: number;
    edizione: string;
    data: string;
    fasciaOraria: number;
    aula: string;
    materiali: string;

    constructor(id: number, edizione: string, fasciaOrariaGiornaliera: FasciaOrariaGionaliera, aula: string, materiali: string) {
        this.id = id;
        this.edizione = edizione;
        this.data = fasciaOrariaGiornaliera.data;
        this.fasciaOraria = fasciaOrariaGiornaliera.fasciaOraria;
        this.aula = aula;
        this.materiali = materiali;
    }

    sqlInsert() {
        return `, (${this.id}, '${this.edizione}', '${this.data}', ${this.fasciaOraria}, '${this.aula}', '${this.materiali}')`;
    }
}

interface Edizione {
    edizione: string;
    oreTotali: number;
    fascieOrarie: FasciaOrariaGionaliera[];
    aule: string[];
    materiali: string[];
    dirittoSettimanaBianca: boolean;
    formatore: "Marinelli" | "Massi" | "Taccari";
    tutor: "Lorenzoni" | "Marrucchiello" | "Massi" | "Pomili" | "Sciamanna";
}

let edizioni: Edizione[] = [
    {
        edizione: "RicOp5A",
        oreTotali: 10,
        // lun 1,2
        fascieOrarie: [
            new FasciaOrariaGionaliera("2025-02-03", 1),
            new FasciaOrariaGionaliera("2025-02-03", 2)
        ],
        aule: ["AulaClasse", "AulaClasse"],
        materiali: ["PC", "PC"],
        dirittoSettimanaBianca: false,
        formatore: "Marinelli",
        tutor: "Massi"
    },
    {
        edizione: "RelAx5E",
        oreTotali: 10,
        // ven 5
        fascieOrarie: [
            new FasciaOrariaGionaliera("2024-12-11", 3),
            new FasciaOrariaGionaliera("2024-12-16", 2)
        ],
        aule: ["FabLab", "FabLab"],
        materiali: ["Raspberry Pi", "Raspberry Pi"],
        dirittoSettimanaBianca: false,
        formatore: "Massi",
        tutor: "Sciamanna"
    },
    {
        edizione: "RelAx4F",
        oreTotali: 10,
        // ven 5
        fascieOrarie: [
            new FasciaOrariaGionaliera("2024-12-11", 4),
            new FasciaOrariaGionaliera("2024-12-16", 1)
        ],
        aule: ["FabLab", "FabLab"],
        materiali: ["Raspberry Pi", "Raspberry Pi"],
        dirittoSettimanaBianca: false,
        formatore: "Massi",
        tutor: "Sciamanna"
    },
    {
        edizione: "RelAx5LSinf",
        oreTotali: 10,
        // ven 5
        fascieOrarie: [
            new FasciaOrariaGionaliera("2024-12-13", 5),
            new FasciaOrariaGionaliera("2024-12-20", 5),
            new FasciaOrariaGionaliera("2025-01-10", 5),
            new FasciaOrariaGionaliera("2025-01-17", 5),
            new FasciaOrariaGionaliera("2025-01-24", 5),
            new FasciaOrariaGionaliera("2025-03-14", 5),
            new FasciaOrariaGionaliera("2025-03-21", 5),
            new FasciaOrariaGionaliera("2025-03-28", 5),
            new FasciaOrariaGionaliera("2025-04-04", 5),
            new FasciaOrariaGionaliera("2025-04-11", 5)
        ],
        aule: ["FabLab", "FabLab", "FabLab", "FabLab", "FabLab", "FabLab", "FabLab", "FabLab", "FabLab", "FabLab"],
        materiali: ["Raspberry Pi", "Raspberry Pi", "Raspberry Pi", "Raspberry Pi", "Raspberry Pi", "Raspberry Pi", "Raspberry Pi", "Raspberry Pi", "Raspberry Pi", "Raspberry Pi"],
        dirittoSettimanaBianca: false,
        formatore: "Massi",
        tutor: "Pomili"
    },
    {
        edizione: "RelAx4E",
        oreTotali: 10,
        // mer 2
        fascieOrarie: [
            new FasciaOrariaGionaliera("2025-02-05", 2),
        ],
        aule: ["FabLab"],
        materiali: ["Raspberry Pi"],
        dirittoSettimanaBianca: false,
        formatore: "Massi",
        tutor: "Pomili"
    },

    {
        edizione: "PhyComp",
        oreTotali: 10,
        // 2B AFM
        // lun 2, mer 4
        fascieOrarie: [
            new FasciaOrariaGionaliera("2025-03-10", 2),
            new FasciaOrariaGionaliera("2025-03-12", 4),
        ],
        aule: ["Lab", "Lab"],
        materiali: ["Micro:bit", "Micro:bit"],
        dirittoSettimanaBianca: false,
        formatore: "Massi",
        tutor: "Pomili"
    },
    {
        edizione: "LM2",
        oreTotali: 10,
        // ven 5
        fascieOrarie: [
            new FasciaOrariaGionaliera("2025-01-31", 5),
            new FasciaOrariaGionaliera("2025-01-31", 6)
        ],
        aule: ["AulaClasse", "AulaClasse"],
        materiali: ["Notebook", "Notebook"],
        dirittoSettimanaBianca: true,
        formatore: "Massi",
        tutor: "Marrucchiello"
    },
    {
        edizione: "Crypto2B",
        // Massi, Pomili
        oreTotali: 10,
        // mer 4, sab 1
        fascieOrarie: [
            new FasciaOrariaGionaliera("2025-01-29", 4),
            new FasciaOrariaGionaliera("2025-02-01", 1)
        ],
        aule: ["Lab", "Lab"],
        materiali: ["PC", "PC"],
        dirittoSettimanaBianca: true,
        formatore: "Massi",
        tutor: "Pomili"
    },
    {
        edizione: "Crypto1B",
        oreTotali: 10,
        // mer 1, sab 4
        fascieOrarie: [
            new FasciaOrariaGionaliera("2025-02-05", 1),
            new FasciaOrariaGionaliera("2025-02-08", 4)
        ],
        aule: ["Lab", "Lab"],
        materiali: ["PC", "PC"],
        dirittoSettimanaBianca: false,
        formatore: "Taccari",
        tutor: "Sciamanna"
    },
    {
        edizione: "Crypto4G",
        oreTotali: 10,
        // mar 2
        fascieOrarie: [
            new FasciaOrariaGionaliera("2025-02-04", 2),
            new FasciaOrariaGionaliera("2025-02-11", 2)
        ],
        aule: ["FabLab", "FabLab"],
        materiali: ["Raspberry Pi", "Raspberry Pi"],
        dirittoSettimanaBianca: false,
        formatore: "Taccari",
        tutor: "Sciamanna"
    },
    {
        edizione: "CyberSec3B",
        oreTotali: 20,
        // mer 5, ven 6
        fascieOrarie: [
            new FasciaOrariaGionaliera("2025-01-29", 5),
            new FasciaOrariaGionaliera("2025-01-31", 6)
        ],
        aule: ["FabLab", "FabLab"],
        materiali: ["Raspberry Pi", "Raspberry Pi"],
        dirittoSettimanaBianca: true,
        formatore: "Taccari",
        tutor: "Sciamanna"
    },
    {
        edizione: "CyberSec4B",
        oreTotali: 20,
        // mer 6, ven 4
        fascieOrarie: [
            new FasciaOrariaGionaliera("2025-01-29", 6),
            new FasciaOrariaGionaliera("2025-01-31", 4)
        ],
        aule: ["FabLab", "FabLab"],
        materiali: ["Raspberry Pi", "Raspberry Pi"],
        dirittoSettimanaBianca: false,
        formatore: "Taccari",
        tutor: "Sciamanna"
    }
];

const giorniFestivi = new Set<string>([
    "2024-12-15", "2024-12-22", "2024-12-23", "2024-12-24", "2024-12-25",
    "2024-12-26", "2024-12-27", "2024-12-28", "2024-12-29", "2024-12-30",
    "2024-12-31", "2025-01-01", "2025-01-02", "2025-01-03", "2025-01-04",
    "2025-01-05", "2025-01-06", "2025-01-12", "2025-01-19", "2025-01-26",
    "2025-02-02", "2025-02-09", "2025-02-16", "2025-02-23", "2025-03-02",
    "2025-03-09", "2025-03-16", "2025-03-23", "2025-03-30", "2025-04-06",
    "2025-04-13", "2025-04-17", "2025-04-18", "2025-04-19", "2025-04-20",
    "2025-04-21", "2025-04-22", "2025-04-25", "2025-04-26", "2025-04-27",
    "2025-05-01", "2025-05-02", "2025-05-03", "2025-05-04", "2025-05-11",
    "2025-05-18", "2025-05-25", "2025-06-01", "2025-06-02"]);

// Classi 2 e 3
const giorniSettimanaBianca = new Set<string>(
    ["2025-02-24", "2025-02-25", "2025-02-26", "2025-02-27", "2025-02-28"]);

// LaureaLeonardo
const giorniLaureaLeonardo = new Set<string>(["2025-02-14"]);


let orarioCorsi: Map<string, Set<number>> = new Map();
let orarioPersonale: Map<string, Set<number>> = new Map();
let mappaLezioni: Map<string, Lezione[]> = new Map();

edizioni.forEach(edizione => {
    if (!orarioCorsi.has(edizione.edizione)) {
        orarioCorsi.set(edizione.edizione, new Set());
    }
    if (!orarioPersonale.has(edizione.formatore)) {
        orarioPersonale.set(edizione.formatore, new Set());
    }
    if (!orarioPersonale.has(edizione.tutor)) {
        orarioPersonale.set(edizione.tutor, new Set());
    }
    if (!mappaLezioni.has(edizione.edizione)) {
        mappaLezioni.set(edizione.edizione, []);
    }
    const c = orarioCorsi.get(edizione.edizione);
    const f = orarioPersonale.get(edizione.formatore);
    const t = orarioPersonale.get(edizione.tutor);
    const l = mappaLezioni.get(edizione.edizione);

    let id = 1;
    const oreTotali = edizione.oreTotali;
    const nFascieOrarie = edizione.fascieOrarie.length;
    const orarioLezione = edizione.fascieOrarie;

    while (id <= oreTotali) {
        for (let idxGiorno = 0; idxGiorno < nFascieOrarie && id <= oreTotali; idxGiorno++) {
            const hashOrarioLezione = orarioLezione[idxGiorno].toNumber();
            if (f?.has(hashOrarioLezione) || t?.has(hashOrarioLezione)) {
                orarioLezione[idxGiorno] = orarioLezione[idxGiorno].prossimaSettimana();
                continue;
            }
            const data = orarioLezione[idxGiorno].data;
            const festivo = giorniFestivi.has(data);
            const settimanaBianca = edizione.dirittoSettimanaBianca && giorniSettimanaBianca.has(data);
            const laureaLeonardo = edizione.formatore == "Taccari" && giorniLaureaLeonardo.has(data);
            if (!(festivo || settimanaBianca || laureaLeonardo)) {
                const clone: FasciaOrariaGionaliera = { ...orarioLezione[idxGiorno] };
                c?.add(clone);
                f?.add(hashOrarioLezione);
                t?.add(hashOrarioLezione);
                l?.push(new Lezione(id, edizione.edizione, clone, edizione.aule[idxGiorno], edizione.materiali[idxGiorno]));
                id++;
            }
            orarioLezione[idxGiorno] = orarioLezione[idxGiorno].prossimaSettimana();
        }
    }
});

for (const [corso, lezioni] of mappaLezioni) {
    lezioni.sort((a, b) => {
        const [ay, am, ad] = a.data.split("-");
        const [by, bm, bd] = b.data.split("-");
        return (ay - by) * 100000 + (am - bm) * 1000 + (ad - bd) * 10 + (a.fasciaOraria - b.fasciaOraria);
    });
    lezioni.forEach((l, idx) => {
        l.id = idx + 1;
        console.log(l.sqlInsert());
    });
}
