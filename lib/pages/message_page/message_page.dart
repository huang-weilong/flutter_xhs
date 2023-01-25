import 'package:flutter/material.dart';
import 'package:flutter_xhs/constants/color_plate.dart';
import 'package:get/get.dart';

import 'message_controller.dart';

class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key);
  final MessageController controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("消息"),
        actions: const [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildIcon("assets/images/liked.png", "赞和收藏", ColorPlate.primary, () {}),
                buildIcon("assets/images/user.png", "新增关注", Colors.blue, () {}),
                buildIcon("assets/images/comment2.png", "评论和@", Colors.green, () {}),
              ],
            ),
          ),
          buildMessage(),
          buildMessage(),
          buildMessage(),
        ],
      ),
    );
  }

  Widget buildIcon(String iconPath, String text, Color color, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(iconPath, width: 30, height: 30),
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget buildMessage() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 8, right: 12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/images/message.png", width: 30, height: 30),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("消息通知", style: TextStyle(fontSize: 16)),
                    Text("星期日", style: TextStyle(fontSize: 12, color: ColorPlate.black9)),
                  ],
                ),
                Text(
                  "活动通知：谁能帮我看看，这种透明的卡是什么啊",
                  style: TextStyle(color: ColorPlate.black9),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
