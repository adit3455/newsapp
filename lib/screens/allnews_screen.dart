import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/repositories/baserepositories.dart';

import '../widgets/export_widgets.dart';

class AllNewsScreen extends StatelessWidget {
  static const String routeName = 'allNews';
  const AllNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("All News"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<List<Articles>>(
              future: NewsRepository().getHotNews(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                        children:
                            List.generate(4, (index) => _cardLoading(context))),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "All Recomendation for you",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "${snapshot.data!.length} Items",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Expanded(
                          child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return AllRecomendationWidget(
                            articles: snapshot.data![index],
                          );
                        },
                      ))
                    ],
                  );
                } else {
                  return const Text("Theres Something Wrong");
                }
              }),
        ));
  }

  CardLoading _cardLoading(BuildContext context) {
    return CardLoading(
        height: 125,
        borderRadius: BorderRadius.circular(20.0),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10));
  }
}
