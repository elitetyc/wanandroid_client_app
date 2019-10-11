import 'package:json_annotation/json_annotation.dart';
import "projectItem.dart";
part 'projectAllOuterChild.g.dart';

@JsonSerializable()
class ProjectAllOuterChild {
    ProjectAllOuterChild();

    String apkLink;
    num audit;
    String author;
    num chapterId;
    String chapterName;
    bool collect;
    num courseId;
    String desc;
    String envelopePic;
    bool fresh;
    num id;
    String link;
    String niceDate;
    String niceShareDate;
    String origin;
    String prefix;
    String projectLink;
    num publishTime;
    num shareDate;
    String shareUser;
    num superChapterId;
    String superChapterName;
    List<ProjectItem> tags;
    String title;
    num type;
    num userId;
    num visible;
    num zan;
    
    factory ProjectAllOuterChild.fromJson(Map<String,dynamic> json) => _$ProjectAllOuterChildFromJson(json);
    Map<String, dynamic> toJson() => _$ProjectAllOuterChildToJson(this);
}
