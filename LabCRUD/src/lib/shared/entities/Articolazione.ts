import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Curriculum } from "./Curriculum.js"
import { Indirizzo } from "./Indirizzo.js"

@Entity<Articolazione>("Articolazione", {
  allowApiCrud: true,
  dbName: "Articolazione",
})
export class Articolazione {
  @Fields.integer()
  id!: number

  @Fields.integer()
  idIndirizzo!: number

  @Relations.toOne(() => Indirizzo, { field: "idIndirizzo" })
  indirizzoIdIndirizzo!: Indirizzo

  @Fields.string()
  articolazione!: string

  // Relations toMany
  @Relations.toMany(() => Curriculum)
  Curriculum?: Curriculum[]
}
