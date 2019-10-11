// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treeResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreeResponse _$TreeResponseFromJson(Map<String, dynamic> json) {
  return TreeResponse()
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Txouter.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..errorCode = json['errorCode'] as num
    ..errorMsg = json['errorMsg'] as String;
}

Map<String, dynamic> _$TreeResponseToJson(TreeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };
