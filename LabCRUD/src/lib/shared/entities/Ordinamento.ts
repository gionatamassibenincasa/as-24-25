import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Indirizzo } from "./Indirizzo.js"

@Entity<Ordinamento>("Ordinamento", {
  allowApiCrud: true,
  dbName: "Ordinamento",
})
export class Ordinamento {
  @Fields.autoIncrement()
  idOrdinamento = 0

  @Fields.string({ allowNull: true })
  ordinamento?: string

  // Relations toMany
  @Relations.toMany(() => Indirizzo)
  Indirizzo?: Indirizzo[]
}
