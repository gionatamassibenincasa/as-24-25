import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Costo } from "./Costo.js"
import { Modulo } from "./Modulo.js"
import { Finanziamento } from "./Finanziamento.js"
import { Plesso } from "./Plesso.js"
import { Utente } from "./Utente.js"

@Entity<Laboratorio>("Laboratorio", {
  allowApiCrud: true,
  dbName: "Laboratorio",
})
export class Laboratorio {
  @Fields.integer()
  id!: number

  @Fields.integer()
  idPlesso = 1

  @Relations.toOne(() => Plesso, { field: "idPlesso" })
  plessoIdPlesso!: Plesso

  @Fields.string({ allowNull: true })
  laboratorio?: string

  @Fields.string({ allowNull: true })
  aula?: string

  @Fields.integer()
  idFinanziamento = 1

  @Relations.toOne(() => Finanziamento, { field: "idFinanziamento" })
  finanziamentoIdFinanziamento!: Finanziamento

  @Fields.integer()
  modificatoDa = 1

  @Relations.toOne(() => Utente, { field: "modificatoDa" })
  utenteModificatoDa!: Utente

  @Fields.createdAt({ allowNull: true })
  createdAt? = new Date()

  @Fields.updatedAt({ allowNull: true })
  updatedAt? = new Date()

  // Relations toMany
  @Relations.toMany(() => Costo)
  Costo?: Costo[]

  @Relations.toMany(() => Modulo)
  Modulo?: Modulo[]
}
