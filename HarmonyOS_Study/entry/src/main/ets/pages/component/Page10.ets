

@Entry
@Component
struct Page10 {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {

      Rating({ rating: (2.5), indicator: false })
        .stars(5)
        .stepSize(0.5)
        .enabled(false)
        .margin({ left: 10 })
        .starStyle({
          backgroundUri: '/common/ic_movie_detail_score_background_start.png',
          foregroundUri: '/common/ic_movie_detail_score_foreground_start.png',
          secondaryUri: '/common/ic_movie_detail_score_secondary_start.png'
        })
    }
    .height('100%')
    .width('100%')
  }
}