import 'package:json_annotation/json_annotation.dart';

part 'theme.g.dart';

@JsonSerializable()
class Theme {
    Theme();

    num themecolor;
    
    factory Theme.fromJson(Map<String,dynamic> json) => _$ThemeFromJson(json);
    Map<String, dynamic> toJson() => _$ThemeToJson(this);
}
