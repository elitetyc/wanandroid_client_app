import 'package:json_annotation/json_annotation.dart';

part 'BaseListResponse.g.dart';

@JsonSerializable()
class BaseListResponse {
    BaseListResponse();

    List data;
    num errorCode;
    String errorMsg;
    
    factory BaseListResponse.fromJson(Map<String,dynamic> json) => _$BaseListResponseFromJson(json);
    Map<String, dynamic> toJson() => _$BaseListResponseToJson(this);
}
