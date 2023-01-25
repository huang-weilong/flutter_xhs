import 'package:json_annotation/json_annotation.dart';
import 'package:video_player/video_player.dart';

part 'video.g.dart';

@JsonSerializable()
class Video {
  @JsonKey(defaultValue: 0)
  late int id;
  @JsonKey(defaultValue: "")
  late String url;
  @JsonKey(defaultValue: "")
  late String descText;
  @JsonKey(defaultValue: 0)
  late int uid;
  @JsonKey(defaultValue: "")
  late String nickname;
  @JsonKey(defaultValue: "")
  late String head;
  @JsonKey(defaultValue: false)
  late bool isFollow;
  @JsonKey(defaultValue: false)
  late bool isLike;
  @JsonKey(defaultValue: false)
  late bool isFav;
  @JsonKey(defaultValue: 0)
  late int likeCount;
  @JsonKey(defaultValue: 0)
  late int favCount;
  @JsonKey(defaultValue: 0)
  late int commentCount;
  @JsonKey(defaultValue: 0)
  late int shareCount;

  @JsonKey(includeFromJson: false, includeToJson: false)
  VideoPlayerController? controller;

  Video(
    this.id,
    this.url,
    this.descText,
    this.uid,
    this.nickname,
    this.head,
    this.isFollow,
    this.isLike,
    this.isFav,
    this.likeCount,
    this.favCount,
    this.commentCount,
    this.shareCount,
  );

  factory Video.fromJson(Map<String, dynamic> srcJson) => _$VideoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  Future loadController() async {
    print("=====>>>>> $url");
    controller = VideoPlayerController.networkUrl(Uri.parse(url));
    await controller?.initialize();
    await controller?.setLooping(true);
  }

  Future dispose() async {
    if (controller != null) {
      // logger.d("Disposing controller for video $id");
      controller?.removeListener(() {});
      await controller?.dispose();
      controller = null;
    }
  }
}
