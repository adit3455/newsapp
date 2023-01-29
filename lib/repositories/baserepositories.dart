import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

abstract class BaseRepositories {
  final String apiKey;
  BaseRepositories({this.apiKey = "120f426ba6b54edba6b7c257b8b1b51f"});
  getAllData() {}
  getAllArticlesCategory() {}
  getHotNews() {}
  getSingleCategory({required String category}) {}
}

class NewsRepository extends BaseRepositories {
  @override
  Future<NewsModel> getAllData() async {
    var response = await Dio().get(
      "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=${super.apiKey}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map<String, dynamic> obj = response.data;

    return NewsModel.fromJson(obj);
  }

  @override
  Future<List<Articles>> getAllArticlesCategory() async {
    var response = await Dio().get(
      "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=${super.apiKey}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    List<dynamic> json = response.data['articles'];
    return json.map((e) => Articles.fromJson(e)).toList();
  }

  @override
  Future<List<Articles>> getHotNews() async {
    var response = await Dio().get(
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=${super.apiKey} ",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    List<dynamic> json = response.data['articles'];
    return json.map((e) => Articles.fromJson(e)).toList();
  }

  @override
  Future<List<Articles>> getSingleCategory({required String category}) async {
    var response = await Dio().get(
      "https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=${super.apiKey}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    List<dynamic> json = response.data['articles'];

    return json.map((e) => Articles.fromJson(e)).toList();
  }
}
