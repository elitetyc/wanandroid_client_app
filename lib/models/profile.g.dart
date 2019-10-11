// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile()
    ..userinfo = json['userinfo'] == null
        ? null
        : Userinfo.fromJson(json['userinfo'] as Map<String, dynamic>)
    ..theme = json['theme'] == null
        ? null
        : Mytheme.fromJson(json['theme'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProfileToJson(Profile instance) =>
    <String, dynamic>{'userinfo': instance.userinfo, 'theme': instance.theme};
