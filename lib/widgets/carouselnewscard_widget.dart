import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';

class CarouselNewsCardWidget extends StatelessWidget {
  final Articles articles;
  const CarouselNewsCardWidget({
    required this.articles,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      width: double.infinity,
      height: 180,
      child: Stack(
        children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/newsDetail',
                arguments: articles),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${articles.urlToImage}")),
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.028,
            top: MediaQuery.of(context).size.height * 0.08,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/newsDetail',
                  arguments: articles),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 3.0),
                        Text(
                          "${articles.title}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.visible),
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                          "${articles.publishedAt}",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.visible),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
