
export enum Sex {
  girl,
  boy,
  unKnow
}


export class Person {
  constructor(name: string, age: number, sex: Sex) {
    this.name = name
    this.age = age
    this.sex = sex
  }
  name?: string
  age?: number
  sex?: Sex
}




