import { Person, Sex } from './model/CommonData';
import { CommonNavBar } from './CommonNavBar';

@Entry
@Component
struct Page1 {
  @State message: string = 'page1_列表';
  personAry: Person[] = [new Person('小红', 12, Sex.girl), new Person('小强', 12, Sex.boy), new Person('未知', 12, Sex.unKnow)]

  build() {
    Column() {
      CommonNavBar({title:this.message})

      List({ space: 10 }) {
        ForEach(
          this.personAry,
          (item: Person) => {
            ListItem() {
              itemCellRow({ element: item })
            }
          },
          (item:Person) => JSON.stringify(item) //生成数组键值
        )
      }
      .alignListItem(ListItemAlign.Center)
      .backgroundColor(Color.Green)
      .width("100%")
      .height("100%")
      .layoutWeight(1)
    }
  }
}

@Component
struct itemCellRow {
  @State isClick: Boolean = false
  element?: Person

  build() {
    Row() {
      Text(this.element?.name ?? "")
        .textExtend(30)
      Text(`年龄${this.element?.age ?? 0}`)
        .textExtend(30)
      Blank()
      Text(this.configurationSex())
        .textExtend(30)
    }
    .opacity(this.isClick ? 1 : 0.5)
    .onClick(() => {
      this.isClick = !this.isClick
    })
    .align(Alignment.Center)
    .justifyContent(FlexAlign.SpaceAround)
    .itemCellStyles()
  }

  configurationSex(): string {

    if (this.element?.sex == Sex.unKnow) {
      return "未知"
    }
    let sexName: string = "未知"
    sexName = this.element?.sex == Sex.girl ? "女孩" : "男孩"
    return sexName
  }
}

// 和@Styles不同，@Extend仅支持定义在全局，不支持在组件内部定义。
// 和@Styles不同，@Extend装饰的方法支持参数，开发者可以在调用时传递参数，调用遵循TS方法传值调用。
@Extend(Text)
function textExtend(fontSize: number) {
  .fontSize(fontSize)
  .fontWeight(FontWeight.Bold)
  .margin({ left: 15, right: 15 })
}

/*
@Styles方法不支持参数
@Styles可以定义在组件内或全局，在全局定义时需在方法名前面添加function关键字，组件内定义时则不需要添加function关键字。
@Styles 在组件内调用得放在使用的地方前面
 */
@Styles
function itemCellStyles() {
  .backgroundColor(Color.Pink)
  .width("90%")
  .height(90)
  .borderRadius(45)
}