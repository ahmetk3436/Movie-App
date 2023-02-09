import 'package:dio/dio.dart';

import '../../core/constants/constants.dart';
import 'movie_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      '${Constants.baseUrl}3/recommendations?api_key=c412c4ac9b1f384bb31d9e684b02850e';

  Future<MovieModel> fetchMovieList() async {
    try {
      Response response = await _dio.get(_url);
      return MovieModel.fromJson(response.data);
    } catch (error) {
      return MovieModel.withError("Data not found / Connection issue");
    }
  }
}
