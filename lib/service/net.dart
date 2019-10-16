import 'package:dio/dio.dart';
import 'package:wanandroid_client_app/models/index.dart';
import 'dart:math';
import 'package:wanandroid_client_app/common/static_info.dart';
import 'package:wanandroid_client_app/common/store.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

const String login = "user/login";
const String register = "user/register";
const String logout = "user/logout/json";
const String banner = "banner/json";
const String tree = "tree/json";
const String nav = "navi/json";
const String projectfl = "project/tree/json";
const String projectList = "project/list/PAGE/json?cid=CID";
const String tixiList = "article/list/PAGE/json?cid=CID";
const String gzh = "wxarticle/chapters/json";
const String gzhList = "wxarticle/list/CID/PAGE/json";
const String collectList = "lg/collect/list/PAGE/json";
String article = "article/list/pageIndex/json";
String collect = "lg/collect/Index/json";
String uncollect = "lg/uncollect_originId/Index/json";



//获取请求对象
Dio getDio() {
  BaseOptions baseOptions = BaseOptions(
    baseUrl: "https://www.wanandroid.com/",
  );
  Dio dio = Dio(baseOptions);
//  添加cookie管理
//  if(Store.profile.userinfo.islogin){
//
//  }
  dio.interceptors.add(CookieManager(PersistCookieJar(dir: Store.cookiePath)));
  dio.interceptors.add(LogInterceptor(responseBody: false)); //开启请求日志
  return dio;
}
//用户登录
dynamic mylogin(String username, String pwd) async {
  Map<String, String> queryParameters = {"username": username, "password": pwd};
  Dio dio = getDio();
  Response response = await dio.post(login, queryParameters: queryParameters);
  Map<String, dynamic> res = response.data;
  return BaseResponse.fromJson(res);
}
//获取首页banner
Future<List<Banner>> getBanner() async {
  Dio dio = getDio();
  Response response = await dio.get(banner);
  Map<String, dynamic> res = response.data;
  BaseListResponse baseListResponse = BaseListResponse.fromJson(res);
  List<Banner> banners = List<Banner>();
  if (baseListResponse.errorCode == 0) {
//    说明获取数据没有错误
    for (int i = 0; i < baseListResponse.data.length; i++) {
      banners.add(Banner.fromJson(baseListResponse.data[i]));
    }
  }
  return  banners;
}

//获取首页文章
Future<Page> getArticle(int index)async{

  Dio dio = getDio();
  String newarticle = article.replaceAll("pageIndex", index.toString());
  Response response = await dio.get(newarticle);
  Map<String, dynamic> res = response.data;
  BaseResponse baseListResponse = BaseResponse.fromJson(res);
  Page page = Page.fromJson(baseListResponse.data);
  for(int i=0;i<page.datas.length;i++){
    page.datas[i].shareUser = Random().nextInt(2)==1?StaticInfo.manIcon.replaceAll("Index", Random().nextInt(50).toString()):StaticInfo.womanIcon.replaceAll("Index", Random().nextInt(50).toString());
  }
  return page;
}

//收藏文章
Future<int> collectArticle(int index)async{
  Dio dio = getDio();
  String collectUrl = collect.replaceAll("Index", index.toString());
  Response response =  await dio.post(collectUrl);
  Map<String, dynamic> res = response.data;
  BaseResponse baseResponse = BaseResponse.fromJson(res);
  return baseResponse.errorCode;

}


//取消收藏文章
Future<int> unCollectArticle(int index)async{
  Dio dio = getDio();
  String uncollectUrl = uncollect.replaceAll("Index", index.toString());
  Response response =  await dio.post(uncollectUrl);
  Map<String, dynamic> res = response.data;
  BaseResponse baseResponse = BaseResponse.fromJson(res);
  return baseResponse.errorCode;

}

////获取体系分类
Future<List<Txouter>> getTreeJson()async{
  List<Txouter> txouter = List<Txouter>();
  Dio dio = getDio();
  Response response = await dio.get(tree);
  Map<String, dynamic> res = response.data;
  TreeResponse treeResponse = TreeResponse.fromJson(res);
  if(treeResponse.errorCode==0){
    txouter = treeResponse.data;
  }
  return txouter;
}

//获取导航数据
Future<List<Navouter>> getNavJson() async{
  List<Navouter> navouters = List<Navouter>();
  Dio dio = getDio();
  Response response = await dio.get(nav);
  Map<String, dynamic> res = response.data;
  NavResponse navResponse = NavResponse.fromJson(res);
  if(navResponse.errorCode==0){
    navouters = navResponse.data;
  }
  return navouters;
}

//获取项目的分类
Future<List<Projectfl>> getProjectFl() async{
  List<Projectfl> projectfls = List<Projectfl>();
  Dio dio = getDio();
  Response response = await dio.get(projectfl);
  Map<String, dynamic> res = response.data;
  ProjectReponse projectReponse = ProjectReponse.fromJson(res);
  if(projectReponse.errorCode==0){
    projectfls = projectReponse.data;
  }
  return projectfls;
}

//获取项目列表数据
Future<List<ProjectAllOuterChild>> getProjectList(int page,int cid) async{
  List<ProjectAllOuterChild> projectAllOuterChild = List<ProjectAllOuterChild>();
  ProjectAllOuter projectAllOuter;
  Dio dio = getDio();
  Response response = await dio.get(projectList.replaceAll("PAGE", page.toString()).replaceAll("CID", cid.toString()));
  Map<String, dynamic> res = response.data;
  ProjectAllResponse projectAllResponse = ProjectAllResponse.fromJson(res);
  if(projectAllResponse.errorCode==0){
    projectAllOuter = projectAllResponse.data;
    projectAllOuterChild = projectAllOuter.datas;
  }
  return projectAllOuterChild;
}



//获取体系列表数据
Future<List<ProjectAllOuterChild>> getTixiList(int page,int cid) async{
  List<ProjectAllOuterChild> projectAllOuterChild = List<ProjectAllOuterChild>();
  ProjectAllOuter projectAllOuter;
  Dio dio = getDio();
  Response response = await dio.get(tixiList.replaceAll("PAGE", page.toString()).replaceAll("CID", cid.toString()));
  Map<String, dynamic> res = response.data;
  ProjectAllResponse projectAllResponse = ProjectAllResponse.fromJson(res);
  if(projectAllResponse.errorCode==0){
    projectAllOuter = projectAllResponse.data;
    projectAllOuterChild = projectAllOuter.datas;
  }
  return projectAllOuterChild;
}

//获取公众号信息
Future<List<GzhChild>> getGzh() async{
  List<GzhChild> gzhChild = List<GzhChild>();
  Dio dio = getDio();
  Response response = await dio.get(gzh);
  Map<String, dynamic> res = response.data;
  GzhResponse gzhResponse = GzhResponse.fromJson(res);
  if(gzhResponse.errorCode==0){
    gzhChild = gzhResponse.data;
  }
  return gzhChild;
}


//获取公众号文章数据
Future<List<ProjectAllOuterChild>> getGzhList(int page,int cid) async{
  List<ProjectAllOuterChild> projectAllOuterChild = List<ProjectAllOuterChild>();
  ProjectAllOuter projectAllOuter;
  Dio dio = getDio();
  Response response = await dio.get(gzhList.replaceAll("PAGE", page.toString()).replaceAll("CID", cid.toString()));
  Map<String, dynamic> res = response.data;
  ProjectAllResponse projectAllResponse = ProjectAllResponse.fromJson(res);
  if(projectAllResponse.errorCode==0){
    projectAllOuter = projectAllResponse.data;
    projectAllOuterChild = projectAllOuter.datas;
  }
  return projectAllOuterChild;
}

//查看我的收藏列表
Future<MyCollect> getCollectList(int page) async{
  Dio dio = getDio();
  Response response = await dio.get(collectList.replaceAll("PAGE", page.toString()));
  Map<String,dynamic> res = response.data;
  MyCollectReponse myCollectReponse = MyCollectReponse.fromJson(res);
  if(myCollectReponse.errorCode==0){
    return myCollectReponse.data;
  }
  return null;
}






