import 'package:json_annotation/json_annotation.dart';
import "article.dart";
part 'page.g.dart';

@JsonSerializable()
class Page {
    Page();

    num curPage;
    List<Article> datas;
    num offset;
    bool over;
    num pageCount;
    num size;
    num total;
    
    factory Page.fromJson(Map<String,dynamic> json) => _$PageFromJson(json);
    Map<String, dynamic> toJson() => _$PageToJson(this);
}
