import 'package:flutter/material.dart';
import 'package:movie_app/bloc/movies/bloc.dart';
import 'package:movie_app/bloc/movies/event.dart';
import 'package:movie_app/core/widgets/buildListMovie.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final MovieBloc dataBloc = MovieBloc();

  @override
  void initState() {
    dataBloc.add(GetMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: MovieListBuilder(dataBloc: dataBloc));
  }
}
