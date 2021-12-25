import 'package:bahas_movie/controllers/mainpage_controller.dart';
import 'package:bahas_movie/pages/home_page.dart';
import 'package:bahas_movie/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainPageC = Get.put(MainPageController());

    Widget customBottomNavbar() {
      return ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 40,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            color: bgColor2,
            height: 54,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        mainPageC.isPressed.value = false;
                        mainPageC.currentIndex.value = 0;
                      },
                      child: Container(
                        clipBehavior: Clip.none,
                        width: Get.width / 4,
                        child: Image.asset(
                          mainPageC.isPressed.value
                              ? 'assets/home_icon.png'
                              : 'assets/home_icon_blue.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        mainPageC.isPressed.value = true;
                        mainPageC.currentIndex.value = 1;
                      },
                      child: Container(
                        clipBehavior: Clip.none,
                        width: Get.width / 4,
                        child: Image.asset(
                          mainPageC.isPressed.value
                              ? 'assets/profile_icon_blue.png'
                              : 'assets/profile_icon.png',
                          width: 19,
                          height: 19,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (mainPageC.currentIndex.value) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    Widget floatingActionButton() {
      return FloatingActionButton(
        child: Image.asset('assets/favorite_button.png'),
        onPressed: () {},
      );
    }

    return Obx(
      () => Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: floatingActionButton(),
        bottomNavigationBar: customBottomNavbar(),
        body: body(),
      ),
    );
  }
}
