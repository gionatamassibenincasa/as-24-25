import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Laboratorio } from "./Laboratorio.js"
import { Istituto } from "./Istituto.js"

@Entity<Plesso>("Plesso", {
  allowApiCrud: true,
  dbName: "Plesso",
})
export class Plesso {
  @Fields.integer()
  id!: number

  @Fields.string({ allowNull: true })
  plesso?: string

  @Fields.integer()
  idIstituto!: number

  @Relations.toOne(() => Istituto, { field: "idIstituto" })
  istitutoIdIstituto!: Istituto

  // Relations toMany
  @Relations.toMany(() => Laboratorio)
  Laboratorio?: Laboratorio[]
}
