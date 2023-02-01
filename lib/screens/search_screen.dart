import 'package:flutter/material.dart';
import 'package:news_app/utils/export_utils.dart';

import '../blocs/export_blocs.dart';
import '../widgets/export_widgets.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerSearch = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const SizedBox(),
          title: const Text("Search"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: (value) {
                  context.read<SearchBloc>().add(DoneSearching(value));
                },
                controller: controllerSearch,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search Here...",
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
              const SizedBox(height: 15.0),
              const SizedBox(height: 10.0),
              BlocConsumer<SearchBloc, SearchState>(
                listener: (context, state) {
                  if (state is SearchError) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  if (state is LoadingSearch) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchDone) {
                    return Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.articles.length,
                        itemBuilder: (context, index) {
                          return RecomendationCardWidget(
                              articles: state.articles[index]);
                        },
                      ),
                    );
                  } else if (state is NotBeenSearch) {
                    return Column(
                        children: List.generate(
                            AppUtils.category.length,
                            (index) => CategorySearchWidget(
                                label: AppUtils.category[index]['label']
                                    .toString(),
                                pictures: AppUtils.category[index]['pictures']
                                    .toString())));
                  } else if (state is NotFound) {
                    return const Center(
                        child: Text("Not Found Anything on your search"));
                  } else {
                    return const Center(child: Text("Theres Something Wrong"));
                  }
                },
              ),
            ],
          ),
        )));
  }
}



// Column(
//                     children: List.generate(
//                         category.length,
//                         (index) => CategorySearchWidget(
//                             label: category[index]['label'].toString(),
//                             pictures: category[index]['pictures'].toString()))),


// Flexible(
//                   fit: FlexFit.loose,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: 10,
//                     itemBuilder: (context, index) {
//                       return const Text("sdnosiabdniwnidoan");
//                     },
//                   ),
//                 )