import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xhs/models/video.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'video_controller.dart';

class VideoPage extends StatelessWidget {
  VideoPage({Key? key}) : super(key: key);
  final VideoController controller = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GetBuilder<VideoController>(builder: (c) {
          return controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : controller.videos.isEmpty
                  ? Center(
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text("暂无数据"),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                          onPressed: controller.initLoad,
                          child: const Text("刷新"),
                        ),
                      ],
                    ))
                  : PageView.builder(
                      controller: PageController(
                        initialPage: controller.currentIndex,
                        viewportFraction: 1,
                      ),
                      itemCount: controller.videos.length,
                      onPageChanged: (index) {
                        controller.changeVideo(index);
                      },
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return videoCard(controller.videos[index]);
                      },
                    );
        }),
      ),
    );
  }

  checkVideoRatio(double width, double height) {
    if (width > height) {
      return BoxFit.contain;
    } else if (width < height) {
      return BoxFit.cover;
    } else {
      return BoxFit.contain;
    }
  }

  Widget videoCard(Video video) {
    return Stack(
      children: [
        video.controller != null && video.controller?.value.isInitialized == true
            // ? Container(
            //     height: double.infinity,
            //     width: double.infinity,
            //     color: Colors.black,
            //     alignment: Alignment.center,
            //     child: AspectRatio(
            //       aspectRatio: 9.0 / 16.0,
            //       child: CachedVideoPlayer(video.controller!),
            //     ),
            //   )
            ? SizedBox.expand(
                child: FittedBox(
                  fit: checkVideoRatio(
                      video.controller?.value.size.width ?? 0, video.controller?.value.size.height ?? 0),
                  child: SizedBox(
                    width: video.controller?.value.size.width ?? 0,
                    height: video.controller?.value.size.height ?? 0,
                    child: VideoPlayer(video.controller!),
                  ),
                ),
              )
            : Container(
                color: Colors.black,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
        if (video.controller?.value.isInitialized == true)
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (video.controller != null) {
                  if (video.controller!.value.isPlaying) {
                    video.controller?.pause();
                  } else {
                    video.controller?.play();
                  }
                }
              },
              child: Container(
                child: video.controller?.value.isPlaying ?? true
                    ? null
                    : Icon(
                        Icons.play_arrow,
                        size: 100,
                        color: Colors.white.withOpacity(0.5),
                      ),
              ),
            ),
          ),
        // 底部
        Positioned(
          bottom: 10,
          left: 12,
          right: 12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(video.descText, style: const TextStyle(color: Colors.white)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.network(
                      video.head,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      video.nickname,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.toggleFollow(video);
                    },
                    child: Container(
                      width: 120.sp,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(
                          side: BorderSide(color: video.isFollow ? Colors.white : Colors.red),
                        ),
                        color: video.isFollow ? Colors.transparent : Colors.red,
                      ),
                      child: Text(
                        video.isFollow ? "已关注" : "关注",
                        style: TextStyle(color: Colors.white, fontSize: 26.sp),
                      ),
                    ),
                  ),
                  const Spacer(),
                  _buildIconText(
                    icon: Icons.favorite,
                    color: video.isLike ? Colors.red : Colors.white,
                    text: video.likeCount.toString(),
                    onTap: () {
                      controller.toggleLike(video);
                    },
                  ),
                  _buildIconText(
                    icon: Icons.star,
                    color: video.isFav ? Colors.orangeAccent : Colors.white,
                    text: video.favCount.toString(),
                    onTap: () {
                      controller.toggleFav(video);
                    },
                  ),
                  _buildIconText(
                    icon: Icons.share,
                    color: Colors.white,
                    text: video.shareCount.toString(),
                    onTap: () {},
                  ),
                  _buildIconText(
                    icon: Icons.comment,
                    color: Colors.white,
                    text: video.commentCount.toString(),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconText(
      {required IconData icon, required Color color, required String text, Function? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              onTap?.call();
            },
            child: Icon(icon, color: color, size: 46.sp),
          ),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
