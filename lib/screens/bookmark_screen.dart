import 'package:flutter/material.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Heres Your Bookmarks",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 30.0),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            ),
          ],
        ));
  }
}
