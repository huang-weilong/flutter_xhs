import 'package:json_annotation/json_annotation.dart';

part 'card_detail_data.g.dart';

@JsonSerializable()
class CardDetailData {
  int id;
  int uid;
  String title;
  String content;
  String avatar;
  String nickname;
  int fav;
  int like;
  int comment;
  String date;
  String address;
  List<String> images;

  CardDetailData(this.id, this.uid, this.title, this.content, this.avatar, this.nickname, this.fav,
      this.like, this.comment, this.date, this.address, this.images);

  factory CardDetailData.fromJson(Map<String, dynamic> srcJson) =>
      _$CardDetailDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CardDetailDataToJson(this);
}
