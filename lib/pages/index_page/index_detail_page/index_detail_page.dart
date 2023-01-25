import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xhs/common/utils/date_utils.dart';
import 'package:flutter_xhs/constants/color_plate.dart';
import 'package:flutter_xhs/pages/index_page/index_detail_page/index_detail_controller.dart';
import 'package:get/get.dart';

class IndexDetailPage extends StatelessWidget {
  IndexDetailPage({Key? key}) : super(key: key);
  final IndexDetailController controller = Get.put(IndexDetailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IndexDetailController>(builder: (_) {
      if (controller.isLoading) {
        return const Scaffold(body: Center(child: CircularProgressIndicator(color: ColorPlate.primary)));
      } else if (controller.isFail) {
        return const Scaffold(body: Center(child: Text("数据加载失败，请重试")));
      }
      return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                ClipOval(
                    child: Image.network(
                  controller.cardDetailData.avatar,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(controller.cardDetailData.nickname),
                ),
              ],
            ),
            actions: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration:
                    const ShapeDecoration(shape: StadiumBorder(side: BorderSide(color: ColorPlate.primary))),
                child: const Text(
                  "关注",
                  style: TextStyle(color: ColorPlate.primary, fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 14),
                child: Image.asset("assets/images/share.png", width: 20, height: 20),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      buildImageSwiper(),
                      buildContent(),
                      buildComment(),
                    ],
                  ),
                ),
                buildBottom(),
              ],
            ),
          ));
    });
  }

  Widget buildImageSwiper() {
    return SizedBox(
      height: Get.height * 2 / 3,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            controller.cardDetailData.images[index],
            width: Get.width,
            fit: BoxFit.contain,
          );
        },
        loop: false,
        itemCount: controller.cardDetailData.images.length,
        indicatorLayout: PageIndicatorLayout.SCALE,
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            activeColor: ColorPlate.primary,
            color: ColorPlate.grey,
          ),
        ),
      ),
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.cardDetailData.title,
            style: const TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              controller.cardDetailData.content,
              style: const TextStyle(color: Color(0xff333333)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "${controller.cardDetailData.date} ${controller.cardDetailData.address}",
              style: const TextStyle(color: Color(0xff999999)),
            ),
          ),
          const Divider(thickness: 0.5)
        ],
      ),
    );
  }

  Widget buildComment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "共${controller.commentList.length}条评论",
            style: const TextStyle(color: ColorPlate.black6),
          ),
          ...controller.commentList.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                      child: Image.network(
                        e.avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 14),
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: ColorPlate.grey, width: 0.5))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e.nickname, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                                  RichText(
                                      text: TextSpan(
                                          style: const TextStyle(color: ColorPlate.black3),
                                          text: e.content,
                                          children: [
                                        TextSpan(
                                          text: "  ${SDateUtils.formatDate(e.createDate)}",
                                          style: const TextStyle(color: ColorPlate.black9),
                                        ),
                                        TextSpan(
                                            text: "  回复",
                                            style: const TextStyle(color: ColorPlate.black3),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                print("回复");
                                              })
                                      ])),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/like.png",
                                width: 20,
                                height: 20,
                              ),
                              Text(e.like.toString()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget buildBottom() {
    Widget buildIcon(String iconPath, int count) {
      return GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Image.asset(iconPath, width: 30, height: 30),
            Text(count.toString()),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 12.0),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: const ShapeDecoration(shape: StadiumBorder(), color: ColorPlate.background),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset(
                      "assets/images/input.png",
                      width: 20,
                      height: 20,
                      color: ColorPlate.black9,
                    ),
                  ),
                  const Text("说点什么...", style: TextStyle(color: ColorPlate.black9))
                ],
              ),
            ),
          ),
          Image.asset("assets/images/like.png", width: 30, height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(controller.cardDetailData.like.toString()),
          ),
          Image.asset("assets/images/fav.png", width: 30, height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(controller.cardDetailData.fav.toString()),
          ),
          Image.asset("assets/images/comment.png", width: 30, height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(controller.cardDetailData.comment.toString()),
          ),
        ],
      ),
    );
  }
}
