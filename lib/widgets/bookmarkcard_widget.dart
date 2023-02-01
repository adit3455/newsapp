import 'package:flutter/material.dart';
import 'package:news_app/screens/export_screens.dart';

import '../blocs/export_blocs.dart';
import '../models/news_model.dart';

class BookmarkCardWidget extends StatelessWidget {
  final Articles articles;
  const BookmarkCardWidget({
    Key? key,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(articles: articles),
          )),
      leading: Image.network("${articles.urlToImage}"),
      title: Text("${articles.title}"),
      subtitle: Text("${articles.publishedAt}"),
      trailing: IconButton(
        onPressed: () {
          context.read<WishlistBloc>().add(RemoveWishlist(articles));
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Removed from wishlist")));
        },
        icon: const Icon(Icons.remove_circle),
      ),
    );
  }
}
