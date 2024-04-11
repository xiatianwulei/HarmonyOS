import { router } from '@kit.ArkUI';

@Entry
@Component
export struct CommonNavBar {
  @State title: string = '标题标标标题标题';

  build() {
    Row() {
      Stack() {
        Row() {
          Button({type:ButtonType.Normal}) {
            Image($r('app.media.common_back'))
          }
          .backgroundColor(`#F5F7F9`)
          .height(30)
          .width(30)
          .margin({ left: 15 })
          .onClick(() => {
            router.back()
          })
        }
        .width(45)
        .height(`100%`)
        .backgroundColor(`#F5F7F9`)
        .zIndex(2)
        .justifyContent(FlexAlign.Start)
        Row() {
          Text(this.title)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .height(22.5)
            .align(Alignment.Center)
            .textOverflow({ overflow: TextOverflow.Ellipsis })//  超出截断
            .maxLines(1)
        }
        .width(`100%`)
        .height(`100%`)
        .backgroundColor(`#F5F7F9`)
        .justifyContent(FlexAlign.Center)
        .zIndex(1)
        .layoutWeight(1)

      }
      .alignContent(Alignment.Start)
    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor(`#F5F7F9`)
    .height('66vp')
    .width(`100%`)
  }
}