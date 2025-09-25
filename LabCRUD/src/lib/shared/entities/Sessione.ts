import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Utente } from "./Utente.js"

@Entity<Sessione>("Sessione", {
  allowApiCrud: true,
  dbName: "Sessione",
})
export class Sessione {
  @Fields.cuid()
  id!: string

  @Fields.string()
  secretHash!: string

  @Fields.createdAt({ allowNull: true })
  createdAt? = new Date()

  @Fields.date({ allowNull: true })
  expiresAt?: Date

  @Fields.integer()
  idUtente!: number

  @Relations.toOne(() => Utente, { field: "idUtente" })
  utenteIdUtente!: Utente
}
