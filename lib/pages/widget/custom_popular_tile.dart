import 'package:bahas_movie/controllers/nowshowing_controller.dart';
import 'package:bahas_movie/models/popular_model.dart';
import 'package:bahas_movie/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customPopularTile(PopularModel popular, List<dynamic> genre) {
  return Container(
    margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 120,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                NowShowingController.basedImageUrl +
                    popular.posterPath.toString(),
              ),
            ),
          ),
          margin: const EdgeInsets.only(bottom: 30),
        ),
        const SizedBox(
          width: 13,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                popular.title.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                popular.overview.toString(),
                style: secondaryTextStyle.copyWith(
                  fontWeight: light,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/star_icon.png',
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${popular.rating} / 10.0',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Text(
                '${genre.join(', ')}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: primaryTextStyle.copyWith(),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
