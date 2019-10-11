import 'package:json_annotation/json_annotation.dart';

part 'navouterchild.g.dart';

@JsonSerializable()
class Navouterchild {
    Navouterchild();

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
    String shareDate;
    String shareUser;
    num superChapterId;
    String superChapterName;
    List tags;
    String title;
    num type;
    num userId;
    num visible;
    num zan;
    
    factory Navouterchild.fromJson(Map<String,dynamic> json) => _$NavouterchildFromJson(json);
    Map<String, dynamic> toJson() => _$NavouterchildToJson(this);
}
