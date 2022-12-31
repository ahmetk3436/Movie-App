import 'package:bloc/bloc.dart';
import 'package:movie_app/bloc/movies/event.dart';
import 'package:movie_app/bloc/movies/state.dart';

import '../../api/movie_list/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetMovieList>((event, emit) async {
      try {
        emit(MovieLoading());
        final mList = await apiRepository.fetchMovieList();
        emit(MovieLoaded(mList));
        if (mList.error != null) {
          emit(MovieError(mList.error));
        }
      } on NetworkError {
        emit(const MovieError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
