import 'package:json_annotation/json_annotation.dart';
import "userinfo.dart";
import "mytheme.dart";
part 'profile.g.dart';

@JsonSerializable()
class Profile {
    Profile();

    Userinfo userinfo;
    Mytheme theme;
    
    factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
    Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
