import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Target } from "./Target.js"
import { Indirizzo } from "./Indirizzo.js"

@Entity<Articolazione>("Articolazione", {
  allowApiCrud: true,
  dbName: "Articolazione",
})
export class Articolazione {
  @Fields.autoIncrement()
  idArticolazione = 0

  @Fields.integer()
  idIndirizzo!: number

  @Relations.toOne(() => Indirizzo, { field: "idIndirizzo" })
  indirizzoIdIndirizzo!: Indirizzo

  @Fields.string({ allowNull: true })
  articolazione?: string

  @Fields.string({ allowNull: true })
  abbreviazione?: string

  // Relations toMany
  @Relations.toMany(() => Target)
  Target?: Target[]
}
