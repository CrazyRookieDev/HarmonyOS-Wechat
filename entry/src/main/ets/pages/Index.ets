@Entry
@Component
struct Index {
  @State private currentIndex: number = 0
  private tabController:TabsController = new TabsController()
  private tabTitles:string[] = ['微信','通信录','发现','我的']
  private tabTextColors:string[] = ['#040404','#57be6a']
  private tabTipCounts:number[] = [2,0,1,0]

  build() {
    Column(){
      Tabs({barPosition:BarPosition.End,controller:this.tabController}){
        // 微信
        TabContent(){

        }.tabBar(this.createTabMenu(0))
        // 通讯录
        TabContent(){

        }.tabBar(this.createTabMenu(1))
        // 发现
        TabContent(){

        }.tabBar(this.createTabMenu(2))
        // 我的
        TabContent(){

        }.tabBar(this.createTabMenu(3))
      }
    }
  }
  @Builder
  createTabMenu(index: number) {
    Stack({ alignContent: Alignment.Center }) {
      // 数字右标
      Badge({
        count: this.tabTipCounts[index],
        maxCount: 99,
        position: BadgePosition.RightTop,
        style: {
          color: 0xFFFFFF,
          fontSize: 13,
          badgeSize: 20,
          badgeColor: Color.Red
        }
      }) {
        Column() {
          // icon图标
          Image(this.currentIndex === index ? `/tabImages/main_page_index${index}_pre.png` :
            `/tabImages/main_page_index${index}_nor.png`)
            .width(29.714)
            .height(26)
            .objectFit(ImageFit.Fill)
            .margin({ bottom: 3 })
          // 文本
          Text(this.tabTitles[index])
            .fontColor(this.tabTextColors[this.currentIndex === index?1:0])
            .fontSize(14)
        }
        .backgroundColor(Color.Transparent)
        .justifyContent(FlexAlign.Center)
      }
      .width(42)
      .height(40)
    }
    .width("100%")
    .height("100%")
  }

}