import 'package:bahas_movie/controllers/nowshowing_controller.dart';
import 'package:bahas_movie/models/nowshowing_model.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

Widget customMoviesCard(NowShowing nowShowing) {
  return Container(
    margin: const EdgeInsets.only(right: 34),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            NowShowingController.basedImageUrl +
                nowShowing.backdropPath.toString(),
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 7,
            ),
            child: Text(
              nowShowing.title.toString(),
              style: primaryTextStyle.copyWith(fontWeight: semiBold),
            ),
          ),
        ),
      ],
    ),
  );
}
