

// utils.ets
// Index.ets
import curves from '@ohos.curves';

// 通过状态变量的判断，在同一个组件内构建普通状态和展开状态的界面
@Component
export struct share_zIndex_expand {
  // 声明与父组件进行交互的是否展开状态变量
  @State isExpand: boolean = false;
  @State curIndex: number = 0;
  @State listArray: Array<number> = [1, 2, 3, 4, 5, 6];
  private parentScroller: Scroller = new Scroller(); // 上层滑动组件控制器

  build() {
    Column() {
      List() {
        ForEach(this.listArray, (item:number, index?:number|undefined) => {
          // 根据需要定制展开后的组件
          if (!this.isExpand || this.curIndex == index) {
            ListItem() {
              Column() {
                Row() {
                  Row()
                    .backgroundColor(Color.Pink)
                    .borderRadius(20)
                    .width(80)
                    .height(80)

                  Column() {
                    Text('点击展开 Item ' + item)
                      .fontSize(20)
                    Text('共享元素转场')
                      .fontSize(12)
                      .fontColor(0x909399)
                  }
                  .alignItems(HorizontalAlign.Start)
                  .justifyContent(FlexAlign.SpaceAround)
                  .margin({ left: 10 })
                  .height(80)
                }
                .width('90%')
                .height(100)

                if (this.isExpand && this.curIndex == index) {
                  Row() {
                    Text('展开态')
                      .fontSize(28)
                      .fontColor(0x909399)
                      .textAlign(TextAlign.Center)
                      .transition(TransitionEffect.OPACITY.animation({ curve: curves.springMotion(0.6, 0.9) }))
                  }
                  .width('90%')
                  .justifyContent(FlexAlign.Center)
                }
              }
              .width('90%')
              .height(this.isExpand && this.curIndex == index ? 750 : 100)
              .alignItems(HorizontalAlign.Center)
              .borderRadius(10)
              .margin({ top: 15 })
              .backgroundColor(Color.White)
              .shadow({ radius: 20, color: 0x909399, offsetX: 20, offsetY: 10 })
            }
            .onClick(() => {
              // 定义展开收起的动画参数
              animateTo({ curve: curves.springMotion(0.6, 0.9) }, () => {
                if(index != undefined){
                  this.curIndex = index;
                }
                this.isExpand = !this.isExpand;
              })
            })
            .zIndex(this.curIndex == index ? 1 : 0) // 当前ListItem被选中时，zIndex置1，会显示在其他zIndex为0的兄弟组件之上
            .translate({ // 根据卡片当前的位置，通过translate在展开的时候移到父容器的顶端
              y: this.isExpand && this.curIndex == index ? -60 - this.parentScroller.currentOffset()['yOffset'] : 0
            })
          }
        })
      }
      .clip(false)
      .height('100%') // 占位容器固定大小
      .alignListItem(ListItemAlign.Center)
      .listDirection(Axis.Horizontal)
    }
    .zIndex(1)
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}


@Entry
@Component
struct Page15 {
  @State isExpand: boolean = false;
  @State curIndex: number = 0;
  private scroller: Scroller = new Scroller();
  @State Sze:Record<string,boolean|number|Scroller> = { 'isExpand': this.isExpand, 'curIndex': this.curIndex, 'parentScroller': this.scroller }

  build() {
    Scroll(this.scroller) {
      Column() {
        Text('ZIndex改变Z轴')
          .fontWeight(FontWeight.Bold)
          .fontSize(30)
          .fontColor(Color.Black)
          .zIndex(0)
          .margin(10)

        share_zIndex_expand(this.Sze)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
    }
  }
}
