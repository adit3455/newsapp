import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class RecomendationCardWidget extends StatelessWidget {
  final Articles articles;
  const RecomendationCardWidget({
    required this.articles,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      style: ListTileStyle.list,
      onTap: () =>
          Navigator.pushNamed(context, '/newsDetail', arguments: articles),
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: Image.network(
        "${articles.urlToImage}",
        height: 200,
        width: 100,
        fit: BoxFit.scaleDown,
      ),
      title: Text("${articles.title}"),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("${articles.author}"),
        Text("${articles.publishedAt}"),
      ]),
    );
  }
}
