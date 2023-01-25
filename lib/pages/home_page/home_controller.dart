import 'package:flutter_xhs/pages/video_page/video_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  void onChangePage(int index) {
    if (index == 2) {
    } else {
      currentIndex.value = index;
      if (Get.find<VideoController>().videos.isNotEmpty) {
        if (index == 1) {
          print("视频播放");
          Get.find<VideoController>().currentVideo.controller?.play();
        } else {
          print("视频暂停");
          Get.find<VideoController>().currentVideo.controller?.pause();
        }
      }
    }
  }
}
