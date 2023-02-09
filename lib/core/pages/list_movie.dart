import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movies/bloc.dart';
import '../../bloc/movies/state.dart';

class MovieListBuilder extends StatefulWidget {
  const MovieListBuilder(
      {super.key, required this.dataBloc, required this.size});
  final MovieBloc dataBloc;
  final Size size;
  @override
  State<MovieListBuilder> createState() => _MovieListBuilderState();
}

class _MovieListBuilderState extends State<MovieListBuilder> {
  @override
  Widget build(BuildContext context) {
    return _buildListMovie(widget.dataBloc, widget.size);
  }
}

Widget _buildListMovie(MovieBloc dataBloc, Size size) {
  return BlocProvider<MovieBloc>(
    create: (_) => dataBloc,
    child: BlocListener<MovieBloc, MovieState>(
      listener: (context, state) {
        if (state is MovieError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message!),
            ),
          );
        }
      },
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieInitial) {
            return const BuildLoadingWidget();
          } else if (state is MovieLoading) {
            return const BuildLoadingWidget();
          } else if (state is MovieLoaded) {
            return MovieListCard(
              model: state.movieModel,
              size: size,
            );
          } else if (state is MovieError) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    ),
  );
}
