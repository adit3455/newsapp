import 'package:dio/dio.dart';

void main() async {
  var response = await Dio().get(
    "https://newsapi.org/v2/top-headlines?country=de&category=business&page=4&apiKey=3aa072174842419cac5216043f89a531",
    options: Options(
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
  List obj = response.data['articles'];

  print(obj.length);
}
