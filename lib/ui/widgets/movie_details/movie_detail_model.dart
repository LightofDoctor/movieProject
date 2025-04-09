import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/api_client/api_client.dart';
import 'package:flutter_application_1/domain/entity/movie_details.dart';

class MovieDetailsModel extends ChangeNotifier{
  final _apiClient = ApiClient();
  final int movieId;
  Movie? _movieDetails;
  final String locale = 'en-US';
  Movie? get movieDetails => _movieDetails;
  MovieDetailsModel(this.movieId);
  Future<void> loadDetails() async{
    _movieDetails = await _apiClient.movieDetails(movieId, locale);
    notifyListeners();
  }


}