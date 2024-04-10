import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State pageAry: string[] = ["page1列表", "page2基本组件"]
  private  parUrlAry: string[] = [`pages/component/Page1`, `pages/component/Page2`]

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        List() {
          ForEach(
            this.pageAry,
            (element: string, index) => {
              ListItem() {
                Row() {
                  Text(element)
                    .fontSize(40)
                    .fontWeight(FontWeight.Bold)
                }
                .backgroundColor(Color.Pink)
                .onClick(() => {
                  const url = this.parUrlAry[index]
                  router.pushUrl({
                    url: url,
                    params: { index: index }
                  }
                    , router.RouterMode.Standard
                    , err => {
                      if (err) {
                        // 100001 内部渲染错误  100002 路由地址错误
                        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                      }
                    }
                  )
                })

              }
            }
          )
        }
        .width("100%")
        .height("100%")
        .layoutWeight(1)
      }
      .width('100%')
    }
    .height('100%')
  }
}