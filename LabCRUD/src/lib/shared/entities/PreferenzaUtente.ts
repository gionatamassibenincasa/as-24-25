import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { TipoPreferenza } from "./TipoPreferenza.js"
import { Utente } from "./Utente.js"

@Entity<PreferenzaUtente>("PreferenzaUtente", {
  allowApiCrud: true,
  dbName: "PreferenzaUtente",
})
export class PreferenzaUtente {
  @Fields.integer()
  idUtente!: number

  @Relations.toOne(() => Utente, { field: "idUtente" })
  utenteIdUtente!: Utente

  @Fields.integer()
  idPreferenza!: number

  @Relations.toOne(() => TipoPreferenza, { field: "idPreferenza" })
  tipoPreferenzaIdPreferenza!: TipoPreferenza

  @Fields.string()
  valore!: string
}
