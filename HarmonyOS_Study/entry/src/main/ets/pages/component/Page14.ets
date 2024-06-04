
import font from '@ohos.font';

@Entry
@Component
struct Page14 {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    font.registerFont({
      familyName: 'DJBGetDigital',
      familySrc: '/font/DJBGetDigital.ttf' // font文件与pages目录同级
    })
  }
  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(30)
        .fontFamily('DJBGetDigital')
        .fontColor('#262626')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}