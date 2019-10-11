// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gzhResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GzhResponse _$GzhResponseFromJson(Map<String, dynamic> json) {
  return GzhResponse()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : GzhChild.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..errorCode = json['errorCode'] as num
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$GzhResponseToJson(GzhResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
