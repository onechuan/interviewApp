import { TabBarItems } from "../constants"
import { BasicConstant } from "../constants/basic"
import { TabBarModel } from '../models/TabBarModel';
import HomeComp from "../components/HomeComp";
import InterviewComp from "../components/InterviewComp";
import MineComp from "../components/MineComp";
import ProjectComp from "../components/ProjectComp"

@Entry
@Component
struct MainPage{

  @State
  curTabIndex: number = 0;
  // 底部导航的方向
  @State
  isLandscape: boolean = false

  @StorageProp('bottomHeight')
  bottomHeight: number = 0

  @Builder
  TabBarBuilder(item: TabBarModel, index: number) {
    Column({ space: BasicConstant.SPACE_SM }) {
      Image(this.curTabIndex === index ? item.activeIcon : item.defaultIcon)
        .width($r('app.float.tab_bar_item_icon_size'))
      Text(item.label)
        .fontSize($r('app.float.tab_bar_item_font_size'))
        .fontColor(this.curTabIndex === index ? $r('app.color.black') : $r('app.color.common_gray_01'))
        .animation({ duration: 300 })
    }
  }

  build(){
    Tabs({
      index: this.curTabIndex,
      barPosition: BarPosition.End
    }){
      ForEach(TabBarItems, (item: TabBarModel, index: number)=>{
        TabContent(){
          if(index === 0){
            HomeComp()
          }else if(index === 1){
            ProjectComp()
          }else if(index === 2){
            InterviewComp()
          }else{
            MineComp()
          }
        }
        .tabBar(this.TabBarBuilder(item, index))
      })
    }
    .vertical(this.isLandscape)
    .barPosition(this.isLandscape ? BarPosition.Start : BarPosition.End)
    .onChange((index)=>{
      this.curTabIndex = index
    })
    .barHeight(this.isLandscape ? $r('app.float.tab_bar_item_height_lg') : $r('app.float.tab_bar_item_height_sm'))
    .scrollable(false)
    .margin({ bottom: this.bottomHeight })
    .barMode(BarMode.Fixed)
  }

}