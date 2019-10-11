import 'package:json_annotation/json_annotation.dart';
import "projectAllOuter.dart";
part 'projectAllResponse.g.dart';

@JsonSerializable()
class ProjectAllResponse {
    ProjectAllResponse();

    ProjectAllOuter data;
    num errorCode;
    String errorMsg;
    
    factory ProjectAllResponse.fromJson(Map<String,dynamic> json) => _$ProjectAllResponseFromJson(json);
    Map<String, dynamic> toJson() => _$ProjectAllResponseToJson(this);
}
