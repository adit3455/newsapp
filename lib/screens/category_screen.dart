import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

import '../models/news_model.dart';
import '../repositories/baserepositories.dart';
import '../widgets/export_widgets.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';
  final String categoryUrl;
  const CategoryScreen({super.key, required this.categoryUrl});

  @override
  Widget build(BuildContext context) {
    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

    return Scaffold(
        appBar: AppBar(
          title: Text("Category ${capitalize(categoryUrl)}"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FutureBuilder<List<Articles>>(
              future: NewsRepository().getSingleCategory(category: categoryUrl),
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
                            "All categories ${capitalize(categoryUrl)} for you",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "${snapshot.data!.length} Items",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
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
        width: MediaQuery.of(context).size.width,
        borderRadius: BorderRadius.circular(20.0),
        margin: const EdgeInsets.all(10));
  }
}
