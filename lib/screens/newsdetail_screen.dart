import 'package:flutter/material.dart';
import 'package:news_app/blocs/export_blocs.dart';
import 'package:news_app/repositories/baserepositories.dart';
import 'package:news_app/widgets/export_widgets.dart';

import '../models/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final Articles articles;
  static const String routeName = '/detailNews';
  const NewsDetailScreen({required this.articles, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detail News"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${articles.title}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 25.0)),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Posted ${articles.publishedAt}"),
                  IconButton(
                      onPressed: () {
                        context.read<WishlistBloc>().add(AddWishlist(articles));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Added to Wishlist")));
                      },
                      icon: const Icon(Icons.bookmark_outline))
                ],
              ),
              const SizedBox(height: 10.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  "${articles.urlToImage}",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                "${articles.author}",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 15.0),
              ),
              const SizedBox(height: 20.0),
              Text(
                "${articles.content}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recomendation",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.share_outlined)),
                ],
              ),
              FutureBuilder<List<Articles>>(
                  future: NewsRepository().getHotNews(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.160,
                        width: MediaQuery.of(context).size.width,
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return RecomendationDetailScreenWidget(
                                articles: snapshot.data![index],
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      return const Text("Theres Something Wrong");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
