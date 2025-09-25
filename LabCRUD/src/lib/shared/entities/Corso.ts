import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Indirizzo } from "./Indirizzo.js"
import { Ordinamento } from "./Ordinamento.js"

@Entity<Corso>("Corso", {
  allowApiCrud: true,
  dbName: "Corso",
})
export class Corso {
  @Fields.integer()
  id!: number

  @Fields.integer()
  idOrdinamento!: number

  @Relations.toOne(() => Ordinamento, { field: "idOrdinamento" })
  ordinamentoIdOrdinamento!: Ordinamento

  @Fields.string({ allowNull: true })
  corso?: string

  // Relations toMany
  @Relations.toMany(() => Indirizzo)
  Indirizzo?: Indirizzo[]
}
