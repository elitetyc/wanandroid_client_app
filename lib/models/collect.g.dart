// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collect _$CollectFromJson(Map<String, dynamic> json) {
  return Collect()
    ..author = json['author'] as String
    ..chapterId = json['chapterId'] as num
    ..chapterName = json['chapterName'] as String
    ..courseId = json['courseId'] as num
    ..desc = json['desc'] as String
    ..envelopePic = json['envelopePic'] as String
    ..id = json['id'] as num
    ..link = json['link'] as String
    ..niceDate = json['niceDate'] as String
    ..origin = json['origin'] as String
    ..originId = json['originId'] as num
    ..publishTime = json['publishTime'] as num
    ..title = json['title'] as String
    ..userId = json['userId'] as num
    ..visible = json['visible'] as num
    ..zan = json['zan'] as num;
}

Map<String, dynamic> _$CollectToJson(Collect instance) => <String, dynamic>{
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'envelopePic': instance.envelopePic,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'origin': instance.origin,
      'originId': instance.originId,
      'publishTime': instance.publishTime,
      'title': instance.title,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan
    };
