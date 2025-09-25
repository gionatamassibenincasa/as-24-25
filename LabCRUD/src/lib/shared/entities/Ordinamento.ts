import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Corso } from "./Corso.js"

@Entity<Ordinamento>("Ordinamento", {
  allowApiCrud: true,
  dbName: "Ordinamento",
})
export class Ordinamento {
  @Fields.integer()
  id!: number

  @Fields.string()
  ordinamento!: string

  // Relations toMany
  @Relations.toMany(() => Corso)
  Corso?: Corso[]
}
