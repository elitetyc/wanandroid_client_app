import 'package:json_annotation/json_annotation.dart';
import "navouterchild.dart";
part 'navouter.g.dart';

@JsonSerializable()
class Navouter {
    Navouter();

    List<Navouterchild> articles;
    num cid;
    String name;
    
    factory Navouter.fromJson(Map<String,dynamic> json) => _$NavouterFromJson(json);
    Map<String, dynamic> toJson() => _$NavouterToJson(this);
}
