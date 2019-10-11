// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'txouter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Txouter _$TxouterFromJson(Map<String, dynamic> json) {
  return Txouter()
    ..children = (json['children'] as List)
        ?.map((e) =>
            e == null ? null : Txouterchild.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..courseId = json['courseId'] as num
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..order = json['order'] as num
    ..parentChapterId = json['parentChapterId'] as num
    ..userControlSetTop = json['userControlSetTop'] as bool
    ..visible = json['visible'] as num;
}

Map<String, dynamic> _$TxouterToJson(Txouter instance) => <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
