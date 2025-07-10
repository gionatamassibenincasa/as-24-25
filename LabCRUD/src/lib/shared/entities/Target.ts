import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Modulo } from "./Modulo.js"
import { Articolazione } from "./Articolazione.js"

@Entity<Target>("Target", {
  allowApiCrud: true,
  dbName: "Target",
})
export class Target {
  @Fields.autoIncrement()
  idTarget = 0

  @Fields.integer()
  idArticolazione!: number

  @Relations.toOne(() => Articolazione, { field: "idArticolazione" })
  articolazioneIdArticolazione!: Articolazione

  @Fields.string({ allowNull: true })
  abbreviazione?: string

  @Fields.string({ allowNull: true })
  target?: string

  // Relations toMany
  @Relations.toMany(() => Modulo)
  Modulo?: Modulo[]
}
