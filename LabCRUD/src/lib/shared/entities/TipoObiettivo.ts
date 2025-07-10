import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Obiettivo } from "./Obiettivo.js"

@Entity<TipoObiettivo>("TipoObiettivo", {
  allowApiCrud: true,
  dbName: "TipoObiettivo",
})
export class TipoObiettivo {
  @Fields.autoIncrement()
  idTipoObiettivo = 0

  @Fields.string({ allowNull: true })
  tipoObiettivo?: string

  @Fields.string({ allowNull: true })
  descrizione?: string

  // Relations toMany
  @Relations.toMany(() => Obiettivo)
  Obiettivo?: Obiettivo[]
}
