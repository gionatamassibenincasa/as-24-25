import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { PreferenzaUtente } from "./PreferenzaUtente.js"

@Entity<TipoPreferenza>("TipoPreferenza", {
  allowApiCrud: true,
  dbName: "TipoPreferenza",
})
export class TipoPreferenza {
  @Fields.integer()
  id!: number

  @Fields.string()
  nome!: string

  // Relations toMany
  @Relations.toMany(() => PreferenzaUtente)
  PreferenzaUtente?: PreferenzaUtente[]
}
