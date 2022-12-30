import 'package:flutter/material.dart';

import '../../api/movie_model.dart';

class MovieListCard extends StatefulWidget {
  const MovieListCard({super.key, required this.model});
  final MovieModel model;
  @override
  State<MovieListCard> createState() => _MovieListCardState();
}

class _MovieListCardState extends State<MovieListCard> {
  @override
  Widget build(BuildContext context) {
    return _buildCard(context, widget.model);
  }
}

Widget _buildCard(BuildContext context, MovieModel model) {
  return ListView.builder(
    itemCount: model.results!.length,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text("Movie Name: ${model.results![index].originalTitle}"),
                Text("Movie Description : ${model.results![index].overview}"),
                Text("Movie ID: ${model.results![index].id}"),
              ],
            ),
          ),
        ),
      );
    },
  );
}
