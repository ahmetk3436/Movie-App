// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/api/movie_list/movie_model.dart';
import 'package:movie_app/core/constants/constants.dart';

class MovieListCard extends StatefulWidget {
  const MovieListCard({
    Key? key,
    required this.size,
    required this.model,
  }) : super(key: key);
  final Size size;
  final MovieModel model;
  @override
  State<MovieListCard> createState() => _MovieListCardState();
}

class _MovieListCardState extends State<MovieListCard> {
  @override
  Widget build(BuildContext context) {
    return _buildCard(context, widget.model, widget.size);
  }
}

Widget _buildCard(BuildContext context, MovieModel model, Size size) {
  return ListView.builder(
    itemCount: model.results!.length,
    itemBuilder: (context, index) {
      return Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Container(
          margin: Constants.EI,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/original/${model.results![index].posterPath}",
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Constants.GAP,
              Text(
                "Movie Name: ${model.results![index].originalTitle}",
                style: Constants.movieTitle,
              ),
              Constants.GAP,
              SizedBox(
                child: Text(
                  "Movie Description : ${model.results![index].overview}",
                  style: Constants.homeTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
