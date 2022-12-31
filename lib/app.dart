import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/bloc/movies/bloc.dart';
import 'package:movie_app/bloc/movies/event.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/pages/home.dart';
import 'package:movie_app/core/pages/settings.dart';
import 'package:movie_app/core/pages/buildListMovie.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final MovieBloc dataBloc = MovieBloc();
  Widget screenWidget = const HomePage();
  @override
  void initState() {
    dataBloc.add(GetMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomGNav(),
      extendBodyBehindAppBar: false,
      appBar: myAppBar(),
      body: screenWidget,
    );
  }

  AppBar myAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text("MOVİE APP", style: Constants.movieTitle),
    );
  }

  GNav bottomGNav() {
    final Size size = MediaQuery.of(context).size;
    return GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey,
        gap: 8,
        onTabChange: (value) {
          switch (value) {
            case 0:
              setState(() {
                screenWidget = const HomePage();
              });
              break;
            case 1:
              setState(() {
                screenWidget = MovieListBuilder(dataBloc: dataBloc, size: size);
              });
              break;
            case 2:
              setState(() {
                screenWidget = const SettingsScreen();
              });
              break;
            default:
          }
        },
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.category_outlined,
            text: "Movies",
          ),
          GButton(
            icon: Icons.settings,
            text: "Settings",
          ),
        ]);
  }
}
