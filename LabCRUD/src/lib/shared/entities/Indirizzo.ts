import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Articolazione } from "./Articolazione.js"
import { Ordinamento } from "./Ordinamento.js"

@Entity<Indirizzo>("Indirizzo", {
  allowApiCrud: true,
  dbName: "Indirizzo",
})
export class Indirizzo {
  @Fields.autoIncrement()
  idIndirizzo = 0

  @Fields.integer()
  idOrdinamento!: number

  @Relations.toOne(() => Ordinamento, { field: "idOrdinamento" })
  ordinamentoIdOrdinamento!: Ordinamento

  @Fields.string({ allowNull: true })
  indirizzo?: string

  @Fields.string({ allowNull: true })
  abbreviazione?: string

  // Relations toMany
  @Relations.toMany(() => Articolazione)
  Articolazione?: Articolazione[]
}
