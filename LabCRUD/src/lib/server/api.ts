import { remultApi } from 'remult/remult-sveltekit';
import { SqlDatabase } from 'remult';
import { Database } from 'bun:sqlite';
import { BunSqliteDataProvider } from 'remult/remult-bun-sqlite';

import { Articolazione } from '$lib/shared/entities/Articolazione';
import { Costo } from '$lib/shared/entities/Costo';
import { Finanziamento } from '$lib/shared/entities/Finanziamento';
import { Fornitore } from '$lib/shared/entities/Fornitore';
import { Fornitura } from '$lib/shared/entities/Fornitura';
import { Indirizzo } from '$lib/shared/entities/Indirizzo';
import { Istituto } from '$lib/shared/entities/Istituto';
import { Laboratorio } from '$lib/shared/entities/Laboratorio';
import { Modulo } from '$lib/shared/entities/Modulo';
import { ObiettiviModulo } from '$lib/shared/entities/ObiettiviModulo';
import { Obiettivo } from '$lib/shared/entities/Obiettivo';
import { Ordinamento } from '$lib/shared/entities/Ordinamento';
import { Plesso } from '$lib/shared/entities/Plesso';
import { Target } from '$lib/shared/entities/Target';
import { TipoFornitura } from '$lib/shared/entities/TipoFornitura';
import { TipoObiettivo } from '$lib/shared/entities/TipoObiettivo';
import { Voce } from '$lib/shared/entities/Voce';

const dataProvider = new SqlDatabase(
  new BunSqliteDataProvider(
    new Database(
      process.env["DB_DATABASE"]
    )
  )
);

export const api = remultApi({
  dataProvider: dataProvider,
  entities: [Articolazione,Costo,Finanziamento,Fornitore,
    Fornitura,Indirizzo,Istituto,Laboratorio,Modulo,ObiettiviModulo,Obiettivo,Ordinamento,Plesso,Target,TipoFornitura,TipoObiettivo,Voce],
  admin: true
});