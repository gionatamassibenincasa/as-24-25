import { Entity, Field, Fields } from "remult"
import { Relations } from "remult"
import { Modulo } from "./Modulo.js"
import { Istituto } from "./Istituto.js"
import { Curriculum } from "./Curriculum.js"

@Entity<Target>("Target", {
  allowApiCrud: true,
  dbName: "Target",
})
export class Target {
  @Fields.integer()
  id!: number

  @Fields.integer()
  idCurriculum!: number

  @Relations.toOne(() => Curriculum, { field: "idCurriculum" })
  curriculumIdCurriculum!: Curriculum

  @Fields.integer()
  idIstituto!: number

  @Relations.toOne(() => Istituto, { field: "idIstituto" })
  istitutoIdIstituto!: Istituto

  @Fields.string({ allowNull: true })
  abbreviazione?: string

  @Fields.string({ allowNull: true })
  target?: string

  // Relations toMany
  @Relations.toMany(() => Modulo)
  Modulo?: Modulo[]
}
