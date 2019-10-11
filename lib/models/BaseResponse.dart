import 'package:json_annotation/json_annotation.dart';

part 'BaseResponse.g.dart';

@JsonSerializable()
class BaseResponse {
    BaseResponse();

    Map<String,dynamic> data;
    num errorCode;
    String errorMsg;
    
    factory BaseResponse.fromJson(Map<String,dynamic> json) => _$BaseResponseFromJson(json);
    Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
