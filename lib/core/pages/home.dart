import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          color: const Color(0XFF000B49),
        ),
        imageWidget(Constants.imageAdress),
        const Positioned.fill(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.transparent, Color(0XFF000B49)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 0.5])))),
        Positioned(
          bottom: 50,
          child: Text(
            "HELLO TO MY MOVİES APP !",
            style: Constants.homeTitle,
          ),
        )
      ],
    );
  }

  Widget imageWidget(String imageurl) {
    return CachedNetworkImage(
        height: MediaQuery.of(context).size.height / 2,
        width: double.infinity,
        fit: BoxFit.fitWidth,
        imageUrl: imageurl,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error));
  }
}
