import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
    Article();

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
    List tags;
    String title;
    num type;
    num userId;
    num visible;
    num zan;
    
    factory Article.fromJson(Map<String,dynamic> json) => _$ArticleFromJson(json);
    Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
