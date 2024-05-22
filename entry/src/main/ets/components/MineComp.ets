import { BackTitleBar } from "./BackTitleBar";
import { UserBaseInfo } from "./UserBaseInfo"
// import { SettingItemView } from "./SettingItemView"

@Component
export default  struct MineComp{

  private titleParam: string = 'Mine';

  @State
  nickName: string = 'Ekawa';
  @State
  signature: string = '这是一条签名';

  build(){
    Column(){

      BackTitleBar({ title: this.titleParam })

      UserBaseInfo({
        nickName: this.nickName,
        signature: this.signature
      }).margin({ bottom: "50vp" })

      // SettingItemView({
      //   itemTitle: "账号管理",
      //   onItemClick: () => {
      //
      //   }
      // })
      // SettingItemView({
      //   itemTitle: "通用设置",
      //   onItemClick: () => {
      //
      //   }
      // })
      // SettingItemView({
      //   itemTitle: "青少年模式",
      //   itemRightDes: "未开启",
      //   onItemClick: () => {
      //
      //   }
      // })
      // SettingItemView({
      //   itemTitle: "关于",
      //   onItemClick: () => {
      //
      //   }
      // })
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#F1F3F5")

  }
}