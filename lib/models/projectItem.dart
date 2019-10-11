import 'package:json_annotation/json_annotation.dart';

part 'projectItem.g.dart';

@JsonSerializable()
class ProjectItem {
    ProjectItem();

    String name;
    String url;
    
    factory ProjectItem.fromJson(Map<String,dynamic> json) => _$ProjectItemFromJson(json);
    Map<String, dynamic> toJson() => _$ProjectItemToJson(this);
}
