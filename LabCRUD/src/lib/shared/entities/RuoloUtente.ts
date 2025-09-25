import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Ruolo } from "./Ruolo.js"
import { Utente } from "./Utente.js"

@Entity<RuoloUtente>("RuoloUtente", {
  allowApiCrud: true,
  dbName: "RuoloUtente",
  id: ['idUtente', 'idRuolo']
})
export class RuoloUtente {
  @Fields.integer()
  idUtente!: number

  @Relations.toOne(() => Utente, { field: "idUtente" })
  utenteIdUtente!: Utente

  @Fields.integer()
  idRuolo!: number

  @Relations.toOne(() => Ruolo, { field: "idRuolo" })
  ruoloIdRuolo!: Ruolo
}
