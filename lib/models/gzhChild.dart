import 'package:json_annotation/json_annotation.dart';

part 'gzhChild.g.dart';

@JsonSerializable()
class GzhChild {
    GzhChild();

    List children;
    num courseId;
    num id;
    String name;
    num order;
    num parentChapterId;
    bool userControlSetTop;
    num visible;
    
    factory GzhChild.fromJson(Map<String,dynamic> json) => _$GzhChildFromJson(json);
    Map<String, dynamic> toJson() => _$GzhChildToJson(this);
}
