import { CommonNavBar } from './CommonNavBar';
import { GridDataElement } from './model/CommonData';
import { CommonViewModel } from './ViewModel/CommonViewModel';

@Entry
@Component
export struct Page3 {
  @State message: string = 'Grid列表';
  private showData: Array<GridDataElement> = [];

  aboutToAppear() {
    this.showData = new CommonViewModel().getGridData()
  }

  build() {

    Column() {

      CommonNavBar({ title: this.message })

      Text(`纵向滚动`)
        .fontColor(Color.Red)
        .fontSize(20)
      Grid() {
        ForEach(
          this.showData,
          (item: GridDataElement) => {
            GridItem() {
              gridItemView({ image: item.image, title: item.title })
                .width(100)
                .height(120)
                .backgroundColor(Color.Green)
            }
          },
          (item: GridDataElement) => JSON.stringify(item)
        )
      }
      .rowsGap(12)
      .columnsGap(12)
      .width(`100%`)
      // .height("100%")
      .layoutWeight(1)
      .backgroundColor(Color.Yellow)
      .columnsTemplate('1fr 1fr 1fr')
    }
  }
}

@Component
struct gridItemView {
  @Prop title: ResourceStr
  @Prop image: ResourceStr

  build() {
    Column() {
      Image(this.image)
        .width(`100vp`)
        .height(`100vp`)
      Text(this.title)
        .height(20)
        .width(`100%`)
        .fontColor(Color.Red)
        .textAlign(TextAlign.Center)
    }
    .justifyContent(FlexAlign.Start)

  }
}
