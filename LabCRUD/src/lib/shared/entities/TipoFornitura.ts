import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Fornitura } from "./Fornitura.js"

@Entity<TipoFornitura>("TipoFornitura", {
  allowApiCrud: true,
  dbName: "TipoFornitura",
})
export class TipoFornitura {
  @Fields.autoIncrement()
  idTipoFornitura = 0

  @Fields.string({ allowNull: true })
  tipoFornitura?: string

  // Relations toMany
  @Relations.toMany(() => Fornitura)
  Fornitura?: Fornitura[]
}
