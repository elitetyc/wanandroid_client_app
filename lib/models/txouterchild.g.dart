// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'txouterchild.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Txouterchild _$TxouterchildFromJson(Map<String, dynamic> json) {
  return Txouterchild()
    ..children = json['children'] as List
    ..courseId = json['courseId'] as num
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..order = json['order'] as num
    ..parentChapterId = json['parentChapterId'] as num
    ..userControlSetTop = json['userControlSetTop'] as bool
    ..visible = json['visible'] as num;
}

Map<String, dynamic> _$TxouterchildToJson(Txouterchild instance) =>
    <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
