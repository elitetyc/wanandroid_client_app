// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myCollect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCollect _$MyCollectFromJson(Map<String, dynamic> json) {
  return MyCollect()
    ..curPage = json['curPage'] as num
    ..datas = (json['datas'] as List)
        ?.map((e) =>
            e == null ? null : Collect.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..offset = json['offset'] as num
    ..over = json['over'] as bool
    ..pageCount = json['pageCount'] as num
    ..size = json['size'] as num
    ..total = json['total'] as num;
}

Map<String, dynamic> _$MyCollectToJson(MyCollect instance) => <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total
    };
