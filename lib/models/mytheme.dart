import 'package:json_annotation/json_annotation.dart';

part 'mytheme.g.dart';

@JsonSerializable()
class Mytheme {
    Mytheme();

    num themecolor;
    
    factory Mytheme.fromJson(Map<String,dynamic> json) => _$MythemeFromJson(json);
    Map<String, dynamic> toJson() => _$MythemeToJson(this);
}
