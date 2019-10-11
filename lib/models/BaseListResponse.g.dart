// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseListResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponse _$BaseListResponseFromJson(Map<String, dynamic> json) {
  return BaseListResponse()
    ..data = json['data'] as List
    ..errorCode = json['errorCode'] as num
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$BaseListResponseToJson(BaseListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
