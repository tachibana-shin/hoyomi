export enum Sex {
  Male = "male",
  Female = "female",
  Other = "other"
}

export interface User {
  user: string
  email?: string
  photoUrl: string
  fullName: string
  sex?: Sex // default: Sex.Other
}
