import 'package:json_annotation/json_annotation.dart';

part 'collect.g.dart';

@JsonSerializable()
class Collect {
    Collect();

    String author;
    num chapterId;
    String chapterName;
    num courseId;
    String desc;
    String envelopePic;
    num id;
    String link;
    String niceDate;
    String origin;
    num originId;
    num publishTime;
    String title;
    num userId;
    num visible;
    num zan;
    
    factory Collect.fromJson(Map<String,dynamic> json) => _$CollectFromJson(json);
    Map<String, dynamic> toJson() => _$CollectToJson(this);
}
