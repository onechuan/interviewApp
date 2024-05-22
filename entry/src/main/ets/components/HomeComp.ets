

@Component
export default  struct HomeComp{
  build(){
    Column(){
      Text('Home')
        .fontColor(Color.Black)
        .fontSize(20)
    }
    .backgroundColor(Color.Yellow)
    .width('100%')
    .height('100%')
  }
}