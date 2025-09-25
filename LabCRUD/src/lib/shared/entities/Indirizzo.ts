import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Articolazione } from "./Articolazione.js"
import { Curriculum } from "./Curriculum.js"
import { Corso } from "./Corso.js"

@Entity<Indirizzo>("Indirizzo", {
  allowApiCrud: true,
  dbName: "Indirizzo",
})
export class Indirizzo {
  @Fields.integer()
  id!: number

  @Fields.integer()
  idCorso!: number

  @Relations.toOne(() => Corso, { field: "idCorso" })
  corsoIdCorso!: Corso

  @Fields.string()
  indirizzo!: string

  // Relations toMany
  @Relations.toMany(() => Articolazione)
  Articolazione?: Articolazione[]

  @Relations.toMany(() => Curriculum)
  Curriculum?: Curriculum[]
}
