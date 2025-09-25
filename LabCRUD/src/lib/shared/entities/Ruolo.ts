import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { RuoloUtente } from "./RuoloUtente.js"

@Entity<Ruolo>("Ruolo", {
  allowApiCrud: true,
  dbName: "Ruolo",
})
export class Ruolo {
  @Fields.integer()
  id!: number

  @Fields.string()
  ruolo!: string

  // Relations toMany
  @Relations.toMany(() => RuoloUtente)
  RuoloUtente?: RuoloUtente[]
}
