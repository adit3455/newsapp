import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class AllRecomendationWidget extends StatelessWidget {
  final Articles articles;
  const AllRecomendationWidget({
    required this.articles,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, '/newsDetail', arguments: articles),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        height: 125,
        width: MediaQuery.of(context).size.width,
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
                width: 125,
                height: 125,
                fit: BoxFit.cover,
                "${articles.urlToImage}"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: 240,
                  child: Text(
                    "${articles.title}",
                    maxLines: 3,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "${articles.publishedAt}",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
