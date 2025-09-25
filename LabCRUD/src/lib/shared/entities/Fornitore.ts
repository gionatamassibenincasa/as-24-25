import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Fornitura } from "./Fornitura.js"

@Entity<Fornitore>("Fornitore", {
  allowApiCrud: true,
  dbName: "Fornitore",
})
export class Fornitore {
  @Fields.integer()
  id!: number

  @Fields.string({ allowNull: true })
  fornitore?: string

  @Fields.string({ allowNull: true })
  PIVA?: string

  @Fields.string({ allowNull: true })
  indirizzo?: string

  @Fields.string({ allowNull: true })
  telefono?: string

  // Relations toMany
  @Relations.toMany(() => Fornitura)
  Fornitura?: Fornitura[]
}
