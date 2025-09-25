import { Entity, Fields } from "remult"
import { Relations } from "remult"
import { Plesso } from "./Plesso.js"
import { Target } from "./Target.js"

@Entity<Istituto>("Istituto", {
  allowApiCrud: true,
  dbName: "Istituto",
})
export class Istituto {
  @Fields.integer()
  id!: number

  @Fields.string({ allowNull: true })
  istituto?: string

  // Relations toMany
  @Relations.toMany(() => Plesso)
  Plesso?: Plesso[]

  @Relations.toMany(() => Target)
  Target?: Target[]
}
