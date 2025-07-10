import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Costo } from "./Costo.js"
import { Fornitore } from "./Fornitore.js"
import { TipoFornitura } from "./TipoFornitura.js"

@Entity<Fornitura>("Fornitura", {
  allowApiCrud: true,
  dbName: "Fornitura",
})
export class Fornitura {
  @Fields.autoIncrement()
  idFornitura = 0

  @Fields.integer()
  idTipoFornitura = 1

  @Relations.toOne(() => TipoFornitura, { field: "idTipoFornitura" })
  tipoFornituraIdTipoFornitura!: TipoFornitura

  @Fields.integer()
  idFornitore = 1

  @Relations.toOne(() => Fornitore, { field: "idFornitore" })
  fornitoreIdFornitore!: Fornitore

  @Fields.string({ allowNull: true })
  fornitura?: string

  @Fields.integer({ allowNull: true })
  prezzo?: number

  @Fields.string({ allowNull: true })
  codiceMepa?: string

  @Fields.string({ allowNull: true })
  link?: string

  @Fields.string({ allowNull: true })
  SKU?: string

  // Relations toMany
  @Relations.toMany(() => Costo)
  Costo?: Costo[]
}
