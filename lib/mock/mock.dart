import 'package:flutter_xhs/models/card_data.dart';
import 'package:flutter_xhs/models/card_detail_data.dart';
import 'package:flutter_xhs/models/comment.dart';
import 'package:flutter_xhs/models/video.dart';

class Mock {
  static List<CardData> indexData = [
    CardData(
      1,
      1000,
      "https://img2.baidu.com/it/u=3158311150,3164770023&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "好爱看美女分享日常照，就像已经可以跟她们贴贴一起出去秋游的感觉",
      "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
      "圆脸卡卡",
      119,
      10,
      2,
    ),
    CardData(
      2,
      1001,
      "https://img1.baidu.com/it/u=895781527,3064009596&fm=253&fmt=auto&app=138&f=JPEG?w=528&h=500",
      "韩国短发女生春季日常休闲穿搭示范-韩国流行- 女人街",
      "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
      "橙子",
      39,
      12,
      0,
    ),
    CardData(
      3,
      1003,
      "https://img2.baidu.com/it/u=485874141,3467188467&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "清纯大学生日常居家写真,清纯-美女图片",
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202003%2F10%2F20200310204111_sfgix.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1694143887&t=56d596ea77bb95611580c4307e2236b1",
      "Manito",
      983,
      13,
      1,
    ),
    CardData(
      4,
      1004,
      "https://img2.baidu.com/it/u=553843652,3032718552&fm=253&fmt=auto&app=138&f=JPEG?w=501&h=500",
      "背影",
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202003%2F10%2F20200310204111_sfgix.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1694143887&t=56d596ea77bb95611580c4307e2236b1",
      "日月",
      81381,
      93,
      17,
    ),
    CardData(
      5,
      1005,
      "https://img0.baidu.com/it/u=2549236506,772844021&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666",
      "治愈系女生陈梓平日常穿搭照",
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202003%2F15%2F20200315114200_qxmdp.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1694144111&t=e2f7201424005a3cb320d2002e784cd2",
      "陈",
      1837,
      31,
      5,
    ),
    CardData(
      6,
      1006,
      "https://pic1.zhimg.com/v2-cfe0f84b071bb79d3ad566a766851511_r.jpg?source=1940ef5c",
      "捕捉一枚野生美女",
      "https://img2.baidu.com/it/u=372601434,3534902205&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "Alice",
      1237,
      63,
      6,
    ),
  ];

  static List<CardDetailData> cardDetailDataList = [
    CardDetailData(
      1,
      1000,
      "好爱看美女分享日常照",
      "好爱看美女分享日常照，就像已经可以跟她们贴贴一起出去秋游的感觉",
      "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
      "圆脸卡卡",
      119,
      10,
      2,
      "2023-08-09 10:54:27",
      "广州",
      [
        "https://img2.baidu.com/it/u=3158311150,3164770023&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
        "https://img0.baidu.com/it/u=3640286701,3728960275&fm=253&fmt=auto&app=138&f=JPEG?w=523&h=500",
      ],
    ),
    CardDetailData(
      2,
      1001,
      "春季日常",
      "韩国短发女生春季日常休闲穿搭示范-韩国流行",
      "https://img1.baidu.com/it/u=895781527,3064009596&fm=253&fmt=auto&app=138&f=JPEG?w=528&h=500",
      "橙子",
      39,
      12,
      0,
      "2023-08-07 06:24:27",
      "深圳",
      [
        "https://img1.baidu.com/it/u=895781527,3064009596&fm=253&fmt=auto&app=138&f=JPEG?w=528&h=500",
        "https://img0.baidu.com/it/u=3067655938,1190349262&fm=253&fmt=auto&app=138&f=JPEG?w=502&h=500",
        "https://img1.baidu.com/it/u=2947850225,1655192861&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      ],
    ),
    CardDetailData(
      3,
      1003,
      "日常居家写真",
      "清纯大学生日常居家写真,清纯-美女图片",
      "https://img2.baidu.com/it/u=485874141,3467188467&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "Manito",
      983,
      13,
      1,
      "2023-06-07 09:24:27",
      "深圳",
      [
        "https://img2.baidu.com/it/u=485874141,3467188467&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      ],
    ),
    CardDetailData(
      4,
      1004,
      "日常更新",
      "背影",
      "https://img2.baidu.com/it/u=553843652,3032718552&fm=253&fmt=auto&app=138&f=JPEG?w=501&h=500",
      "日月",
      81381,
      93,
      17,
      "2023-06-09 16:54:27",
      "深圳",
      [
        "https://img2.baidu.com/it/u=553843652,3032718552&fm=253&fmt=auto&app=138&f=JPEG?w=501&h=500",
      ],
    ),
    CardDetailData(
      5,
      1005,
      "治愈系",
      "治愈系女生平日常穿搭照",
      "https://img0.baidu.com/it/u=2549236506,772844021&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666",
      "陈",
      1837,
      31,
      5,
      "2023-06-09 16:54:27",
      "深圳",
      [
        "https://img0.baidu.com/it/u=2549236506,772844021&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=666",
        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fc4ce25b7-4b03-4ce7-ab33-3f80db62e94e%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1694266388&t=836fcd1a4884bee19bbef7990db42eb2",
        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fea4b667b-eec8-4f2b-aa29-7820cff8a26a%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1694266388&t=f18df7c2e97535bfb9cbda942563345c",
      ],
    ),
    CardDetailData(
      6,
      1006,
      "封校日常",
      "捕捉一枚野生美女",
      "https://img2.baidu.com/it/u=372601434,3534902205&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "Alice",
      1237,
      63,
      6,
      "2023-06-15 16:54:27",
      "贵州",
      [
        "https://pic1.zhimg.com/v2-cfe0f84b071bb79d3ad566a766851511_r.jpg?source=1940ef5c",
        "https://p1.itc.cn/c_cut,x_0,y_285,w_960,h_640/images01/20200519/cb858487cb2f4d70b4d4d987a1fa930f.jpeg",
        "https://img0.baidu.com/it/u=1445820300,3925907851&fm=253&fmt=auto&app=138&f=JPEG?w=375&h=500",
        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202007%2F07%2F20200707000455_pswbd.thumb.400_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1694266871&t=3c6e8c83c1a9d742652eded9d9af28ec",
      ],
    ),
  ];

  static List<Comment> commentList = [
    Comment(
      1,
      "Alice",
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202003%2F15%2F20200315114200_qxmdp.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1694144111&t=e2f7201424005a3cb320d2002e784cd2",
      "封校日常捕捉一枚野生美女",
      "2023-06-15 16:54:27",
      1,
      false,
      "深圳",
    ),
    Comment(
      2,
      "momo",
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202003%2F15%2F20200315114200_qxmdp.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1694144111&t=e2f7201424005a3cb320d2002e784cd2",
      "清纯大学生日常居家写真,清纯-美女图片",
      "2023-06-17 16:54:27",
      6,
      false,
      "广州",
    ),
  ];

  static List<Video> videoList = [
    Video(
        1,
        "https://static.ybhospital.net/test-video-10.MP4",
        "真就离了大谱",
        1,
        "Lily",
        "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
        false,
        true,
        false,
        156,
        123,
        65,
        10),
    Video(
        2,
        "https://static.ybhospital.net/test-video-1.mp4",
        "真就离了大谱",
        2,
        "xiao",
        "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
        false,
        true,
        false,
        1526,
        13,
        65,
        10),
    Video(
        3,
        "https://static.ybhospital.net/test-video-2.mp4",
        "哈哈哈哈哈哈哈",
        2,
        "哦冻啊",
        "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
        false,
        true,
        false,
        526,
        135,
        65,
        102),
    Video(
        4,
        "https://static.ybhospital.net/test-video-3.mp4",
        "哈哈哈哈哈哈哈",
        2,
        "哦冻啊",
        "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
        false,
        true,
        false,
        526,
        135,
        65,
        102),
    Video(
        5,
        "https://static.ybhospital.net/test-video-4.mp4",
        "哈哈哈哈哈哈哈",
        2,
        "哦冻啊",
        "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
        false,
        true,
        false,
        526,
        135,
        65,
        102),
    Video(
        6,
        "https://static.ybhospital.net/test-video-5.mp4",
        "哈哈哈哈哈哈哈",
        2,
        "哦冻啊",
        "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
        false,
        true,
        false,
        526,
        135,
        65,
        102),
    Video(
        7,
        "https://static.ybhospital.net/test-video-6.mp4",
        "哈哈哈哈哈哈哈",
        2,
        "哦冻啊",
        "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
        false,
        true,
        false,
        526,
        135,
        65,
        102),
    Video(
        8,
        "https://static.ybhospital.net/test-video-7.MP4",
        "哈哈哈哈哈哈哈",
        2,
        "哦冻啊",
        "https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8718367adab44aed5e941fe4b81c8701a08bfbdc.jpg",
        false,
        true,
        false,
        526,
        135,
        65,
        102),
  ];
}