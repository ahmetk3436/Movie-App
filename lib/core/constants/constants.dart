import 'package:flutter/material.dart';

class Constants {
  static String base_url = "https://api.themoviedb.org/3/movie/";
  static TextStyle homeTextStyle = const TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static TextStyle movieTitle = const TextStyle(
    color: Colors.grey,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static EdgeInsets EI = const EdgeInsets.all(8.0);
  static SizedBox GAP = const SizedBox(
    height: 8,
  );
}
