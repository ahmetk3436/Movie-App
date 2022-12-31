import 'package:flutter/material.dart';

class Constants {
  static String base_url = "https://api.themoviedb.org/3/movie/";
  static TextStyle homeTextStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle movieTitle = TextStyle(
    color: Colors.amber.shade200,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static EdgeInsets EI = const EdgeInsets.all(8.0);
  static SizedBox GAP = const SizedBox(
    height: 8,
  );
  static String image_adress =
      "https://storage.googleapis.com/afs-prod/media/e53811360eed4b8ba26b5f635d703a7c/3000.jpeg";
}
