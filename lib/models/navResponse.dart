import 'package:json_annotation/json_annotation.dart';
import "navouter.dart";
part 'navResponse.g.dart';

@JsonSerializable()
class NavResponse {
    NavResponse();

    List<Navouter> data;
    num errorCode;
    String errorMsg;
    
    factory NavResponse.fromJson(Map<String,dynamic> json) => _$NavResponseFromJson(json);
    Map<String, dynamic> toJson() => _$NavResponseToJson(this);
}
