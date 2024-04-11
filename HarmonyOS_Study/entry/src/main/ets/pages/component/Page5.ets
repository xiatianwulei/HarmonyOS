import { CommonNavBar } from './CommonNavBar';
import { GridDataElement } from './model/CommonData';
import CommonViewModel from './ViewModel/CommonViewModel';

@Entry
@Component
export struct Page5 {
  @State message: string = 'List列表';
  private showData: Array<GridDataElement> = [];

  aboutToAppear() {
    this.showData = CommonViewModel.getGridData()
  }

  build() {
    Column() {
      CommonNavBar({ title: this.message })

      List({ space: 0 }) {

        ListItemGroup({ header: this.itemHead('分组标题1'),space:10 }) {
          // 循环渲染分组A的ListItem
          ForEach(
            this.showData,
            (item: GridDataElement) => {
              ListItem() {
                ListItemView({ title: item.title, image: item.image })
                  .height(80)
              }
            },
            (item: GridDataElement) => JSON.stringify(item))
        }

      }
      .sticky(StickyStyle.Header)  // 设置吸顶，实现粘性标题效果
      .alignListItem(ListItemAlign.Center)
      .height(`100%`)
      .width(`100%`)
      .layoutWeight(1)

    }
  }

  @Builder itemHead(text: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Row(){
      Text(text)
        .fontSize(20)
        .backgroundColor(Color.Green)
        .width('100%')
        .height(`100%`)
        .padding(5)
        .textAlign(TextAlign.Center)
    }
    .backgroundColor(Color.Pink)
    .height("60vp")
    .width(`100%`)
    .justifyContent(FlexAlign.Center)
    .align(Alignment.Center)
  }
}



@Component
struct ListItemView {
  @Prop title: ResourceStr
  @Prop image: ResourceStr

  build() {
    Row() {
      Image(this.image)
        .width(`50vp`)
        .height(`50vp`)
        .margin({left:15})
      Blank(15)
      Text(this.title)
        .height(20)
        .width(`100%`)
        .fontColor(Color.Red)
        .textAlign(TextAlign.Start)
    }

    .borderRadius(10)
    .height(`100%`)
    .width(`90%`)
    .justifyContent(FlexAlign.Start)
    .alignItems(VerticalAlign.Center)
    .backgroundColor(Color.Yellow)

  }
}
