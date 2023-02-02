import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:news_app/blocs/export_blocs.dart';
import 'package:news_app/screens/export_screens.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  static const String routeName = '/main';
  const CustomBottomNavigationWidget({super.key});

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const SearchScreen(),
      const BookmarkScreen(),
      const UserScreen()
    ];

    return BlocBuilder<ChangerBottomNavigationBarBloc,
        ChangerBottomNavigationBarState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: _onWillPop,
          child: Scaffold(
            body: pages[
                (state as ChangerBottomNavigationBarInitial).selectedIndex],
            bottomNavigationBar: FlashyTabBar(
              selectedIndex: state.selectedIndex,
              showElevation: true,
              onItemSelected: (value) {
                context
                    .read<ChangerBottomNavigationBarBloc>()
                    .add(OnSelectedIndex(value: value));
              },
              items: [
                FlashyTabBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text('Home'),
                  activeColor:
                      Theme.of(context).appBarTheme.titleTextStyle!.color!,
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.search),
                  title: const Text('Search'),
                  activeColor:
                      Theme.of(context).appBarTheme.titleTextStyle!.color!,
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.bookmark),
                  title: const Text('Bookmark'),
                  activeColor:
                      Theme.of(context).appBarTheme.titleTextStyle!.color!,
                ),
                FlashyTabBarItem(
                  icon: const Icon(Icons.person),
                  title: const Text('User'),
                  activeColor:
                      Theme.of(context).appBarTheme.titleTextStyle!.color!,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
