import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/bloc/movies/bloc.dart';
import 'package:movie_app/bloc/movies/event.dart';
import 'package:movie_app/core/constants/constants.dart';
import 'package:movie_app/core/widgets/buildListMovie.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final MovieBloc dataBloc = MovieBloc();

  @override
  void initState() {
    dataBloc.add(GetMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: bottomGNav(),
        extendBodyBehindAppBar: true,
        appBar: myAppBar(),
        body: MovieListBuilder(
          dataBloc: dataBloc,
          size: size,
        ));
  }

  AppBar myAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text("HOME", style: Constants.homeTextStyle),
    );
  }

  GNav bottomGNav() {
    return const GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey,
        gap: 8,
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.category_outlined,
            text: "Categories",
          ),
          GButton(
            icon: Icons.settings,
            text: "Settings",
          ),
        ]);
  }
}
