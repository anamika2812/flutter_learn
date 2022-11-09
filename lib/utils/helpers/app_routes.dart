import 'package:flutter/material.dart';

import '../../ToDoAppScreen/view/home_view.dart';
import '../../modules/animation/animation.dart';
import '../../modules/counterapp/view/counter_app.dart';
import '../../modules/httpdemo/view/httpdemoscreen.dart';
import '../../modules/listhttpdemo/view/listdemoscreen.dart';
import '../../modules/moviescreen/view/movie_screen.dart';
import '../../modules/navigationdemo/screen1.dart';
import '../../modules/navigationdemo/screen2.dart';
import '../../modules/navigationdemo/screen3.dart';
import '../../modules/navigationdemo/screen4.dart';
import '../../modules/navigationdemo/screen5.dart';
import '../../modules/profile/view/locationmap.dart';
import '../../modules/profile/view/profileview.dart';
import '../../modules/screen/home_screen.dart';
import '../../modules/signup/view/signupform.dart';
import '../../modules/spashscreen/splash_screen.dart';

import '../../modules/tutorial/view/tutorial_page_view.dart';

class AppRoutes {
  static const String screenRoute1 = '/screen1';
  static const String screenRoute2 = '/screen2';
  static const String screenRoute3 = '/screen3';
  static const String screenRoute4 = '/screen4';
  static const String screenRoute5 = '/screen5';
  static const String splashScreen = '/SplashScreen';
  static const String tutorialScreen = '/tutorialScreen';
  static const String signupScreen = '/signupScreen';
  static const String movieScreen = '/movieScreen';
  static const String profilehomescreen = '/profilehomescreen';
  static const String googleMapScreen = '/googleMapScreen';
  static const String demohttpscreen = '/demohttpscreen';
  static const String demolistcreen = '/demolistcreen';
  static const String counterAppScreen = '/counterAppScreen';
  static const String animationscreen = '/animationscreen';

  //todoApp
  static const String todohomescreen = '/todohomescreen';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      screenRoute1: (context) => const ScreenoneDemo(),
      screenRoute2: (context) => const ScreentwoDemo(),
      screenRoute3: (context) => const ScreenthreeDemo(),
      screenRoute4: (context) => const ScreenfourDemo(),
      screenRoute5: (context) => const ScreenfiveDemo(),
      tutorialScreen: (context) => const TutorialPage(),
      signupScreen: (context) => const RegisterPage(),
      profilehomescreen: (context) => const ProfileScreen(),
      googleMapScreen: (context) => const SimpleMap(),
      splashScreen: (context) => const SplashScreen(),
      movieScreen: (context) => const MovieScreenPage(),
      demohttpscreen: (context) => const DemoHttpScreen(),
      demolistcreen: (context) => const ListHttpDemo(),
      counterAppScreen: (context) => const CounterAppScreen(),
      animationscreen: (context) => const PhotoHero(),

      todohomescreen: (context) => const HomeScreen(),

      //todoApp
      todohomescreen: (context) => const HomePage(),
    };
  }
}
