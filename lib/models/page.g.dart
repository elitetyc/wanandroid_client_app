// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Page _$PageFromJson(Map<String, dynamic> json) {
  return Page()
    ..curPage = json['curPage'] as num
    ..datas = (json['datas'] as List)
        ?.map((e) =>
            e == null ? null : Article.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..offset = json['offset'] as num
    ..over = json['over'] as bool
    ..pageCount = json['pageCount'] as num
    ..size = json['size'] as num
    ..total = json['total'] as num;
}

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total
    };
