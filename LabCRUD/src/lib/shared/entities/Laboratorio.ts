import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Costo } from "./Costo.js"
import { Modulo } from "./Modulo.js"
import { Finanziamento } from "./Finanziamento.js"
import { Plesso } from "./Plesso.js"

@Entity<Laboratorio>("Laboratorio", {
  allowApiCrud: true,
  dbName: "Laboratorio",
})
export class Laboratorio {
  @Fields.autoIncrement()
  idLaboratorio = 0

  @Fields.integer()
  idPlesso!: number

  @Relations.toOne(() => Plesso, { field: "idPlesso" })
  plessoIdPlesso!: Plesso

  @Fields.string({ allowNull: true })
  laboratorio?: string

  @Fields.string({ allowNull: true })
  aula?: string

  @Fields.integer({ allowNull: true })
  idFinanziamento? = 1

  @Relations.toOne(() => Finanziamento, { field: "idFinanziamento" })
  finanziamentoIdFinanziamento?: Finanziamento

  // Relations toMany
  @Relations.toMany(() => Costo)
  Costo?: Costo[]

  @Relations.toMany(() => Modulo)
  Modulo?: Modulo[]
}
