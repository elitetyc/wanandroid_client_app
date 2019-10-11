import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {
    Banner();

    String desc;
    num id;
    String imagePath;
    num isVisible;
    num order;
    String title;
    num type;
    String url;
    
    factory Banner.fromJson(Map<String,dynamic> json) => _$BannerFromJson(json);
    Map<String, dynamic> toJson() => _$BannerToJson(this);
}
