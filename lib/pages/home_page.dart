import 'package:bahas_movie/controllers/nowshowing_controller.dart';
import 'package:bahas_movie/controllers/popular_controller.dart';
import 'package:bahas_movie/models/genres_model.dart';
import 'package:bahas_movie/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/custom_movies_card.dart';
import 'widget/custom_popular_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nowShowingC = Get.put(NowShowingController());
    final popularC = Get.put(PopularController());

    return Scaffold(
      backgroundColor: bgColor1,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                ),
                child: Column(
                  children: [
                    Text(
                      'Bahas Movie',
                      style: primaryTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Find Your Movies here',
                      style: tertiaryTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: defaultMargin, bottom: 13),
                child: Text(
                  'Now Playing',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Obx(
                () => CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.7,
                    height: 230,
                    autoPlay: true,
                    pageSnapping: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(
                      seconds: 2,
                    ),
                  ),
                  items: nowShowingC.nowShowingList.map((nowShowing) {
                    return GestureDetector(
                      child: customMoviesCard(nowShowing),
                      onTap: () {
                        Get.toNamed('/detail-page');
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: defaultMargin),
                child: Text(
                  'Popular',
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => Column(
                  children: popularC.popularList.map((popular) {
                    List<dynamic> genre = popular.genre!
                        .map((genre) => Genres().listOfGenres[genre])
                        .toList();
                    return GestureDetector(
                      child: customPopularTile(popular, genre),
                      onTap: () {
                        Get.toNamed('/detail-page');
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
