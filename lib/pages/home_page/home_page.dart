import 'package:flutter/material.dart';
import 'package:flutter_xhs/pages/index_page/index_page.dart';
import 'package:flutter_xhs/pages/message_page/message_page.dart';
import 'package:flutter_xhs/pages/mine_page/mine_page.dart';
import 'package:flutter_xhs/pages/video_page/video_page.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: homeController.currentIndex.value,
          children: [
            IndexPage(),
            homeController.currentIndex.value == 1 ? VideoPage() : Container(),
            Container(),
            MessagePage(),
            MinePage(),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            iconSize: 24,
            backgroundColor: homeController.currentIndex.value == 1 ? Colors.black : Colors.white,
            selectedItemColor: homeController.currentIndex.value == 1 ? Colors.white : Colors.black,
            unselectedItemColor: const Color(0xff999999),
            type: BottomNavigationBarType.fixed,
            currentIndex: homeController.currentIndex.value,
            unselectedFontSize: 16,
            selectedFontSize: 18,
            items: const [
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: "首页",
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: "视频",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box,
                  size: 32,
                  color: Colors.red,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: "消息",
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: "我",
              ),
            ],
            onTap: (index) {
              homeController.onChangePage(index);
            },
          ),
        ),
      ),
    );
  }
}
