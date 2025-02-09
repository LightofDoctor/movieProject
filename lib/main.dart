import 'package:flutter/material.dart';
import 'package:flutter_application_1/Theme/app_colors.dart';
import 'package:flutter_application_1/screen/main_screen.dart';
import 'package:flutter_application_1/screen/movie_details.dart';
import 'package:flutter_application_1/widgets/auth/auth_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.mainDartBlue,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainDartBlue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          )),
      routes: {
        '/auth': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
        'main_screen/movie_details_screen': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsScreen( 
              movieId: arguments,
            );
          } else {
            return MovieDetailsScreen(
              movieId: 0,
            );
          }
        }
      },
      initialRoute: '/auth',
    );
  }
}
