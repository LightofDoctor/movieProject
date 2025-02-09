import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_details_info_widget.dart';
import 'package:flutter_application_1/widgets/movie_list/movie_details_scroll_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;
  MovieDetailsScreen({super.key, required this.movieId });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Дэдпул и Росомаха ',
        textAlign: TextAlign.center,
        
      ),
      ),
      body: ColoredBox(
        color: Color.fromRGBO(137, 32, 32,1.0),
        child: ListView(
          children: [
            MovieDetailsInfoWidget(),
            MovieDetailsScrollWidget(),
          ],
        ),
      ),
    );
    
  }
}
