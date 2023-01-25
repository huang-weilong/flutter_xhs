// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['id'] as int? ?? 0,
      json['url'] as String? ?? '',
      json['descText'] as String? ?? '',
      json['uid'] as int? ?? 0,
      json['nickname'] as String? ?? '',
      json['head'] as String? ?? '',
      json['isFollow'] as bool? ?? false,
      json['isLike'] as bool? ?? false,
      json['isFav'] as bool? ?? false,
      json['likeCount'] as int? ?? 0,
      json['favCount'] as int? ?? 0,
      json['commentCount'] as int? ?? 0,
      json['shareCount'] as int? ?? 0,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'descText': instance.descText,
      'uid': instance.uid,
      'nickname': instance.nickname,
      'head': instance.head,
      'isFollow': instance.isFollow,
      'isLike': instance.isLike,
      'isFav': instance.isFav,
      'likeCount': instance.likeCount,
      'favCount': instance.favCount,
      'commentCount': instance.commentCount,
      'shareCount': instance.shareCount,
    };
