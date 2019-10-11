// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userinfo _$UserinfoFromJson(Map<String, dynamic> json) {
  return Userinfo()
    ..username = json['username'] as String
    ..pwd = json['pwd'] as String
    ..islogin = json['islogin'] as bool;
}

Map<String, dynamic> _$UserinfoToJson(Userinfo instance) => <String, dynamic>{
      'username': instance.username,
      'pwd': instance.pwd,
      'islogin': instance.islogin
    };
