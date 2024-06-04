// xxx.ets
@Entry
@Component
struct Page12 {
  @State tabArray: Array<number> = [0, 1];
  @State focusIndex: number = 0;
  @State pre: number = 0;
  @State index: number = 0;
  private controller: TabsController = new TabsController();
  @State test: boolean = false;

  // 单独的页签
  @Builder
  Tab(tabName: string, tabItem: number, tabIndex: number) {
    Row({ space: 20 }) {
      Text(tabName).fontSize(18)
      Image($r('app.media.icon')).width(20).height(20)
    }
    .justifyContent(FlexAlign.Center)
    .constraintSize({ minWidth: 35 })
    .width(120)
    .height(30)
    .borderRadius({ topLeft: 10, topRight: 10 })
    .onClick(() => {
      this.controller.changeIndex(tabIndex);
      this.focusIndex = tabIndex;
    })
    .backgroundColor(tabIndex === this.focusIndex ? '#FFFFFFFF' : '#FFB7B7B7')
  }

  build() {
    Column() {
      Column() {
        // 页签
        Row({ space: 7 }) {
          Scroll() {
            Row() {
              ForEach(this.tabArray, (item: number, index: number) => {
                this.Tab('页签 ' + item, item, index)
              })
            }
            .justifyContent(FlexAlign.Start)
          }
          .align(Alignment.Start)
          .scrollable(ScrollDirection.Horizontal)
          .scrollBar(BarState.Off)
          .width('90%')
          .backgroundColor('#FFB7B7B7')

          Image(``).width(20).height(20).backgroundColor(Color.Red)
        }
        .width('100%')
        .backgroundColor('#FFB7B7B7')

        //tabs
        Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
          ForEach(this.tabArray, (item: number, index: number) => {
            TabContent() {
              Text('我是页面 ' + item + ' 的内容')
                .height(300)
                .width('100%')
                .fontSize(30)
            }
            .backgroundColor('#1890FF52')
          })
        }

        .barHeight(0)
        .animationDuration(100)
        .onChange((index: number) => {
          this.focusIndex = index;
        })
      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')
    }
    .height('100%')
  }
}