import 'package:dio/dio.dart';
import 'package:news_app/models/news_model.dart';

abstract class BaseRepositories {
  final String apiKey = '300e8f7e3f744fbfb11dc9b56a68e11f';
  BaseRepositories();
  void getAllData() {}
  void getAllArticlesCategory() {}
  void getHotNews() {}
  void getSingleCategory({required String category}) {}
  void getSearch({required String search}) {}
}

class NewsRepository extends BaseRepositories {
  @override
  Future<NewsModel> getAllData() async {
    var response = await Dio().get(
      "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=$apiKey",
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
      "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=$apiKey",
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
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=$apiKey ",
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
      "https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=$apiKey",
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
  Future<List<Articles>> getSearch({required String search}) async {
    var response = await Dio().get(
      "https://newsapi.org/v2/everything?language=id&q=$search&apiKey=$apiKey",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    List<dynamic> json = response.data['articles'];

    List<Articles> list = json.map((e) => Articles.fromJson(e)).toList();
    print(List.generate(list.length, (index) => print(list[index].urlToImage)));
    return json.map((e) => Articles.fromJson(e)).toList();
  }
}
