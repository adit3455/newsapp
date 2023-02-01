import 'package:flutter/material.dart';
import 'package:news_app/widgets/export_widgets.dart';

import '../blocs/export_blocs.dart';

class BookmarkScreen extends StatelessWidget {
  static const String routeName = '/bookmark';
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          centerTitle: true,
          title: const Text("Bookmark"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Heres Your Bookmarks",
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10.0),
              BlocConsumer<WishlistBloc, WishlistState>(
                listener: (context, state) {
                  if (state is WishlistError) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  if (state is WishlistNull) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is WishlistLoaded) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          return BookmarkCardWidget(
                            articles: state.articles[index],
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text("Theres Something error");
                  }
                },
              ),
            ],
          ),
        ));
  }
}
