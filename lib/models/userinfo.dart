import 'package:json_annotation/json_annotation.dart';

part 'userinfo.g.dart';

@JsonSerializable()
class Userinfo {
    Userinfo();

    String username;
    String pwd;
    bool islogin;
    
    factory Userinfo.fromJson(Map<String,dynamic> json) => _$UserinfoFromJson(json);
    Map<String, dynamic> toJson() => _$UserinfoToJson(this);
}
