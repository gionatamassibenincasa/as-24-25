import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Fornitura } from "./Fornitura.js"
import { Laboratorio } from "./Laboratorio.js"
import { Voce } from "./Voce.js"

@Entity<Costo>("Costo", {
  allowApiCrud: true,
  dbName: "Costo",
})
export class Costo {
  @Fields.integer()
  id!: number

  @Fields.integer()
  idVoce = 3

  @Relations.toOne(() => Voce, { field: "idVoce" })
  voceIdVoce!: Voce

  @Fields.integer()
  idLaboratorio!: number

  @Relations.toOne(() => Laboratorio, { field: "idLaboratorio" })
  laboratorioIdLaboratorio!: Laboratorio

  @Fields.integer()
  idFornitura!: number

  @Relations.toOne(() => Fornitura, { field: "idFornitura" })
  fornituraIdFornitura!: Fornitura

  @Fields.string({ allowNull: true })
  descrizione?: string

  @Fields.integer({ allowNull: true })
  quantita?: number
}
