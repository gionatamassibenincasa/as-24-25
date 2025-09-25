import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Laboratorio } from "./Laboratorio.js"

@Entity<Finanziamento>("Finanziamento", {
  allowApiCrud: true,
  dbName: "Finanziamento",
})
export class Finanziamento {
  @Fields.integer()
  id!: number

  @Fields.string({ allowNull: true })
  tipo?: string

  @Fields.string({ allowNull: true })
  denominazione?: string

  @Fields.string({ allowNull: true })
  urlAvviso?: string

  @Fields.integer({ allowNull: true })
  importo?: number

  // Relations toMany
  @Relations.toMany(() => Laboratorio)
  Laboratorio?: Laboratorio[]
}
