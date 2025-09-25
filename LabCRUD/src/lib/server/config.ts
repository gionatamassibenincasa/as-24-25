import { config } from 'dotenv'
import { Database } from 'bun:sqlite'

import { SqlDatabase } from 'remult'
import { BunSqliteDataProvider } from 'remult/remult-bun-sqlite'

import { Articolazione } from '$lib/shared/entities/Articolazione'
import { Corso } from '$lib/shared/entities/Corso'
import { Costo } from '$lib/shared/entities/Costo'
import { Curriculum } from '$lib/shared/entities/Curriculum'
import { Finanziamento } from '$lib/shared/entities/Finanziamento'
import { Fornitore } from '$lib/shared/entities/Fornitore'
import { Fornitura } from '$lib/shared/entities/Fornitura'
import { Indirizzo } from '$lib/shared/entities/Indirizzo'
import { Istituto } from '$lib/shared/entities/Istituto'
import { Laboratorio } from '$lib/shared/entities/Laboratorio'
import { Modulo } from '$lib/shared/entities/Modulo'
import { ObiettiviModulo } from '$lib/shared/entities/ObiettiviModulo'
import { Obiettivo } from '$lib/shared/entities/Obiettivo'
import { Ordinamento } from '$lib/shared/entities/Ordinamento'
import { Plesso } from '$lib/shared/entities/Plesso'
import { PreferenzaUtente } from '$lib/shared/entities/PreferenzaUtente'
import { Ruolo } from '$lib/shared/entities/Ruolo'
import { RuoloUtente } from '$lib/shared/entities/RuoloUtente'
import { Sessione } from '$lib/shared/entities/Sessione'
import { Target } from '$lib/shared/entities/Target'
import { TipoFornitura } from '$lib/shared/entities/TipoFornitura'
import { TipoObiettivo } from '$lib/shared/entities/TipoObiettivo'
import { TipoPreferenza } from '$lib/shared/entities/TipoPreferenza'
import { Utente } from '$lib/shared/entities/Utente'
import { Voce } from '$lib/shared/entities/Voce'

config();

export const dataProvider = new SqlDatabase(
    new BunSqliteDataProvider(new Database(process.env['DB_DATABASE'])),
)

export const entities = [
    Articolazione,
    Corso,
    Costo,
    Curriculum,
    Finanziamento,
    Fornitore,
    Fornitura,
    Indirizzo,
    Istituto,
    Laboratorio,
    Modulo,
    ObiettiviModulo,
    Obiettivo,
    Ordinamento,
    Plesso,
    PreferenzaUtente,
    Ruolo,
    RuoloUtente,
    Sessione,
    Target,
    TipoFornitura,
    TipoObiettivo,
    TipoPreferenza,
    Utente,
    Voce
]
