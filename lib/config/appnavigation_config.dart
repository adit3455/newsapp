import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/export_screens.dart';
import '../widgets/export_widgets.dart';

class AppNavigationConfig {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            settings: const RouteSettings(name: HomePage.routeName),
            builder: (context) => const HomePage());
      case '/setting':
        return MaterialPageRoute(
            settings: const RouteSettings(name: SettingScreen.routeName),
            builder: (context) => const SettingScreen());
      case '/search':
        return MaterialPageRoute(
            settings: const RouteSettings(name: SearchScreen.routeName),
            builder: (context) => const SettingScreen());
      case '/main':
        return MaterialPageRoute(
            settings: const RouteSettings(
                name: CustomBottomNavigationWidget.routeName),
            builder: (context) => const CustomBottomNavigationWidget());
      case '/bookmark':
        return MaterialPageRoute(
            settings: const RouteSettings(name: BookmarkScreen.routeName),
            builder: (context) => const BookmarkScreen());
      case '/user':
        return MaterialPageRoute(
            settings: const RouteSettings(name: UserScreen.routeName),
            builder: (context) => const UserScreen());
      case '/category':
        return MaterialPageRoute(
            settings: const RouteSettings(name: CategoryScreen.routeName),
            builder: (context) => CategoryScreen(
                  categoryUrl: settings.arguments as String,
                ));
      case '/editUser':
        return MaterialPageRoute(
            settings: const RouteSettings(name: EditUserScreen.routeName),
            builder: (context) => const EditUserScreen());
      case '/newsDetail':
        return MaterialPageRoute(
            settings: const RouteSettings(name: NewsDetailScreen.routeName),
            builder: (context) => NewsDetailScreen(
                  articles: settings.arguments as Articles,
                ));
      case '/allNews':
        return MaterialPageRoute(
            settings: const RouteSettings(name: AllNewsScreen.routeName),
            builder: (context) => const AllNewsScreen());
      case '/login':
        return MaterialPageRoute(
            settings: const RouteSettings(name: AuthScreen.routeName),
            builder: (context) => const AuthScreen());

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => const ErrorScreen());
  }
}
