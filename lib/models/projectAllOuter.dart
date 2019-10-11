import 'package:json_annotation/json_annotation.dart';
import "projectAllOuterChild.dart";
part 'projectAllOuter.g.dart';

@JsonSerializable()
class ProjectAllOuter {
    ProjectAllOuter();

    num curPage;
    List<ProjectAllOuterChild> datas;
    num offset;
    bool over;
    num pageCount;
    num size;
    num total;
    
    factory ProjectAllOuter.fromJson(Map<String,dynamic> json) => _$ProjectAllOuterFromJson(json);
    Map<String, dynamic> toJson() => _$ProjectAllOuterToJson(this);
}
