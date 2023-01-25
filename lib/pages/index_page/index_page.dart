import 'package:flutter/material.dart';
import 'package:flutter_xhs/constants/color_plate.dart';
import 'package:flutter_xhs/models/card_data.dart';
import 'package:get/get.dart';

import 'index_controller.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);
  final IndexController controller = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPlate.background,
        body: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/images/world.png", width: 30, height: 30),
                  SizedBox(
                    height: 30,
                    width: 200,
                    child: TabBar(
                      labelColor: Colors.black,
                      dividerColor: Colors.transparent,
                      indicatorColor: ColorPlate.primary,
                      controller: controller.tabController,
                      tabs: const [
                        Tab(text: "关注"),
                        Tab(text: "发现"),
                        Tab(text: "购物"),
                      ],
                    ),
                  ),
                  Image.asset("assets/images/search.png", width: 30, height: 30),
                ],
              ),
            ),
            Expanded(
              child: GetBuilder<IndexController>(
                builder: (_) {
                  return TabBarView(
                    controller: controller.tabController,
                    children: [
                      buildFollowPage(),
                      buildDiscoverPage(),
                      buildShoppingPage(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFollowPage() {
    return const Center(child: Text("正在开发"));
  }

  Widget buildDiscoverPage() {
    return ListView(
      children: [
        Row(
          children: [
            Column(
              children: controller.data.map((e) => buildCardItem(e)).toList(),
            ),
            Column(
              children: controller.data.reversed.map((e) => buildCardItem(e)).toList(),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildShoppingPage() {
    return const Center(child: Text("正在开发"));
  }

  Widget buildCardItem(CardData cardData) {
    return GestureDetector(
      onTap: () {
        controller.openIndexDetailPage(cardData.id);
      },
      child: Container(
        width: (Get.width / 2) - 8,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.network(
                cardData.cover,
                width: Get.width / 2,
                height: Get.width / 2 + 30,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Text(cardData.content, maxLines: 2, overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.network(cardData.avatar, width: 20, height: 20, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(cardData.nickname),
                  ),
                  const Spacer(),
                  Image.asset("assets/images/like.png", width: 20),
                  Text(cardData.fav.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
