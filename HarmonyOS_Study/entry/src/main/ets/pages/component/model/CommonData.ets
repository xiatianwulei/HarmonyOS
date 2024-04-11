
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

// Grid List 数据
export class GridDataElement {
  constructor(title?: ResourceStr, image?: Resource, other?: Resource) {
    this.title = title
    this.image = image
    this.other = other
  }
  title?:ResourceStr
  image?:Resource
  other?:Resource
}



