import 'package:json_annotation/json_annotation.dart';
import "myCollect.dart";
part 'myCollectReponse.g.dart';

@JsonSerializable()
class MyCollectReponse {
    MyCollectReponse();

    MyCollect data;
    num errorCode;
    String errorMsg;
    
    factory MyCollectReponse.fromJson(Map<String,dynamic> json) => _$MyCollectReponseFromJson(json);
    Map<String, dynamic> toJson() => _$MyCollectReponseToJson(this);
}
