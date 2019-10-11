import 'package:json_annotation/json_annotation.dart';
import "txouterchild.dart";
part 'txouter.g.dart';

@JsonSerializable()
class Txouter {
    Txouter();

    List<Txouterchild> children;
    num courseId;
    num id;
    String name;
    num order;
    num parentChapterId;
    bool userControlSetTop;
    num visible;
    
    factory Txouter.fromJson(Map<String,dynamic> json) => _$TxouterFromJson(json);
    Map<String, dynamic> toJson() => _$TxouterToJson(this);
}
