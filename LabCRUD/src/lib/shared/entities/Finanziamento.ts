import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Laboratorio } from "./Laboratorio.js"

@Entity<Finanziamento>("Finanziamento", {
  allowApiCrud: true,
  dbName: "Finanziamento",
})
export class Finanziamento {
  @Fields.autoIncrement()
  idFinanziamento = 0

  @Fields.string({ allowNull: true })
  urlAvviso?: string

  @Fields.integer({ allowNull: true })
  importo?: number

  // Relations toMany
  @Relations.toMany(() => Laboratorio)
  Laboratorio?: Laboratorio[]
}
