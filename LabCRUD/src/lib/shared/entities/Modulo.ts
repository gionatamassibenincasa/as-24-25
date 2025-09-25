import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { ObiettiviModulo } from "./ObiettiviModulo.js"
import { Utente } from "./Utente.js"
import { Laboratorio } from "./Laboratorio.js"
import { Target } from "./Target.js"

@Entity<Modulo>("Modulo", {
  allowApiCrud: true,
  dbName: "Modulo",
})
export class Modulo {
  @Fields.integer()
  id!: number

  @Fields.integer()
  idLaboratorio!: number

  @Relations.toOne(() => Laboratorio, { field: "idLaboratorio" })
  laboratorioIdLaboratorio!: Laboratorio

  @Fields.integer()
  idTarget!: number

  @Relations.toOne(() => Target, { field: "idTarget" })
  targetIdTarget!: Target

  @Fields.string({ allowNull: true })
  modulo?: string

  @Fields.string({ allowNull: true })
  descrizione?: string

  @Fields.string({ allowNull: true })
  discipline?: string

  @Fields.string({ allowNull: true })
  professione?: string

  @Fields.integer({ allowNull: true })
  modificatoDa? = 1

  @Relations.toOne(() => Utente, { field: "modificatoDa" })
  utenteModificatoDa?: Utente

  @Fields.createdAt({ allowNull: true })
  createdAt? = new Date()

  @Fields.updatedAt({ allowNull: true })
  updatedAt? = new Date()

  // Relations toMany
  @Relations.toMany(() => ObiettiviModulo)
  ObiettiviModulo?: ObiettiviModulo[]
}
