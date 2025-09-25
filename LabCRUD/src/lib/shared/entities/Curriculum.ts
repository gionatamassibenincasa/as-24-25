import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Target } from "./Target.js"
import { Articolazione } from "./Articolazione.js"
import { Indirizzo } from "./Indirizzo.js"

@Entity<Curriculum>("Curriculum", {
  allowApiCrud: true,
  dbName: "Curriculum",
})
export class Curriculum {
  @Fields.integer()
  id!: number

  @Fields.string()
  codice!: string

  @Fields.integer()
  idIndirizzo!: number

  @Relations.toOne(() => Indirizzo, { field: "idIndirizzo" })
  indirizzoIdIndirizzo!: Indirizzo

  @Fields.integer({ allowNull: true })
  idArticolazione?: number

  @Relations.toOne(() => Articolazione, { field: "idArticolazione" })
  articolazioneIdArticolazione?: Articolazione

  @Fields.string()
  curriculum!: string

  // Relations toMany
  @Relations.toMany(() => Target)
  Target?: Target[]
}
