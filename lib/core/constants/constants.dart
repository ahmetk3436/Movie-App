import 'package:flutter/material.dart';

class Constants {
  static String baseUrl = "https://api.themoviedb.org/3/movie/";
  static String weatherBaseUrl = "https://api.open-meteo.com/";
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
  static TextStyle homeTitle = const TextStyle(
    color: Colors.white,
    fontSize: 27,
    fontWeight: FontWeight.bold,
  );
  static EdgeInsets ei = const EdgeInsets.all(8.0);
  static SizedBox gap = const SizedBox(
    height: 8,
  );
  static String imageAdress =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpj8fCEmMBQyi8oj6l9rzEcifTJo7M5jRwXVdTdwHsTgsfS1Nk";
}
