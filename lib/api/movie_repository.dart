import 'package:movie_app/api/movie_model.dart';
import 'package:movie_app/api/movie_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<MovieModel> fetchMovieList() {
    return _provider.fetchMovieList();
  }
}

class NetworkError extends Error {}
