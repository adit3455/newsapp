import 'package:flutter/material.dart';

import '../models/news_model.dart';

class RecomendationDetailScreenWidget extends StatelessWidget {
  final Articles articles;
  const RecomendationDetailScreenWidget({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          height: 200,
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage("${articles.urlToImage}"),
          )),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width * 0.02,
            top: MediaQuery.of(context).size.height * 0.12,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).shadowColor,
                        blurRadius: 22.0,
                        offset: const Offset(0.4, 0.25))
                  ],
                ),
                child: Text(
                  '${articles.title}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 12.0, color: Colors.white),
                ))),
      ],
    );
  }
}
