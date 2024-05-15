// 以下是嵌套类对象的数据结构。
@Observed
class ClassA {
  public title: string;

  constructor(title: string) {
    this.title = title;
  }
}

@Observed
class ClassB {
  public name: string;
  public a: ClassA;

  constructor(name: string, a: ClassA) {
    this.name = name;
    this.a = a;
  }
}
// @Prop嵌套场景
@Entry
@Component
struct Parent {
  @State votes: ClassB = new ClassB('Hello', new ClassA('world'))

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Button('change ClassB name')
          .width(312)
          .height(40)
          .margin(12)
          .fontColor('#FFFFFF，90%')
          .onClick(() => {
            this.votes.name = "aaaaa"
          })
        Button('change ClassA title')
          .width(312)
          .height(40)
          .margin(12)
          .fontColor('#FFFFFF，90%')
          .onClick(() => {
            this.votes.a.title = "wwwww"
          })
        Text(this.votes.name)
          .fontSize(16)
          .margin(12)
          .width(312)
          .height(40)
          .backgroundColor('#ededed')
          .borderRadius(20)
          .textAlign(TextAlign.Center)
          .fontColor('#e6000000')
          .onClick(() => {
            this.votes.name = 'Bye'
          })
        Text(this.votes.a.title)
          .fontSize(16)
          .margin(12)
          .width(312)
          .height(40)
          .backgroundColor('#ededed')
          .borderRadius(20)
          .textAlign(TextAlign.Center)
          .onClick(() => {
            this.votes.a.title = "openHarmony"
          })
        Child1({ vote1: this.votes.a })
      }

    }

  }
}

@Component
struct Child1 {
  @Prop vote1: ClassA = new ClassA('');

  build() {
    Column() {
      Text(this.vote1.title)
        .fontSize(16)
        .margin(12)
        .width(312)
        .height(40)
        .backgroundColor('#ededed')
        .borderRadius(20)
        .textAlign(TextAlign.Center)
        .onClick(() => {
          this.vote1.title = 'Bye Bye'
        })
    }
  }
}

