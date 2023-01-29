import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/blocs/export_blocs.dart';
import 'package:news_app/config/appnavigation_config.dart';
import 'package:news_app/repositories/baseauth_repository.dart';
import 'package:news_app/screens/export_screens.dart';
import 'package:news_app/utils/export_utils.dart';
import 'package:news_app/widgets/custombottomnavigationbar_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ThemeChangerTwoBloc()),
      BlocProvider(create: (context) => ChangerBottomNavigationBarBloc()),
      BlocProvider(create: (context) => AuthBloc(authRepository: BaseAuth())),
    ],
    child: BlocBuilder<ThemeChangerTwoBloc, ThemeChangerTwoState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: (state as ThemeChangerTwoInitial).value == false
              ? ThemeDataChanger.lightTheme
              : ThemeDataChanger.darkTheme,
          onGenerateRoute: AppNavigationConfig.onGenerateRoute,
          initialRoute: FirebaseAuth.instance.currentUser == null
              ? AuthScreen.routeName
              : CustomBottomNavigationWidget.routeName,
        );
      },
    ),
  ));
}
