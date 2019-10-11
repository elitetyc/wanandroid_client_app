import 'package:json_annotation/json_annotation.dart';

part 'projectfl.g.dart';

@JsonSerializable()
class Projectfl {
    Projectfl();

    List children;
    num courseId;
    num id;
    String name;
    num order;
    num parentChapterId;
    bool userControlSetTop;
    num visible;
    
    factory Projectfl.fromJson(Map<String,dynamic> json) => _$ProjectflFromJson(json);
    Map<String, dynamic> toJson() => _$ProjectflToJson(this);
}
