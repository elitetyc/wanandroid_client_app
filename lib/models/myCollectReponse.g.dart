// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myCollectReponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCollectReponse _$MyCollectReponseFromJson(Map<String, dynamic> json) {
  return MyCollectReponse()
    ..data = json['data'] == null
        ? null
        : MyCollect.fromJson(json['data'] as Map<String, dynamic>)
    ..errorCode = json['errorCode'] as num
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$MyCollectReponseToJson(MyCollectReponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
