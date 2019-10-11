// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projectAllOuter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectAllOuter _$ProjectAllOuterFromJson(Map<String, dynamic> json) {
  return ProjectAllOuter()
    ..curPage = json['curPage'] as num
    ..datas = (json['datas'] as List)
        ?.map((e) => e == null
            ? null
            : ProjectAllOuterChild.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..offset = json['offset'] as num
    ..over = json['over'] as bool
    ..pageCount = json['pageCount'] as num
    ..size = json['size'] as num
    ..total = json['total'] as num;
}

Map<String, dynamic> _$ProjectAllOuterToJson(ProjectAllOuter instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total
    };
