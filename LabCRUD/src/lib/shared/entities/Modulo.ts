import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { ObiettiviModulo } from "./ObiettiviModulo.js"
import { Laboratorio } from "./Laboratorio.js"
import { Target } from "./Target.js"

@Entity<Modulo>("Modulo", {
  allowApiCrud: true,
  dbName: "Modulo",
})
export class Modulo {
  @Fields.autoIncrement()
  idModulo = 0

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

  // Relations toMany
  @Relations.toMany(() => ObiettiviModulo)
  ObiettiviModulo?: ObiettiviModulo[]
}
