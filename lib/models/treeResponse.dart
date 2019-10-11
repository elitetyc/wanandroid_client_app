import 'package:json_annotation/json_annotation.dart';
import "txouter.dart";
part 'treeResponse.g.dart';

@JsonSerializable()
class TreeResponse {
    TreeResponse();

    List<Txouter> data;
    num errorCode;
    String errorMsg;
    
    factory TreeResponse.fromJson(Map<String,dynamic> json) => _$TreeResponseFromJson(json);
    Map<String, dynamic> toJson() => _$TreeResponseToJson(this);
}
