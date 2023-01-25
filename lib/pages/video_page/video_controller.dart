import 'package:flutter/material.dart';
import 'package:flutter_xhs/api/api_client.dart';
import 'package:flutter_xhs/models/video.dart';
import 'package:get/get.dart';

class VideoController extends GetxController with WidgetsBindingObserver {
  List<Video> videos = [];
  int prevIndex = 0;
  int currentIndex = 0;
  bool isLoading = true;

  final TextEditingController commentController = TextEditingController();
  FocusNode focusNode = FocusNode();
  double currentBottom = 0;

  @override
  void onInit() {
    super.onInit();
    // tabController.addListener(() {
    //   if (!tabController.indexIsChanging) {
    //     print("监听切换tab ${tabController.index} ");
    //   }
    // });
    WidgetsBinding.instance.addObserver(this);
    initLoad();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 第一次进入页面bottom为0，页面在底部点击输入框可能导致键盘无法弹起
      if (currentBottom == WidgetsBinding.instance.window.viewInsets.bottom) return;
      if (WidgetsBinding.instance.window.viewInsets.bottom == 0) {
        focusNode.unfocus();
        // 收起键盘，如果文本是空的，清除回复的人的信息
        if (commentController.text.isEmpty) {
          update();
        }
      }
      currentBottom = WidgetsBinding.instance.window.viewInsets.bottom;
    });
  }

  @override
  void onClose() {
    commentController.dispose();
    focusNode.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  Video get currentVideo {
    if (videos.isNotEmpty) return videos[currentIndex];
    return Video.fromJson({});
  }

  void initLoad() async {
    await ApiClient().getVideoList().then((response) {
      // print("首页视频数据初始化 ${response.data}");
      isLoading = false;
      videos.addAll(response);
      update();
    }).catchError((onError) {
      isLoading = false;
    });
    if (videos.isEmpty) {
      // print("暂无视频");
      return;
    }

    await videos[0].loadController();

    videos[0].controller!.addListener(() {
      update();
    });
    videos[0].controller!.play();

    if (videos[1].controller == null) {
      await videos[1].loadController();
      videos[1].controller!.addListener(() {
        update();
      });
    }
    update();
  }

  void loadMore() async {
    await ApiClient().getVideoList().then((response) {
      response as List<Video>;
      for (var v in response) {
        videos.add(Video.fromJson(v.toJson()));
      }
    });
    update();
  }

  void changeVideo(index) async {
    currentIndex = index;

    bool isGoingUp = index == prevIndex;
    prevIndex = index - 1;

    if (videos[index].controller == null) {
      await videos[index].loadController();
      videos[index].controller!.addListener(() {
        update();
      });
    }

    await videos[index].controller!.play();

    if (!isGoingUp) {
      if (videos[index - 1].controller != null) {
        await videos[index - 1].controller!.pause();
        await videos[index - 1].controller!.seekTo(Duration.zero);
      }
      if (index + 1 < videos.length) {
        if (videos[index + 1].controller == null) {
          await videos[index + 1].loadController();
          videos[index + 1].controller!.addListener(() {
            update();
          });
        }
      }

      if (index > 4) {
        for (var video in videos.sublist(0, index - 4)) {
          await video.dispose();
        }
      }
    } else {
      if (videos[index + 1].controller != null) {
        await videos[index + 1].controller!.pause();
        await videos[index + 1].controller!.seekTo(Duration.zero);
      }

      if (index - 1 >= 0) {
        if (videos[index - 1].controller == null) {
          await videos[index - 1].loadController();
          videos[index - 1].controller!.addListener(() {
            update();
          });
        }
      }

      if (index + 4 < videos.length) {
        for (var video in videos.sublist(index + 4, videos.length)) {
          await video.dispose();
        }
      }
    }

    if (index > videos.length - 2) {
      loadMore();
    }

    update();
  }

  void loadVideo(int index) async {
    if (videos.length > index) {
      await videos[index].loadController();
      await videos[index].controller?.play();

      if (index + 1 < videos.length) {
        if (videos[index + 1].controller == null) {
          await videos[index + 1].loadController();
        }
      }
      update();
    }
  }

  void toggleLike(Video video) {
    video.isLike = !video.isLike;
    update();
  }

  void toggleFav(Video video) {
    video.isFav = !video.isFav;
    update();
  }

  void toggleFollow(Video video) {
    video.isFollow = !video.isFollow;
    update();
  }

  void openUserHomePage(int uid) {
    currentVideo.controller?.pause();
  }
}
