import 'package:card_loading/card_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/blocs/export_blocs.dart';
import 'package:news_app/config/greeting_config.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/repositories/baserepositories.dart';

import '../widgets/export_widgets.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoryCard = [
      {"icon": Icons.health_and_safety_outlined, "label": "Health"},
      {"icon": Icons.business_outlined, "label": "Business"},
      {"icon": Icons.accessible_outlined, "label": "Entertainment"},
      {"icon": Icons.science_outlined, "label": "Science"},
      {"icon": Icons.sports_baseball_outlined, "label": "Sport"},
      {"icon": Icons.table_chart_outlined, "label": "Technology"},
    ];

    List<double> loadingIndex = [150.0, 200.0, 500.0];

    return Scaffold(
      appBar: AppBar(
        title: const Text("PenNews"),
        actions: [
          BlocBuilder<ThemeChangerTwoBloc, ThemeChangerTwoState>(
            builder: (context, state) {
              return Row(
                children: [
                  (state as ThemeChangerTwoInitial).value == false
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode),
                  CupertinoSwitch(
                    value: state.value,
                    activeColor: Colors.purpleAccent,
                    thumbColor: Colors.white,
                    trackColor: Colors.blueAccent,
                    onChanged: (value) {
                      context
                          .read<ThemeChangerTwoBloc>()
                          .add(OnChangedSwitch(value: value));
                    },
                  ),
                ],
              );
            },
          ),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/setting'),
              icon: const Icon(Icons.settings)),
        ],
      ),
      drawer: const CustomDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: FutureBuilder<List<Articles>>(
              future: NewsRepository().getAllArticlesCategory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                      children: List.generate(
                          loadingIndex.length,
                          (index) => _cardLoading(context,
                              height: loadingIndex[index])));
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8.0),
                    Text(
                      "Hi ${GreetingConfig().name}, ${GreetingConfig().greeting}!",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hottest News",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/allNews'),
                          child: const Text("See More"),
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    FutureBuilder<List<Articles>>(
                        future: NewsRepository().getHotNews(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return _cardLoading(context, height: 150);
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return CarouselSlider(
                              options: CarouselOptions(
                                aspectRatio: 1.3,
                                viewportFraction: 0.92,
                                height: 200,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                                initialPage: 0,
                                autoPlay: true,
                              ),
                              items: snapshot.data!
                                  .map((e) => CarouselNewsCardWidget(
                                        articles: e,
                                      ))
                                  .toList(),
                            );
                          } else {
                            return const Text("Theres Something Wrong");
                          }
                        }),
                    Text(
                      "News Category",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 8.0),
                    Center(
                      child: Wrap(
                          runSpacing: 10.0,
                          spacing: 10.0,
                          alignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: List.generate(
                              categoryCard.length,
                              (index) => CategoryCardWidget(
                                  categoryRepo: categoryCard[index]['label']
                                      .toString()
                                      .toLowerCase(),
                                  label: categoryCard[index]['label'],
                                  icon: categoryCard[index]['icon']))),
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommendation",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                              context, '/allNews',
                              arguments: snapshot.data),
                          child: const Text("See More"),
                        ),
                      ],
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return RecomendationCardWidget(
                            articles: snapshot.data![index],
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  CardLoading _cardLoading(BuildContext context, {required double height}) {
    return CardLoading(
        borderRadius: BorderRadius.circular(20.0),
        height: height,
        margin: const EdgeInsets.only(bottom: 20.0),
        width: MediaQuery.of(context).size.width);
  }
}
