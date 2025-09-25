import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { ObiettiviModulo } from "./ObiettiviModulo.js"
import { TipoObiettivo } from "./TipoObiettivo.js"

@Entity<Obiettivo>("Obiettivo", {
  allowApiCrud: true,
  dbName: "Obiettivo",
})
export class Obiettivo {
  @Fields.integer()
  id!: number

  @Fields.integer()
  idTipoObiettivo!: number

  @Relations.toOne(() => TipoObiettivo, { field: "idTipoObiettivo" })
  tipoObiettivoIdTipoObiettivo!: TipoObiettivo

  @Fields.string({ allowNull: true })
  obiettivo?: string

  // Relations toMany
  @Relations.toMany(() => ObiettiviModulo)
  ObiettiviModulo?: ObiettiviModulo[]
}
