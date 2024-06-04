@Entry
@Component
struct Page13 {
  @State currentIndex: number = 0
  controller = new TabsController()

  @Builder
  tab(index: number, name: string) {
    Row() {
      Text(name)
        .fontColor(this.currentIndex === index ? Color.Green : Color.Black)
        .onClick(() => {
          this.controller.changeIndex(index)
        })
    }.width(50).height('100%').backgroundColor('#c0c0c0')
  }

  @State num: number[] = []

  aboutToAppear() {
    for (let i = 0; i < 100; i++) {
      this.num[i] = i
    }
  }

  build() {
    Column() {
      Row() {

        this.tab(0, "首页")
        this.tab(1, "发现")
        this.tab(2, "我的")

      }.height('10%').width('100%').backgroundColor('#6a6da9')

      Tabs({ controller: this.controller, barPosition: BarPosition.Start }) {
        TabContent() {

          List() {
            ListItem() {
              Text(this.num.toString()).width(50).backgroundColor('#c0c0c0')
            }

          }

        }.width('100%').height('100%').backgroundColor('#c0c0c0')

        TabContent() {
          Column() {
            Text('222')
          }.width('100%').height('100%').justifyContent(FlexAlign.Start).alignItems(HorizontalAlign.Center)

        }.width('100%').height('100%').backgroundColor('#c0c0c0')

        TabContent() {
          Text('333')
        }.width('100%').height('100%').backgroundColor('#c0c0c0')
      }
      .vertical(false) // tabBar 放在顶部
      .barWidth(0) // 把tabBar的宽高设置为0,隐藏 tabBar
      .barHeight(0)
      .width('100%')
      .height('90%')
      .backgroundColor('#f58220')
      .scrollable(false)
      .barMode(BarMode.Fixed)
      .onChange(index => this.currentIndex = index)

    }.width('100%').height('100%')

  }
}
