import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/api_client/api_client.dart';
import 'package:flutter_application_1/domain/entity/movie.dart';
import 'package:flutter_application_1/ui/navigation/main_navigation.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  int _currentPage = 0;
  List<Movie> get movies => List.unmodifiable(_movies);





    
    Future<void> loadMovies() async {
    final nextPage = _currentPage + 1;
    try{
     final moviesResponse = await _apiClient.popularMovie(nextPage,'en-US');
    _currentPage = moviesResponse.page;
    _movies.addAll(moviesResponse.movies);
    notifyListeners();

    } catch(e){
      print(e);
    }
   
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.movieDetails,
      arguments: id,
    );
  }
  void showMoviesAtIndex(int index){
    if (index < _movies.length - 1) return;
    loadMovies();
  }
}