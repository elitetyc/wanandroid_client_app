// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navouter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Navouter _$NavouterFromJson(Map<String, dynamic> json) {
  return Navouter()
    ..articles = (json['articles'] as List)
        ?.map((e) => e == null
            ? null
            : Navouterchild.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..cid = json['cid'] as num
    ..name = json['name'] as String;
}

Map<String, dynamic> _$NavouterToJson(Navouter instance) => <String, dynamic>{
      'articles': instance.articles,
      'cid': instance.cid,
      'name': instance.name
    };
