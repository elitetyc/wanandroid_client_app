// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projectAllResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectAllResponse _$ProjectAllResponseFromJson(Map<String, dynamic> json) {
  return ProjectAllResponse()
    ..data = json['data'] == null
        ? null
        : ProjectAllOuter.fromJson(json['data'] as Map<String, dynamic>)
    ..errorCode = json['errorCode'] as num
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$ProjectAllResponseToJson(ProjectAllResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
