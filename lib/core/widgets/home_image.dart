import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/constants.dart';

import 'image_widget.dart';

Stack FLChart(BuildContext context) {
  return Stack(
    children: [
      Container(
        height: double.infinity,
        color: const Color(0XFF000B49),
      ),
      ImageWidget(imageurl: Constants.imageAdress, context: context),
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
