import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imageUrls = [
    "https://wwwimage-us.pplusstatic.com/thumbnails/photos/w370-q80/movie_asset/59/74/33/sml_salone_poster_1400x2100.jpg",
    "https://i.ytimg.com/vi/Awg3cWuHfoc/maxresdefault.jpg",
    "https://tr.web.img4.acsta.net/pictures/22/09/26/09/43/3388433.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.grey,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: imageWidget(Constants.image_adress),
              ),
              Expanded(
                flex: 1,
                child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      return imageWidget(imageUrls[index]);
                    },
                    options: CarouselOptions()),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget imageWidget(String imageurl) {
    return Container(
      color: Colors.black,
      padding: Constants.EI,
      child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageurl,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error)),
    );
  }
}
