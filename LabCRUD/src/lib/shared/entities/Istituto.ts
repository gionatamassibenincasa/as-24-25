import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Plesso } from "./Plesso.js"

@Entity<Istituto>("Istituto", {
  allowApiCrud: true,
  dbName: "Istituto",
})
export class Istituto {
  @Fields.autoIncrement()
  idIstituto = 0

  @Fields.string({ allowNull: true })
  istituto?: string

  // Relations toMany
  @Relations.toMany(() => Plesso)
  Plesso?: Plesso[]
}
