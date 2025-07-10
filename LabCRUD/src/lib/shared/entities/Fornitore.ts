import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Fornitura } from "./Fornitura.js"

@Entity<Fornitore>("Fornitore", {
  allowApiCrud: true,
  dbName: "Fornitore",
})
export class Fornitore {
  @Fields.autoIncrement()
  idFornitore = 0

  @Fields.string({ allowNull: true })
  fornitore?: string

  // Relations toMany
  @Relations.toMany(() => Fornitura)
  Fornitura?: Fornitura[]
}
