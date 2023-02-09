import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.imageurl, required this.context});
  final String imageurl;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return imageWidget(imageurl, context);
  }
}

Widget imageWidget(String imageurl, BuildContext context) {
  return CachedNetworkImage(
      height: MediaQuery.of(context).size.height / 2,
      width: double.infinity,
      fit: BoxFit.fitWidth,
      imageUrl: imageurl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error));
}
