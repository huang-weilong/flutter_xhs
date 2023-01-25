import 'package:json_annotation/json_annotation.dart';

part 'card_data.g.dart';

@JsonSerializable()
class CardData {
  int id;
  int uid;
  String cover; // 封面
  String content;
  String avatar;
  String nickname;
  int fav;
  int like;
  int comment;

  CardData(
    this.id,
    this.uid,
    this.cover,
    this.content,
    this.avatar,
    this.nickname,
    this.fav,
    this.like,
    this.comment,
  );

  factory CardData.fromJson(Map<String, dynamic> srcJson) => _$CardDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CardDataToJson(this);
}
