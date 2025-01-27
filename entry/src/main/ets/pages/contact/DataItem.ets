export interface ContactItem {
  name: string;
  head: string| Resource;
}

export default  interface DataItem {
  title: string;
  contactList: ContactItem[];
}

class YourClass {
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
        { name: "ArdWard", head: $r("app.media.user_head1") },
        { name: "阿联酋", head: $r("app.media.user_head2") },
        { name: "艾森宝", head: $r("app.media.user_head3") }
      ]
    },
    {
      title: 'B',
      contactList: [
        { name: "宝贝", head: $r("app.media.user_head4") },
        { name: "博士伦", head: $r("app.media.user_head1") },
        { name: "白雪公主", head: $r("app.media.user_head2") }
      ]
    },
    {
      title: 'C',
      contactList: [
        { name: "陈先进", head: $r("app.media.user_head3") },
        { name: "蔡伦", head: $r("app.media.user_head4") },
        { name: "褚卫娟", head: $r("app.media.user_head1") }
      ]
    },
    {
      title: 'D',
      contactList: [
        { name: "达芬奇", head: $r("app.media.user_head2") },
        { name: "丁春秋", head: $r("app.media.user_head3") },
        { name: "邓浩", head: $r("app.media.user_head4") }
      ]
    },
    {
      title: 'S',
      contactList: [
        { name: "石破天", head: $r("app.media.user_head1") },
        { name: "宋浩杰", head: $r("app.media.user_head2") }
      ]
    },
    {
      title: 'Z',
      contactList: [
        { name: "猪八戒", head: $r("app.media.user_head3") },
        { name: "张宇恒", head: $r("app.media.user_head4") },
        { name: "周大年", head: $r("app.media.user_head1") }
      ]
    }
  ];
}