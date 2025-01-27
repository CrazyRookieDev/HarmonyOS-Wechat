import prompt from '@ohos.promptAction'
import router from '@ohos.router'
import ListContactItem from '../../component/contactListItem'
import WechatToolbar from '../../component/WechatToolBar'
import DataItem, { ContactItem } from './DataItem'

@Preview
@Component
export default struct Contact {
  private scroller: Scroller = new Scroller()
  private dataList: DataItem[] = [
    {
      title: '',
      contactList: [
        { name: "新的朋友", head: $r("app.media.ic_new_friend") },
        { name: "群聊", head: $r("app.media.ic_group_chat") },
        { name: "标签", head: $r("app.media.ic_tag") },
        { name: "公众号", head: $r("app.media.ic_official_account") }
      ]
    },
    {
      title: 'A',
      contactList: [
        { name: "肉联厂F4", head: $r("app.media.user_head1") },
        { name: "盛强集团", head: $r("app.media.user_head2") },
        { name: "张三", head: $r("app.media.user_head3") }
      ]
    },
    {
      title: 'B',
      contactList: [
        { name: "李四", head: $r("app.media.user_head4") },
        { name: "王武", head: $r("app.media.user_head1") },
        { name: "特朗普", head: $r("app.media.user_head2") }
      ]
    },
    {
      title: 'C',
      contactList: [
        { name: "普京", head: $r("app.media.user_head3") },
        { name: "安澜", head: $r("app.media.user_head4") },
        { name: "荒天帝", head: $r("app.media.user_head1") }
      ]
    },
    {
      title: 'D',
      contactList: [
        { name: "送葬人", head: $r("app.media.user_head2") },
        { name: "人间客", head: $r("app.media.user_head3") },
        { name: "天佑", head: $r("app.media.user_head4") }
      ]
    },
    {
      title: 'S',
      contactList: [
        { name: "狂赌张三", head: $r("app.media.user_head1") },
        { name: "肉联厂F4", head: $r("app.media.user_head2") }
      ]
    },
    {
      title: 'Z',
      contactList: [
        { name: "老莫", head: $r("app.media.user_head3") },
        { name: "张宇恒", head: $r("app.media.user_head4") },
        { name: "周大福", head: $r("app.media.user_head1") }
      ]
    }
  ];
  private letterList: string[] =
    ['↑', '☆', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
      'V', 'W', 'X', 'Y', 'Z', '#']

  @Builder
  itemHead(title: string) {
    Text(title)
      .fontSize(14)
      .visibility("" === title ? Visibility.None : Visibility.Visible)
      .backgroundColor("#EDEDED")
      .height(36)
      .width("100%")
      .padding({ left: 20 })
  }

  build() {
    Stack({ alignContent: Alignment.End }) {

      Column() {
        // 标题栏
        WechatToolbar({ title: "通讯录" })
        // 通讯录列表
        List({ scroller: this.scroller }) {
          // 遍历循环大组标签
          ForEach(this.dataList, (item: DataItem) => {
            // 大组标签
            ListItemGroup({ header: this.itemHead(item.title) }) {
              // 遍历循环大组内的联系人列表
              ForEach(item.contactList, (contact: ContactItem) => {
                // // 小组联系人列表
                ListItem() {
                  ListContactItem({ head: contact.head, name: contact.name })
                }
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/chat/ChatPage',
                    params: { name: contact.name }
                  })
                })
              })
            }
            .divider({
              strokeWidth: 0.8,
              color: '#f0f0f0',
              startMargin: 85,
              endMargin: 0
            }) // 每行之间的分界线
          })
        }
        .width('100%')
        .height(0)
        .layoutWeight(1)
        .backgroundColor(Color.White)
      }
      .width("100%")
      .height("100%")

      AlphabetIndexer({ arrayValue: this.letterList, selected: 0 })
        .color(Color.Black)
        .font({ size: 14 })
        .selectedFont({ size: 14 })
        .selectedColor(Color.Black)
        .selectedBackgroundColor(Color.Transparent)
        .usingPopup(true)
        .popupColor(Color.Red)
        .popupBackground("#57be6a")
        .popupFont({ size: 32, weight: FontWeight.Bolder })
        .itemSize(20)
        .alignStyle(IndexerAlign.Right)
        .margin({ top: 80 })
        .onSelect((index: number) => {
          let letter = this.letterList[index]
          let target: number = 0
          for (const item of this.dataList) {
            if (letter === item.title) {
              this.scroller.scrollToIndex(target)
              prompt.showToast({ message: "" + target })
              break
            }
            target++
          }
        })

    }.width("100%")
    .height("100%")

  }
}
