import 'package:json_annotation/json_annotation.dart';

part 'txouterchild.g.dart';

@JsonSerializable()
class Txouterchild {
    Txouterchild();

    List children;
    num courseId;
    num id;
    String name;
    num order;
    num parentChapterId;
    bool userControlSetTop;
    num visible;
    
    factory Txouterchild.fromJson(Map<String,dynamic> json) => _$TxouterchildFromJson(json);
    Map<String, dynamic> toJson() => _$TxouterchildToJson(this);
}
