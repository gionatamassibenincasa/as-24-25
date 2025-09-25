import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Fornitura } from "./Fornitura.js"
import { Laboratorio } from "./Laboratorio.js"
import { Modulo } from "./Modulo.js"
import { PreferenzaUtente } from "./PreferenzaUtente.js"
import { RuoloUtente } from "./RuoloUtente.js"
import { Sessione } from "./Sessione.js"

@Entity<Utente>("Utente", {
  allowApiCrud: true,
  dbName: "Utente",
})
export class Utente {
  @Fields.integer()
  id!: number

  @Fields.string()
  username!: string

  @Fields.string({ includeInApi: false, inputType: "password" })
  password_hash!: string

  @Fields.createdAt({ allowNull: true })
  createdAt? = new Date()

  // Relations toMany
  @Relations.toMany(() => Fornitura)
  Fornitura?: Fornitura[]

  @Relations.toMany(() => Laboratorio)
  Laboratorio?: Laboratorio[]

  @Relations.toMany(() => Modulo)
  Modulo?: Modulo[]

  @Relations.toMany(() => PreferenzaUtente)
  PreferenzaUtente?: PreferenzaUtente[]

  @Relations.toMany(() => RuoloUtente)
  RuoloUtente?: RuoloUtente[]

  @Relations.toMany(() => Sessione)
  Sessione?: Sessione[]
}
