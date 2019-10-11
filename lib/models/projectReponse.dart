import 'package:json_annotation/json_annotation.dart';
import "projectfl.dart";
part 'projectReponse.g.dart';

@JsonSerializable()
class ProjectReponse {
    ProjectReponse();

    List<Projectfl> data;
    num errorCode;
    String errorMsg;
    
    factory ProjectReponse.fromJson(Map<String,dynamic> json) => _$ProjectReponseFromJson(json);
    Map<String, dynamic> toJson() => _$ProjectReponseToJson(this);
}
