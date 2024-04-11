import { Page3 } from './Page3';
import { Page5 } from './Page5';

@Entry
@Component
struct Page4 {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder
  TabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        Column() {
          Page3()
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#00CB87')
      }
      .tabBar(this.TabBuilder('电影', 0, $r("app.media.ic_film_selected"), $r("app.media.ic_film_normal")))
      TabContent() {
        Column(){
          Page5()
        }.width('100%').height('100%').backgroundColor('#007DFF')
      }
      .tabBar(this.TabBuilder('我的', 1, $r("app.media.ic_me_selected"), $r("app.media.ic_me_normal")))
    }
    .barWidth('100%')
    .barHeight(50)
    .backgroundColor('#f2f3f5')
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}
