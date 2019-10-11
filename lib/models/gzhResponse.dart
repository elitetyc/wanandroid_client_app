import 'package:json_annotation/json_annotation.dart';
import "gzhChild.dart";
part 'gzhResponse.g.dart';

@JsonSerializable()
class GzhResponse {
    GzhResponse();

    List<GzhChild> data;
    num errorCode;
    String errorMsg;
    
    factory GzhResponse.fromJson(Map<String,dynamic> json) => _$GzhResponseFromJson(json);
    Map<String, dynamic> toJson() => _$GzhResponseToJson(this);
}
