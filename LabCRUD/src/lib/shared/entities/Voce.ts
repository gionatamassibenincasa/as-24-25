import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Costo } from "./Costo.js"

@Entity<Voce>("Voce", {
  allowApiCrud: true,
  dbName: "Voce",
})
export class Voce {
  @Fields.integer()
  id!: number

  @Fields.string()
  lettera!: string

  @Fields.string()
  voce!: string

  @Fields.string({ allowNull: true })
  descrizione?: string

  @Fields.integer({ allowNull: true })
  minimale?: number

  @Fields.integer({ allowNull: true })
  massimale?: number

  // Relations toMany
  @Relations.toMany(() => Costo)
  Costo?: Costo[]
}
