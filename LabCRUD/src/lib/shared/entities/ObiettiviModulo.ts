import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Obiettivo } from "./Obiettivo.js"
import { Modulo } from "./Modulo.js"

@Entity<ObiettiviModulo>("ObiettiviModulo", {
  allowApiCrud: true,
  dbName: "ObiettiviModulo",
})
export class ObiettiviModulo {
  @Fields.integer()
  idModulo!: number

  @Relations.toOne(() => Modulo, { field: "idModulo" })
  moduloIdModulo!: Modulo

  @Fields.integer()
  idObiettivo!: number

  @Relations.toOne(() => Obiettivo, { field: "idObiettivo" })
  obiettivoIdObiettivo!: Obiettivo
}
