import 'package:flutter/material.dart';
import 'package:flutter_application_1/library/widgets/inherited/inherit_notifier_provider.dart';
import 'package:flutter_application_1/ui/widgets/auth/auth_model.dart';
import 'package:flutter_application_1/ui/widgets/auth/auth_widget.dart';
import 'package:flutter_application_1/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter_application_1/ui/widgets/movie_details/movie_detail_model.dart';
import 'package:flutter_application_1/ui/widgets/movie_details/movie_details_widget.dart';

abstract class MainNavigationRouteNames {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.mainScreen
      : MainNavigationRouteNames.auth;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => InheritedNotifierProvider(
          model: AuthModel(),
          child: const AuthWidget(),
        ),
    MainNavigationRouteNames.mainScreen: (context) => const MainScreenWidget(),
  };
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => InheritedNotifierProvider(
            model: MovieDetailsModel(movieId),
            child: MovieDetailsWidget(),),
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}