import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const SizedBox(),
          title: const Text("Search"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AnimSearchBar(
                textController: textEditingController,
                onSubmitted: (p0) {},
                autoFocus: true,
                width: MediaQuery.of(context).size.width,
                onSuffixTap: () {},
              ),
            ),
          ],
        ));
  }
}
