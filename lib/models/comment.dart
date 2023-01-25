import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  int id;
  String nickname;
  String avatar;
  String content;
  String createDate;
  int like;
  bool isLike = false;
  String address;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<Comment> replyCommentList = [];

  Comment(this.id, this.nickname, this.avatar, this.content, this.createDate, this.like,
      this.isLike, this.address);

  factory Comment.fromJson(Map<String, dynamic> srcJson) => _$CommentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
