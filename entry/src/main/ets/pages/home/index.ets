import router from '@ohos.router'
import ListChatItem, { ChatItemData } from '../../component/chatListItem'
import WechatToolbar from '../../component/WechatToolBar'

@Preview
@Component
export default struct Home {
  @State chatList: ChatItemData[] = [
    {
      headSrc: $r("app.media.user_head1"),
      nickname: "老婆",
      content: "今晚给你做了好吃的，早点下班哦😊",
      time: "17:21"
    },
    {
      headSrc: $r("app.media.user_head2"),
      nickname: "率土天佑",
      content: "我今天又拿了五杀，牛逼不？",
      time: "15:38"
    },
    {
      headSrc: $r("app.media.user_head3"),
      nickname: "同事李明",
      content: "领导，报给写好了，请过目",
      time: "14:12"
    },
    {
      headSrc: $r("app.media.user_head4"),
      nickname: "HR孙小花",
      content: "这个岗位还需要招两个人",
      time: "12:08"
    },
    {
      headSrc: $r("app.media.user_head1"),
      nickname: "张三",
      content: "好的",
      time: "昨天"
    },
    {
      headSrc: $r("app.media.user_head2"),
      nickname: "李四",
      content: "好的，哥",
      time: "周一"
    },
    {
      headSrc: $r("app.media.user_head3"),
      nickname: "张三丰",
      content: "这是我的武功秘籍，30希望您能考虑下",
      time: "昨天"
    },
    {
      headSrc: $r("app.media.user_head4"),
      nickname: "老妹",
      content: "好的，哥",
      time: "周一"
    },
    {
      headSrc: $r("app.media.user_head1"),
      nickname: "客户潘总",
      content: "这是我们公司的报价，希望您能考虑下",
      time: "昨天"
    },
    {
      headSrc: $r("app.media.user_head2"),
      nickname: "狂徒张三",
      content: "是兄弟就来砍我",
      time: "周一"
    },
    {
      headSrc: $r("app.media.user_head3"),
      nickname: "马仔",
      content: "吃屎呀,你",
      time: "昨天"
    },
    {
      headSrc: $r("app.media.user_head4"),
      nickname: "乌鸦哥",
      content: "难办?,那就不要办了",
      time: "周一"
    }
  ]

  build() {
    Column() {
      WechatToolbar({ title: "微信(2)" })

      List() {
        ForEach(this.chatList, (item: ChatItemData, index: number) => {
          ListItem() {
            ListChatItem({ data: item })
          }
          .onClick(() => {
            router.pushUrl({ url: 'pages/chat/ChatPage',
              params: {name:item.nickname}
            })
          })
        })
        ListItem() {
          Divider().color('#0000').strokeWidth(0)
        }
      }
      .divider({ strokeWidth: 0.8, color: '#f0f0f0', startMargin: 90, endMargin: 0 }) // 每行之间的分界线
      .backgroundColor(Color.White)
      .width("100%")
      .height("100%")
    }
    .width("100%")
    .height("100%")
    .backgroundColor("#f0f0f0")
  }
}
