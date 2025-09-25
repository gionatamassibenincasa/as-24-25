import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Costo } from "./Costo.js"
import { Fornitore } from "./Fornitore.js"
import { TipoFornitura } from "./TipoFornitura.js"
import { Utente } from "./Utente.js"

@Entity<Fornitura>("Fornitura", {
  allowApiCrud: true,
  dbName: "Fornitura",
})
export class Fornitura {
  @Fields.integer()
  id!: number

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
}
