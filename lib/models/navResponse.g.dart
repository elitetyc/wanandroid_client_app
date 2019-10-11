// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NavResponse _$NavResponseFromJson(Map<String, dynamic> json) {
  return NavResponse()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Navouter.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..errorCode = json['errorCode'] as num
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$NavResponseToJson(NavResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
