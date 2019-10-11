import 'package:json_annotation/json_annotation.dart';
import "collect.dart";
part 'myCollect.g.dart';

@JsonSerializable()
class MyCollect {
    MyCollect();

    num curPage;
    List<Collect> datas;
    num offset;
    bool over;
    num pageCount;
    num size;
    num total;
    
    factory MyCollect.fromJson(Map<String,dynamic> json) => _$MyCollectFromJson(json);
    Map<String, dynamic> toJson() => _$MyCollectToJson(this);
}
