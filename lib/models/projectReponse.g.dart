// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projectReponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectReponse _$ProjectReponseFromJson(Map<String, dynamic> json) {
  return ProjectReponse()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Projectfl.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..errorCode = json['errorCode'] as num
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$ProjectReponseToJson(ProjectReponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
