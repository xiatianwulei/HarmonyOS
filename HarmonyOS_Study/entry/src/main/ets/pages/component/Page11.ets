enum ScrollPosition {
  start,
  center,
  end
}

@Entry
@Component
struct NestedScroll {
  @State listPosition: number = ScrollPosition.start; // 0代表滚动到List顶部，1代表中间值，2代表滚动到List底部。
  @State scrollPosition: number = ScrollPosition.start; // 0代表滚动到页面顶部，1代表中间值，2代表滚动到页面底部。
  @State showTitle: boolean = false;
  @State currentYOffset: number = 0;
  private arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  private scrollerForScroll: Scroller = new Scroller();
  private scrollerForList: Scroller = new Scroller();

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Scroll(this.scrollerForScroll) {
        Column() {
          Image(``)
            .width("100%")
            .height("40%")
            .backgroundColor(Color.Red)

          Tabs({ barPosition: BarPosition.Start }) {
            TabContent() {
              List({ space: 10, scroller: this.scrollerForList }) {
                ForEach(this.arr, (item:number) => {
                  ListItem() {
                    Text("ListItem" + item)
                      .width("100%")
                      .height("100%")
                      .borderRadius(15)
                      .fontSize(24)
                      .textAlign(TextAlign.Center)
                      .backgroundColor(Color.White)
                  }.width("100%").height(100)
                })
              }
              .padding({ left: 10, right: 10 })
              .width("100%")
              .edgeEffect(EdgeEffect.None)
              .scrollBar(BarState.Off)
              .onReachStart(() => {
                this.listPosition = ScrollPosition.start
              })
              .onReachEnd(() => {
                this.listPosition = ScrollPosition.end
              })
              .onScrollFrameBegin((offset: number, state: ScrollState) => {
                // 滑动到列表中间时
                if (!((this.listPosition == ScrollPosition.start && offset < 0)
                  || (this.listPosition == ScrollPosition.end && offset > 0))) {
                  this.listPosition = ScrollPosition.center
                }

                // 如果页面已滚动到底部，列表不在顶部或列表有正向偏移量
                if (this.scrollPosition == ScrollPosition.end
                  && (this.listPosition != ScrollPosition.start || offset > 0)) {
                  return { offsetRemain: offset };
                } else {
                  this.scrollerForScroll.scrollBy(0, offset)
                  return { offsetRemain: 0 };
                }
              })
            }.tabBar('促销活动')

            TabContent() {
              Column().width('100%').height('100%').backgroundColor('#007DFF')
            }.tabBar('行程服务')

          }
          .vertical(false)
          .barMode(BarMode.Fixed)
          .barWidth(360)
          .barHeight(56)
          .width("100%")
          .height("92%")
          .backgroundColor('#F1F3F5')
        }
      }
      .scrollBar(BarState.Off)
      .width("100%")
      .height("100%")
      .onScroll((xOffset: number, yOffset: number) => {
        this.currentYOffset = this.scrollerForScroll.currentOffset().yOffset;

        // 非（页面在顶部或页面在底部），则页面在中间
        if (!((this.scrollPosition == ScrollPosition.start && yOffset < 0)
          || (this.scrollPosition == ScrollPosition.end && yOffset > 0))) {
          this.scrollPosition = ScrollPosition.center
        }
      })
      .onScrollEdge((side: Edge) => {
        if (side == Edge.Top) {
          // 页面在顶部
          this.scrollPosition = ScrollPosition.start
        } else if (side == Edge.Bottom) {
          // 页面在底部
          this.scrollPosition = ScrollPosition.end
        }
      })
      .onScrollFrameBegin(offset => {
        if (this.scrollPosition == ScrollPosition.end) {
          return { offsetRemain: 0 };
        } else {
          return { offsetRemain: offset };
        }
      })

      if (this.currentYOffset >= 0) {
        Row() {
          Text('发现').fontSize(24)
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Color.White)
        .width('100%')
        .height('8%')
        .opacity(this.currentYOffset / 50 > 1 ? 1 : this.currentYOffset / 50)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xDCDCDC)
  }
}